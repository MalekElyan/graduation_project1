import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/functions/checkinternet.dart';

class Curd {
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
    String linkUrl,
    Map data,
  ) async {
    try {
      if (await checkInternet()) {
        final response = await http
            .post(Uri.parse(linkUrl), body: data)
            .timeout(const Duration(seconds: 20));

        if (response.statusCode == 200 || response.statusCode == 201) {
          final Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("CURD ERROR: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> postJsonData(
    String linkUrl,
    Map<String, dynamic> data,
  ) async {
    try {
      if (await checkInternet()) {
        final response = await http
            .post(
              Uri.parse(linkUrl),
              headers: {"Content-Type": "application/json", "Accept": "*/*"},
              body: jsonEncode(data),
            )
            .timeout(const Duration(seconds: 20));

        print("JSON URL: $linkUrl");
        print("JSON DATA: $data");
        print("JSON STATUS: ${response.statusCode}");
        print("JSON BODY: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          final decodedBody = jsonDecode(response.body);

          if (decodedBody is Map<String, dynamic>) {
            return Right(decodedBody);
          } else {
            return Right({"data": decodedBody});
          }
        } else {
          if (response.body.isNotEmpty) {
            try {
              final decodedBody = jsonDecode(response.body);
              if (decodedBody is Map<String, dynamic>) {
                return Right(decodedBody);
              }
            } catch (_) {}
          }

          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("CURD JSON ERROR: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> postMultipartData(
    String linkUrl,
    Map<String, String> data, {
    XFile? file,
    String fileFieldName = "file",
  }) async {
    try {
      if (await checkInternet()) {
        final request = http.MultipartRequest("POST", Uri.parse(linkUrl));

        request.fields.addAll(data);

        if (file != null && file.path.isNotEmpty) {
          request.files.add(
            await http.MultipartFile.fromPath(
              fileFieldName,
              file.path,
              filename: file.name,
            ),
          );
        }

        final streamedResponse = await request.send().timeout(
          const Duration(seconds: 20),
        );

        final response = await http.Response.fromStream(streamedResponse);

        print("MULTIPART URL: $linkUrl");
        print("MULTIPART DATA: $data");
        print("MULTIPART FILE: ${file?.path}");
        print("MULTIPART STATUS: ${response.statusCode}");
        print("MULTIPART BODY: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.body.isEmpty) {
            return Right({"success": true});
          }

          final decodedBody = jsonDecode(response.body);

          if (decodedBody is Map<String, dynamic>) {
            return Right(decodedBody);
          } else {
            return Right({"data": decodedBody});
          }
        } else {
          if (response.body.isNotEmpty) {
            try {
              final decodedBody = jsonDecode(response.body);
              if (decodedBody is Map<String, dynamic>) {
                return Right(decodedBody);
              }
            } catch (_) {}
          }

          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("CURD MULTIPART ERROR: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }
}

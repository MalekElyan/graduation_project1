import 'package:project/cloude_page/application_model.dart';

class ApplicationsData {
  ApplicationsData._();

  // Mock data مؤقتًا للتجربة فقط
  // لاحقًا سيتم استبدالها ببيانات من API / Database
  static const List<ApplicationModel> applications = [
    ApplicationModel(
      id: '1',
      name: 'ليلى حسن',
      field: 'علم البيانات',
      rating: 4.8,
      skills: ['Python', 'ML'],
      status: ApplicationStatus.pending,
    ),
    ApplicationModel(
      id: '2',
      name: 'محمد علي',
      field: 'نظم المعلومات',
      rating: 4.5,
      skills: ['React', 'Node.js'],
      status: ApplicationStatus.pending,
    ),
    ApplicationModel(
      id: '3',
      name: 'رنا خالد',
      field: 'هندسة برمجيات',
      rating: 4.9,
      skills: ['UI/UX', 'Figma'],
      status: ApplicationStatus.accepted,
    ),
  ];
}

class ApplicationModel {
  final String id;
  final String name;
  final String field;
  final double rating;
  final List<String> skills;
  final ApplicationStatus status;

  const ApplicationModel({
    required this.id,
    required this.name,
    required this.field,
    required this.rating,
    required this.skills,
    required this.status,
  });

  ApplicationModel copyWith({
    String? id,
    String? name,
    String? field,
    double? rating,
    List<String>? skills,
    ApplicationStatus? status,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      field: field ?? this.field,
      rating: rating ?? this.rating,
      skills: skills ?? this.skills,
      status: status ?? this.status,
    );
  }
}

enum ApplicationStatus { pending, accepted, rejected }

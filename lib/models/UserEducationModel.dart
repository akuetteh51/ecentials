class UserEducationModel {
  final String? user_id;
  final String? school_name;
  final String? course;
  final String? duration;
  final String? highest_level;
  final String? id;

  UserEducationModel( 
      {this.school_name,
      this.course,
      this.duration,
      this.highest_level,
      this.user_id,
      this.id,
      });

  factory UserEducationModel.fromJson(Map<String, dynamic>? data) {
    return UserEducationModel(
        school_name: data?['school_name'] ?? "",
        course: data?['course'] ?? "",
        duration: data?['duration'] ?? "",
        highest_level: data?['highest_level'] ?? "",
        id: data?['_id'] ?? "",
        );
  }
}

class AdminModel {
  final String userID;
  final String name;
  final String contact;
  final String cnic;
  final String email;

  AdminModel({
    required this.userID,
    required this.name,
    required this.contact,
    required this.cnic,
    required this.email,
  });

  factory AdminModel.fromMap(
      {required Map<String, dynamic> map, required String userID}) {
    return AdminModel(
      userID: userID,
      name: map['name'],
      email: map["email"],
      contact: map["contact"],
      cnic: map["cnic"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "contact": contact,
      "cnic": cnic,
      "email": email,
    };
  }
}

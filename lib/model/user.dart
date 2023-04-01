// ignore_for_file: public_member_api_docs, sort_constructors_first
class Userinfo {
  final String? id;
  final String name;
  final String email;
  final bool isAdmin;

  Userinfo({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
  });

  Userinfo.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'],
        isAdmin = data['isAdmin'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': name,
      'email': email,
      'isAdmin': isAdmin,
    };
  }
}

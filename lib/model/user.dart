// ignore_for_file: public_member_api_docs, sort_constructors_first
class Userinfo {
  final String? id;
  final String name;
  final String email;
  final bool isAdmin;
  final String? address;

  Userinfo(
      {required this.id,
      required this.name,
      required this.email,
      required this.isAdmin,
      this.address});

  Userinfo.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        name = data['Name'],
        email = data['email'],
        isAdmin = data['isAdmin'],
        address = data['address'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': name,
      'email': email,
      'isAdmin': isAdmin,
      'address': address,
    };
  }
}

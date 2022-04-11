class ContactFavories {

  final int? id;
  final String name;
  final String phone;

  ContactFavories({this.id, required this.name, required this.phone});

  factory ContactFavories.fromMap(Map<String, dynamic> json) => new ContactFavories(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}
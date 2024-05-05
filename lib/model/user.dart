class User {
  final String? name;
  final String? surname;
  final String? mail;
  final String? city;
  final String? image;
  final String? phone;
  final String? password;

  User({
    this.name,
    this.surname,
    this.mail,
    this.city,
    this.image,
    this.phone,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      surname: json['surname'],
      mail: json['mail'],
      city: json['city'],
      image: json['image'],
      phone: json['phone'],
      password: json['password'],
    );
  }
}

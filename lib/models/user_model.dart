import 'dart:convert';

class Usermodel {
  final String id;
  final String userType;
  final String name;
  final String email;
  final String password;
  final String address;
  final String contact;
  final String avatar;
  final String lat;
  final String lng;
  Usermodel({
    required this.id,
    required this.userType,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.contact,
    required this.avatar,
    required this.lat,
    required this.lng,
  });


  Usermodel copyWith({
    String? id,
    String? userType,
    String? name,
    String? email,
    String? password,
    String? address,
    String? contact,
    String? avatar,
    String? lat,
    String? lng,
  }) {
    return Usermodel(
      id: id ?? this.id,
      userType: userType ?? this.userType,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      contact: contact ?? this.contact,
      avatar: avatar ?? this.avatar,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userType': userType,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'contact': contact,
      'avatar': avatar,
      'lat': lat,
      'lng': lng,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      id: map['id'] ?? '',
      userType: map['userType'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      contact: map['contact'] ?? '',
      avatar: map['avatar'] ?? '',
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) => Usermodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usermodel(id: $id, userType: $userType, name: $name, email: $email, password: $password, address: $address, contact: $contact, avatar: $avatar, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Usermodel &&
      other.id == id &&
      other.userType == userType &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.address == address &&
      other.contact == contact &&
      other.avatar == avatar &&
      other.lat == lat &&
      other.lng == lng;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userType.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      address.hashCode ^
      contact.hashCode ^
      avatar.hashCode ^
      lat.hashCode ^
      lng.hashCode;
  }
}

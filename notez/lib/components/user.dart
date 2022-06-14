import 'package:cloud_firestore/cloud_firestore.dart';

class AuthUser{
  final String name;
  final int life;
  final String bd;
  final String gender;
  AuthUser(
      {required this.name,
      required this.life,
      required this.bd,
      required this.gender});
  Map<String, dynamic> toJson() => {
        'name': name,
        'birthdate': bd,
        'life': life,
        'gender': gender,
      };
  static AuthUser fromJson(Map<String, dynamic> json) => AuthUser(
      bd: json['birthdate'],
      name: json['name'],
      life: json['life'],
      gender: json['gender']);
}

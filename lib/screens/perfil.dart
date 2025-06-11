import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:convert';



class UserProfile {
  String name;
  String email;
  String? phone;
  String? profileImagePath;

  UserProfile({
    required this.name,
    required this.email,
    this.phone,
    this.profileImagePath,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profileImagePath: json['profileImagePath'],
    );
  }
}
class Perfil extends StatefulWidget {
  const Perfil({super.key, required String title});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  // UserProfile? _userProfile;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // CircleAvatar(
            //   radius: 60,
            //   backgroundColor: Colors.grey[300],
            //   backgroundImage:
            //       _userProfile!.profileImagePath != null
            //           ? NetworkImage(_userProfile!.profileImagePath!)
            //           : null,
            //   child:
            //       _userProfile!.profileImagePath == null
            //           ? const Icon(Icons.person, size: 60)
            //           : null,
            // ),
            const SizedBox(height: 20),
            Text(
              "Nome: {_userProfile!.name}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Email: {_userProfile!.email}",
              style: const TextStyle(fontSize: 18),
            ),
            // if (_userProfile!.phone != null)
              Text(
                "Telefone: {_userProfile!.phone}",
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

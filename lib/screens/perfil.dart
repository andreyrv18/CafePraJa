
import 'package:cafe_pra_ja/screens/cadastro.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

// Modelo de dados do usuário
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
  UserProfile? _userProfile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final response = await http.get(Uri.parse('https://seuservidor.com/api/usuario-logado'));
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _userProfile = UserProfile.fromJson(data);
          _isLoading = false;
        });
      } else {
        throw Exception('Erro ao buscar dados do usuário');
      }
    } catch (e) {
      debugPrint('Erro: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_userProfile == null) {
      return const Scaffold(
        body: Center(child: Text("Erro ao carregar perfil.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Icon(Icons.coffee_sharp, size: 150.0),
            const SizedBox(height: 30),
            Text(
              "Digite os dados de acesso nos campos abaixo.",
              style: TextStyle(color: theme.colorScheme.onPrimary), // creme
            ),
            const SizedBox(height: 30),
            CupertinoTextField(
              cursorColor: Color(0xFF7B4F2F), // marrom médio
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 14,
              ), // bege claro
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Color(0x332D1B0B), // marrom com transparência
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              padding: EdgeInsets.all(15),
              cursorColor: Color(0xFF8B5E3C),
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 14,
              ),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Color(0x332D1B0B),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: theme.colorScheme.primary, // marrom café com leite
                child: Text(
                  "Acessar",
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 7),
            SizedBox(width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor:  WidgetStateProperty.all(theme.colorScheme.tertiary)),
                child: Text(
                  "Crie sua conta",
                  style: TextStyle(
                    color: theme.colorScheme.onSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),

                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Cadastro()));
                },
              ),

            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              backgroundImage: _userProfile!.profileImagePath != null
                  ? NetworkImage(_userProfile!.profileImagePath!)
                  : null,
              child: _userProfile!.profileImagePath == null
                  ? const Icon(Icons.person, size: 60)
                  : null,

            ),
            const SizedBox(height: 20),
            Text("Nome: ${_userProfile!.name}", style: const TextStyle(fontSize: 18)),
            Text("Email: ${_userProfile!.email}", style: const TextStyle(fontSize: 18)),
            if (_userProfile!.phone != null)
              Text("Telefone: ${_userProfile!.phone}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

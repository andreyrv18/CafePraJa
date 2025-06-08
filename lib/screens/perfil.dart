import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

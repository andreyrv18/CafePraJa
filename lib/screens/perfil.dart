import 'package:cafe_pra_ja/screens/bemvindo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.primary, theme.colorScheme.onSurface],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.coffee_sharp, size: 150.0),
              const SizedBox(height: 30),
              Text(
                "Digite os dados de acesso nos campos abaixo.",
                style: TextStyle(color: theme.colorScheme.onPrimary),
              ),
              const SizedBox(height: 30),

              // Campo de e-mail
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x332D1B0B),
                  hintText: "Digite o seu e-mail",
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O e-mail é obrigatório';
                  } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Digite um e-mail válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Campo de senha
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x332D1B0B),
                  hintText: "Digite sua senha",
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A senha é obrigatória';
                  } else if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Botão de acessar
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(17),
                  color: theme.colorScheme.primary,
                  child: Text(
                    "Acessar",
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Se o formulário for válido, prossiga
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Acesso autorizado')),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 7),

              // Botão de criar conta
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.onPrimary,
                    width: 0.8,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: CupertinoButton(
                  child: Text(
                    "Crie sua conta",
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Bemvindo(title: 'teste'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cafe_pra_ja/screens/cadastro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
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
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.onSurface, // bege quente
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        ),
      ),
    );
  }
}

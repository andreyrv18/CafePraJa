import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var nomeController = TextEditingController();
  var sobrenomeController = TextEditingController();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();
  var segundaSenhaController = TextEditingController();

  void validarCampos() {
    var validarNome =
        nomeController.text.length < 3 || sobrenomeController.text.length < 3;
    var validarEmail =
        emailController.text.contains("@") &&
        emailController.text.contains(".com");
    var validarTamanhoSenha =
        senhaController.text.length < 6 ||
        segundaSenhaController.text.length < 6;

    var validarSenhaIguais = segundaSenhaController.text.compareTo(
      senhaController.text,
    );
    if (validarNome ||
        validarTamanhoSenha ||
        !validarEmail ||
        validarSenhaIguais != 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Verifique os campos e tente novamente'),
          duration: const Duration(milliseconds: 1000),

          behavior: SnackBarBehavior.fixed,
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nomeController.dispose();
    sobrenomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    segundaSenhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: theme.outline),
              border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
              icon: const Icon(Icons.person_2),
              hintText: 'Como posso chamar você?',
              labelText: 'Nome *',
            ),
            controller: nomeController,
          ),
          SizedBox(height: 24),
          TextField(
            controller: sobrenomeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
              hintStyle: TextStyle(color: theme.outline),
              icon: const Icon(Icons.person_2_outlined),
              hintText: 'Qual é o seu sobrenome?',
              labelText: 'Sobrenome *',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
              hintStyle: TextStyle(color: theme.outline),
              icon: Icon(Icons.email),
              hintText: 'Ex: seumelhoremail@gmail.com *',
              labelText: 'Digite seu email *',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            obscureText: true,
            controller: senhaController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
              hintStyle: TextStyle(color: theme.outline),
              icon: Icon(Icons.lock),
              hintText: 'Digite sua senha *',
              labelText: 'Senha *',
            ),
          ),
          SizedBox(height: 24),

          TextField(
            controller: segundaSenhaController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
              hintStyle: TextStyle(color: theme.outline),
              icon: Icon(Icons.lock_outline),
              hintText: 'Senha *',
              labelText: 'Digite novamente sua senha *',
            ),
          ),
          SizedBox(height: 240),
          FloatingActionButton.extended(
            backgroundColor: theme.primary,
            elevation: 5,
            foregroundColor: theme.onPrimary,
            onPressed: () async {
              validarCampos();
            },
            label: Text("Cadastrar!"),
          ),
        ],
      ),
    );
  }
}

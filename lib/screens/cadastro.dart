import 'package:cafe_pra_ja/screens/home/home_screen.dart';
import 'package:cafe_pra_ja/widgets/navigation_bottom_bar.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Como posso chamar você?',
              labelText: 'Nome *',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Qual é o seu sobrenome?',
              labelText: 'Sobrenome *',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Ex: seumelhoremail@gmail.com *',
              labelText: 'Digite seu email *',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Digite sua senha *',
              labelText: 'Senha *',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Senha *',
              labelText: 'Digite novamente sua senha *',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
          FloatingActionButton(

            backgroundColor: theme.primary,
            elevation: 5,
            foregroundColor: theme.onPrimary,
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigationBottomBar(),
                ),
              );
            },
            child: Text("Cadastrar!"),
          ),
        ],
      ),
    );
  }
}

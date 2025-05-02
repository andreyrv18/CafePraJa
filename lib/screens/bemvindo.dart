import 'package:flutter/material.dart';

class Bemvindo extends StatelessWidget {
  const Bemvindo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x0038241D),
      body: Column(
        children: [
          Image.asset("assets/images/bemvindo.jpg"),
          Container(
            color: Color(0xff38241d),
            child: Column(
              children: [
                Text(
                  style: TextStyle(color: Colors.white),
                  "Hora de uma parada para o café",
                ),
                Text(
                  style: TextStyle(color: Colors.white),
                  "Sua dose diária de café fresquinho entregue na sua porta. Comece agora a sua jornada no mundo do café!",
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "home"),
                  child: Text("Começe"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

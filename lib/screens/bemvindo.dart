import 'package:flutter/material.dart';

class Bemvindo extends StatelessWidget {
  const Bemvindo({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5C3A2E),
      body: Column(
        spacing: 16,
        children: [
          SizedBox(
            height: 508,
            child: Image.asset("assets/images/bemvindo.jpg", fit: BoxFit.cover),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontFamily: "Sora",
                      ),
                      "Hora de uma parada para o café",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w300,
                      ),
                      "Sua dose diária de café fresquinho entregue na sua porta. Comece agora a sua jornada no mundo do café!",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: 315,
                    height: 50,

                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color(0xffE27D19),
                        ),
                      ),
                      onPressed: () => Navigator.pushNamed(context, "home"),
                      child: Text(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Sora",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        "Vamos lá!",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

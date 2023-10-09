import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController campoGasolina = TextEditingController();
  TextEditingController campoAlcool = TextEditingController();
  String resultado = "Preencha os campos abaixo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gasolina, Álcool ou Bike"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                // Inserindo Imagens
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "Image/combustiveis.jpg",
                    scale: 4,
                  ),
                  Image.asset("Image/bike.jpg", scale: 4),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  resultado,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: campoGasolina,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "Digite o preço da gasolina:",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: campoAlcool,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "Digite o preço do álcool:",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  double gasolina = double.parse(campoGasolina.text);
                  double alcool = double.parse(campoAlcool.text);
                  if (gasolina == 0 || alcool == 0) {
                    setState(() {
                      resultado = "Digite um valor válido";
                    });
                  } else if (gasolina > 10 && alcool > 10) {
                    setState(() {
                      resultado = "Melhor ir de bike";
                    });
                  } else if (alcool / gasolina >= 0.7) {
                    setState(() {
                      resultado = "Melhor abastecer com gasolina";
                    });
                  } else {
                    setState(() {
                      resultado = "É melhor abastecer com álcool";
                    });
                  }
                },
                child: Text("Calcular".toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

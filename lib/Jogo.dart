import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  var _ganhador = "";
  var _apostadacasa = "";
  var _suaaposta = "";
  var _resultadodado = "";

  void _sortear(valorescolhido){
    var valordacasa = Random().nextInt(6) + 1;
    var valordodado = Random().nextInt(6) + 1;
    int maior_a = max(valordodado, valorescolhido);
    int menor_a = min(valordodado, valorescolhido);
    int maior_b = max(valordodado, valordacasa);
    int menor_b = min(valordodado, valordacasa);

    _resultadodado = valordodado.toString();
    _apostadacasa = valordacasa.toString();
    _suaaposta = valorescolhido.toString();

    if(valorescolhido == valordacasa){
      setState(() {
        _ganhador = "Empatou";
      });
    }else if(maior_a - menor_a < maior_b - menor_b){
      setState(() {
        _ganhador = "Você ganhou";
      });
    }
    else{
      setState(() {
        _ganhador = "A casa ganhou";
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dado da Sorte"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 35, bottom: 15),
                child: Text(
                  "Teste a sua sorte",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                )),
            Image.asset(
              "images/dado.gif",
              height: 150.0,
              width: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(onTap:() => _sortear(1), child: const Text("1", style: TextStyle(fontSize: 30))),
                  GestureDetector(onTap:() => _sortear(2), child: const Text("2", style: TextStyle(fontSize: 30))),
                  GestureDetector(onTap:() => _sortear(3), child: const Text("3", style: TextStyle(fontSize: 30))),
                  GestureDetector(onTap:() => _sortear(4), child: const Text("4", style: TextStyle(fontSize: 30))),
                  GestureDetector(onTap:() => _sortear(5), child: const Text("5", style: TextStyle(fontSize: 30))),
                  GestureDetector(onTap:() => _sortear(6), child: const Text("6", style: TextStyle(fontSize: 30))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Resultado: $_resultadodado", style: const TextStyle(fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Aposta da casa: $_apostadacasa", style: const TextStyle(fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("Sua aposta: $_suaaposta", style: const TextStyle(fontSize: 25)),
            ),
            Text(_ganhador, style: const TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}

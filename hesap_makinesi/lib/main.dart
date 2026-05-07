import 'package:flutter/material.dart';

void main() {
  runApp(const HesapMakinesiApp());
}

class HesapMakinesiApp extends StatelessWidget {
  const HesapMakinesiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hesap Makinesi',
      theme: ThemeData.dark(),
      home: const HesapMakinesiEkrani(),
    );
  }
}

class HesapMakinesiEkrani extends StatefulWidget {
  const HesapMakinesiEkrani({super.key});

  @override
  State<HesapMakinesiEkrani> createState() => _HesapMakinesiEkraniState();
}

class _HesapMakinesiEkraniState extends State<HesapMakinesiEkrani> {
  String ekrandakiYazi = "0";

  Widget ozelButon(String yazi, Color butonRengi, {int genislikCari = 1}) {
    return Expanded(
      flex: genislikCari,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: butonRengi,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          onPressed: () {
            setState(() {
              ekrandakiYazi = yazi;
            });
          },
          child: Text(
            yazi,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color koyuGri = const Color(0xFF333333);
    Color maviGri = const Color(0xFF607D8B);
    Color turuncu = const Color(0xFFFF9800);
    Color kirmizi = const Color(0xFFEF5350);
    Color yesil = const Color(0xFF4CAF50);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Scientific Calculator",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      ekrandakiYazi,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ozelButon("sin(", maviGri),
                        ozelButon("cos(", maviGri),
                        ozelButon("tan(", maviGri),
                        ozelButon("log(", maviGri),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ozelButon("sqrt(", maviGri),
                        ozelButon("^", maviGri),
                        ozelButon("(", maviGri),
                        ozelButon(")", maviGri),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ozelButon("7", koyuGri),
                        ozelButon("8", koyuGri),
                        ozelButon("9", koyuGri),
                        ozelButon("÷", turuncu),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ozelButon("4", koyuGri),
                        ozelButon("5", koyuGri),
                        ozelButon("6", koyuGri),
                        ozelButon("×", turuncu),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ozelButon("1", koyuGri),
                        ozelButon("2", koyuGri),
                        ozelButon("3", koyuGri),
                        ozelButon("-", turuncu),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ozelButon("0", koyuGri),
                        ozelButon(".", koyuGri),
                        ozelButon("⌫", kirmizi),
                        ozelButon("+", turuncu),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ozelButon("C", kirmizi, genislikCari: 2),
                        ozelButon("=", yesil, genislikCari: 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

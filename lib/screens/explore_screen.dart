import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String qrResult = 'Codigo qr';

  void scanQr() async {
    String? cameraScanResult = await scanner.scan();
    setState(() {
      qrResult = cameraScanResult!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          flexibleSpace: Container(
            padding: const EdgeInsets.all(80),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/title.png'), fit: BoxFit.cover)),
          ),
          backgroundColor: const Color.fromARGB(250, 168, 176, 180),
          centerTitle: true,
          title: const Text('The Best Buy',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 2),
                    Shadow(
                        color: Colors.black,
                        offset: Offset(-1, -1),
                        blurRadius: 2),
                    Shadow(
                        color: Colors.black,
                        offset: Offset(2, -2),
                        blurRadius: 2),
                    Shadow(
                        color: Colors.black,
                        offset: Offset(-2, 2),
                        blurRadius: 2)
                  ])),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: 100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('buscar'),
                  const Icon(Icons.search),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                  const Text('login'),
                  //QRSCAN
                  FloatingActionButton(
                    onPressed: () => scanQr(),
                    child: const Icon(Icons.qr_code),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

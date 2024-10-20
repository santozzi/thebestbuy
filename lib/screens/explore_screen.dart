import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

//import 'package:qrscan/qrscan.dart' as scanner;

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String qrResult = 'Codigo qr';
  Future<void> scanQr() async {
    final qrResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancelar', true, ScanMode.QR);
    if (!mounted) return;
    setState(() {
      this.qrResult = qrResult;
      print(qrResult);
    });
  }

  final _dio = Dio();
  final String url =
      'https://backendlabiv-s4q1.onrender.com/api/v1/products?page=1';
  Future<dynamic> getProducts() async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  late Future<String> producto;

  @override
  void initState() {
    super.initState();
    producto = getProducts().then((value) => value[0]['title']);
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
        body: ListView(children: const <Widget>[
          Card(
              title: 'sergio',
              price: '69.349',
              urlImage:
                  'https://www.lumilagro.com.ar/wp-content/uploads/2023/05/T0376LUN_1.jpg'),
        ]));
  }
}

class Card extends StatelessWidget {
  final String title;
  final String price;
  final String urlImage;
  const Card({
    super.key,
    required this.title,
    required this.price,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
            'https://www.lumilagro.com.ar/wp-content/uploads/2023/05/T0376LUN_1.jpg'),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Termo Lumilagro Luminox Negro De Acero Inoxidable 1 L',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: const Text('\$69.349', style: TextStyle(fontSize: 20))),
      ],
    );
  }
}

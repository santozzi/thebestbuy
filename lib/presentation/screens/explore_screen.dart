import 'package:bestbuy/models/ecommerce_model.dart';
import 'package:bestbuy/models/product_model.dart';
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
  List<ProductModel> products = [];
  Future<void> scanQr() async {
    final qrResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancelar', true, ScanMode.QR);
    if (!mounted) return;
    setState(() {
      this.qrResult = qrResult;
    });
  }

  final api = EcommerceModel();
  Future<List<ProductModel>> productos() async {
    return await api.getProducts();
  }

  @override
  void initState() {
    super.initState();
    productos().then((value) {
      setState(() {
        products = value;
      });
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
        body: ListView(children: <Widget>[
          for (var product in products)
            Card(
              title: products.isNotEmpty ? product.name : 'Loading...',
              price: products.isNotEmpty ? product.price : 0,
              urlImage: products.isNotEmpty ? product.images[0] : 'Loading...',
            ),
        ]));
  }
}

class Card extends StatelessWidget {
  final String title;
  final int price;
  final String urlImage;
  const Card({
    super.key,
    required this.title,
    required this.price,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Image.network(urlImage),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: Text('\$$price', style: const TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}

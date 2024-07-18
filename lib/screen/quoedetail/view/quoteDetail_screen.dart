import 'package:dbminer/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class QuotedetailScreen extends StatefulWidget {
  const QuotedetailScreen({super.key});

  @override
  State<QuotedetailScreen> createState() => _QuotedetailScreenState();
}

class _QuotedetailScreenState extends State<QuotedetailScreen> {
  QuotesController controller = QuotesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quote"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.save),),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.share)),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.wallpaper)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2,
            width: MediaQuery.sizeOf(context).width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: const Text(
              "Everybody needs just a little love, lots of hope and unshakable faith.",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

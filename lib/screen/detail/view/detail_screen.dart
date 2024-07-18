import 'package:dbminer/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModel data=ModalRoute.of(context)!.settings.arguments as HomeModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote"),
      ),
      body: ListView.builder(
        itemCount:data.quotesList!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'quote');
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? const Color(0xffe2bef1)
                    : const Color(0xfffbf7d5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black87,width: 1),
                boxShadow: [
                  BoxShadow(
                      color: index % 2 == 0
                          ? const Color(0xfffbf7d5)
                          : const Color(0xffe2bef1),
                      blurRadius: 8,
                      blurStyle: BlurStyle.outer)
                ],
              ),
              child:  Text(
                "${data.quotesList}",
                style: TextStyle(
                 color: Colors.black87,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

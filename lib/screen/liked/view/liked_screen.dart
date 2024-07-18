import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Liked",
        style: TextStyle(fontSize: 25),
      ),
    ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Slidable(
                    closeOnScroll: true,
                    direction: Axis.horizontal,
                    enabled: true,

                    child: Slidable(
                      enabled: true,
                      closeOnScroll: true,
                      endActionPane: ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(onPressed: (context) {
                          
                        },icon: Icons.delete,backgroundColor: Colors.red,)
                      ]),
                      startActionPane: ActionPane(
                        extentRatio: 0.2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(

                            onPressed: (context) {},
                            icon: Icons.delete,backgroundColor: Colors.red,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xffe2bef1),),
                              child: Text("1"),
                            ),
                            title: const Text("Everybody needs just a little love, lots of hope and unshakable faith.",style: TextStyle(overflow: TextOverflow.ellipsis),),
                          ),
                          Divider()
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

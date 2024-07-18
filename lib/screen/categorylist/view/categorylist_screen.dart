import 'package:dbminer/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorylistScreen extends StatefulWidget {
  const CategorylistScreen({super.key});

  @override
  State<CategorylistScreen> createState() => _CategorylistScreenState();
}

class _CategorylistScreenState extends State<CategorylistScreen> {
  QuotesController controller =QuotesController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getquoteJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Image.asset("assets/img/Quote.jpg"),
          Expanded(
            child: ListView.builder(
              itemCount: controller.quote.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',arguments: controller.quote[index]);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 130,
                      width: MediaQuery
                          .sizeOf(context)
                          .width,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Color(0xffe2bef1)
                              : Color(0xfffbf7d5),
                          borderRadius: BorderRadius.circular(
                              20),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.7,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.90),
                                blurRadius: 7)
                          ]),
                      child: Obx(
                        ()=> Text(
                          "${controller.quote[index].category}",
                          style: TextStyle(color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}

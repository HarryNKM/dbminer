import 'package:dbminer/screen/categorylist/view/categorylist_screen.dart';
import 'package:dbminer/screen/home/controller/home_controller.dart';
import 'package:dbminer/screen/home/model/home_model.dart';
import 'package:dbminer/screen/liked/view/liked_screen.dart';
import 'package:dbminer/screen/likedcategories/view/category_screen.dart';
import 'package:dbminer/screen/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuotesController controller = QuotesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getReadData();
    controller.getquoteJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
              () =>
              SalomonBottomBar(
                margin: EdgeInsets.all(10),
                onTap: (value) {
                  controller.changeIndex(value);
                },
                currentIndex: controller.changeNavIndex.value,
                items: [
                  SalomonBottomBarItem(
                    selectedColor: Colors.purpleAccent,
                    icon: const Icon(Icons.home),
                    title: const Text("Home"),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.favorite),
                    title: const Text("Liked"),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.save),
                    title: const Text("Categories"),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.settings),
                    title: const Text("Settings"),
                  ),
                ],
              ),
        ),
        body: Obx(
              () =>
              IndexedStack(
                index: controller.changeNavIndex.value,
                children: [
                 CategorylistScreen(),
                  LikedScreen(),
                  CategoryScreen(),
                  SettingScreen()
                ],
              ),
        )
    );
  }
}

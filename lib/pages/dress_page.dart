import 'package:flutter/material.dart';
import 'package:shared_pref/model/dress.dart';
import 'package:shared_pref/pages/soccer_page.dart';
import 'package:shared_pref/services/logger.dart';
import 'package:shared_pref/services/shared_pref_service.dart';

import '../services/flutter_toast.dart';

class DressShop extends StatefulWidget {
  static const String id = "home_page";

  const DressShop({super.key});

  @override
  State<DressShop> createState() => _DressShopState();
}

class _DressShopState extends State<DressShop> {
  TextEditingController sizeViewController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  String? sizeView;
  String? color;
  dynamic size;
  String? type;

  Future<void> savedDressObj() async {
    sizeView = sizeViewController.text.trim();
    color = colorController.text.trim();
    size = sizeController.text.trim();
    type = typeController.text.trim();
    Dress dress = Dress(sizeView: sizeView, color: color, type: type);
    bool isSaved =
        await SharedPrefService.storedObj(obj: dress, objKey: "dress");
    LoggerService.debugLogger(text: isSaved.toString());
  }

  Future getDressObj() async {
    // await SharedPrefService.getObj(Dress, "dress");
    Dress dress = await SharedPrefService.getObj(Dress, "dress");
    setState(() {
      sizeView = dress.sizeView;
      color = dress.color;
      size = dress.size;
      type = dress.type;
    });
    LoggerService.debugLogger(text: SharedPrefService.getObj(Dress, "dress").toString());
    LoggerService.debugLogger(text: color!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff17203A),
        title: const Text(
          "Shopping dress",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SoccerPage.id);
              },
              icon: const Icon(Icons.arrow_forward_ios,  color: Colors.white,))
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Text("Example"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/img.png"))),
              ),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/img_1.png"))),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Color(0xff17203A)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: typeController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Color(0xff17203A)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: sizeViewController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Size view",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: const Color(0xff17203A)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: sizeController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Size ",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Color(0xff17203A)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: colorController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Color",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
                onPressed: () async {
                  await savedDressObj();
                  LoggerService.debugLogger(text: "on press bosildi");
                  showToast("dress information saved");
                },
                child: const Text("Buy now")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
                onPressed: () async {
                  showToast("get information and  color is $color");
                  await getDressObj();
                },//dress information get
                child:  const Text("dress information get")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
                onPressed: () async {
                  showToast("order cansel");
                  await getDressObj();
                },
                child:  const Text("Cansel")),
          ),
        ],
      ),
    );
  }
}

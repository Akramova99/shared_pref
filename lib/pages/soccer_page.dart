import 'package:flutter/material.dart';
import 'package:shared_pref/model/soccer.dart';
import 'package:shared_pref/services/flutter_toast.dart';
import 'package:shared_pref/services/logger.dart';
import 'package:shared_pref/services/shared_pref_service.dart';

class SoccerPage extends StatefulWidget {
  static const String id = "soccer_page";

  const SoccerPage({super.key});

  @override
  State<SoccerPage> createState() => _SoccerPageState();
}

class _SoccerPageState extends State<SoccerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController playerNumberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  String? name;
  int? age;
  int? playerNumber;
  String? type;

  Future<void> savedSoccerObj() async {
    name = nameController.text.trim();
    age = int.parse(ageController.text.trim());
    playerNumber = int.parse(playerNumberController.text.trim());
    type = typeController.text.trim();
    if (name!.isNotEmpty &&
        age.toString().isNotEmpty &&
        playerNumber.toString().isNotEmpty &&
        type!.isNotEmpty) {
      SoccerPlayer soccerPlayer = SoccerPlayer(
          name: name, age: age, playerNumber: playerNumber, type: type);
      bool isSaved = await SharedPrefService.storedObj(
          obj: soccerPlayer, objKey: "soccer player");
      LoggerService.debugLogger(text: isSaved.toString());
    }
  }

  Future<void> getSoccerPlayer() async {
    SoccerPlayer soccerPlayer =
        await SharedPrefService.getObj(SoccerPlayer, "soccer player");
    setState(() {
      name = soccerPlayer.name;
      age = soccerPlayer.age;
      playerNumber = soccerPlayer.playerNumber;
      type = soccerPlayer.type;
    });
    LoggerService.debugLogger(text: name!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff83689C),
        title: const Text(
          "Soccer Player",
         // style: TextStyle(color: Colors.white),
        ),
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
                        image: AssetImage("assets/images/img_2.png"))),
              ),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/img_3.png"),fit: BoxFit.cover)),
              ),
            ],
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
                controller: nameController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
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
                controller: ageController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Age",
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
                controller: playerNumberController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "player Number",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 78.0),
            child: ElevatedButton(
                onPressed: () async {
                  await savedSoccerObj();
                  showToast("player information saved");
                },
                child: const Text("Vote")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 78.0),
            child: ElevatedButton(
                onPressed: () async {
                  await getSoccerPlayer();
                  showToast("get $name information ");
                },
                child: const Text("See")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 78.0),
            child: ElevatedButton(
                onPressed: () async {
                  await SharedPrefService.removeObj("soccer player");
                  showToast("remove $name information ");
                },
                child: const Text("Cansel")),
          ),
        ],///dress information saved and get
      ),
    );
  }
}

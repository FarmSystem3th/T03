import 'package:flutter/material.dart';
import 'package:reborn_fe/start/login.dart';

// ignore: camel_case_types
class Lobby_first extends StatefulWidget {
  const Lobby_first({super.key});

  @override
  State<Lobby_first> createState() => _LobbyfirstState();
}

class _LobbyfirstState extends State<Lobby_first> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFFc7e8f2),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LobbyLogin()),
          );
        },
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  "assets/lobby_title.png",
                ),
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: Image.asset(
                    "assets/lobby_hanems.png",
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      Image.asset(
                        "assets/lobby_company.png",
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container())
            ],
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class LobbyFind extends StatelessWidget {
  const LobbyFind({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(children: [
          LobbyPic(),
        ]),
      ),
    ));
  }
}

class LobbyPic extends StatelessWidget {
  const LobbyPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/lobby_title.PNG",
          width: 50,
        ),
        Image.asset(
          "assets/lobby_hanems.PNG",
          width: 25,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'drawer.dart';

class BuildAppBar extends StatefulWidget {
  const BuildAppBar({Key? key}) : super(key: key);

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> {
  @override
  Widget build(Object context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
            onTap: () {},
            child: const Text("Map", style: TextStyle(color: Colors.black))),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomDrawer()));
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
              size: 26,
            )),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
              onPressed: () => {_key.currentState!.openEndDrawer()},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 26,
              )),
        ],
      ),
    );
  }
}

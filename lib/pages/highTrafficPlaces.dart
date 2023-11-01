import 'package:flutter/material.dart';

class HighTrafficPlaces extends StatelessWidget {
  const HighTrafficPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width - 20, 50)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                icon: const Icon(Icons.star),
                label: const Text(
                  'اصفهان، خیابان میر، قبل از پمپ بنزین',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

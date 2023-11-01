import 'package:flutter/material.dart';
import 'package:test_flutter/pages/profileScreen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                          side: MaterialStateProperty.all(BorderSide.none)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileEditPage()));
                  },
                  label: const Text('پروفایل'),
                  icon: const Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('سفرهای شما'),
                  icon: const Icon(
                    Icons.mode_of_travel,
                    size: 24.0,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('هدیه شما'),
                  icon: const Icon(
                    Icons.card_giftcard,
                    size: 24.0,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('مکان های پر تردد'),
                  icon: const Icon(
                    Icons.star_purple500,
                    size: 24.0,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

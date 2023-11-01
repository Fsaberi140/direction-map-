import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white, // رنگ پس‌زمینه دراور
            ),
            child: Stack(children: [
              Text(
                'پروفایل',
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title:const Text('پروفایل'),
            onTap: () {},
          ),
          ListTile(
            leading:const Icon(Icons.mode_of_travel),
            title:const Text('سفرهای شما'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('هدیه شما'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.star_purple500),
            title: const Text(
              "مکان های پر تردد",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ثبت نام کنید'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'نام کاربری',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'رمز عبور',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // کد بررسی صحت نام کاربری و رمز عبور
              },
              child: Text('ورود'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  height: 55,
                  child: TextField(
                    decoration: const InputDecoration(
                        labelText: 'نام کاربری',
                        prefixIcon: Icon(Icons.person, size: 20),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    controller: usernameController,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 55,
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'رمز عبور',
                        prefixIcon: Icon(Icons.lock, size: 20),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                const SizedBox(height: 36),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width - 220, 50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    if (isLogin) {
                      //  کد بررسی صحت نام کاربری و رمز عبور برای ورود
                    } else {
                      //  کد بررسی صحت نام کاربری و رمز عبور برای ثبت نام
                    }
                  },
                  child: Text(
                    isLogin ? 'ورود' : 'ثبت نام',
                    style:const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? 'ثبت نام نکرده اید؟ ثبت نام'
                        : 'قبلاً ثبت نام کرده اید؟ ورود',
                  
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
  }

  void _saveChanges() {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String email = _emailController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: "نام و نام خانوادگی",
                    labelStyle: TextStyle(fontSize: 15)),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                    labelText: "تلفن همراه",
                    labelStyle: TextStyle(fontSize: 15)),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                 
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent)),
                    focusColor: Colors.purpleAccent,
                    
                    labelText: "ایمیل",                    
                    labelStyle: TextStyle(fontSize: 15,), ),
              ),
              const SizedBox(height: 25),
              Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.purpleAccent,
                ),
                child: TextButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  child: const Text(
                    'اعمال تغییرات',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

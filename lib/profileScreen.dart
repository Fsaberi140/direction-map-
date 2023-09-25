import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
   TextEditingController _nameController;
   TextEditingController _phoneController;
   TextEditingController _emailController;

_ProfileEditPageState(this._emailController, this._nameController, this._phoneController)

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
  }

  @override
  void _saveChanges() {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String email = _emailController.text;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [TextFormField(
            controller: _nameController,
            decoration:const InputDecoration(labelText: "نام و نام خانوادگی"),
          ),
          TextFormField(
            controller: _phoneController,
            decoration:const InputDecoration(labelText: "تلفن همراه"),
          keyboardType: TextInputType.phone,), 
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "ایمیل"),
          ), 
         const SizedBox(height: 20,),
        TextButton(
          onPressed:_saveChanges,
          child : const Text("ذخیره تغییرات")
        )
          ],
        ),
      )),
    );
  }
}

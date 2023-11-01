import 'package:flutter/material.dart';

class YourTravel extends StatelessWidget {
  const YourTravel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
              child: IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 237, 162, 251),
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [BoxShadow(blurRadius: 0.2)],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'مبدا:',
                                    style: TextStyle(fontSize: 15),
                                  )),
                                  Expanded(
                                      child: Text(
                                          'اصفهان،خیابان سعدی،کوچه 15، پلاک1')),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text('مقصد:',
                                          style: TextStyle(fontSize: 15))),
                                  Expanded(
                                      child: Text(
                                          'اصفهان،خیابان مولوی، کوچه 33')),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text('راننده:',
                                          style: TextStyle(fontSize: 15))),
                                  Expanded(
                                      child: Text('مرتضی رضوی اردستانی')),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text('پلاک:',
                                          style: TextStyle(fontSize: 15))),
                                  Expanded(child: Text('12 ی 12345')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

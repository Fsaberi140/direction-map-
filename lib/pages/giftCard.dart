import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/gift.svg',
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(height: 40),
                  const Text('شما 50 هزار تومان هدیه فعال دارید',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                  const SizedBox(height: 20),
                  Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color.fromARGB(255, 237, 162, 251),
                          width: 2),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'کد تخفیف: kjkd7jd8',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }
}

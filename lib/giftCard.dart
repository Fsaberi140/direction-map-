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
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                 const Text('شما 50 هزار تومان هدیه فعال دارید',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                 const SizedBox(height: 20),
                  const Text(
                    'کد تخفیف: kjkd7jd8',
                    style: TextStyle(fontSize: 15),
                  )
                ]),
          ),
        ));
  }
}

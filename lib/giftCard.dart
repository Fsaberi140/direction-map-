
import 'package:flutter/material.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'شما 50 هزار تومان هدیه فعال دارید',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.purple[600])
                  ),
                  SizedBox(height: 20),
                  Text(
                    'کد تخفیف: kjkd7jd8',
                    style: TextStyle(fontSize: 15),
                  )
                ]),
          ),
        ));
  }
}

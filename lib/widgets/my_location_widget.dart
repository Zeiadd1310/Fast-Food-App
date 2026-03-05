import 'package:flutter/material.dart';

class MyLocationWidget extends StatelessWidget {
  const MyLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/avatar.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset('assets/images/navigation.png'),

                Text(
                  'الموقع الحالي',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            Text(
              '19 الشيخ احمد الصاوي، مدينة نصر',
              style: TextStyle(fontSize: 15, color: Color(0xff515151)),
            ),
          ],
        ),
        Image.asset('assets/images/notification.png', height: 40, width: 40),
      ],
    );
  }
}

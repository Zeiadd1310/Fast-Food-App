import 'package:depi/widgets/custom_meal_card_widget.dart';
import 'package:flutter/material.dart';

class CustomMealInfoWidget extends StatelessWidget {
  const CustomMealInfoWidget({super.key, required this.imagePath});

  final AssetImage imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomMealCardWidget(
          imagePath: imagePath,
          color: Color(0xffFEEEEC),
          width: 175,
          height: 125,
          borderRadius: 0,
        ),
        SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'بج بيرجر سبايسي',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset('assets/images/burger_icon.png'),
                    SizedBox(width: 6),
                    Text(
                      'وجبات سريعة',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff868686),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0xffFFB700), size: 16),
                    SizedBox(width: 6),
                    Text(
                      '5.0 (+100)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  '150 ج.م',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff868686),
                  ),
                ),
              ],
            ),
            SizedBox(width: 24),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                color: Color(0xffF55540),
                image: DecorationImage(
                  image: AssetImage('assets/images/store.png'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

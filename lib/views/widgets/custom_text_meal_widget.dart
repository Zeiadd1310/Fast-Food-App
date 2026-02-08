import 'package:flutter/material.dart';

class MealItem {
  final String imagePath;
  final String name;
  final String price;

  MealItem({required this.imagePath, required this.name, required this.price});
}

class CustomTextMealWidget extends StatelessWidget {
  const CustomTextMealWidget({super.key, required this.meals});

  final List<MealItem> meals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              meal.imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Text(
              meal.name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Text(
              meal.price,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff868686),
              ),
            ),
          ],
        );
      },
    );
  }
}

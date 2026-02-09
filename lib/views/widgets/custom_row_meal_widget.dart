import 'package:flutter/material.dart';

class MealItem {
  final String title;
  final String description;
  final String price;
  final String image;

  MealItem({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}

class CustomRowMealWidget extends StatelessWidget {
  final List<MealItem> meals;

  const CustomRowMealWidget({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: meals.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final meal = meals[index];
        final isLast = index == meals.length - 1;
        return Column(
          children: [
            Row(
              children: [
                Image.asset(
                  meal.image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        meal.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        meal.price,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!isLast) ...[
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
            ],
          ],
        );
      },
    );
  }
}

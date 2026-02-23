import 'package:depi/widgets/custom_horizontal_container_widget.dart';
import 'package:depi/widgets/custom_row_meal_widget.dart';
import 'package:depi/widgets/custom_text_meal_widget.dart';
import 'package:flutter/material.dart';

class BestDealsView extends StatelessWidget {
  const BestDealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              //
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 380,
                    height: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/pizza_order.png',
                          fit: BoxFit.fitHeight,
                          width: 100,
                          height: 150,
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'اسم الطعم هنا',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset('assets/images/burger_icon.png'),
                                  SizedBox(width: 5),
                                  Text(
                                    'طعام بحري, مشويات, اكلات سريعة',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff868686),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffFFB700),
                                    size: 16,
                                  ),
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
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset('assets/images/truck-fast.png'),
                                  SizedBox(width: 6),
                                  Text(
                                    'متاح التوصيل',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff868686),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_border_outlined, size: 30),
                            SizedBox(height: 10),
                            Icon(Icons.share, size: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF55540),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.tune, color: Color(0xffF55540)),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xffF55540),
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            'الأفضل 🔥',
                            style: TextStyle(
                              color: Color(0xffF55540),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        CustomHorizontalContainerWidget('بيتزا'),
                        const SizedBox(width: 5),
                        CustomHorizontalContainerWidget('مشويات'),
                        const SizedBox(width: 5),
                        CustomHorizontalContainerWidget('حلويات'),
                        const SizedBox(width: 5),
                        CustomHorizontalContainerWidget('مشروبات'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '🔥 الافضل',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CustomTextMealWidget(
                    meals: [
                      TextMealItem(
                        imagePath: 'assets/images/chicken_rec.png',
                        name: 'معكرونه بالصوص و قطع بانية حار',
                        price: '2.20 د.ك',
                      ),
                      TextMealItem(
                        imagePath: 'assets/images/fries.png',
                        name: 'معكرونه بالصوص و قطع بانية حار',
                        price: '2.20 د.ك',
                      ),
                      TextMealItem(
                        imagePath: 'assets/images/eggs.png',
                        name: 'معكرونه بالصوص و قطع بانية حار',
                        price: '2.20 د.ك',
                      ),
                      TextMealItem(
                        imagePath: 'assets/images/pizza.png',
                        name: 'معكرونه بالصوص و قطع بانية حار',
                        price: '2.20 د.ك',
                      ),
                    ],
                  ),
                  Text(
                    '🍕 بيتزا',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  CustomRowMealWidget(
                    meals: [
                      MealItem(
                        title: 'معكرونه بالصوص و قطع بانية حار',
                        description:
                            'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
                        price: '2.20 د.ك',
                        image: 'assets/images/spaghetti.png',
                      ),
                      MealItem(
                        title: 'معكرونه بالصوص و قطع بانية حار',
                        description:
                            'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
                        price: '2.20 د.ك',
                        image: 'assets/images/spaghetti.png',
                      ),
                      MealItem(
                        title: 'معكرونه بالصوص و قطع بانية حار',
                        description:
                            'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
                        price: '2.20 د.ك',
                        image: 'assets/images/spaghetti.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF55540),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color.fromARGB(255, 255, 172, 161),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    '0',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'الاطلاع على السلة',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '0.00 ج.م',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

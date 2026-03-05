import 'package:depi/constants.dart';
import 'package:depi/features/home/models/product_model.dart';
import 'package:depi/features/favourites/controller/favourites_controller.dart';
import 'package:depi/widgets/custom_meal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomMealInfoWidget extends StatelessWidget {
  const CustomMealInfoWidget({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomMealCardWidget(
                imagePath: AssetImage(
                  product.image ?? 'assets/images/default.png',
                ),
                color: Color(0xffFEEEEC),
                width: 175,
                height: 125,
                borderRadius: 0,
              ),
              Positioned(
                top: 8,
                right: 4,
                child: Consumer<FavouritesController>(
                  builder: (context, favouritesController, _) {
                    final isFavourite = favouritesController.isFavourite(
                      product.id ?? 0,
                    );
                    return GestureDetector(
                      onTap: () {
                        favouritesController.toggleFavourite(product);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name ?? 'اسم الوجبة',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              SizedBox(height: 6),
              Text(
                product.description ?? 'وصف الوجبة',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff868686),
                ),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Image.asset(
                    'assets/images/burger_icon.png',
                    width: 14,
                    height: 14,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      product.category ?? 'الفئة',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff868686),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffFFB700), size: 16),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      '${product.rating ?? 0.0} (+${product.ratingsCount ?? 0})',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price ?? 0} ج.م',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff868686),
                    ),
                  ),
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
          ),
        ],
      ),
    );
  }
}

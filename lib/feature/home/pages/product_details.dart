import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_market/core/constants/product_data.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/feature/cart/presentation/pages/cart_product.dart';
import 'package:one_market/feature/home/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  List<CardItem> product = [];
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentSlide = 0;
  int selectedButton = 2;

  void addToCart() {
    ProductItem newItem = ProductItem(
      name: widget.product[0].title,
      price: widget.product[0].pricing,
      quantity: 1,
    );
    ProductProvider().addToCart(newItem);
  }

  void selectButton(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  final List<String> _image = [
    productImages[0],
    productImages[1],
    productImages[2],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 3,
              enlargeCenterPage: true,
              onPageChanged: (index, _) {
                setState(() {
                  _currentSlide = index;
                });
              },
            ),
            items: widget.product.map((image) {
              return Builder(
                builder: (context) {
                  return Image.asset(
                    image.images[_currentSlide],
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),
          Container(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.product[_currentSlide].title,
                      style: getTitleStyle(
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.product[_currentSlide].pricing}',
                      style: getBodyStyle(color: AppColors.secondryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(16),
          // Padding(
          //   padding: const EdgeInsets.all(18),
          //   child: Text(
          //     'وصف المنتج',
          //     style: getHeadLineStyle(fontSize: 22),
          //   ),
          // ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   padding: const EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     color: AppColors.primaryColor,
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'أحلي بن عالرايق',
          //         style: getBodyStyle(color: AppColors.secondryColor),
          //       ),
          //       Text(
          //         'أحلي بن عالرايق',
          //         style: getBodyStyle(color: AppColors.secondryColor),
          //       ),
          //       Text(
          //         'أحلي بن عالرايق',
          //         style: getBodyStyle(color: AppColors.secondryColor),
          //       ),
          //     ],
          //   ),
          // ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.only(right: 8, left: 8, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      selectButton(1);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 1
                          ? Colors.grey
                          : AppColors.secondryColor,
                    ),
                    child: Text(
                      'إعادة بيع',
                      style: getTitleStyle(
                        color: selectedButton == 1
                            ? AppColors.secondryColor
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.only(right: 8, left: 8, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      selectButton(2);
                      addToCart();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 2
                          ? Colors.grey
                          : AppColors.secondryColor,
                    ),
                    child: Text(
                      'أضف إلى السلة',
                      style: getTitleStyle(
                        color: selectedButton == 2
                            ? AppColors.secondryColor
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

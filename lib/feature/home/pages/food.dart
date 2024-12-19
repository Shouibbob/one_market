import 'package:flutter/material.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/core/widgets/custom_scaffold.dart';
import 'package:one_market/feature/home/widgets/card_widget.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  //List<String> image = [];
  List<CardItem> product = [];
  List<String> title = [];

  @override
  void initState() {
    super.initState();
    //image = cards.map((e) => e.images).cast<String>().toList();
    product = cards
        .map((e) =>
            CardItem(images: e.images, title: e.title, pricing: e.pricing))
        .toList();
    fetchImages();
  }

  Future<void> fetchImages() async {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.secondryColor,
              ),
              child: Container(
                color: AppColors.primaryColor,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(product[index].images[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.secondryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  product[index].title,
                                  style: getHeadLineStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.secondryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  product[index].pricing,
                                  style: getTitleStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  product[index].pricing,
                                  style: getHeadLineStyle(
                                    color: AppColors.secondryColor,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  product[index].pricing,
                                  style: getBodyStyle(
                                    color: AppColors.secondryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 1,
    );
  }
}

class FoodItem {
  final String image;
  final String title;
  final String subtitle;
  final double rating;
  final double price;
  FoodItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  });
}

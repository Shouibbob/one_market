import 'package:flutter/material.dart';
import 'package:one_market/core/function/navigation.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/core/widgets/custom_scaffold.dart';
import 'package:one_market/feature/home/pages/product_details.dart';
import 'package:one_market/feature/home/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> cardItems = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    cardItems = cards;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: CustomScaffold(
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
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'ابحث عن ما يناسبك',
                            hintStyle:
                                getSmallStyle(fontSize: 12, color: Colors.grey),
                            border: InputBorder.none,
                            icon: const Icon(Icons.search),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
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
                child: SingleChildScrollView(
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: cardItems
                        .where((cardItem) => cardItem.title
                            .toLowerCase()
                            .contains(searchText.toLowerCase()))
                        .map((cardItem) {
                      return buildCard(cardItem);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        showBottomNavBar: true,
        initialIndex: 0,
      ),
    );
  }

  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async {
        await push(context, const ProductDetails());
      },
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              child: PageView.builder(
                itemCount: cardItem.images.length,
                onPageChanged: (int index) {
                  setState(() {
                    cardItem.currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    cardItem.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(cardItem.images.length,
                  (int circlrIndex) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: circlrIndex == cardItem.currentIndex
                        ? AppColors.foreGround
                        : AppColors.secondryColor,
                  ),
                );
              }),
            ),
            ListTile(
              title: Text(
                cardItem.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: getBodyStyle(color: AppColors.secondryColor),
              ),
              subtitle: Text(
                cardItem.pricing,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  ' استثنائي ',
                  style: getBodyStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

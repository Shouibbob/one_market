import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/core/widgets/custom_scaffold.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> productNames = [
    'حلاوة البريمو',
    'دقيق الخباز',
    'شاي العروسة',
    'زيت هدية',
    'شاي ليبتون'
  ];
  List<int> quantities = [1, 1, 1, 1, 1];
  List<double> prices = [800, 250, 350, 1400, 950];
  List<String> images = [
    'assets/images/albremo.png',
    'assets/images/baker.png',
    'assets/images/elarosatea.png',
    'assets/images/hediaoil.png',
    'assets/images/lebton.png',
  ];

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      quantities[index]--;
    });
  }

  double getCartToal() {
    double total = 0;
    for (int i = 0; i < productNames.length; i++) {
      total += quantities[i] * prices[i];
    }
    return total;
  }

  void showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('تأكيد الطلب'),
          content: const Text('هل أنت متأكد من أنك تريد إكمال الطلب؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('تأكيد'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'عربة التسوق',
                style: getHeadLineStyle(
                  fontSize: 26,
                  color: AppColors.secondryColor,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productNames.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(productNames[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          productNames.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16),
                        child: const Icon(
                          Icons.cancel,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              images[index],
                              height: 50,
                              width: 50,
                            ),
                            const Gap(15),
                            Column(
                              children: [
                                Text(
                                  productNames[index],
                                  style: getTitleStyle(),
                                ),
                                Text(
                                  '\$${prices[index]}',
                                  style: getBodyStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    decrementQuantity(index);
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(
                                  quantities[index].toString(),
                                  style: getTitleStyle(),
                                ),
                                IconButton(
                                  onPressed: () {
                                    incrementQuantity(index);
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'عربة التسوق :',
                      style: getTitleStyle(),
                    ),
                    const Gap(50),
                    Text(
                      '\$${getCartToal().toStringAsFixed(2)}',
                      style: getHeadLineStyle(),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showCheckoutDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondryColor,
                          foregroundColor: AppColors.primaryColor,
                        ),
                        child: const Text(
                          'ادفع الان',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 3,
    );
  }
}

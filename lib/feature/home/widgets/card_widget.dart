import 'package:one_market/core/constants/product_data.dart';

class CardItem {
  final String title;
  final String pricing;
  final List<String> images;
  int currentIndex;

  CardItem({
    required this.title,
    required this.pricing,
    required this.images,
    this.currentIndex = 0,
  });
}

List<CardItem> cards = [
  CardItem(
    title: 'بن ابو عوف',
    pricing: '1350 ج.م',
    images: [
      productImages[0],
      productImages[0],
      productImages[0],
    ],
  ),
  CardItem(
    title: 'شعرية أدم',
    pricing: '600 ج.م',
    images: [
      productImages[1],
      productImages[1],
      productImages[1],
    ],
  ),
  CardItem(
    title: 'حلاوة البريمو',
    pricing: '800 ج.م',
    images: [
      productImages[2],
      productImages[2],
      productImages[2],
    ],
  ),
  CardItem(
    title: 'دقيق الخباز',
    pricing: '250 ج.م',
    images: [
      productImages[3],
      productImages[3],
      productImages[3],
    ],
  ),
  CardItem(
    title: 'كاتشب فرست تشويس',
    pricing: '90 ج.م',
    images: [
      productImages[4],
      productImages[4],
      productImages[4],
    ],
  ),
  CardItem(
    title: 'شاي العروسة',
    pricing: '1000 - 350 ج.م',
    images: [
      productImages[5],
      productImages[5],
      productImages[5],
    ],
  ),
  CardItem(
    title: 'فرجلو مرقة دجاج',
    pricing: '800 ج.م',
    images: [
      productImages[6],
      productImages[6],
      productImages[6],
    ],
  ),
  CardItem(
    title: 'زيت هدية',
    pricing: '1400 ج.م',
    images: [
      productImages[7],
      productImages[7],
      productImages[7],
    ],
  ),
  CardItem(
    title: 'عسل نحل عبوة 1 كيلو',
    pricing: '1500 ج.م',
    images: [
      productImages[8],
      productImages[8],
      productImages[8],
    ],
  ),
  CardItem(
    title: 'شاي ليبتون',
    pricing: '1800 - 950 ج.م',
    images: [
      productImages[9],
      productImages[9],
      productImages[9],
    ],
  ),
  CardItem(
    title: 'مرقة دجاج ماجي',
    pricing: '850 ج.م',
    images: [
      productImages[10],
      productImages[10],
      productImages[10],
    ],
  ),
  CardItem(
    title: 'كوفي ميكس بدون سكر',
    pricing: '100 ج.م',
    images: [
      productImages[11],
      productImages[11],
      productImages[11],
    ],
  ),
  CardItem(
    title: 'نودلز كوري الحراق',
    pricing: '550 ج.م',
    images: [
      productImages[12],
      productImages[12],
      productImages[12],
    ],
  ),
  CardItem(
    title: 'زيت رغد',
    pricing: '1500 ج.م',
    images: [
      productImages[13],
      productImages[13],
      productImages[13],
    ],
  ),
  CardItem(
    title: 'زيت صنى',
    pricing: '45 ج.م',
    images: [
      productImages[14],
      productImages[14],
      productImages[14],
    ],
  ),
  CardItem(
    title: 'تونة صن شاين قطع',
    pricing: '1500 ج.م',
    images: [
      productImages[15],
      productImages[15],
      productImages[15],
    ],
  ),
];

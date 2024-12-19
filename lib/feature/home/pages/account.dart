import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/core/widgets/custom_scaffold.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.secondryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'حسابي',
                        style: getHeadLineStyle(
                          fontSize: 22,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        'shouib@gmail.com',
                        style: getSmallStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                'assets/images/home.png',
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'معلومات الحساب',
                  style: getTitleStyle(fontSize: 20),
                ),
              ),
              const ListOfOption(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.secondryColor,
                ),
                title: 'الملف الشخصي',
              ),
              const ListOfOption(
                icon: Icon(
                  Icons.location_city_outlined,
                  color: AppColors.secondryColor,
                ),
                title: 'العنوان',
              ),
              const ListOfOption(
                icon: Icon(
                  Icons.payment_outlined,
                  color: AppColors.secondryColor,
                ),
                title: 'المدفوعات',
              ),
              const ListOfOption(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.secondryColor,
                ),
                title: 'الطلبات',
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'الإعدادات',
                  style: getTitleStyle(fontSize: 20),
                ),
              ),
              const ListOfOption(
                icon: Icon(
                  Icons.language_outlined,
                  color: AppColors.secondryColor,
                ),
                title: 'اللغة',
              ),
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 2,
    );
  }
}

class ListOfOption extends StatelessWidget {
  final Icon icon;
  final String title;
  const ListOfOption({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 16,
      ),
      onTap: () {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import 'package:news_app_final/ui/core/assets/app_images.dart';
import 'package:news_app_final/ui/core/widgets/category_card.dart';
import 'package:news_app_final/ui/core/widgets/custom_app_bar.dart';
import 'package:news_app_final/ui/core/widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  static const String routeName = 'Home';
  List<String> categoryImage =[AppImages.general,AppImages.business,AppImages.entertainment,
  AppImages.health,AppImages.science,AppImages.technology,AppImages.sports];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> categoryName =[
    getTranslations(context).general,
    getTranslations(context).business,
    getTranslations(context).entertainment,
    getTranslations(context).health,
    getTranslations(context).science,
    getTranslations(context).technology,
    getTranslations(context).sports
    ];
    List<String> apiCategoryName =[
      'general',
      'business',
      'entertainment',
      'health',
      'science',
      'technology',
      'sports'
    ];
    return SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: CustomAppBar(
                  title: getTranslations(context).home,
                  isSearchIconDisplayed: false,
              )),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Text(
                  getTranslations(context).good_morning,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                  SizedBox(height: 20.h,),
                  Expanded(
                          child: ListView.builder(
                              itemCount: categoryName.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:  EdgeInsets.only(bottom: 20.h),
                                  child: CategoryCard(
                                     categoryName: categoryName[index],
                                     apiCategoryName: apiCategoryName[index],
                                     categoryImage: categoryImage[index],
                                      currentIndex: index,
                                  ),
                                );
                              }
                          )
                      )
              ],
            ),
          ),
        )
    );
  }
}
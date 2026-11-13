import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import 'package:news_app_final/ui/screens/news_screen.dart';

import '../assets/app_colors.dart';

class CategoryCard extends StatelessWidget{
  String categoryName;
  String apiCategoryName;
  String categoryImage;
  int currentIndex;
  CategoryCard({
    required this.categoryName,
    required this.apiCategoryName,
    required this.categoryImage,
    required this.currentIndex
});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
      color: Theme.of(context).appBarTheme.foregroundColor,
      borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        textDirection: currentIndex %2 == 0? TextDirection.ltr : TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
                categoryImage,
             // width: 180,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20.h,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, NewsScreen.routeName,arguments: {
                    "apiCategoryName": apiCategoryName,
                    "categoryName": categoryName,
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(84.r),
                    color: Theme.of(context).brightness == Brightness.light? AppColors.lowOpacityWhite : AppColors.lowOpacityBlack
                  ),
                   child: Row(
                    textDirection: currentIndex %2 == 0? TextDirection.ltr : TextDirection.rtl,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          getTranslations(context).view_all,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Theme.of(context).textTheme.titleLarge?.color
                        ),
                        child: Icon(
                          currentIndex %2 == 0 && Localizations.localeOf(context) == Locale('en')
                              || currentIndex %2 != 0 && Localizations.localeOf(context) == Locale('ar')?
                          Icons.arrow_forward_ios_sharp
                          : Icons.arrow_back_ios_sharp,
                          size: 30.r,
                          color: Theme.of(context).textTheme.headlineSmall?.color,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
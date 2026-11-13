import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import 'package:news_app_final/ui/core/assets/app_images.dart';

import '../../screens/news_details.dart';

class CustomBottomSheet extends StatelessWidget{
  String newsImageUrl;
  String newsContent;
  final currentArticle;
  CustomBottomSheet({
   required this.newsImageUrl,
   required this.newsContent,
   required this.currentArticle
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16.r),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.foregroundColor,
          borderRadius: BorderRadius.circular(16.r)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: newsImageUrl == '' ? Image.asset(
                    AppImages.empty,
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
          : Image.network(
                    newsImageUrl,
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
              ),
              Text(
                newsContent,
                maxLines: 5,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              ElevatedButton(
                  onPressed: (){
                 Navigator.pushNamed(context, NewsDetails.routeName,arguments: currentArticle);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    )
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 15.h),
                    child: Text(
                      getTranslations(context).view_full_article,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
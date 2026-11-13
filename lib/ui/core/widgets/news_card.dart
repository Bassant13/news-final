import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import 'package:news_app_final/ui/core/widgets/custom_bottom_sheet.dart';
import '../assets/app_images.dart';

class NewsCard extends StatelessWidget{
  String newsImageUrl;
  String newsTitle;
  String newsContent;
  String newsAuthor;
  String publishTime;
  final currentArticle;
  NewsCard({
   required this.newsImageUrl,
   required this.newsTitle,
   required this.newsContent,
   required this.newsAuthor,
   required this.publishTime,
   required this.currentArticle
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (builder){
          return CustomBottomSheet(
          newsImageUrl: newsImageUrl,
          newsContent: newsContent,
          currentArticle: currentArticle,
        );
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
           decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16.r),
                   border: Border.all(
                       color: Theme.of(context).appBarTheme.foregroundColor!,
                       width: 1.5
           )
           ),
        child: Padding(
          padding:  EdgeInsets.all(8.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                newsTitle,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${getTranslations(context).by}: $newsAuthor',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      publishTime,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
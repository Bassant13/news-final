import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/api_services/models/Articles.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import 'package:news_app_final/ui/core/widgets/custom_app_bar.dart';
import 'package:news_app_final/ui/core/widgets/custom_drawer.dart';
import '../core/assets/app_images.dart';

class NewsDetails extends StatelessWidget{
  static const String routeName = 'News Details';

  @override
  Widget build(BuildContext context) {
    final currentArticle = ModalRoute.of(context)?.settings.arguments  as Articles? ;
    return SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: CustomAppBar(
              isSearchIconDisplayed: false,
                title: currentArticle?.source?.name ??''
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentArticle?.title ??'',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    '${getTranslations(context).by}: ${currentArticle?.author ?? getTranslations(context).unknown}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    '${getTranslations(context).published_at}: ${currentArticle?.publishedAt?.substring(0,10)}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 15.h,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: currentArticle?.urlToImage == '' ? Image.asset(
                        AppImages.empty,
                        height: 200.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                          : Image.network(
                       currentArticle?.urlToImage ?? '',
                        height: 200.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    currentArticle?.description ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
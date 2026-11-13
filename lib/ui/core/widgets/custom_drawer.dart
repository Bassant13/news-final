import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import 'package:news_app_final/providers/language_provider.dart';
import 'package:news_app_final/ui/core/assets/app_colors.dart';
import 'package:news_app_final/ui/core/assets/app_fonts.dart';
import 'package:news_app_final/ui/core/widgets/custom_dropdown_menu.dart';
import 'package:news_app_final/ui/screens/home.dart';
import '../../../providers/theme_provider.dart';

class CustomDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String selectedTheme = context.watch<ThemeProvider>().currentTheme == ThemeMode.light? getTranslations(context).light
        : getTranslations(context).dark  ;
    String selectedLanguage = context.watch<LanguageProvider>().currentLocale == 'en'? 'English' : 'العربية' ;

    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            color: AppColors.white,
            child: Center(
              child: Text(
                getTranslations(context).news_app,
                style: AppFonts.blackBold24
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Home.routeName);
                  },
                  child: CustomDropdownMenu(
                    title: getTranslations(context).home_page,
                    icon: Icons.home,
                    hasMenu: false,
                  ),
                ),
                CustomDropdownMenu(
                  title: getTranslations(context).theme,
                  icon: Icons.format_paint,
                  selectedItem: selectedTheme,
                  menuItems: [getTranslations(context).light,getTranslations(context).dark],
                  onChanged: (newTheme){
                        selectedTheme = newTheme!;
                      context.read<ThemeProvider>().changeTheme(
                          selectedTheme == getTranslations(context).light? ThemeMode.light : ThemeMode.dark
                      );
                  },
                ),
                CustomDropdownMenu(
                  title: getTranslations(context).language,
                  icon: Icons.language,
                  hasDivider: false,
                  selectedItem: selectedLanguage,
                  menuItems: ['English','العربية'],
                  onChanged: (newLocale){
                    selectedLanguage = newLocale!;
                    context.read<LanguageProvider>().changeLocale(
                        selectedLanguage == 'English'? 'en' : 'ar'
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
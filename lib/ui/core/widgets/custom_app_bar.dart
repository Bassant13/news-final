import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/l10n/app_translation.dart';

class CustomAppBar extends StatefulWidget{
  String title;
  bool isSearchIconDisplayed;
  bool isSearchClicked = false;
  TextEditingController? searchController;
  Function(String)? onChanged;
  CustomAppBar({
    required this.title,
    this.isSearchIconDisplayed = true,
    this.searchController,
    this.onChanged
});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return widget.isSearchClicked == true? Padding(
      padding:  EdgeInsets.symmetric(vertical: 30.h),
      child: TextField(
        onChanged: widget.onChanged,
        controller: widget.searchController,
        style: Theme.of(context).textTheme.headlineSmall,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_outlined,
              size: 25.r,
            // color: AppColors.black,
            ),
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  widget.isSearchClicked = false;
                });
              },
              icon: Icon(
                Icons.clear,
              size: 25.r,
             // color: AppColors.black,
              ),
            ),
            hintText: getTranslations(context).search,
            hintStyle: Theme.of(context).textTheme.headlineSmall,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                    //color: AppColors.black,
                    width: 1.w
                )
            )
        ),

      ),
    )
        : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: (){
               Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.dehaze,
                size: 30.r,
               // color: AppColors.black,
              )
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          widget.isSearchIconDisplayed == true? IconButton(
              onPressed: (){
                setState(() {
                  widget.isSearchClicked = true;
                });
              },
              icon: Icon(
                Icons.search_outlined,
                size: 30.r,
                //color: AppColors.black,
              )
          ): SizedBox(),
        ],
    );
  }
}
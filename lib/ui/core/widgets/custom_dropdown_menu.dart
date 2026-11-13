import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/ui/core/assets/app_colors.dart';
import 'package:news_app_final/ui/core/assets/app_fonts.dart';

class CustomDropdownMenu extends StatelessWidget{
  IconData icon;
  String title;
  bool hasMenu;
  bool hasDivider;
  List<String>? menuItems;
  String? selectedItem;
  Function(String?)? onChanged;
  CustomDropdownMenu({
    required this.title,
    required this.icon,
    this.hasMenu = true,
    this.hasDivider = true,
    this.menuItems,
    this.selectedItem,
    this.onChanged
});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 30.r,
              color: AppColors.white,
            ),
            SizedBox(width: 10.w,),
            Text(
              title,
              style: AppFonts.whiteBold20,
            )
          ],
        ),
         SizedBox(height: hasMenu? 15.h : 0,),
        hasMenu? Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.white,
              width: 1.5.r
            )
          ),
          child: DropdownButton<String>(
            dropdownColor: AppColors.black,
              icon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                color: AppColors.white,
                size: 30.r,
              ),
              underline: SizedBox(),
              borderRadius: BorderRadius.circular(16.r),
              isExpanded: true,
              value: selectedItem,
              items: menuItems?.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppFonts.whiteMedium20,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
          ),
        ) : SizedBox(),
        SizedBox(height: 15.h,),
        hasDivider? Padding(
          padding:  EdgeInsets.only(bottom: 15.h),
          child: Divider(
            color: AppColors.white,
            thickness: 1.5.r,
          ),
        ): SizedBox()
      ],
    );
  }
}
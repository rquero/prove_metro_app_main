import 'package:flutter/material.dart';

import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';

class ActivitySchedule extends StatelessWidget {
  const ActivitySchedule({
    super.key,
    required this.day,
    required this.hour
  });

  final String day;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6, 
          decoration: BoxDecoration(
            color: ColorConstant.whiteFF,
            borderRadius: BorderRadius.circular(20))
          ),

       const SizedBox(width: 4),
       
        Text(
          TextConstant.availableSchedule,
          style: AppStyle.txtPoppinsRegular12White
        ),
    
        const SizedBox(width: 8),
    
        Icon(
          Icons.date_range,
          color: ColorConstant.whiteFF, size: 14
        ),
        
        const SizedBox(width: 4),
    
        Text(
          day,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400
          )
        ),
    
        const SizedBox(width: 4),
    
        Text(
          '-',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400
          )
        ),
    
        const SizedBox(width: 4),
    
        Icon(Icons.alarm_on_outlined, color: ColorConstant.whiteFF, size: 14),
    
        const SizedBox(width: 4),
    
        Text(
          hour,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400
          )
        )
      ]
    );
  }
}
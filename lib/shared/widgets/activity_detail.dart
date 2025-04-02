import 'package:flutter/material.dart';

import 'package:prove_metro_app_main/core/constants/image_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_decoration.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/widgets/activity_schedule.dart';
import 'package:prove_metro_app_main/shared/widgets/activity_title.dart';

class ActivityDetail extends StatelessWidget {
  const ActivityDetail({
    super.key,
    required this.activity,
    required this.titleButton,
    this.onTap,
    this.hideButton = true,
  });

  final Activity activity;
  final Function(Activity)? onTap;
  final bool hideButton;
  final String titleButton;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.roundedBorderRadius(
        color: Theme.of(context).colorScheme.surface,
        customShape: ShapeBorderRadius.BorderRadiusOnlyTop,
        radius: 34,
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ActivityDetailImage(
                  image: '${ImageConstant.rootPath}/${activity.image}',
                ),
            
                const SizedBox(width: 8),
            
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ActivityTitle(
                        title: activity.name,
                        style: AppStyle.txtPoppinsSemiBold16White,
                      ),

                      ActivitySchedule(
                        day: activity.classDay,
                        hour: activity.classHour
                      ),
                  
                      const SizedBox(height: 6),
            
                      Text(
                        activity.description,
                        style: AppStyle.txtPoppinsRegular12White
                      )
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            if (hideButton) _ButtonReservation(
              title: titleButton,
              onTap: onTap != null ? () => onTap!(activity) : null
            )
          ],
        )
      ),
    );
  }
}

class _ButtonReservation extends StatelessWidget {
  const _ButtonReservation({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 34
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant
            ),
            onPressed: onTap,
            child: Text(title, style: AppStyle.txtPoppinsRegular14White)
          )),
      ),
    );
  }
}

class _ActivityDetailImage extends StatelessWidget {
  const _ActivityDetailImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
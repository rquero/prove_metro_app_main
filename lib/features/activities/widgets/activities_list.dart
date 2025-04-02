
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/constants/image_constant.dart';

import 'package:prove_metro_app_main/core/constants/key_constant.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_decoration.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';
import 'package:prove_metro_app_main/features/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/activity_selected.dart';
import 'package:prove_metro_app_main/shared/widgets/widgets.dart';


class ActivitiesList extends StatelessWidget {
  const ActivitiesList({
    super.key,
    required this.title,
    required this.activitiesList
  });
  
  final String title;
  final List<ActivitySelected> activitiesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.txtPoppinsSemiBold18White
          ),
      
          const SizedBox(height: 10),
      
          Expanded(
            child: ListView.separated(
              key: Key(KeyConstant.activitiesListKey),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                final ActivitySelected activitySelected = activitiesList.elementAt(index);
                Activity activity = activitySelected.activity;

                return _ActivitiesListItem(
                  activity: activity,
                  selected: activitySelected.selected,
                  showButton: activitySelected.hasMatches,
                  onSubscriptionActivity: 
                    () => context.read<ActivitiesCubit>().subscriptionActivity(activitySelected),
                  onShowDetail: () {
                    showModalBottomSheet(
                      backgroundColor: ColorConstant.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return ActivityDetail(
                          activity: activity,
                          hideButton: !activitySelected.hasMatches,
                          titleButton: !activitySelected.selected
                              ? TextConstant.inscriptionActivityButton
                              : TextConstant.cancelActivityButton,
                          onTap: (Activity activity) {
                            context.read<ActivitiesCubit>().subscriptionActivity(activitySelected);
                            Navigator.pop(context);
                          },
                        );
                    });
                  }
                );
              },
              separatorBuilder: (_, int index) => const SizedBox(height: 20),
              itemCount: activitiesList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivitiesListItem extends StatelessWidget {
  const _ActivitiesListItem({
    super.key,
    required this.activity,
    required this.showButton,
    required this.onShowDetail,
    required this.onSubscriptionActivity,
    required this.selected,
  });

  final Activity activity;
  final bool showButton;
  final bool selected;
  final VoidCallback? onShowDetail;
  final VoidCallback? onSubscriptionActivity;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return SizedBox(
      width: mediaQuery.size.width * 0.9,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            _ActivitiesListBackground(image: activity.image),
            
            Positioned(
              top: 10,
              left: 10,
              child: ActivityTitle(
                title: activity.name,
                style: AppStyle.txtPoppinsSemiBold24White
              ),
            ),

            Positioned(
              top: 10,
              right: 10,
              child: ActivityTopButton(
                onTap: onShowDetail
              ),
            ),
            
            Positioned(
              top: 48,
              left: 10,
              child: ActivitySchedule(
                day: activity.classDay,
                hour: activity.classHour,
              ),
            ),

            if (!showButton)
              _ActivitiesListBottomButton(
                key: Key('${KeyConstant.activitiesListButtonDetailKey}_${activity.id}'),
                onTap: onSubscriptionActivity,
                label: !selected
                  ? TextConstant.inscriptionActivityButton
                  : TextConstant.cancelActivityButton,
              )
            
          ],
        ),
      ),
    );
  }
}

class _ActivitiesListBottomButton extends StatelessWidget {
  const _ActivitiesListBottomButton({
    super.key,
    this.onTap,
    required this.label,
  });

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Positioned(
      bottom: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: mediaQuery.size.width * 0.9,
          height: 30,
          decoration: AppDecoration.roundedBorderRadius(
            color: ColorConstant.black00.withOpacity(0.4),
            customShape: ShapeBorderRadius.BorderRadiusOnlyTop,
            radius: 34
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              label,
              style: AppStyle.txtPoppinsSemiBold16White
            ),
          ),
        ),
      ),
    );
  }
}

class _ActivitiesListBackground extends StatelessWidget {
  const _ActivitiesListBackground({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: AppDecoration.roundedBorderRadius(
        customShape: ShapeBorderRadius.BorderRadiusAll,
        radius: 20,
        image: '${ImageConstant.rootPath}/$image',
        colorFilter: ColorFilter.mode(
          ColorConstant.black00.withOpacity(0.6),
          BlendMode.darken
        )
      ),
    );
  }
}
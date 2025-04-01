
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/constants/key_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';
import 'package:prove_metro_app_main/features/user_activities/cubit/user_activities_cubit.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/widgets/widgets.dart';

class UserActivitiesList extends StatelessWidget {
  const UserActivitiesList({
    super.key,
    required this.title,
    required this.activitiesList
  });
  
  final String title;
  final List<Activity> activitiesList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyle.txtPoppinsSemiBold18White,
          ),
      
          const SizedBox(
            height: 20,
          ),
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                key: Key(KeyConstant.activitiesListMemberKey),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: activitiesList.length,
                itemBuilder: (context, index) {
                  final Activity activity = activitiesList[index];
                  return _ActivityCard(
                    activity: activity,
                    onShowDetail: () => showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return ActivityDetail(
                          activity: activity,
                          titleButton: 'Cancelar',
                          onTap: (Activity activity) {
                            context.read<UserActivitiesCubit>().deleteActivity(activity);
                            Navigator.pop(context);
                          },
                        );
                    }),
                    onDelete: 
                      () => context.read<UserActivitiesCubit>().deleteActivity(activity),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({
    super.key,
    required this.activity,
    required this.onDelete,
    required this.onShowDetail,
  });

  final Activity activity;
  final VoidCallback onDelete;
  final VoidCallback onShowDetail;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20),
      width: double.infinity,
      height: 200,
      decoration: _buildDecoration(),
      child: Stack(
        children: [
          Positioned(
            child: ActivityTitle(
              title: activity.name,
              style: AppStyle.txtPoppinsSemiBold24White,
            )),

          Positioned(
            top: 40,
            child: ActivitySchedule(
              day: activity.classDay,
              hour: activity.classHour,
            ),
          ),

          Positioned(
            bottom: 60,
            child: _ActivityCardDescription(text: activity.description)
          ),

          Positioned(
            bottom: 10,
            left: 0,
            child: _ActivityTrainer(
              fullName: activity.trainer!.fullName
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: _ActivityCardButton(
              onTap: onDelete
            ),
          ),

          Positioned(
            top: 0,
            right: 10,
            child: ActivityTopButton(
              onTap: onShowDetail,
            ),
          ),
        ],
      ));
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: ColorConstant.gray3D,
      image: DecorationImage(
        image: AssetImage('resources/${activity.image}'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.8),
          BlendMode.darken
        )
      )
    );
  }
}

class _ActivityTrainer extends StatelessWidget {
  const _ActivityTrainer({
    super.key,
    required this.fullName,
  });

  final String fullName;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.fitness_center, size: 14),
            
            const SizedBox(width: 4),

            Text('Trainer', style: AppStyle.txtPoppinsRegular12White),
          ],
        ),
        
        const SizedBox(height: 4),

        Text(fullName, style: AppStyle.txtPoppinsRegular12White),
      ],
    );
  }
}

class _ActivityCardButton extends StatelessWidget {
  const _ActivityCardButton({
    super.key, required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: ColorConstant.gray3D.withOpacity(0.6),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
        ),
        child: Center(child: Text('Cancelar', style: AppStyle.txtPoppinsMedium14White)),
      ),
    );
  }
}

class _ActivityCardDescription extends StatelessWidget {
  const _ActivityCardDescription({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 80
      ),
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: AppStyle.txtPoppinsRegular12White,
      ));
  }
}
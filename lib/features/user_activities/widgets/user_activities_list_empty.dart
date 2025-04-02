import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';
import 'package:prove_metro_app_main/features/home/cubit/home_cubit.dart';

class UserActivitiesListEmpty extends StatelessWidget {
  const UserActivitiesListEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textAlign: TextAlign.center,
                TextConstant.userActivitiesListEmpty,
                style: AppStyle.txtPoppinsSemiBold18White
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant
                ),
                onPressed: () => context.read<HomeCubit>()
                  .setTab(HomeTab.activities),
                child: Text(
                  TextConstant.userActivitiesEmptyButton,
                  style: AppStyle.txtPoppinsRegular12White,
                )),
            )
          ],
        )
      );
  }
}

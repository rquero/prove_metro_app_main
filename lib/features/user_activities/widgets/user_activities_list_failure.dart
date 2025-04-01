import 'package:flutter/material.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';

class UserActivitiesListFailure extends StatelessWidget {
  const UserActivitiesListFailure({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        TextConstant.userActivitiesListFailure
      ));
  }
}
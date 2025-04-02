import 'package:flutter/material.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';

class ActivitiesListEmpty extends StatelessWidget {
  const ActivitiesListEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(TextConstant.activitiesListEmpty)
    );
  }
}

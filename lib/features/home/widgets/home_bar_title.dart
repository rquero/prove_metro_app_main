import 'package:flutter/material.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';
import 'package:prove_metro_app_main/shared/widgets/custom_circle_avatar.dart';

class HomeBarTitle extends StatelessWidget {
  const HomeBarTitle({
    super.key,
    required this.title,
    this.image
  });

  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircleAvatar(
          name: title,
        ),

        const SizedBox(width: 8),

        Text(
          title ?? '',
          style: AppStyle.txtPoppinsMedium14White
        ),
      ],
    );
  }
}
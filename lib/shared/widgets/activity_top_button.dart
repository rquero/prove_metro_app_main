import 'package:flutter/material.dart';
import 'package:prove_metro_app_main/core/constants/color_constant.dart';

class ActivityTopButton extends StatelessWidget {
  const ActivityTopButton({
    super.key,
    this.onTap
  });
  
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: ColorConstant.black00.withOpacity(0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(20)
          )
        ),
        child: Icon(
          Icons.visibility_outlined,
          color: Theme.of(context).colorScheme.secondary,
          size: 14
        ),
      ),
    );
  }
}
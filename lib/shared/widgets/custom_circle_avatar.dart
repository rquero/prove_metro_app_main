import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? name;
  final String? image;
  
  const CustomCircleAvatar({
    super.key,
    required this.name,
    this.image = ''
  });

  @override
  Widget build(BuildContext context) {
    return name != null && image!.isEmpty
      ? _CirlceAvatarWrapper(
          child: Center(
            child: Text(
              name!.isNotEmpty && name!.length > 2
                ? name!.substring(0, 2).toUpperCase()
                : '',
            style: AppStyle.txtPoppinsMedium14White)
          ),
      )
      : (image != ''
        ? _CirlceAvatarWrapper(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: image!,
                placeholder: (context, url) => _CirlceAvatarWrapper(
                  child: Icon(Icons.person),
                ),
                errorWidget: (context, url, error) => _CirlceAvatarWrapper(
                  child: Image.asset(image!)), // Imagen de error
              ),
            ),
          )
          : _CirlceAvatarWrapper(
            child: Icon(Icons.person),
          )
        );
  }
}

class _CirlceAvatarWrapper extends StatelessWidget {
  final Widget child;
  
  const _CirlceAvatarWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: ColorConstant.gray3D,
          borderRadius: BorderRadius.circular(50),
        ),
        child: child
      );
  }
}
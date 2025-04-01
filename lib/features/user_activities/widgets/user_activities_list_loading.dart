import 'package:flutter/material.dart';

class UserActivitiesListLoading extends StatelessWidget {
  const UserActivitiesListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
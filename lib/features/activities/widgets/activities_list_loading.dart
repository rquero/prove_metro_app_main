import 'package:flutter/material.dart';

class ActivitiesListLoading extends StatelessWidget {
  const ActivitiesListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
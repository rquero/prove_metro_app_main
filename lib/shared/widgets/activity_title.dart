import 'package:flutter/material.dart';

class ActivityTitle extends StatelessWidget {
  const ActivityTitle({
    super.key,
    required this.title,
    this.style
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 280
      ),
      child: Text(
        title,
        style: style,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
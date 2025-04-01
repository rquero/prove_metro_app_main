import 'package:prove_metro_app_main/shared/models/activity.dart';

class ActivitySelected {
  ActivitySelected({
    required this.activity,
    required this.selected,
    required this.hasMatches,
  });

  final bool selected;
  final Activity activity;
  final bool hasMatches;

  @override
  String toString() {
    return 'selected: $selected hasMatches: $hasMatches activity: $activity';
  }

  ActivitySelected copyWith({
    Activity? activity,
    bool? selected,
    bool? hasMatches,
  }) => ActivitySelected(
    activity: activity ?? this.activity,
    selected: selected ?? this.selected,
    hasMatches: hasMatches ?? this.hasMatches
  );
}

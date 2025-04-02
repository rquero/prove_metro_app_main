
part of 'activities_cubit.dart';

enum ActivitiesStatus { initial, loading, success, failure }
enum SubscriptionStatus { initial, success, cancel, failure }

class ActivitiesState extends Equatable {
  final ActivitiesStatus status;
  final List<ActivitySelected> activities;
  final SubscriptionStatus subscriptionStatus;
  final String message;

  const ActivitiesState({
    this.status = ActivitiesStatus.initial,
    this.activities = const [],
    this.subscriptionStatus = SubscriptionStatus.initial,
    this.message = ''
  });

  ActivitiesState copyWith({
    ActivitiesStatus? status,
    List<ActivitySelected>? activities,
    SubscriptionStatus? subscriptionStatus,
    String? message,
  }) {
    return ActivitiesState(
      status: status ?? this.status,
      activities: activities ?? this.activities,
      message: message ?? this.message,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
    );
  }
    
  @override
  List<Object?> get props => [
    status,
    activities,
    subscriptionStatus,
    message
  ];
}
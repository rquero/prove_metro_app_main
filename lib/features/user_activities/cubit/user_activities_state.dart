
part of 'user_activities_cubit.dart';

enum UserActivitiesStatus { initial, loading, success, failure }
enum UnsubscriptionStatus { initial, success, failure }

class UserActivitiesState extends Equatable {
  final UserActivitiesStatus status;
  final List<Activity> activitiesList;
  final UnsubscriptionStatus unsubscriptionStatus;
  final String message;


  const UserActivitiesState({
    this.status = UserActivitiesStatus.initial,
    this.activitiesList = const [],
    this.unsubscriptionStatus = UnsubscriptionStatus.initial,
    this.message = '',
  });

  UserActivitiesState copyWith({
    UserActivitiesStatus? status,
    List<Activity>? activitiesList,
    UnsubscriptionStatus? unsubscriptionStatus,
    String? message,
  }) {
    return UserActivitiesState(
      status: status ?? this.status,
      activitiesList: activitiesList ?? this.activitiesList,
      unsubscriptionStatus: unsubscriptionStatus ?? this.unsubscriptionStatus,
      message: message ?? this.message
    );
  }

  @override
  List<Object?> get props => [
    status,
    activitiesList,
    unsubscriptionStatus,
    message
  ];
}
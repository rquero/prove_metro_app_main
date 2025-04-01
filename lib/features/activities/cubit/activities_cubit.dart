
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';

import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/activity_selected.dart';
import 'package:prove_metro_app_main/shared/repository/activities_repository.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit(this._activitiesRepository) : super(ActivitiesState()) {
    init();
  }

  final ActivitiesRepository _activitiesRepository;
  late final Stream<List<Activity>> _streamSubscription;
  List<Activity> _activitiesUser = [];

  void init() async {
    _streamSubscription = _activitiesRepository.getActivitiesUser();
  
    _streamSubscription.listen(
        (event) {
          _activitiesUser = [...event];

          getAllActivities();
        }
      );

      getAllActivities();
  }
  
  void getAllActivities() async {
    emit(state.copyWith(status: ActivitiesStatus.loading));

    try {
      final activities = await _activitiesRepository.getAllActivities();
      
      final mappedActivities = activities.map(
        (activity) => ActivitySelected(
            activity: activity,
            selected: false,
            hasMatches: false
          )
        ).toList();

      List<ActivitySelected> updatedActivitiesList = updateActivitiesList(
        mappedActivities
      );
            
      emit(
        state.copyWith(
          status: ActivitiesStatus.success,
          activities: [...updatedActivitiesList],
      ));
    } catch (e) {

      emit(state.copyWith(status: ActivitiesStatus.failure));
    }
  }

  List<ActivitySelected> updateActivitiesList(
    List<ActivitySelected> activitiesList
  ) {
    return activitiesList.map(
        (act) => ActivitySelected(
            activity: act.activity,
            selected: haveBeenSelected(act.activity.id),
            hasMatches: canInscription(act.activity)
          )
        ).toList();
  }

  bool findActivitiesByMember(int id) {
    try {
      final findedActivities = _activitiesUser.where(
        (activity) => activity.id == id).toList();

      return findedActivities.isNotEmpty;

    } catch (err) {
      return false;
    }
  }

  bool haveBeenSelected(int id) {
    return _activitiesUser.where(
      (actUser) => actUser.id == id).toList().isNotEmpty;
  }

  bool canInscription(Activity activity) {
    try {
      final findedActivities = _activitiesUser.where(
        (item) => item.id != activity.id &&
        ( item.classHour == activity.classHour ) &&
        ( item.classDay == activity.classDay )
      )
      .toList();

      return findedActivities.isNotEmpty;

    } catch (err) {
      return false;
    }
  }

  void subscriptionActivity(
    ActivitySelected activitySelected
  ) {
    final Activity activity = activitySelected.activity;

    bool activityFound = findActivitiesByMember(activity.id);

    activityFound ? deleteActivity(activity) : addActivity(activitySelected.activity);
  }

  void addActivity(Activity activity) async {
    try {
      _activitiesRepository.saveActivity(activity);
      
      emit(
        state.copyWith(
          subscriptionStatus: SubscriptionStatus.success,
          message: TextConstant.addActivitySuccessfully,
        ));

    } catch (err) {
      emit(
        state.copyWith(
          subscriptionStatus: SubscriptionStatus.failure,
          message: TextConstant.addActivityFailure,
        ));
    }

    emit(
      state.copyWith(subscriptionStatus: SubscriptionStatus.initial)
    );
  }

  void deleteActivity(Activity activity) async {
    try {
      await _activitiesRepository.removeActivity(activity);

      emit(
        state.copyWith(
          subscriptionStatus: SubscriptionStatus.cancel,
          message: TextConstant.deleteActivitySuccessfully
        ));

    } catch (err) {
      emit(
        state.copyWith(
          subscriptionStatus: SubscriptionStatus.failure,
          message: TextConstant.deleteActivityFailure
        ));
    }

    emit(
      state.copyWith(subscriptionStatus: SubscriptionStatus.initial)
    );
  }
}

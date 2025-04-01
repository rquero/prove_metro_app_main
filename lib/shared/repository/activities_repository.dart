import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';
import 'package:prove_metro_app_main/shared/services/activity_service.dart';
import 'package:prove_metro_app_main/shared/services/trainer_service.dart';

class ActivitiesRepository {
  String baseApi = 'resources/response_calls';

  ActivitiesRepository({
    required ActivityService activityService,
    required TrainerService trainerService,
  })  : _activityService = activityService,
        _trainerService = trainerService;
  
  final TrainerService _trainerService;
  final ActivityService _activityService;
  
  Future<List<Activity>> getAllActivities() async {
    final activities = await _activityService.getAllActivities();
    final trainers = await _trainerService.getAllTrainers();

    for (var activity in activities) {
      Trainer trainer = trainers.firstWhere((trainer) => trainer.id == activity.responsibleTrainer);

      activity.trainer = trainer.copyWith();
    }

    return activities;
  }

  Stream<List<Activity>> getActivitiesUser() =>
    _activityService.getActivitiesList();

  Future<List<Activity>> saveActivity(Activity activity) =>
    _activityService.saveActivity(activity);

  Future<void> removeActivity(Activity activity) =>
    _activityService.removeActivity(activity);

  void dispose() => _activityService.close();
  
}
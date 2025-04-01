import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:prove_metro_app_main/core/constants/api_constant.dart';

import 'package:prove_metro_app_main/shared/models/activity.dart';

class ActivityService {
  final SharedPreferences _prefs;

  ActivityService({
    required SharedPreferences prefs
  }) : _prefs = prefs {
    init();
  }

  late final _activitiesStreamController = BehaviorSubject<List<Activity>>.seeded(
    []
  );

  String? _getValue(String key) => _prefs.getString(key);

  Future<void> _setValue(String key, String value) => _prefs.setString(key, value);
  
  Future<List<Activity>> getAllActivities() async {
    try {
      String response = await rootBundle.loadString(ApiConstant.getActivities);
      final List<dynamic> data = json.decode(response);
      final List<Activity> activities = data.map((activity) => Activity.fromJson(activity)).toList();

      return activities;
    } catch (e) {
      throw Exception('Error al cargar las actividades');
    }
  }

  Stream<List<Activity>> getActivitiesList() => _activitiesStreamController.asBroadcastStream();
  
  void init() {
    final activitiesListJson = _getValue('activitiesList');

    if (activitiesListJson != null) {
      final List<Activity> activitiesList = List<Map<dynamic, dynamic>>.from(
        json.decode(activitiesListJson) as List,
      )
        .map((jsonMap) => Activity.fromJson(Map<String, dynamic>.from(jsonMap)))
        .toList();
      _activitiesStreamController.add(activitiesList);
      
    } else {
     _activitiesStreamController.add(const []);
    }
  }

  Future<List<Activity>> saveActivity(Activity activity) async {
    final List<Activity> activitiesList = [..._activitiesStreamController.value];
    
    activitiesList.add(activity);
    _activitiesStreamController.add(activitiesList);

    _setValue('activitiesList', json.encode(activitiesList));

    return _activitiesStreamController.value;
  }

  Future<void> removeActivity(Activity activity) {
    final List<Activity> activitiesList = [..._activitiesStreamController.value];

    activitiesList.removeWhere((element) => element.id == activity.id);
    _activitiesStreamController.add(activitiesList);

    return _setValue('activitiesList', json.encode(activitiesList));
  }

  Future<void> close() {
    return _activitiesStreamController.close();
  }

}
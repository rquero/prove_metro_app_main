import 'package:prove_metro_app_main/shared/models/trainer.dart';

class Activity {
    int id;
    String name;
    String description;
    String image;
    int responsibleTrainer;
    List<int> registeredPartners;
    String classDay;
    String classHour;
    Trainer? trainer;

    Activity({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.responsibleTrainer,
        required this.registeredPartners,
        required this.classDay,
        required this.classHour,
        this.trainer,
    });

    factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id                    : json["id"],
        name                  : json["name"],
        description           : json["description"],
        image                 : json["image"],
        responsibleTrainer    : json["responsibleTrainer"],
        registeredPartners    : List<int>.from(json["registeredPartners"].map((x) => x)),
        classDay              : json["classDay"],
        classHour             : json["classHour"],
        trainer               : json["trainer"] != null ? Trainer.fromJson(json["trainer"]) : null 
    );

    Map<String, dynamic> toJson() => {
        "id"                : id,
        "name"              : name,
        "description"       : description,
        "image"             : image,
        "responsibleTrainer": responsibleTrainer,
        "registeredPartners": List<dynamic>.from(registeredPartners.map((x) => x)),
        "classDay"          : classDay,
        "classHour"         : classHour,
        "trainer"           : trainer != null ? trainer!.toJson() : trainer
    };

    @override
  String toString() {
    return 'id: $id activityName: $name';
  }
}

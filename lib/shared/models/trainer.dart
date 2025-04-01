class Trainer {
    int id;
    String name;
    String lastNames;
    String dni;
    String cv;
    List<int> activities;

    Trainer({
        required this.id,
        required this.name,
        required this.lastNames,
        required this.dni,
        required this.cv,
        required this.activities,
    });

    factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id        : json["id"],
        name      : json["name"],
        lastNames : json["lastNames"],
        dni       : json["dni"],
        cv        : json["cv"],
        activities: List<int>.from(json["activities"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastNames": lastNames,
        "dni": dni,
        "cv": cv,
        "activities": List<dynamic>.from(activities.map((x) => x)),
    };

    String get fullName => '$name $lastNames';

    Trainer copyWith({
      int? id,
      String? name,
      String? lastNames,
      String? dni,
      String? cv,
      List<int>? activities
    }) => Trainer(
      id: id ?? this.id,
      name: name ?? this.name,
      lastNames: lastNames ?? this.lastNames,
      dni: dni ?? this.dni,
      cv: cv ?? this.cv,
      activities: activities ?? this.activities
    );
}

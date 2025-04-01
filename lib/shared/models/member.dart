class Member {
    int id;
    String name;
    String lastNames;
    String dni;

    Member({
        required this.id,
        required this.name,
        required this.lastNames,
        required this.dni,
    });

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        id        : json["id"],
        name      : json["name"],
        lastNames : json["lastNames"],
        dni       : json["dni"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "name"      : name,
        "lastNames" : lastNames,
        "dni"       : dni,
    };

    String get fullName => '$name $lastNames';

    Member copyWith({
      int? id,
      String? name,
      String? lastNames,
      String? dni
    }) => Member(
      id: id ?? this.id,
      name: name ?? this.name,
      lastNames: lastNames ?? this.lastNames,
      dni: dni ?? this.dni
    );

    @override
  String toString() => 'id: $id, name: $name, lastNames: $lastNames, dni: $dni';
}

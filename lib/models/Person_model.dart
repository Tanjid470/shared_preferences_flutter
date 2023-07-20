// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    String? name;
    String? job;
    String? id;
    DateTime? createdAt;

    Person({
         this.name,
         this.job,
         this.id,
         this.createdAt,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toString(),
    };
}

class MedicinesModel {
  late List<Medicines> medicines;

  MedicinesModel({required this.medicines});

  MedicinesModel.fromJson(Map<String, dynamic> json) {
    medicines = (json["medicines"] == null
        ? null
        : (json["medicines"] as List)
            .map((e) => Medicines.fromJson(e))
            .toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["medicines"] = medicines.map((e) => e.toJson()).toList();
    return data;
  }
}

class Medicines {
  late String name;
  late String img;

  Medicines({required this.name, required this.img});

  Medicines.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    img = json["img"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["img"] = img;
    return data;
  }
}

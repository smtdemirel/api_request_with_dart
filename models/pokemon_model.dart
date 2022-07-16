import 'dart:convert';

class PokemonModel {
  BerryFlavor? berryFlavor;
  int? id;
  String? name;
  List<Names>? names;

  PokemonModel({this.berryFlavor, this.id, this.name, this.names});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    berryFlavor = json['berry_flavor'] != null
        ? new BerryFlavor.fromJson(json['berry_flavor'])
        : null;
    id = json['id'];
    name = json['name'];
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(new Names.fromJson(v));
      });
    }
  }
  static convertPokemonModel(String pokemon) =>
      PokemonModel.fromJson(jsonDecode(pokemon));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.berryFlavor != null) {
      data['berry_flavor'] = this.berryFlavor!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BerryFlavor {
  String? name;
  String? url;

  BerryFlavor({this.name, this.url});

  BerryFlavor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Names {
  String? color;
  BerryFlavor? language;
  String? name;

  Names({this.color, this.language, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    language = json['language'] != null
        ? new BerryFlavor.fromJson(json['language'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

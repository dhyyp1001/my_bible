import 'dart:convert';

import 'package:my_bible/models/bilbe_model.dart';

class BibleModelList{
  late final List<BibleModel>? bibles;
  BibleModelList({this.bibles});

  factory BibleModelList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<BibleModel> bibles = <BibleModel>[];

    bibles = listFromJson.map((place) => BibleModel.fromJson(place)).toList();
    return BibleModelList(bibles: bibles);
  }
}
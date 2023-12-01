import 'dart:convert';

import 'package:my_bible/models/bible_model.dart';

class BibleModelList{
  List<BibleModel>? bibles;
  BibleModelList({this.bibles});

  factory BibleModelList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<BibleModel> bibles = <BibleModel>[];

    bibles = listFromJson.map((bible) => BibleModel.fromJson(bible)).toList();
    return BibleModelList(bibles: bibles);
  }
}
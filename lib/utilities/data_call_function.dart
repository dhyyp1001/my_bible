import 'package:flutter/services.dart';
import 'package:my_bible/models/bible_model.dart';
import 'package:my_bible/utilities/bible_model_list.dart';

class DataCallFunction {
  String KOR_bible = 'assets/json/KOR_bible.json';
  List<BibleModel> bibleModelList = [];

  Future dataCheck() async {
    final routeFromJsonFile = await rootBundle.loadString(KOR_bible);
    List<BibleModel>? _bibleModelList =
        BibleModelList.fromJson(routeFromJsonFile).bibles ?? <BibleModel>[];
    bibleModelList = _bibleModelList;
  }

  Future<List<String?>> getBibleLongLabelList() async{
    await dataCheck();

    List<String?>? longLabelList = List.empty(growable: true);

    for (int i = 0; i < bibleModelList.length; i++) {
      longLabelList!.add(bibleModelList[i].long_label);
    }

    longLabelList = longLabelList!.toSet().toList();

    return longLabelList;
  }
}

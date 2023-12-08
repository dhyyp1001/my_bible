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

  Future<List<String?>> getBibleLongLabelList() async {
    await dataCheck();

    List<String?> longLabelList = List.empty(growable: true);

    for (int i = 0; i < bibleModelList.length; i++) {
      longLabelList.add(bibleModelList[i].long_label);
    }

    longLabelList = longLabelList!.toSet().toList();
    return longLabelList;
  }

  Future<List<String?>> getBibleChapterList(String? longLabel) async {
    await dataCheck();

    List<String?> chapterList = List.empty(growable: true);

    for (int i = 0; i < bibleModelList.length; i++) {
      if (bibleModelList[i].long_label == longLabel) {
        chapterList.add(bibleModelList[i].chapter.toString() + ' 장');
      }
    }

    chapterList = chapterList!.toSet().toList();
    return chapterList;
  }

  Future<List<String?>> getBibleParagraphList(String? longLabel, String? chapter) async {
    await dataCheck();

    List<String?> paragraphList = List.empty(growable: true);

    for (int i = 0; i < bibleModelList.length; i++) {
      if (bibleModelList[i].long_label == longLabel && bibleModelList[i].chapter.toString() + ' 장' == chapter) {
        paragraphList.add(bibleModelList[i].paragraph.toString() + ' 절');
      }
    }

    return paragraphList;
  }

  Future<List<String?>> getSentenceList(String? longLabel, String? chapter) async {
    await dataCheck();

    List<String?> longLabelSentenceList = List.empty(growable: true);

    for (int i = 0; i < bibleModelList.length; i++) {
      if (bibleModelList[i].long_label == longLabel && bibleModelList[i].chapter.toString()+' 장' == chapter) {
        longLabelSentenceList.add('${bibleModelList[i].paragraph}. ${bibleModelList[i].sentence}');
      }
    }

    return longLabelSentenceList;
  }
}

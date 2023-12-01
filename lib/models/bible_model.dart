class BibleModel {
  int? idx;
  int? cate;
  int? book;
  int? chapter;
  int? paragraph;
  String? sentence;
  String? testament;
  String? long_label;
  String? short_label;

  BibleModel({
    this.idx,
    this.cate,
    this.book,
    this.chapter,
    this.paragraph,
    this.sentence,
    this.testament,
    this.long_label,
    this.short_label,
  });

  factory BibleModel.fromJson(Map<String, dynamic> json)=>
      BibleModel(
          idx: json['idx'],
          cate: json['cate'],
          book: json['book'],
          chapter: json['chapter'],
          paragraph: json['paragraph'],
          sentence: json['sentence'],
          testament: json['testament'],
          long_label: json['long_label'],
          short_label: json['short_label']
      );
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/utilities/data_call_function.dart';
import 'dart:math' as math;

class BibleScreen extends StatefulWidget {
  String? selectedLongLabel;
  String? selectedChapter;
  final String? selectedParagraph;

  BibleScreen(
      this.selectedLongLabel, this.selectedChapter, this.selectedParagraph,
      {super.key});

  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;

  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    int onlyChapterNum = int.parse(widget.selectedChapter!
        .substring(0, widget.selectedChapter!.indexOf(' ')));

    String appbarTitle =
        '${widget.selectedLongLabel} ${widget.selectedChapter}';

    var bibleLongLabelList = DataCallFunction().getBibleLongLabelList();
    var bibleChapterList;

    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment(
                Alignment.bottomCenter.x - 0.08, Alignment.bottomCenter.y),
            child: FloatingActionButton(
              heroTag: "actionButton1",
              onPressed: () {
                setState(() {
                  onlyChapterNum--;
                  widget.selectedChapter = '$onlyChapterNum 장';
                  if (onlyChapterNum < 1) {
                    bibleLongLabelList.then((value) {
                      widget.selectedLongLabel =
                          value[value.indexOf(widget.selectedLongLabel) - 1];
                      bibleChapterList = DataCallFunction()
                          .getBibleChapterList(widget.selectedLongLabel);
                      bibleChapterList.then((value) {
                        widget.selectedChapter = value[value.length - 1];
                      });
                    });
                  }
                });
              },
              backgroundColor: const Color.fromRGBO(204, 108, 45, 1.0),
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Align(
            alignment: Alignment(
                Alignment.bottomCenter.x + 0.55, Alignment.bottomCenter.y),
            child: Transform(
              transform: Matrix4.rotationY(math.pi),
              child: FloatingActionButton(
                heroTag: "actionButton2",
                onPressed: () {
                  setState(() {
                    onlyChapterNum++;
                    widget.selectedChapter = '$onlyChapterNum 장';

                    if () {
                      bibleLongLabelList.then((value) {
                        widget.selectedLongLabel =
                            value[value.indexOf(widget.selectedLongLabel) + 1];
                        onlyChapterNum = 1;
                      });
                    }
                  });
                },
                backgroundColor: const Color.fromRGBO(204, 108, 45, 1.0),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text(appbarTitle),
        elevation: 0.02,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 17, color: Colors.black54),
        backgroundColor: const Color.fromRGBO(253, 253, 253, 1.0),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1.0),
      body: FutureBuilder(
        future: DataCallFunction()
            .getSentenceList(widget.selectedLongLabel, widget.selectedChapter),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {

            return const Center(child: CircularProgressIndicator());
          } else {
            appbarTitle = data[0].toString();

            return Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onScaleStart: (details) {
                  widget._baseScaleFactor = widget._scaleFactor;
                },
                onScaleUpdate: (details) {
                  setState(
                    () {
                      widget._scaleFactor =
                          widget._baseScaleFactor * (details.scale);
                      if (widget._scaleFactor < 0.99) {
                        widget._scaleFactor = 1.0;
                      } else if (widget._scaleFactor > 1.81) {
                        widget._scaleFactor = 1.8;
                      }
                    },
                  );
                },
                child: Container(
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data.length - 1, //index[0]의 목차, 장 미노출 시키기 위함
                    itemBuilder: (BuildContext context, int index) {

                      return Row(
                        children: [
                          Container(
                            width: 400,
                            child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  data[index + 1]!, //index[0]의 목차, 장 미노출 시키기 위함
                                  textScaleFactor: widget._scaleFactor,
                                  style: const TextStyle(fontSize: 14),
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/utilities/data_call_function.dart';

class BibleScreen extends StatefulWidget {
  String? selectedLongLabel;
  String? selectedChapter;
  final String? selectedParagraph;

  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;

  BibleScreen(
      this.selectedLongLabel, this.selectedChapter, this.selectedParagraph,
      {super.key});

  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    int chapterPlus = int.parse(widget.selectedChapter!
        .substring(0, widget.selectedChapter!.indexOf(' ')));

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
                  chapterPlus--;
                  widget.selectedChapter = '$chapterPlus 장';
                });
              },
              backgroundColor:
                  const Color.fromRGBO(204, 108, 45, 1.0).withOpacity(0.5),
            ),
          ),
          Align(
            alignment: Alignment(
                Alignment.bottomCenter.x + 0.25, Alignment.bottomCenter.y),
            child: FloatingActionButton(
                heroTag: "actionButton2",
                onPressed: () {
                  setState(() {
                    chapterPlus++;
                    widget.selectedChapter = '$chapterPlus 장';
                  });
                },
                backgroundColor:
                    const Color.fromRGBO(204, 108, 45, 1.0).withOpacity(0.5)),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(204, 108, 45, 1.0),
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
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            width: 400,
                            child: Padding(
                                child: Text(
                                  data[index]!,
                                  textScaleFactor: widget._scaleFactor,
                                  style: TextStyle(fontSize: 14),
                                ),
                                padding: EdgeInsets.all(15.0)),
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

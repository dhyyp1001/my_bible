import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/utilities/data_call_function.dart';

class BibleScreen extends StatefulWidget {
  final String? selectedLongLabel;
  String? selectedChapter;
  final String? selectedParagraph;

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
                    const Color.fromRGBO(204, 108, 45, 1.0).withOpacity(0.5)),
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
              child: Container(
                width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          height: 70,
                          width: 400,
                          child: Text(data![index]!),
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

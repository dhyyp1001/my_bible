import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/utilities/data_call_function.dart';

class BibleSelectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BibleSelectScreenState();
}

class _BibleSelectScreenState extends State<BibleSelectScreen> {
  String? selectedLongLabelDropdown;
  String? selectedChapterDropdown;
  String? selectedParagraphDropdown;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(204, 108, 45, 1.0),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(204, 108, 45, 1.0), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: FutureBuilder(
                  future: DataCallFunction().getBibleLongLabelList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    } else {
                      return DropdownButton(
                        underline: SizedBox.shrink(),
                        hint: Text('목차를 선택하세요.'),
                        value: selectedLongLabelDropdown,
                        items: snapshot.data
                            ?.map<DropdownMenuItem<String>>(
                              (String? item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text('$item'),
                              ),
                            )
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedLongLabelDropdown = value;
                          });
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(204, 108, 45, 1.0), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: FutureBuilder(
                  future: DataCallFunction()
                      .getBibleChapterList(selectedLongLabelDropdown),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    } else {
                      return DropdownButton(
                        underline: SizedBox.shrink(),
                        hint: Text('장을 선택하세요.'),
                        value: selectedChapterDropdown,
                        items: snapshot.data
                            ?.map<DropdownMenuItem<String>>(
                              (String? item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text('$item'),
                              ),
                            )
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedChapterDropdown = value;
                          });
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(204, 108, 45, 1.0), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: FutureBuilder(
                  future: DataCallFunction().getBibleParagraphList(
                      selectedLongLabelDropdown, selectedChapterDropdown),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    } else {
                      return DropdownButton(
                        underline: SizedBox.shrink(),
                        hint: Text('절을 선택하세요.'),
                        value: selectedParagraphDropdown,
                        items: snapshot.data
                            ?.map<DropdownMenuItem<String>>(
                              (String? item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text('$item'),
                              ),
                            )
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedParagraphDropdown = value;
                          });
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

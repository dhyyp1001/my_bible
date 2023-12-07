import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/modules/custom_dropdown.dart';
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
    CustomDropdown cd = new CustomDropdown();

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(204, 108, 45, 1.0),
          height: 90,
          child: GestureDetector()),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(204, 108, 45, 1.0),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.0,
          ),
          cd.customDropdownWidget(DataCallFunction().getBibleLongLabelList(),
              selectedLongLabelDropdown, '목차를 선택하세요.', (String? value) {
            setState(() {
              selectedLongLabelDropdown = value;
            });
          }),
          SizedBox(
            height: 60.0,
          ),
          cd.customDropdownWidget(
              DataCallFunction().getBibleChapterList(selectedLongLabelDropdown),
              selectedChapterDropdown,
              '장을 선택하세요.', (String? value) {
            setState(() {
              selectedChapterDropdown = value;
            });
          }),
          SizedBox(
            height: 60.0,
          ),
          cd.customDropdownWidget(
              DataCallFunction().getBibleParagraphList(
                  selectedLongLabelDropdown, selectedChapterDropdown),
              selectedParagraphDropdown,
              '절을 선택하세요.', (String? value) {
            setState(() {
              selectedParagraphDropdown = value;
            });
          }),
        ],
      ),
    );
  }
}

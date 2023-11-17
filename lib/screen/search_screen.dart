import 'package:flutter/material.dart';
import 'package:my_bible/screen/home_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 1.0),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 1000,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(204, 108, 45, 1.0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(8),
                        bottomRight: const Radius.circular(8),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    hintText: '검색 키워드를 입력해주세요',
                  ),
                ),
              ),
            ),
            new Positioned(
              child: new Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.keyboard_backspace_rounded,
                      color: Color.fromRGBO(204, 108, 45, 1.0),
                    ),
                  ) // IconButton

                  ), // align
            ), // Positioned
          ],
        ),
      ),
    );
  }
}

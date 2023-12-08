import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/deregates/search_bar_sliver_persistent_header_delegate.dart';
import 'package:my_bible/screens/bible_select_screen.dart';
import 'package:my_bible/utilities/data_call_function.dart';

class BibleScreen extends StatefulWidget {
  final String? selectedLongLabel;
  final String? selectedChapter;
  final String? selectedParagraph;

  const BibleScreen(
      this.selectedLongLabel, this.selectedChapter, this.selectedParagraph,
      {super.key});

  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final double statusBarSize = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(204, 108, 45, 1.0),
      ),
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1.0),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: DataCallFunction().getSentenceList(
              widget.selectedLongLabel, widget.selectedChapter),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontSize: 15),
                ),
              );
            } else {
              return Column(
                children: [
                  Text(widget.selectedLongLabel! +
                      ' ' +
                      widget.selectedChapter!),
                  Text('${snapshot.data}')
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

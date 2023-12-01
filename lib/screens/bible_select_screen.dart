import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bible/utilities/data_call_function.dart';

class BibleSelectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BibleSelectScreenState();
}

class _BibleSelectScreenState extends State<BibleSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: DataCallFunction().getBibleLongLabelList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return Center(child: CircularProgressIndicator(),);
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error:${snapshot.error}',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

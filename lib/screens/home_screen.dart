import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bible/deregates/search_bar_sliver_persistent_header_delegate.dart';
import 'package:my_bible/screens/bible_select_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final double statusBarSize = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1.0),
      body: Padding(
        padding: EdgeInsets.only(top: statusBarSize),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Image(
                    image: AssetImage('assets/img/homeTopIcon.png'),
                    height: 50,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SearchBarSliverPersistentHeaderDelegate(),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 5.0,
                            offset: const Offset(0, 10)),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context){
                                return BibleSelectScreen();} ),
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: const Size(310, 55),
                        backgroundColor:
                            const Color.fromRGBO(204, 108, 45, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: const Text(
                        ' 성경 선택하기 ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2000,
                  ),
                  const Text('footer\n.\n.\n.\n.\n.\n.\n.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

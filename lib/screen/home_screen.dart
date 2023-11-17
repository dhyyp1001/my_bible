import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_bible/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var alignment = Alignment.bottomCenter;
  bool search_bar_selected = false;
  bool _visibility = true;

  late ScrollController _scrollController;
  int scrollSize = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        print(_scrollController.offset);
      });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarSize = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 1.0),
      body: Padding(
        padding: EdgeInsets.only(top: statusBarSize),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Image(
                image: AssetImage('assets/img/homeTopIcon.png'),
                height: 50,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: CustomSliverPersistentHeaderDelegate(),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text('tdslk'
                      'sdlkt'
                      'sdlkjt'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      'sldkjt'
                      'sdlkjt'
                      'sdlkjt'
                      'sdtklj'
                      'sdtkjl'
                      'sdtkl'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n'
                      '\n')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    double horizontalPadding() {
      if (!overlapsContent && shrinkOffset == 0.0) {
        return 25.0;
      } else {
        return 25 - (shrinkOffset / 3);
      }
    }

    double cornerRadius() {
      if (!overlapsContent && shrinkOffset == 0.0) {
        return 8.0;
      } else {
        return 8 - shrinkOffset / 5;
      }
    }

    return FlexibleSpaceBar.createSettings(
      maxExtent: maxExtent,
      minExtent: minExtent,
      currentExtent: max(minExtent, maxExtent - shrinkOffset),
      isScrolledUnder: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding()),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cornerRadius()),
                topRight: Radius.circular(cornerRadius()),
                bottomLeft: const Radius.circular(8),
                bottomRight: const Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 5.0,
                    offset: Offset(0, 10)),
              ],
              border:
                  Border.all(color: const Color.fromRGBO(204, 108, 45, 1.0)),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
        ),
      ),
    );
  }
}

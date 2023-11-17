import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_bible/screens/search_screen.dart';

class SearchBarSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 48.0;

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
        return 30.0;
      } else {
        return 30 - (shrinkOffset / 2);
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
          child: Stack(
            children: [
              Container(
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
                        offset: const Offset(0, 10)),
                  ],
                  border: Border.all(
                      color: const Color.fromRGBO(204, 108, 45, 1.0),
                      width: 1.5),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),child: Icon(
                  Icons.search,
                  size: 27,
                  color: const Color.fromRGBO(204, 108, 45, 1.0),
                ),),
              ),
            ],
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

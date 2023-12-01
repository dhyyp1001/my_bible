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
        return 60.0;
      } else {
        return 65 - (shrinkOffset * 1.2);
      }
    }

    double cornerTopRadius() {
      if (!overlapsContent && shrinkOffset == 0.0) {
        return 100.0;
      } else {
        return 50 - shrinkOffset;
      }
    }

    double cornerBottomRadius() {
      if (!overlapsContent && shrinkOffset == 0.0) {
        return 100.0;
      } else {
        return 50 - shrinkOffset / 1.25;
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
                    topLeft: Radius.circular(cornerTopRadius()),
                    topRight: Radius.circular(cornerTopRadius()),
                    bottomLeft: Radius.circular(cornerBottomRadius()),
                    bottomRight: Radius.circular(cornerBottomRadius()),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movedor/models/Chapter.dart';

import '../constants.dart';
import '../size_config.dart';
import '../localStorage.dart';

class ChapterCard extends StatefulWidget {
  ChapterCard({
    Key key,
    this.width = 160,
    @required this.chapter,
    @required this.press,
  }) : super(key: key);

  final double width;
  final Chapter chapter;
  final GestureTapCallback press;

  @override
  _ChapterCardState createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(5), bottom: 20),
      child: 
      GestureDetector(
        onTap: widget.press,
        child: 
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            widget.chapter.image,
                            fit: BoxFit.fill,
                          ),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: 
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.chapter.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              maxLines: 2,
                            ),
                            Text(
                              widget.chapter.description,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        )
          
        // SizedBox (
        //   width: getProportionateScreenWidth(widget.width),
        //   child: 
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       AspectRatio(
        //         aspectRatio: 1,
        //         child: Container(
        //           child:
        //           ClipRRect(
        //             borderRadius: BorderRadius.circular(10.0),
        //             child: Image.asset(
        //               widget.chapter.image,
        //               fit: BoxFit.fill,
        //             ),
        //           )
        //         ),
        //       ),
        //       const SizedBox(height: 10),
        //       Text(
        //         widget.chapter.title,
        //         style: TextStyle(color: Colors.black),
        //         maxLines: 2,
        //       ),
        //       const SizedBox(height: 10),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Row(
        //             children: [
        //               const SizedBox(width: 10),
        //               // InkWell(
        //               //   borderRadius: BorderRadius.circular(50),
        //               //   onTap: () {
        //               //     setState(() {
        //               //       widget.chapter.isFavourite = !widget.chapter.isFavourite;
        //               //     });
        //               //   },
        //               //   child: Container(
        //               //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        //               //     height: getProportionateScreenWidth(28),
        //               //     width: getProportionateScreenWidth(28),
        //               //     decoration: BoxDecoration(
        //               //       color: widget.chapter.isFavourite
        //               //           ? kPrimaryColor.withOpacity(0.15)
        //               //           : kSecondaryColor.withOpacity(0.1),
        //               //       shape: BoxShape.circle,
        //               //     ),
        //               //     child: 
        //               //     widget.chapter.isFavourite
        //               //     ? SvgPicture.asset(
        //               //       "assets/icons/Heart Icon_2.svg",
        //               //       color: widget.chapter.isFavourite
        //               //           ? Color(0xFFFF4848)
        //               //           : Color(0xFFDBDEE4),
        //               //     )
        //               //     : Icon(
        //               //       LineIcons.heart_o,
        //               //       size: 12,
        //               //     ),
        //               //   ),
        //               // ),
        //             ],
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

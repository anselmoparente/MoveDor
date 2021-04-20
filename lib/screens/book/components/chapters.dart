import 'package:flutter/material.dart';
import 'package:movedor/components/chapter_card.dart';
import 'package:movedor/models/Chapter.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class Chapters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Capitulos", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  chapters.length,
                  (index) {
                    return ChapterCard(
                      chapter: chapters[index],
                      press: () {
                        var chapter = index + 1;

                        const chaptersRoutes = {
                          1: '/chapter-01',
                          2: '/chapter-02',
                          3: '/chapter-03',
                          4: '/chapter-04',
                          5: '/chapter-05',
                          6: '/chapter-06',
                          7: '/infographic'
                        };

                        print(chaptersRoutes[chapter]);

                        Navigator.pushNamed(
                          context,
                          chaptersRoutes[chapter], 
                        );
                      }
                    );
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}

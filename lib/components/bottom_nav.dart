import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class BottomNav extends StatefulWidget {
  int index;
  final PageController _pageController;
  BottomNav(this.index, this._pageController);

  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Color _getTabBackgroundColor() {
    Color color;
    switch (widget.index) {
      case 0:
        color = kPrimaryColor;
        break;
      case 1:
        color = kPrimaryLightColor;
        break;
      case 2:
        color = kPrimaryLightColor;
        break;
      case 3:
        color = kPrimaryLightColor;
        break;
      case 4:
        color = kPrimaryLightColor;
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: _getTabBackgroundColor(),
              tabs: [
                GButton(
                  icon: LineIcons.book,
                  text: 'Livreto',
                ),
                GButton(
                  icon: LineIcons.comment,
                  text: 'Infográfico',
                ),
                GButton(
                  icon: LineIcons.calendar,
                  text: 'Diário',
                ),
                GButton(
                  icon: LineIcons.infoCircle,
                  text: 'Sobre',
                ),
              ],
              selectedIndex: widget.index,
              onTabChange: (index) {
                if (widget.index != index) {
                  if (index == 2) {
                    if (controller.lastChapter > 2) {
                      setState(() {
                        widget.index = index;
                      });
                      print(widget.index);

                      widget._pageController.jumpToPage(index);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('O diário ainda não foi desbloqueado!'),
                        duration: const Duration(seconds: 2),
                        margin: EdgeInsets.only(
                            bottom: 80.0, left: 10.0, right: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ));
                      setState(() {
                        index = 0;
                      });
                    }
                  } else {
                    setState(() {
                      widget.index = index;
                    });
                    print(widget.index);

                    widget._pageController.jumpToPage(index);
                  }
                }
              }),
        ),
      ),
    );
  }
}

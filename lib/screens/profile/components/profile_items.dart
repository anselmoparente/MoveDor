import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../size_config.dart';

class ProfileItems extends StatelessWidget {
  ProfileItems({
    Key key,
  }) : super(key: key);

  final List<Map> items = [
    {
      "icon" : LineIcons.user,
      "text" : "Conta",
      "route": ""
    },
    {
      "icon" : LineIcons.cogs,
      "text" : "Preferências",
      "route": ""
    },
    {
      "icon" : LineIcons.bell,
      "text" : "Notificações",
      "route": ""
    },
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return 
          GestureDetector(
            onTap: () {
              print(items[index]["route"]);
            },
            child: 
            Column(
              children: [
                Divider(),
                SizedBox(height: getProportionateScreenHeight(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          items[index]["icon"],
                        color: Colors.black.withOpacity(.5),
                          size: 30,
                        ),
                        SizedBox(width: getProportionateScreenWidth(15)),
                        Text(
                          items[index]["text"],
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black.withOpacity(.5),
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
              ],
            ),
          );
        }
      ),
    );
  }
}
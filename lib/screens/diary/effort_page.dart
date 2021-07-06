import 'package:flutter/material.dart';

class EffortPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: mediaSize.height * 0.05,
                left: mediaSize.height * 0.03,
              ),
              width: double.maxFinite,
              child: Text(
                'PERCEPÇÃO DE ESFORÇO',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: mediaSize.height * 0.02,
                left: mediaSize.height * 0.03,
              ),
              width: double.maxFinite,
              child: Text(
                'Exercícios aeróbios',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            barChart(mediaSize, 7),
            Container(
              margin: EdgeInsets.only(
                top: mediaSize.height * 0.02,
                left: mediaSize.height * 0.03,
              ),
              width: double.maxFinite,
              child: Text(
                'Exercícios de fortalecimento',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            barChart(mediaSize, 9),
          ],
        ),
      ),
    );
  }

  Widget barChart(Size _mediaSize, int _imageFactor) {
    double _width = _mediaSize.width * 0.36;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: _mediaSize.width * 0.9,
        height: _mediaSize.height * 0.3,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Padding(
            padding: EdgeInsets.only(top: 10, right: 0, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: _mediaSize.height * 0.02,
                      ),
                      width: _width,
                      child: Text(
                        'Pontuação mais comum',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/diary/borg/$_imageFactor.png',
                      scale: 5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: _mediaSize.height * 0.02,
                      ),
                      width: _width,
                      child: Text(
                        'Últimas pontuações',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

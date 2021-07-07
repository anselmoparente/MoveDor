import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GoalPage extends StatelessWidget {
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
                'METAS',
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
            barChart(mediaSize, 15, 20, 15, 100),
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
            barChart(mediaSize, 10, 10, 20, 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(int _progressvalue, int _totalvalue) {
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ClipRRect(
              child: Container(
                  height: 30,
                  child: SfLinearGauge(
                    orientation: LinearGaugeOrientation.horizontal,
                    minimum: 0.0,
                    maximum: _totalvalue.toDouble(),
                    showTicks: false,
                    showLabels: false,
                    animateAxis: true,
                    axisTrackStyle: LinearAxisTrackStyle(
                      thickness: 30,
                      edgeStyle: LinearEdgeStyle.bothCurve,
                      borderWidth: 1,
                      borderColor: Color(0xffa9d6c2).withOpacity(0.5),
                      color: Color(0xffa9d6c2).withOpacity(0.5),
                    ),
                    barPointers: <LinearBarPointer>[
                      LinearBarPointer(
                        value: _progressvalue.toDouble(),
                        thickness: 30,
                        edgeStyle: LinearEdgeStyle.bothCurve,
                        color: Color(0xff36a9b0),
                      ),
                    ],
                  )))),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.only(top: 13.5, left: 10.0),
              child: Text(
                '$_progressvalue\min / $_totalvalue\min',
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ))),
    ]);
  }

  Widget barChart(Size _mediaSize, int _progressValue1, int _totalValue1,
      int _progressValue2, int _totalValue2) {
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
            padding: EdgeInsets.only(top: 10, right: 25, left: 25),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: _mediaSize.height * 0.02,
                  ),
                  width: double.maxFinite,
                  child: Text(
                    'Meta diária',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                _buildProgressBar(_progressValue1, _totalValue1),
                Container(
                  margin: EdgeInsets.only(
                    top: _mediaSize.height * 0.02,
                  ),
                  width: double.maxFinite,
                  child: Text(
                    'Meta semanal',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                _buildProgressBar(_progressValue2, _totalValue2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

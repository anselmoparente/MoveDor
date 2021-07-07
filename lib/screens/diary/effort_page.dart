import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EffortPage extends StatelessWidget {
  final List<int> showIndexes = const [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    final lineBarsData = [
      LineChartBarData(
        spots: [
          FlSpot(1, 6),
          FlSpot(3, 7),
          FlSpot(6, 7),
          FlSpot(9, 5),
        ],
        showingIndicators: showIndexes,
        curveSmoothness: 0,
        colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
        barWidth: 1,
        show: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
      ),
    ];
    final tooltipsOnBar = lineBarsData[0];
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
            barChart(mediaSize, 7, lineBarsData, tooltipsOnBar),
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
            barChart(mediaSize, 9, lineBarsData, tooltipsOnBar),
          ],
        ),
      ),
    );
  }

  Widget barChart(
      Size _mediaSize, int _imageFactor, lineBarsData, tooltipsOnBar) {
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
                      scale: 6,
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
                    Container(
                      width: _mediaSize.width * 0.35,
                      height: _mediaSize.height * 0.2,
                      child: LineChart(
                        LineChartData(
                          showingTooltipIndicators: showIndexes.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((spotIndex) {
                                return TouchedSpotIndicatorData(
                                  FlLine(color: Colors.transparent),
                                  FlDotData(),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Colors.transparent,
                              tooltipPadding: const EdgeInsets.all(0),
                              tooltipMargin: 10,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    lineBarSpot.y.round().toString(),
                                    const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          gridData: FlGridData(show: false),
                          axisTitleData: FlAxisTitleData(show: false),
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(showTitles: false),
                            leftTitles: SideTitles(showTitles: false),
                          ),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 10,
                          maxY: 10,
                          minY: 0,
                          lineBarsData: lineBarsData,
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

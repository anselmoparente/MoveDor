import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticPage extends StatelessWidget {
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
                'ESTATÍSTICAS',
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
            barChart(mediaSize, BarData.barData),
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
            barChart(mediaSize, BarData.barDataEffort),
          ],
        ),
      ),
    );
  }

  Widget barChart(Size _mediaSize, List<Data> _barData) {
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
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                maxY: 40,
                minY: 0,
                groupsSpace: _mediaSize.width * 0.05,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.transparent,
                    tooltipPadding: const EdgeInsets.all(0),
                    tooltipMargin: 0,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        (rod.y.round() - 1).toString(),
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                backgroundColor: Colors.white,
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: false),
                  bottomTitles: BarTitles.getTopBottomTitles(),
                ),
                borderData: FlBorderData(show: false),
                barGroups: _barData
                    .map((data) => BarChartGroupData(
                          x: data.id,
                          barsSpace: 4,
                          showingTooltipIndicators: [0],
                          barRods: [
                            BarChartRodData(
                                y: data.y + 1,
                                width: 22,
                                colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                ))
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Data {
  final int id;
  final String name;
  final double y;
  final Color color;

  const Data({
    @required this.name,
    @required this.id,
    @required this.y,
    @required this.color,
  });
}

class BarData {
  static int interval = 5;

  static List<Data> barData = [
    Data(
      name: 'DOM',
      id: 0,
      y: 0,
      color: Color(0xff19bfff),
    ),
    Data(
      name: 'SEG',
      id: 1,
      y: 15,
      color: Color(0xffff4d94),
    ),
    Data(
      name: 'TER',
      id: 2,
      y: 20,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'QUA',
      id: 3,
      y: 0,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'QUI',
      id: 4,
      y: 15,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'SEX',
      id: 5,
      y: 30,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'SÁB',
      id: 6,
      y: 0,
      color: Color(0xffff4d94),
    ),
  ];

  static List<Data> barDataEffort = [
    Data(
      id: 0,
      name: 'Domingo',
      y: 0,
      color: Color(0xff19bfff),
    ),
    Data(
      name: 'Segunda',
      id: 1,
      y: 10,
      color: Color(0xffff4d94),
    ),
    Data(
      name: 'Terça',
      id: 2,
      y: 0,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Quarta',
      id: 3,
      y: 10,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Quinta',
      id: 4,
      y: 0,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Sexta',
      id: 5,
      y: 0,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Sábado',
      id: 6,
      y: 0,
      color: Color(0xffff4d94),
    ),
  ];
}

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        margin: 10,
        getTitles: (double id) => BarData.barData
            .firstWhere((element) => element.id == id.toInt())
            .name,
      );

  static SideTitles getSideTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Colors.white, fontSize: 10),
        rotateAngle: 90,
        interval: BarData.interval.toDouble(),
        margin: 10,
        reservedSize: 30,
        getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
      );
}

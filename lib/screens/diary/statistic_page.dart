import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  Size mediaSize;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: mediaSize.height * 0.05),
              child: Text(
                "Atividade",
                style: TextStyle(
                  color: Color(0xff36a9b0),
                  fontSize: 24,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: mediaSize.width * 0.9,
                height: mediaSize.height * 0.4,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  color: const Color(0xff020227),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, right: 25),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.center,
                        maxY: 60,
                        minY: 0,
                        groupsSpace: 25,
                        barTouchData: BarTouchData(enabled: true),
                        titlesData: FlTitlesData(
                          topTitles: BarTitles.getTopBottomTitles(),
                        ),
                        barGroups: BarData.barData
                            .map((data) => BarChartGroupData(
                                  x: data.id,
                                  barsSpace: 4,
                                  barRods: [
                                    BarChartRodData(
                                        y: data.y,
                                        width: 22,
                                        colors: [data.color],
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
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Percepção de Esforço",
                style: TextStyle(
                  color: Color(0xff36a9b0),
                  fontSize: 24,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: mediaSize.width * 0.9,
                height: mediaSize.height * 0.4,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  color: const Color(0xff020227),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, right: 25),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.center,
                        maxY: 10,
                        minY: 0,
                        groupsSpace: 25,
                        barTouchData: BarTouchData(enabled: true),
                        titlesData: FlTitlesData(
                          topTitles: BarTitles.getTopBottomTitles(),
                        ),
                        barGroups: BarData.barDataEffort
                            .map((data) => BarChartGroupData(
                                  x: data.id,
                                  barsSpace: 4,
                                  barRods: [
                                    BarChartRodData(
                                        y: data.y,
                                        width: 22,
                                        colors: [data.color],
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
            ),
          ],
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
      id: 0,
      name: 'Domingo',
      y: 24,
      color: Color(0xff19bfff),
    ),
    Data(
      name: 'Segunda',
      id: 1,
      y: 20,
      color: Color(0xffff4d94),
    ),
    Data(
      name: 'Terça',
      id: 2,
      y: 18,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Quarta',
      id: 3,
      y: 25,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Quinta',
      id: 4,
      y: 34,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Sexta',
      id: 5,
      y: 16,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Sábado',
      id: 6,
      y: 58,
      color: Color(0xffff4d94),
    ),
  ];

  static List<Data> barDataEffort = [
    Data(
      id: 0,
      name: 'Domingo',
      y: 2,
      color: Color(0xff19bfff),
    ),
    Data(
      name: 'Segunda',
      id: 1,
      y: 4,
      color: Color(0xffff4d94),
    ),
    Data(
      name: 'Terça',
      id: 2,
      y: 5,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Quarta',
      id: 3,
      y: 3,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Quinta',
      id: 4,
      y: 8,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Sexta',
      id: 5,
      y: 9,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Sábado',
      id: 6,
      y: 8,
      color: Color(0xffff4d94),
    ),
  ];
}

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Colors.white, fontSize: 10),
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

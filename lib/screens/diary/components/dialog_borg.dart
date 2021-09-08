import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DialogBorg extends StatefulWidget {
  final double initialSliderValue;

  const DialogBorg({Key key, this.initialSliderValue}) : super(key: key);

  @override
  _DialogBorgState createState() => _DialogBorgState();
}

class _DialogBorgState extends State<DialogBorg> {
  double _sliderValue;
  Size mediaSize;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initialSliderValue;
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: Text(
          'Qual foi o grau de esforço para realizar a atividade?(deslize o slider)'),
      content: Container(
        height: mediaSize.height * 0.6,
        child: Row(
          children: [
            SfSlider.vertical(
              min: 1.0,
              max: 10.0,
              value: _sliderValue,
              interval: 1,
              stepSize: 1.0,
              showTicks: true,
              activeColor: _sliderValue.toInt() == 10
                  ? Colors.yellow[200]
                  : _sliderValue.toInt() == 9
                      ? Colors.yellow
                      : _sliderValue.toInt() == 8
                          ? Colors.yellow[700]
                          : _sliderValue.toInt() == 7
                              ? Colors.yellow[800]
                              : _sliderValue.toInt() == 6
                                  ? Colors.yellow[900]
                                  : _sliderValue.toInt() == 5
                                      ? Colors.orange
                                      : _sliderValue.toInt() == 4
                                          ? Colors.orange[700]
                                          : _sliderValue.toInt() == 3
                                              ? Colors.brown[400]
                                              : _sliderValue.toInt() == 2
                                                  ? Colors.red
                                                  : Colors.red[900],
              onChanged: (dynamic value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            SizedBox(width: mediaSize.width * 0.05),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    _sliderValue.toInt() == 10
                        ? 'assets/diary/borg/1.png'
                        : _sliderValue.toInt() == 9
                            ? 'assets/diary/borg/2.png'
                            : _sliderValue.toInt() == 8
                                ? 'assets/diary/borg/3.png'
                                : _sliderValue.toInt() == 7
                                    ? 'assets/diary/borg/4.png'
                                    : _sliderValue.toInt() == 6
                                        ? 'assets/diary/borg/5.png'
                                        : _sliderValue.toInt() == 5
                                            ? 'assets/diary/borg/6.png'
                                            : _sliderValue.toInt() == 4
                                                ? 'assets/diary/borg/7.png'
                                                : _sliderValue.toInt() == 3
                                                    ? 'assets/diary/borg/8.png'
                                                    : _sliderValue.toInt() == 2
                                                        ? 'assets/diary/borg/9.png'
                                                        : 'assets/diary/borg/10.png',
                    height: mediaSize.width * 0.4,
                    width: mediaSize.width * 0.4,
                  ),
                ),
                Text(
                  _sliderValue.toInt() == 10
                      ? 'Demasiado Leve'
                      : _sliderValue.toInt() == 9
                          ? 'Muito Leve'
                          : _sliderValue.toInt() == 8
                              ? 'Muito Leve-Leve'
                              : _sliderValue.toInt() == 7
                                  ? 'Leve'
                                  : _sliderValue.toInt() == 6
                                      ? 'Leve-Moderado'
                                      : _sliderValue.toInt() == 5
                                          ? 'Moderado'
                                          : _sliderValue.toInt() == 4
                                              ? 'Moderado-Intenso'
                                              : _sliderValue.toInt() == 3
                                                  ? 'Intenso'
                                                  : _sliderValue.toInt() == 2
                                                      ? 'Muito Intenso'
                                                      : 'Exaustivo',
                  style: TextStyle(
                      fontSize: mediaSize.width * 0.05, color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, _sliderValue);
          },
          child: Text('Salvar'),
        )
      ],
    );
  }
}

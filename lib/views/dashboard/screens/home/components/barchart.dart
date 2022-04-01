import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theorytest/constants/constants.dart' as Constants;

class BarChartSample1 extends StatefulWidget {

  const BarChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final box = GetStorage();
  late List<double> data;
  final Color barBackgroundColor = Color.fromRGBO(243, 242, 240, 1);
  final Duration animDuration = const Duration(milliseconds: 250);

  int? touchedIndex = 0;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    data = box.read("scores");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.28.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255,218, 218, 218,),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(3.0,2)
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.only(top: 10,left: 10),
                    child: const Text(
                      'Last Five Tests',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                  ,
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Constants.blueCard,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          width: 20,
          colors: isTouched ? [Color.fromRGBO(0, 114, 255, 1),Color.fromRGBO(0, 114, 255,1)] : [Color.fromRGBO(231,231,231,1),Color.fromRGBO(245,245,245,1)],
          borderSide: const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 100,
            colors: [Colors.white],
          ),
        ),
      ],
      barsSpace: 1,
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(data.length, (i) {
    switch (i) {
      case 0:
        if(data[4-i] == 0){
          return makeGroupData(0, ((data[4-i]/40) * 100) + 2, isTouched: i == touchedIndex);
        }
        else{
          return makeGroupData(0, (data[4-i]/40) * 100, isTouched: i == touchedIndex);
        }
      case 1:
        if(data[4-i] == 0){
          return makeGroupData(1, ((data[4-i]/40) * 100) + 2, isTouched: i == touchedIndex);
        }
        else{
          return makeGroupData(1, (data[4-i]/40) * 100, isTouched: i == touchedIndex);
        }
      case 2:
        if(data[4-i]==0){
          return makeGroupData(2, ((data[4-i]/40) * 100)+2, isTouched: i == touchedIndex);

        }
        else{
          return makeGroupData(2, (data[4-i]/40) * 100, isTouched: i == touchedIndex);
        }
      case 3:
        if(data[4-i]==0){
          return makeGroupData(3, ((data[4-i]/40) * 100)+2, isTouched: i == touchedIndex);

        }
        else{
          return makeGroupData(3, (data[4-i]/40) * 100, isTouched: i == touchedIndex);
        }
      case 4:
        if(data[4-i]==0){
          return makeGroupData(4, ((data[4-i]/40) * 100)+2, isTouched: i == touchedIndex);

        }
        else{
          return makeGroupData(4, (data[4-i]/40) * 100, isTouched: i == touchedIndex);
        }
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.white,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  if(data[4-group.x.toInt()] >= 35){
                    weekDay = 'Passed';
                  }
                  else{
                    weekDay = "Failed";
                  }
                  break;
                case 1:
                  if(data[4-group.x.toInt()] >= 35){
                    weekDay = 'Passed';
                  }
                  else{
                    weekDay = "Failed";
                  }
                  break;
                case 2:
                  if(data[4-group.x.toInt()] >= 35){
                    weekDay = 'Passed';
                  }
                  else{
                    weekDay = "Failed";
                  }
                  break;
                case 3:
                  if(data[4-group.x.toInt()] >= 35){
                    weekDay = 'Passed';
                  }
                  else{
                    weekDay = "Failed";
                  }
                  break;
                case 4:
                  if(data[4-group.x.toInt()] >= 35){
                    weekDay = 'Passed';
                  }
                  else{
                    weekDay = "Failed";
                  }
                  break;
                case 5:
                  if(data[group.x.toInt()] >= 35){
                    weekDay = 'Passed';
                  }
                  else{
                    weekDay = "Failed";
                  }
                  break;
                case 6:
                  if(data[group.x.toInt()] >= 35){
                    weekDay = 'Passed';
                  }
                  else{
                    weekDay = "Failed";
                  }
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                TextStyle(
                  color: weekDay == "Failed" ? Colors.red: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if(barTouchResponse?.spot != null){
              touchedIndex = barTouchResponse?.spot!.touchedBarGroupIndex;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => TextStyle(
              color: value == touchedIndex ? Colors.blue : Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                if(data[4-value.toInt()] >= 35){
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
                else{
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
              case 1:
                if(data[4-value.toInt()] >= 35){
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
                else{
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
              case 2:
                if(data[4-value.toInt()] >= 35){
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
                else{
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
              case 3:
                if(data[4-value.toInt()] >= 35){
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
                else{
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
              case 4:
                if(data[4-value.toInt()] >= 35){
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
                else{
                  return ((data[4-value.toInt()]/40)*100).toInt().toString();
                }
              default:
                return '';
            }
          },
        ),
          leftTitles: SideTitles(
            getTextStyles: (context, value) => const TextStyle(
              color: Colors.grey,
              fontSize: 12
            ),
              showTitles: true,
              interval: 20,
              reservedSize: 32,
            margin: -20
          )
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }
}
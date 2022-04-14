import 'dart:collection';

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

  String dropdownValue = "test";

  final box = GetStorage();
  late List<double> data;
  late List<double> practiceData;
  late List<double> rapidData;
  late List<double> marathonData;
  final Color barBackgroundColor = Color.fromRGBO(243, 242, 240, 1);
  final Duration animDuration = const Duration(milliseconds: 250);

  int? touchedIndex = 0;

  @override
  void initState(){
    super.initState();
    Map og = box.read("scores");
    practiceData = og["practice"];
    rapidData = og["rapid"];
    marathonData = og["marathon"];
    data = practiceData;
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
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
            spreadRadius: 1.w,
            blurRadius: 8.w,
            offset: Offset(3.0.w,2.w)
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.r))
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Container(
                      margin:EdgeInsets.only(top: 10,left: 10),
                      child: Text(
                        'Last Five Tests',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),DropdownButton<String>(
                      value: dropdownValue,
                      items: [DropdownMenuItem(value: "test",child: Text(
                        'Practice test',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),),DropdownMenuItem(value: "rapid",child: Text(
                        'Rapid fire',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),),DropdownMenuItem(value: "marathon",child: Text(
                        'Marathon',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),)],
                      onChanged: (value) { setState(() {
                        dropdownValue = value as String;
                         if(dropdownValue=="test"){
                           data = practiceData;
                           refreshState();
                         }
                         else if(dropdownValue =="rapid"){
                           data = rapidData;
                           refreshState();
                         }
                         else if(dropdownValue =="marathon"){
                           data = marathonData;
                           refreshState();
                         }
                      }); },)],
                  )
                  ,
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(right: 8.0.w),
                      child:
                      BarChart(
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
          borderRadius: BorderRadius.all(Radius.circular(5)),
          width: 20.w,
          color: isTouched ? Color.fromRGBO(0, 114, 255,1) : Color.fromRGBO(231,231,231,1),
          borderSide: const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: Colors.white,
          ), toY: y,
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
                  fontSize: 18.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.fromY - 1).toString(),
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
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
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value,titleMeta){
            return
            Padding(padding: EdgeInsets.only(top: 5),
                child: Text("${((data[4-value.toInt()]/40)*100).toInt().toString()}",
                style: TextStyle(
                  color: value == touchedIndex ? Colors.blue : Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),)
              );
            },
          ),
        ),
          leftTitles: AxisTitles(sideTitles: SideTitles(
              getTitlesWidget: (value,titleMeta){
                return
                  Text("${value.toInt()}",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey,));
                  },
              showTitles: true,
              reservedSize: 40,
              interval: 20
          ),
      ),
    )
        , barGroups: showingGroups(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false)
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(data.length, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 0,);
          case 1:
            return makeGroupData(1, 0,);
          case 2:
            return makeGroupData(2, 5,);
          case 3:
            return makeGroupData(3, 0,);
          case 4:
            return makeGroupData(4, 0,);
          case 5:
            return makeGroupData(5, 0,);
          case 6:
            return makeGroupData(6, 0,);
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

}
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theorytest/constants/constants.dart' as Constants;
import 'package:theorytest/controllers/dashboard_controller.dart';
import 'package:theorytest/models/legends_model.dart';

class BarChartSample1 extends StatelessWidget {
  final box = GetStorage();
  final Color barBackgroundColor = Color.fromRGBO(243, 242, 240, 1);
  final Duration animDuration = const Duration(milliseconds: 400);

  dashboardController controller = Get.put(dashboardController());
  List<LegendsModel> legends = [
    LegendsModel(
        name: "Practice",
        color: Constants.lightblueCard,
        bgColor: Constants.blueCard),
    LegendsModel(
        name: "Rapid",
        color: Constants.lightorangeCard,
        bgColor: Constants.orangeCard),
    LegendsModel(
        name: "Marathon", color: Colors.red.shade200, bgColor: Colors.red)
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<dashboardController>(builder: (controller) {
      return Container(
        height: 0.30.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(
                    255,
                    218,
                    218,
                    218,
                  ),
                  spreadRadius: 1.w,
                  blurRadius: 8.w,
                  offset: Offset(3.0.w, 2.w)),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Wrap(
                //   children: [
                //     TextButton(onPressed: ()=>{}, child: Text("Rapid")),
                //     TextButton(onPressed: ()=>{}, child: Text("Marathon")),
                //     TextButton(onPressed: ()=>{}, child: Text("Practice")),
                //   ],
                // )
              ]),
              Container(
                child: Text(
                  'Last Three Tests',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: legends.length,
                  itemBuilder: (BuildContext context, int index) => LegendsList(
                    model: legends[index],
                    index: index,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
    y2,
    y3, {
    bool isTouched = false,
    Color barColor = Constants.blueCard,
    double width = 20,
    List<int> showTooltips = const [0],
  }) {
    return BarChartGroupData(
      x: x,
      barsSpace: 10,
      showingTooltipIndicators: [controller.touchedIndex],
      barRods: [
        BarChartRodData(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            width: width,
            color: controller.touchedIndex == 0
                ? Constants.primaryBlue
                : Constants.lightblueCard,
            borderSide: const BorderSide(color: Colors.white, width: 0),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 100,
              fromY: -2,
              color: Colors.grey.shade100,
            ),
            toY: y,
            fromY: -2),
        BarChartRodData(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            width: width,
            color: controller.touchedIndex == 1
                ? Constants.orangeCard
                : Constants.lightorangeCard,
            borderSide: const BorderSide(color: Colors.white, width: 0),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              fromY: -2,
              toY: 100,
              color: Colors.grey.shade100,
            ),
            toY: y2,
            fromY: -2),
        BarChartRodData(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            width: width,
            color:
                controller.touchedIndex == 2 ? Colors.red : Colors.red.shade300,
            borderSide: const BorderSide(color: Colors.white, width: 0),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 100,
              fromY: -2,
              color: Colors.grey.shade100,
            ),
            toY: y3,
            fromY: -2),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() =>
      List.generate(controller.practiceData.length - 2, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
                0,
                ((controller.practiceData[4 - i] / 40) * 100),
                ((controller.rapidData[4 - i] / 40) * 100),
                ((controller.marathonData[4 - i] / 40) * 100),
                isTouched: i == controller.touchedIndex);
          case 1:
            return makeGroupData(
                1,
                ((controller.practiceData[4 - i] / 40) * 100),
                ((controller.rapidData[4 - i] / 40) * 100),
                ((controller.marathonData[4 - i] / 40) * 100),
                isTouched: i == controller.touchedIndex);
          case 2:
            return makeGroupData(
                2,
                ((controller.practiceData[4 - i] / 40) * 100),
                ((controller.rapidData[4 - i] / 40) * 100),
                ((controller.marathonData[4 - i] / 40) * 100),
                isTouched: i == controller.touchedIndex);
          case 3:
            return makeGroupData(
                3,
                ((controller.practiceData[4 - i] / 40) * 100),
                ((controller.rapidData[4 - i] / 40) * 100),
                ((controller.marathonData[4 - i] / 40) * 100),
                isTouched: i == controller.touchedIndex);
          case 4:
            return makeGroupData(
                4,
                ((controller.practiceData[4 - i] / 40) * 100),
                ((controller.rapidData[4 - i] / 40) * 100),
                ((controller.marathonData[4 - i] / 40) * 100),
                isTouched: i == controller.touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
        groupsSpace: 20,
        alignment: BarChartAlignment.center,
        barTouchData: BarTouchData(
          allowTouchBarBackDraw: true,
          touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipPadding: const EdgeInsets.all(0),
              tooltipMargin: 8,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                    rod.toY.round().toString(),
                    const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ));
              }),
          touchCallback: (FlTouchEvent event, barTouchResponse) {
            if (barTouchResponse?.spot != null) {
              controller.updateTouchIndex(
                  barTouchResponse!.spot!.touchedRodDataIndex);
            } else {}
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, titleMeta) {
                switch (value.toInt()) {
                  case 0:
                    return Text("1st",
                        textAlign: TextAlign.start,
                        style: Get.textTheme.bodyText2
                            ?.copyWith(color: Colors.grey, fontSize: 10.sp));
                  case 1:
                    return Text("2nd",
                        textAlign: TextAlign.start,
                        style: Get.textTheme.bodyText2
                            ?.copyWith(color: Colors.grey, fontSize: 10.sp));
                  case 2:
                    return Text("3rd",
                        textAlign: TextAlign.start,
                        style: Get.textTheme.bodyText2
                            ?.copyWith(color: Colors.grey, fontSize: 10.sp));
                  case 3:
                    return Text("4th",
                        textAlign: TextAlign.start,
                        style: Get.textTheme.bodyText2
                            ?.copyWith(color: Colors.grey, fontSize: 10.sp));
                  default:
                    return Text("${value.toInt()}",
                        textAlign: TextAlign.start,
                        style: Get.textTheme.bodyText2
                            ?.copyWith(color: Colors.grey, fontSize: 10.sp));
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
                getTitlesWidget: (value, titleMeta) {
                  return Text("${value.toInt()}",
                      textAlign: TextAlign.start,
                      style: Get.textTheme.bodyText2
                          ?.copyWith(color: Colors.grey, fontSize: 10.sp));
                },
                //style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey,));

                showTitles: true,
                reservedSize: 25,
                interval: 20),
          ),
        ),
        barGroups: showingGroups(),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false));
  }
}

class LegendsList extends StatelessWidget {
  LegendsModel model;
  int index;
  LegendsList({required this.model, required this.index});
  dashboardController controller = Get.put(dashboardController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => controller.updateTouchIndex(index)),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: model.bgColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 10,
              color: model.color,
            ),
            SizedBox(
              width: 6,
            ),
            Text("${model.name}",
                style: Get.theme.textTheme.bodyText2
                    ?.copyWith(color: Colors.white))
          ],
        ),
      ),
    );
  }
}

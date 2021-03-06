import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_chart_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaChart extends StatefulWidget {
  @override
  _PicaChartState createState() => _PicaChartState();
}

class _PicaChartState extends State<PicaChart>
    with AutomaticKeepAliveClientMixin {
  final PicaChartController picaCController = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 100, maxHeight: 800, maxWidth: 600, minWidth: 300),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Obx(
                      () {
                        if (_homeController
                                .tempListChecklistAudit.value.checklistAudit !=
                            null) {
                          picaCController.combineList();
                          return Container(
                            width: 500,
                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: 110,
                                minY: 0,
                                barTouchData: BarTouchData(
                                  enabled: false,
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.transparent,
                                    tooltipPadding: const EdgeInsets.all(0),
                                    tooltipMargin: 10,
                                    getTooltipItem: (
                                      BarChartGroupData group,
                                      int groupIndex,
                                      BarChartRodData rod,
                                      int rodIndex,
                                    ) {
                                      return BarTooltipItem(
                                        rod.y.round().toString(),
                                        TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: SideTitles(),
                                  topTitles: SideTitles(),
                                  bottomTitles: SideTitles(
                                    reservedSize: 70,
                                    showTitles: true,
                                    rotateAngle: 270,
                                    getTextStyles: (value, number) =>
                                        const TextStyle(
                                      color: Color(0xff7589a2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    margin: 20,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'PI';
                                        case 1:
                                          return 'PS Plan';
                                        case 2:
                                          return 'PS';
                                        case 3:
                                          return 'OVH Plan';
                                        case 4:
                                          return 'OVH';
                                        case 5:
                                          return 'USC';
                                        case 6:
                                          return 'TOOLS';
                                        case 7:
                                          return 'CBM';
                                        case 8:
                                          return 'INFRAS';
                                        case 9:
                                          return 'PEOPLE';
                                        case 10:
                                          return 'IW';
                                        case 11:
                                          return 'VM';
                                        case 12:
                                          return 'AE';
                                        case 13:
                                          return 'MR';
                                        case 14:
                                          return 'OM';
                                        case 15:
                                          return 'OP';
                                        case 16:
                                          return 'OS';
                                        case 17:
                                          return 'RegM';
                                        case 18:
                                          return 'CO';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (value, number) =>
                                        const TextStyle(
                                            color: Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                    margin: 14,
                                    reservedSize: 15,
                                    getTitles: (value) {
                                      if (value == 90.0) {
                                        return '93';
                                      } else {
                                        return '';
                                      }
                                    },
                                  ),
                                ),
                                gridData: FlGridData(
                                  show: true,
                                  drawHorizontalLine: true,
                                  checkToShowHorizontalLine: (value) =>
                                      value - 90 == 0,
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: List<BarChartGroupData>.generate(
                                  picaCController.listIndex.length,
                                  (index) => BarChartGroupData(
                                    x: index,
                                    barRods: [
                                      BarChartRodData(
                                        width: 10,
                                        y: picaCController.scorePica(
                                            picaCController.listIndex[index]!),
                                        colors: picaCController.colorBar(
                                          picaCController.scorePica(
                                            picaCController.listIndex[index]!,
                                          ),
                                        ),
                                      ),
                                    ],
                                    showingTooltipIndicators: [0],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

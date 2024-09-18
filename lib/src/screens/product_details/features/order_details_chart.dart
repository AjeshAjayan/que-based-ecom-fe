import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';

class OrderDetailsChart extends StatefulWidget {
  OrderDetailsChart({super.key});
  final List<Color> barColor = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
  ];
  @override
  State<OrderDetailsChart> createState() => _OrderDetailsChartState();
}

class _OrderDetailsChartState extends State<OrderDetailsChart> {
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    final barGroup1 = makeGroupData(0, [2, 3]);
    final barGroup2 = makeGroupData(1, [0, 1]);

    final items = [
      barGroup1,
      barGroup2,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: showingBarGroups,
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                  axisNameWidget: const Text('No. of Orders'),
                  sideTitles: SideTitles(
                    getTitlesWidget: leftTitles,
                    showTitles: true,
                  ),
                ),
                rightTitles: const AxisTitles(
                  axisNameWidget: Text(''),
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  axisNameSize: 50,
                  axisNameWidget: const Text('Variants'),
                  sideTitles: SideTitles(
                    getTitlesWidget: bottomTitles,
                    showTitles: true,
                  ),
                ),
                topTitles: const AxisTitles(
                  axisNameSize: 24,
                  axisNameWidget: Text('Order stats'),
                ),
              ),
            ),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, List<int> y) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: y
          .map(
            (y) => BarChartRodData(
              toY: y.toDouble(),
              color: widget.barColor[x],
              width: 7,
            ),
          )
          .toList(),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final Widget text = Text(
      'order-${(value + 1).toInt().toString()}',
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}

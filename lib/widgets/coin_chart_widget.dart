
import 'package:cryptodemo/models/fetchCoins_models/usd_model.dart';
import 'package:cryptodemo/models/models.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinChartWidget extends StatelessWidget {
  const CoinChartWidget({
    Key? key,
    required this.data,
    required this.coinPrice,
    required this.color,
  }) : super(key: key);

  final List<ChartData> data;
  final UsdModel coinPrice;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 96.0,
              width: double.infinity,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(isVisible: false),
                primaryYAxis: CategoryAxis(isVisible: false),
                legend: Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: false),
                series: <ChartSeries<ChartData, String>>[
                  LineSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (ChartData sales, _) => sales.year.toString(),
                    yValueMapper: (ChartData sales, _) => sales.value,
                      pointColorMapper: (ChartData sales, _) => coinPrice.percentChange_7d >= 0 ? Colors.green : Colors.red
                  ),
                ],
              ),
            ),
          ),
          color == Colors.green
              ? Container()
              : Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.only(right: 16.0),
                  alignment: Alignment.center,
                  width: 72,
                  height: 36,
                  decoration: BoxDecoration(
                      color: coinPrice.percentChange_7d >= 0
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Text(
                    coinPrice.percentChange_7d.toStringAsFixed(2) + "%",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
        ],
      ),
    );
  }
}

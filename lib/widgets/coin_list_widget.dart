

import 'package:cryptodemo/models/chart_data_model.dart';
import 'package:cryptodemo/models/fetchCoins_models/data_model.dart';
import 'package:cryptodemo/screens/coin_detail_screen.dart';
import 'package:flutter/material.dart';

import 'coin_chart_widget.dart';
import 'coin_logo_widget.dart';

class CoinListWidget extends StatefulWidget {
  final List<DataModel> coins;
  final Future<void> Function() refreshData;

  const CoinListWidget({
    Key? key,
    required this.coins, required this.refreshData,
  }) : super(key: key);

  @override
  _CoinListWidgetState createState() => _CoinListWidgetState();
}

class _CoinListWidgetState extends State<CoinListWidget> {
  @override
  Widget build(BuildContext context) {
    return
        RefreshIndicator(
          color: Colors.orange,
          onRefresh: widget.refreshData,
          child: ListView.builder(
            itemExtent: 160,
            itemCount: widget.coins.length,
            itemBuilder: (context, index) {
              var coin = widget.coins[index];
              var coinPrice = coin.quoteModel.usdModel;
              var data = [
                ChartData(coinPrice.percentChange_90d, 2160),
                ChartData(coinPrice.percentChange_60d, 1440),
                ChartData(coinPrice.percentChange_30d, 720),
                ChartData(coinPrice.percentChange_24h, 24),
                ChartData(coinPrice.percentChange_1h, 1),
              ];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CoinDetailScreen(coin: coin)),
                  );
                },
                child: Container(
                  height: 160.0,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CoinLogoWidget(coin: coin),
                      CoinChartWidget(
                        data: data,
                        coinPrice: coinPrice,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
  }
}

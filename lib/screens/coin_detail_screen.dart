import 'dart:math';


import 'package:cryptodemo/models/chart_data_model.dart';
import 'package:cryptodemo/models/fetchCoins_models/data_model.dart';
import 'package:cryptodemo/widgets/coin_detail_app_bar_widget.dart';
import 'package:cryptodemo/widgets/coin_randomed_chart_widget.dart';
import 'package:flutter/material.dart';


import 'package:intl/intl.dart';

class CoinDetailScreen extends StatefulWidget {
  final DataModel coin;
  const CoinDetailScreen({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  _CoinDetailScreenState createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    var coinPrice = widget.coin.quoteModel.usdModel;
    DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(coinPrice.lastUpdated);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    var data = [
      ChartData(next(110, 140), 1),
      ChartData(next(9, 41), 2),
      ChartData(next(140, 200), 3),
      ChartData(coinPrice.percentChange_24h, 4),
      ChartData(coinPrice.percentChange_1h, 5),
      ChartData(next(110, 140), 6),
      ChartData(next(9, 41), 7),
      ChartData(next(140, 200), 8),
      ChartData(coinPrice.percentChange_24h, 9),
      ChartData(coinPrice.percentChange_1h, 10),
      ChartData(next(110, 140), 12),
      ChartData(next(9, 41), 13),
      ChartData(coinPrice.percentChange_1h, 14),
      ChartData(next(9, 41), 15),
      ChartData(next(140, 200), 16),
      ChartData(coinPrice.percentChange_24h, 17),
      ChartData(coinPrice.percentChange_1h, 18),
      ChartData(next(110, 140), 19),
      ChartData(next(9, 41), 20),
      ChartData(next(140, 200), 21),
      ChartData(coinPrice.percentChange_24h, 22),
      ChartData(next(110, 140), 23),
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 12, 54, 1),
      body: CustomScrollView(
        slivers: [
          CoinDetailAppBar(coin: widget.coin, coinIconUrl: coinIconUrl),
          CoinRandomedChartWidget(
              coinPrice: coinPrice, outputDate: outputDate, data: data, changeData: (){
                setState(() {});
          },),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 400.0,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Circulating Supply: ",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              widget.coin.circulatingSupply.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Max Supply: ",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              widget.coin.maxSupply.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Market pairs: ",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              widget.coin.numMarketPairs.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Market Cap: ",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              widget.coin.quoteModel.usdModel.marketCap
                                  .toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

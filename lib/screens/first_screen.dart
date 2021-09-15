import 'package:cryptodemo/models/fetchCoins_models/big_data_model.dart';
import 'package:cryptodemo/repository/repository.dart';
import 'package:cryptodemo/widgets/coin_list_widget.dart';
import 'package:flutter/material.dart';



class FirstScreen extends StatefulWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<BigDataModel> _futureCoins;
  Repository repository = Repository();
  @override
  void initState() {
    _futureCoins = repository.getCoins();
    super.initState();
  }

  Future<BigDataModel> getCoinsList() async {
    final listCoins = await repository.getCoins();
    return listCoins;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: Text(
        "Crypto List",
        style: Theme.of(context).textTheme.headline5,
      ), ),
      body: FutureBuilder<BigDataModel>(
        future: _futureCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var coinsData = snapshot.data!.dataModel;
              return CoinListWidget(coins: coinsData, refreshData: () {
                setState(() {
                  _futureCoins = getCoinsList();
                });
                return _futureCoins;
              },);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
          }

          return Center(
            child: CircularProgressIndicator(color: Colors.white,),
          );
        },
      ),
    );
  }
}

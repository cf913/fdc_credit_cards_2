import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller = ScrollController();

  var transactionsList = [
    {
      'logo': 'images/netflix.png',
      'width': 25.0,
      'name': 'NETFLIX',
      'type': 'Cinema',
      'amount': '-\$12'
    },
    {
      'logo': 'images/maccas.png',
      'width': 27.0,
      'name': 'MCDONALDS',
      'type': 'Restaurants',
      'amount': '-\$6'
    },
    {
      'logo': 'images/apple.png',
      'width': 15.0,
      'name': 'OKKO',
      'type': 'Petrol',
      'amount': '-\$43'
    },
    {
      'logo': 'images/glovo.png',
      'width': 30.0,
      'name': 'GLOVO',
      'type': 'Delivery',
      'amount': '-\$9'
    },
    {
      'logo': 'images/apple.png',
      'name': 'APPLE',
      'width': 15.0,
      'type': 'Gadgets & Technology',
      'amount': '-\$1 299'
    },
    {
      'logo': 'images/nike.png',
      'width': 28.0,
      'name': 'NIKE',
      'type': 'Sportswear',
      'amount': '-\$38'
    },
    {
      'logo': 'images/glovo.png',
      'width': 30.0,
      'name': 'GLOVO',
      'type': 'Delivery',
      'amount': '-\$9'
    },
    {
      'logo': 'images/apple.png',
      'name': 'APPLE',
      'width': 15.0,
      'type': 'Gadgets & Technology',
      'amount': '-\$1 299'
    },
    {
      'logo': 'images/nike.png',
      'width': 28.0,
      'name': 'NIKE',
      'type': 'Sportswear',
      'amount': '-\$38'
    },
    {
      'logo': 'images/glovo.png',
      'width': 30.0,
      'name': 'GLOVO',
      'type': 'Delivery',
      'amount': '-\$9'
    },
    {
      'logo': 'images/apple.png',
      'name': 'APPLE',
      'width': 15.0,
      'type': 'Gadgets & Technology',
      'amount': '-\$1 299'
    },
    {
      'logo': 'images/nike.png',
      'width': 28.0,
      'name': 'NIKE',
      'type': 'Sportswear',
      'amount': '-\$38'
    },
    {
      'logo': 'images/glovo.png',
      'width': 30.0,
      'name': 'GLOVO',
      'type': 'Delivery',
      'amount': '-\$9'
    },
    {
      'logo': 'images/apple.png',
      'name': 'APPLE',
      'width': 15.0,
      'type': 'Gadgets & Technology',
      'amount': '-\$1 299'
    },
    {
      'logo': 'images/nike.png',
      'width': 28.0,
      'name': 'NIKE',
      'type': 'Sportswear',
      'amount': '-\$38'
    },
  ];

  double bottomNavY = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(onScroll);
  }

  onScroll() {
    setState(() {});
  }

  double mapRange(double input, double inputStart, double inputEnd,
      double outputStart, double outputEnd) {
    double slope = (outputEnd - outputStart) / (inputEnd - inputStart);
    return outputStart + (slope * (input - inputStart)).round();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var primary = Colors.white;
    var grey = Color(0xff464D59);
    var dark = Color(0xff1F2327);
    double bottomHeight = 220;
    double maxHeight = h / 2;
    double minHeight = bottomHeight + 44;
    var transactions = [
      ...transactionsList,
      ...transactionsList,
      ...transactionsList
    ];
    return Scaffold(
        body: Container(
          color: dark,
          child: CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: maxHeight - 44,
                elevation: 0,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(bottomHeight),
                    child: Container()),
                flexibleSpace: Container(
                  height: maxHeight,
                  width: w,
                  color: dark,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double paddingHorizontal = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 16, 32);
                      double paddingTop = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 48, 110);

                      double creditCardBorder = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 30, 15);

                      return StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          setState(() {
                            bottomNavY = mapRange(constraints.maxHeight,
                                maxHeight, minHeight, 0, 100);
                          });
                          return Stack(
                            children: <Widget>[
                              Positioned(
                                top: 40,
                                left: 0,
                                right: 0,
                                child: WalletRow(grey: grey),
                              ),
                              Container(
                                height: maxHeight,
                                width: w,
                                // color: dark,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      paddingHorizontal,
                                      paddingTop,
                                      paddingHorizontal,
                                      70),
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            creditCardBorder),
                                        color: Colors.green,
                                      ),
                                      child: Container(),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 0,
                                right: 0,
                                child: TransacRow(grey: grey),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index == transactions.length) {
                      return Container(height: 150);
                    }
                    return Container(
                      color: dark,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                        dense: true,
                        trailing: AmountText(
                            text: transactions[index]['amount'],
                            color: primary),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffDCDFE0),
                          radius: 20,
                          // child: Image.asset(
                          //   transactions[index]['logo'],
                          //   color: Colors.red,
                          //   height: 30,
                          //   width: transactions[index]['width'],
                          //   fit: BoxFit.contain,
                          // ),
                          child: Text('$index'),
                        ),
                        title: BigText(
                            text: transactions[index]['name'], color: primary),
                        subtitle: SmallText(
                            text: transactions[index]['type'], color: grey),
                      ),
                    );
                  },
                  childCount: transactions.length + 1,
                ),
                // SliverChildListDelegate(
                //   [
                //     Container(color: Colors.green),
                //     Container(color: Colors.red),
                //     Container(color: Colors.purple),
                //     Container(color: Colors.green),
                //     Container(color: Colors.orange),
                //     Container(color: Colors.yellow),
                //     Container(color: Colors.pink),
                //     Container(color: Colors.yellow),
                //   ],
                // ),
              ),
            ],
          ),
        ),
        floatingActionButton: Transform.translate(
          offset: Offset(0, bottomNavY),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0), bottom: Radius.circular(30.0)),
              color: Color(0xff353A47),
            ),
            width: MediaQuery.of(context).size.width - 32,
            height: 85,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.pie_chart,
                    color: Color(0xff778195),
                  ),
                  Icon(
                    Icons.credit_card,
                    color: Color(0xff778195),
                  ),
                  Icon(
                    Icons.person,
                    color: Color(0xff778195),
                  ),
                ],
              ),
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class SmallText extends StatelessWidget {
  final Color color;
  final String text;

  const SmallText({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600));
  }
}

class BigText extends StatelessWidget {
  final Color color;
  final String text;

  const BigText({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w600));
  }
}

class AmountText extends StatelessWidget {
  final Color color;
  final String text;

  const AmountText({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyle(color: color, fontSize: 19, fontWeight: FontWeight.w500));
  }
}

class TransacRow extends StatelessWidget {
  final Color grey;
  const TransacRow({Key key, this.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Transactions',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 23),
          ),
          Icon(
            Icons.filter_list,
            size: 25,
            color: grey,
          )
        ],
      ),
    );
  }
}

class WalletRow extends StatelessWidget {
  final Color grey;
  const WalletRow({Key key, this.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Wallets',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 23),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xff2F3135),
                border: Border.all(
                  color: grey,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.add,
              size: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

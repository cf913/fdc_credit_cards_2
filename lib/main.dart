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
  int currentPage = 0;

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
    return outputStart + (slope * (input - inputStart));
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
                          constraints.maxHeight, minHeight, maxHeight, 0, 8);
                      if (paddingHorizontal < 0) paddingHorizontal = 0;
                      double paddingTop = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 48, 110);
                      if (paddingTop < 0) paddingTop = 0;

                      double paddingBottom = 80;

                      double creditCardBorder = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 25, 15);

                      double scaleCurrent = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 1.02, 1);

                      double scaleOther = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 0.8, 1);

                      double theOpacity = mapRange(
                          constraints.maxHeight, minHeight, maxHeight, 0, 1);
                      if (theOpacity < 0) theOpacity = 0;

                      return StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          setState(() {
                            bottomNavY = mapRange(constraints.maxHeight,
                                maxHeight, minHeight, 0, 110);
                          });
                          return Stack(
                            children: <Widget>[
                              Positioned(
                                top: 40,
                                left: 0,
                                right: 0,
                                child: Opacity(
                                    opacity: theOpacity,
                                    child: WalletRow(grey: grey)),
                              ),
                              PageView.builder(
                                itemCount: [1, 2, 3].length,
                                onPageChanged: (i) =>
                                    setState(() => currentPage = i),
                                controller:
                                    PageController(viewportFraction: 0.9),
                                itemBuilder: (_, i) {
                                  bool isCurrent = (i == currentPage);
                                  // var thePadding = isCurrent
                                  // ?
                                  var thePadding = EdgeInsets.fromLTRB(
                                      paddingHorizontal,
                                      paddingTop,
                                      paddingHorizontal,
                                      paddingBottom);
                                  // : EdgeInsets.fromLTRB(
                                  // 8, 110, 8, paddingBottom);
                                  return Transform.scale(
                                    scale:
                                        isCurrent ? scaleCurrent : scaleOther,
                                    child: Container(
                                      // height: 400,
                                      width: w + 15,
                                      // color: dark,
                                      child: Padding(
                                        padding: thePadding,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, .3),
                                                    offset: Offset(
                                                        -0.8, -0.8), //(x,y)
                                                    blurRadius: 0,
                                                    spreadRadius: 0.0),
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, .7),
                                                    offset: Offset(
                                                        5.0, 12.0), //(x,y)
                                                    blurRadius: 35.0,
                                                    spreadRadius: -2.0),
                                              ],
                                              color: Color(0xff363944),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      creditCardBorder),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/bg.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                // color: Color(0xff363944),
                                                gradient: LinearGradient(
                                                  begin: Alignment(-0.5, 0),
                                                  end: Alignment(9, 0),
                                                  colors: [
                                                    Color(0xff363944),
                                                    Colors.transparent
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        creditCardBorder),
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  24, 25, 24, 0),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6),
                                                            decoration:
                                                                BoxDecoration(
                                                                    // color:
                                                                    //     Color(0xff2F3135),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          grey,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6)),
                                                            child: Icon(
                                                              Icons.euro_symbol,
                                                              size: 12,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(width: 8),
                                                          RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          'EUR',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          letterSpacing:
                                                                              1.4))
                                                                ]),
                                                          ),
                                                          Spacer(),
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '· ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900),
                                                                ),
                                                                TextSpan(
                                                                  text: '5806',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          1.4),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 25.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                              '1855.00',
                                                              style: TextStyle(
                                                                  fontSize: 27,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Positioned(
                                                    bottom: 27,
                                                    left: 0,
                                                    right: 0,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: <Widget>[
                                                        Opacity(
                                                          opacity: theOpacity,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                'Holder',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xff666D79),
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Text(
                                                                'Shane Cooper',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                          'VISA',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
                          backgroundColor: dark,
                          radius: 20,
                          // child: Image.asset(
                          //   transactions[index]['logo'],
                          //   color: Colors.red,
                          //   height: 30,
                          //   width: transactions[index]['width'],
                          //   fit: BoxFit.contain,
                          // ),
                          child: Icon(Icons.shopping_cart, color: grey),
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
          offset: Offset(0, bottomNavY - 10),
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
            TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400));
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
            TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400));
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
            TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.w400));
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

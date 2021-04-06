import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './dummy_data.dart';

void main() => runApp(ArkFundsLAndingPage());

class ArkFundsLAndingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARK - Funds',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARK - Funds'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${DateFormat.yMMMd().format(DateTime.now()).toString()}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Total Market Value',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(0x7d, 0x7d, 0x7d, 1),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$49.954 B',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '\$1.457 B',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff2c815d),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Text(
              'ACTIVELY MANAGED INNOVATION  ETFs',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  backgroundColor: Colors.grey[350]),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(
                    DUMMY_CATEGORIES[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    DUMMY_CATEGORIES[index].subtitle,
                    style: TextStyle(fontSize: 13),
                  ),
                  trailing: Row(
                    children: [
                      Text(
                        '\$${DUMMY_CATEGORIES[index].amount}',
                        style: TextStyle(fontSize: 17),
                      ),
                      IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {}),
                    ],
                  ),
                );
              },
              itemCount: DUMMY_CATEGORIES.length,
            ),
          )
        ],
      ),
    );
  }
}

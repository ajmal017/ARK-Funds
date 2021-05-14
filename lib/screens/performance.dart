import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:arkfundsapp/providers/performance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';

class ArkkPerformance extends StatefulWidget {
  static const routeName = '/peformance';

  @override
  _ArkkPerformanceState createState() => _ArkkPerformanceState();
}

class _ArkkPerformanceState extends State<ArkkPerformance> {
  Widget buildCont(String title, String value) {
    return Container(
      padding: EdgeInsets.only(
        top: 12,
        bottom: 12,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF-Pro-Text'),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(0, 0, 0, 0.4),
              fontFamily: 'SF-Pro-Text',
            ),
          ),
        ],
      ),
    );
  }

  Widget titleContainer(String text) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
      padding: EdgeInsets.only(
        left: 20,
        right: 8,
        top: 12,
        bottom: 12,
      ),
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: Color.fromRGBO(0, 0, 0, 0.4),
          fontFamily: 'SF-Pro-Text',
        ),
      ),
    );
  }

  Widget buildContainer(Map<String, Object> arkkPerf) {
    return Column(
      children: [
        titleContainer(arkkPerf['period'].toString().toUpperCase()),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              buildCont('NAV', arkkPerf['nav'].toString() + '%'),
              Divider(
                thickness: 0.5,
                height: 4,
                color: Colors.grey,
                // indent: 20,
              ),
              buildCont('Market Price', arkkPerf['marketPrice'].toString() + '%'),
            ],
          ),
        ),
      ],
    );
  }

  void buildAnnualized(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      elevation: 4,
      context: ctx,
      builder: (_) {
        return Container(
          height: MediaQuery.of(ctx).size.height * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(247, 247, 247, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '*Annualized',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SF-Pro-Text',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF-Pro-Text',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  Annualized[0],
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'SF-Pro-Text',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  var _isLoading = false;

  Future<void> fetch() async {
    final productGroups =
        Provider.of<FundProductGroup>(context, listen: false).groups;
    List<Category> groups = [];
    for (int i = 0; i < productGroups.length; i++) {
      groups += productGroups[i];
    }
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<PerformanceProvider>(context, listen: false)
          .fetchPerformace(groups[i].id);
    }
  }

  @override
  void initState() {
    _isLoading = true;
    fetch().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final Category etfListItem = etfDetails['listItem'];
    final fundTitle = etfDetails['title'];
    final performanceDetails =
        Provider.of<PerformanceProvider>(context).performanceList;
    final performanceObj = performanceDetails
        .firstWhere((fund) => fund.id == etfListItem.id, orElse: () => null);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          fundTitle,
          style: TextStyle(
            fontFamily: 'SF-Pro-Text',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          'Fund Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'SF-Pro-Text',
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            etfListItem.title,
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'SF-Pro-Text',
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) => Container(
                      child: buildContainer(performanceObj.performance[index]),
                    ),
                    itemCount: performanceObj.performance.length
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
                    child: TextButton(
                      onPressed: () => buildAnnualized(context),
                      child: Text(
                        '*Annualized',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

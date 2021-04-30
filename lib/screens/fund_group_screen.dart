import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/fund_total_market_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/custom_list_view.dart';
import '../providers/fund_groups.dart';
import '../widgets/intoduction.dart';

class FundGroupsScreen extends StatefulWidget {
  @override
  _FundGroupsScreenState createState() => _FundGroupsScreenState();
}

class _FundGroupsScreenState extends State<FundGroupsScreen> {
  Widget selectContainer(String title, String subtitle) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          padding: EdgeInsets.only(
            left: 12,
            right: 8,
            top: 8,
            bottom: 4,
          ),
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'SF-Pro-Rounded',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'SF-Pro-Text',
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget buildContainer(
      String text1, String text2, List<Category> dummyList, int index) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: index != 0
                ? BorderRadius.circular(12)
                : BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
          ),
          child: Column(
            children: [
              if (index != 0)
                selectContainer(
                  text1,
                  text2,
                ),
              CustomListView(dummyList),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  List<Widget> _getBuildContainer() {
    final funds = Provider.of<FundGroups>(context).funds;
    final groups = Provider.of<FundProductGroup>(context).groups;
    List<Widget> buildContainers = [];
    int i = 0;
    for (i = 0; i < funds.length; i++) {
      buildContainers.add(
        buildContainer(
          funds[i].name,
          funds[i].description,
          groups[i],
          i,
        ),
      );
    }
    return buildContainers;
  }

  var _isLoading = false;
  Future<void> fetch() async {
    await Provider.of<FundTotalMarketValue>(context, listen: false)
        .fetchIntro();
    await Provider.of<FundGroups>(context, listen: false).fetchFunds();

    final funds = Provider.of<FundGroups>(context, listen: false).funds;
    for (int i = 0; i < funds.length; i++) {
      await Provider.of<FundProductGroup>(context, listen: false)
          .fetchProducts(funds[i].id);
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
    final funds = Provider.of<FundGroups>(context).funds;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ARK - Funds',
          style: TextStyle(
            fontFamily: 'SF-Pro-Text',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: null),
        ],
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: Color(0xFFF2F2F7)),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Introduction(310),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.075,
                          bottom: -7.5,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              children: [
                                selectContainer(
                                  funds[0].name,
                                  funds[0].description,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: _getBuildContainer(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

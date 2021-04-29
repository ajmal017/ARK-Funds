import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/fund_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../dummy_data.dart';

class FundDetailsScreen extends StatefulWidget {
  static const routeName = '/fund-detail-screen';

  @override
  _FundDetailsScreenState createState() => _FundDetailsScreenState();
}

class _FundDetailsScreenState extends State<FundDetailsScreen> {
  var _isLoading = false;
  Future<void> fetch() async {
    final groups = Provider.of<FundProductGroup>(context).groups;
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<FundProductGroup>(context, listen: false)
          .fetchProducts(groups[i].id);
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
    final fundDetails = Provider.of<FundDetailsProvider>(context).fundDetails;
    final selectedFundDetail =
        fundDetails.firstWhere((fund) => fund.id == etfListItem.id);
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
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          margin: EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
          ),
          padding: EdgeInsets.only(
            top: 12,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    selectedFundDetail.fundDetails[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'SF-Pro-Text',
                    ),
                  ),
                  Spacer(),
                  Text(
                    selectedFundDetail.fundDetails[index]['detail'],
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      fontFamily: 'SF-Pro-Text',
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        itemCount: selectedFundDetail.fundDetails.length,
      ),
    );
  }
}

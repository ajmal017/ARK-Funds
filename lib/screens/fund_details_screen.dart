import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/fund_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class FundDetailsScreen extends StatefulWidget {
  static const routeName = '/fund-detail-screen';

  @override
  _FundDetailsScreenState createState() => _FundDetailsScreenState();
}

class _FundDetailsScreenState extends State<FundDetailsScreen> {
  var _isLoading = false;
  Future<void> fetch() async {
    final productGroups =
        Provider.of<FundProductGroup>(context, listen: false).groups;
    List<Category> groups = [];
    for (int i = 0; i < productGroups.length; i++) {
      groups += productGroups[i];
    }
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<FundDetailsProvider>(context, listen: false)
          .fetchFundDetails(groups[i].id);
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
    final selectedFundDetail = fundDetails
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
          : ListView.builder(
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
                        selectedFundDetail.fundDetails[index]['title'] ==
                                    'Fund Name' ||
                                selectedFundDetail.fundDetails[index]
                                        ['title'] ==
                                    'Primary Exchange'
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  selectedFundDetail.fundDetails[index]
                                      ['detail'],
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(0, 0, 0, 0.4),
                                    fontFamily: 'SF-Pro-Text',
                                  ),
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                ),
                              )
                            : Text(
                                selectedFundDetail.fundDetails[index]['detail'],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                  fontFamily: 'SF-Pro-Text',
                                ),
                                textAlign: TextAlign.right,
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

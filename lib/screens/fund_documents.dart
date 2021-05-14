import 'package:arkfundsapp/providers/fundDocuments_provider.dart';
import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FundDocuments extends StatefulWidget {
  static const routeName = '/fund-documents';

  @override
  _FundDocumentsState createState() => _FundDocumentsState();
}

class _FundDocumentsState extends State<FundDocuments> {
  var _isLoading = false;
  Future<void> fetch() async {
    final productGroups =
        Provider.of<FundProductGroup>(context, listen: false).groups;
    List<Category> groups = [];
    for (int i = 0; i < productGroups.length; i++) {
      groups += productGroups[i];
    }
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<FundDocumentsProvider>(context, listen: false)
          .fetchFundDocs(groups[i].id);
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

  void _launchUrl(String url) async {
    // print(url);
    // const urlToLaunch = url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<FundDocObject> _fundDocs;
  FundDocObject _selectedFundDoc;
  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final Category etfListItem = etfDetails['listItem'];
    final fundTitle = etfDetails['title'];
     _fundDocs = Provider.of<FundDocumentsProvider>(context).fundDocument;
     _selectedFundDoc = _fundDocs
        .firstWhere((doc) => doc.id == etfListItem.id, orElse: () => null);

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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                    InkWell(
                      onTap: () =>
                          _launchUrl(_selectedFundDoc.documents[index]['url']),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            _selectedFundDoc.documents[index]['name'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'SF-Pro-Text',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      //height: 4,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              itemCount: _selectedFundDoc.documents.length,
            ),
    );
  }
}

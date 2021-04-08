import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Introduction extends StatelessWidget {
  final double flexInput;
  Introduction(this.flexInput);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: flexInput,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
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
    );
  }
}

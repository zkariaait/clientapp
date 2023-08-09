import 'package:flutter/material.dart';

import 'card_section.dart';
import 'items_actions.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: const [
          CardSection(),
          ActionItems(),
          //    RecentTransactionSection()
        ],
      ),
    );
  }
}

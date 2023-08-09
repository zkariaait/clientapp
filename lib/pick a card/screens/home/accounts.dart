import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../card/views/CardPage.dart';
import 'components/body.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      body: Body(),
      appBar: buildAppBar(),
      bottomNavigationBar: _buildBottomBar(context), // Pass the context
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Navigate to the CardPage screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CardPage()), // Replace CardPage with the actual screen
              );
            },
            backgroundColor: Color.fromARGB(255, 53, 138, 234),
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xffF4F5FA),
      elevation: 0,
      centerTitle: false,
      title: Text(
        "My accounts",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: SvgPicture.asset("assets/icons/notifs.svg"),
        )
      ],
    );
  }
}

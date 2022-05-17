import 'package:flutter/material.dart';
import 'package:whats_fake_responsivo/components/side_menu.dart';
import 'package:whats_fake_responsivo/models/email.dart';
import 'package:whats_fake_responsivo/screens/email/email_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'email_card.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({Key? key}) : super(key: key);

  @override
  State<ListOfEmails> createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              // This is our Seearch bar
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: 10),
                child: Row(
                  children: [
                    // Once user click the menu icon the menu shows like drawer
                    // Also we want to hide this menu icon on desktop
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        onPressed: () =>
                            _scaffoldKey.currentState!.openDrawer(),
                        icon: Icon(Icons.menu),
                      ),
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.all(kDefaultPadding * 0.75),
                            child: Icon(Icons.search),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down, size: 30),
                    SizedBox(width: 5),
                    Text(
                      "Sort by data",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: Icon(Icons.sort),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  itemBuilder: (context, index) => EmailCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    email: emails[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailScreen(
                            email: emails[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

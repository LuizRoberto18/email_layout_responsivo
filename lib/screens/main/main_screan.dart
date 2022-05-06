import 'package:flutter/material.dart';
import 'package:whats_fake_responsivo/responsive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// make sure you enable flutter web
// this is what we want
// this design looks fine if our width is more than 1100
// let´s creat our responsive file
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // it provide us the width and heignt
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      // once our width is less then 1300 then it start showing errors
      // Now there is no error if our width is less then 1340
      body: Responsive(
        mobile: Container(),
        //Now we are on tablet
        // right now we dont have any acess of our side menu
        //lets add a menu icon there
        tablet: Container(
          child: Row(children: [
            Expanded(
              flex: 6,
              child: ListOfEmails(),
            ),
            Expanded(
              flex: 9,
              child: EmailScreen(),
            ),
          ]),
        ),
        //Our existing design work fine if then width is more than 1100
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListOfEmails(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: EmailScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

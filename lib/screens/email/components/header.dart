import 'package:flutter/material.dart';

import 'package:whats_fake_responsivo/constants.dart';

import '../../../responsive.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          // We need this back button on mobile only
          if (Responsive.isMobile(context)) BackButton(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline_sharp,
                size: 24, color: Color.fromARGB(255, 6, 67, 117)),
          ),
          IconButton(
            icon: Icon(Icons.reply_sharp,
                size: 24, color: Color.fromARGB(255, 6, 67, 117)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.reply_all_sharp,
                size: 24, color: Color.fromARGB(255, 6, 67, 117)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_sharp,
                size: 24, color: Color.fromARGB(255, 6, 67, 117)),
            onPressed: () {},
          ),

          Spacer(),
          // We don't need print option on mobile
          if (Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.print_rounded,
                  size: 24, color: Color.fromARGB(255, 6, 67, 117)),
              onPressed: () {},
            ),
          IconButton(
            icon: Icon(Icons.bookmark_border_sharp,
                size: 24, color: Color.fromARGB(255, 6, 67, 117)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert_sharp,
                size: 24, color: Color.fromARGB(255, 6, 67, 117)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

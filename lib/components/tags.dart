import 'package:flutter/material.dart';

import '../constants.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.keyboard_arrow_down),
            SizedBox(width: kDefaultPadding / 4),
            Icon(Icons.bookmark_border_sharp, color: Colors.black54),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              "Tags",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: kGrayColor),
            ),
            Spacer(),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: kGrayColor,
                size: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: kDefaultPadding / 2),
        _buildTag(context, title: 'Design', color: Color(0xFF23CF91)),
        _buildTag(context, title: "Work", color: Color(0xFF3A6FF7)),
        _buildTag(context, color: Color(0xFFF3CF50), title: "Friends"),
        _buildTag(context, color: Color(0xFF8338E1), title: "Family"),
      ],
    );
  }

  InkWell _buildTag(context,
      {@required String? title, @required Color? color}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(kDefaultPadding * 1.5, 10, 0, 10),
        child: Row(
          children: [
            Icon(
              Icons.bookmark,
              color: color!,
            ),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: kGrayColor),
            ),
          ],
        ),
      ),
    );
  }
}

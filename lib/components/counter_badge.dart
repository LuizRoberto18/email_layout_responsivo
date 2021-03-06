import 'package:flutter/material.dart';

import '../constants.dart';
import '../extensions.dart';

class CounterBadge extends StatelessWidget {
  final int count;

  const CounterBadge({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: kBadgeColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.caption?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
      ),
    ).addNeumorphism(
      offset: Offset(4, 4),
      borderRadius: 9,
      blurRadius: 4,
      topShadowColor: Colors.white,
      bottomShadowColor: Color(0xFF30384D).withOpacity(0.3),
    );
  }
}

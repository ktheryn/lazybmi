import 'package:flutter/material.dart';
import 'constants.dart';

class Reusable_dumbells extends StatelessWidget {
  Reusable_dumbells({
    required this.heightdumbells,
  });

  double heightdumbells;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightdumbells,
      width: 13,
      decoration: BoxDecoration(
        color: kPrimaryBmiSlider,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

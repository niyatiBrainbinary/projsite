import 'package:flutter/material.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/helper/helper.dart';

class StatisticScreen extends StatefulWidget {
  static const id = 'Statistic_screen';
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: getAppBarWithIcon(ctx: context) as PreferredSizeWidget?,
      body: getCommonContainer(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            getCommonContainer(
              height: screenHeight(context,dividedBy: 16),
              width: screenWidth(context),
              color: Colors.transparent,
              child: getContainerWithTralingIcon(ctx: context, text: 'Statistic'),
            ),
            verticalSpaces(context, height: 100),

          ],
        ),
      ),
    );
  }
}

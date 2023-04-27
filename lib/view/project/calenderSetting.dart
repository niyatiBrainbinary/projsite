import 'package:flutter/material.dart';
import 'package:proj_site/common/colors/colors.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/helper/helper.dart';
import 'package:proj_site/services/custom_function.dart';

class CalenderSetting extends StatefulWidget {

  const CalenderSetting({Key? key}) : super(key: key);

  @override
  State<CalenderSetting> createState() => _CalenderSettingState();
}

class _CalenderSettingState extends State<CalenderSetting> {
  bool isZone = false;
  bool isAutomatic = false;
  bool isWaste = false;
  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return HexColor.orange.withOpacity(0.5);
      }
      return null;
    },
  );
  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.amber.withOpacity(0.54);
      }
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return getCommonContainer(
      child: Column(
        children: [
          commonText(
            "Here you can control various functionalities in the project calendar view.",
            color: HexColor.Gray53,
            fontFamily: LexendLight,
            fontWeight: FontWeight.w300,
            fontSize: 12,
              textAlign: TextAlign.center
          ),
          verticalSpaces(context, height: 20),
          getSwitchWithTittleAndSubTittle(
              ctx: context,
              tittle: "Zone at the same time",
              value: isZone,
              trackColor: trackColor,
              overlayColor: overlayColor,
              onChanged: (value) {
                setState(() {
                  isZone = value!;
                });
              },
              subTittle:
                  'If this is on, users do NOT have the opportunity to create a booking in the same zone during the same time interval'),
          getSwitchWithTittleAndSubTittle(
              ctx: context,
              tittle: "Automatic approval",
              value: isAutomatic,
              trackColor: trackColor,
              overlayColor: overlayColor,
              onChanged: (value) {
                setState(() {
                  isAutomatic = value!;
                });
              },
              subTittle:
                  'If this is on, no approval is required for a booking to go through'),
          getSwitchWithText(
              ctx: context,
              tittle: "Waste Disposal",
              value: isWaste,
              trackColor: trackColor,
              overlayColor: overlayColor,
              onChanged: (value) {
                setState(() {
                  isWaste = value!;
                });
              }),
          verticalSpaces(context, height: 20),
          commonButton(context: context, buttonName: "Save"),
        ],
      ),
    );
  }
}

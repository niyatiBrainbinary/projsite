import 'package:flutter/material.dart';
import 'package:proj_site/common/colors/colors.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/helper/helper.dart';
import 'package:proj_site/services/custom_function.dart';

class ProjectNotification extends StatefulWidget {
  const ProjectNotification({Key? key}) : super(key: key);

  @override
  State<ProjectNotification> createState() => _ProjectNotificationState();
}

class _ProjectNotificationState extends State<ProjectNotification> {
  bool light = true;
  bool light1 = true;
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
              """Here you can turn off and on the notification functions for the 
project. Notification are sent when creating a booking to all 
users who have the rights to approve/reject the booking 
(ie admin, project managers) and to the user selected as 
'responsible' for the booking. Notification are also sent 
upon approval/rejection/update/deletion of a booking to 
the creator of the booking and the chosen 'responsible' 
user of the booking.""",
              color: HexColor.Gray53,
              fontFamily: LexendLight,
              fontWeight: FontWeight.w300,
              fontSize: 12,
              textAlign: TextAlign.center),
          verticalSpaces(context, height: 20),
          getSwitchWithText(
              ctx: context,
              tittle: "Mail",
              value: light1,
              trackColor: trackColor,
              overlayColor: overlayColor,
              onChanged: (value) {
                setState(() {
                  light1 = value!;
                });
              }),
          getSwitchWithText(
              ctx: context,
              tittle: "SMS",
              value: light1,
              trackColor: trackColor,
              overlayColor: overlayColor,
              onChanged: (value) {
                setState(() {
                  light1 = value!;
                });
              })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proj_site/common/colors/colors.dart';
import 'package:proj_site/common/image_constant/image_constant.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/helper/helper.dart';

class AssignUsers extends StatefulWidget {
  static const id = 'AssignUsers_screen';
  @override
  _AssignUsersState createState() => _AssignUsersState();
}

class _AssignUsersState extends State<AssignUsers> {
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithIcon(ctx: context) as PreferredSizeWidget?,
      body: getCommonContainer(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSimpleTwoRowText(
                ctx: context,
                tittle1: "Sub Project List",
                tittle2: "Project Name"),
            verticalSpaces(context, height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                            color: HexColor.Gray53.withOpacity(0.6),
                            width: 1.5)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text('Select'),
                        icon: Image.asset(icons.ic_downArrow, height: 7),
                        items: _dropdownValues
                            .map((value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (value) {},
                        isExpanded: true,
                        value: _dropdownValues.first,
                      ),
                    ),
                  ),
                ),
                horizontal(context, width: 70),
                commonButton(context: context, buttonName: "Assign"),
              ],
            ),
            verticalSpaces(context, height: 13),
            commonText("Assigned Users",
                color: HexColor.Gray53,
                fontFamily: LexendBold,
                fontWeight: FontWeight.w800,
                fontSize: 14),
            verticalSpaces(context, height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonText("Fredrik Balkåsen",
                              color: Colors.black,
                              fontFamily: LexendRegular,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          getIconWithUnderlineText(
                              text: "Remove",
                              ctx: context,
                              icon: icons.ic_assignUser,
                              iconColor: HexColor.carnation,
                              textColor: HexColor.carnation,
                              underlineColor: HexColor.carnation)
                        ],
                      ),
                      getDivider(height: 20)
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

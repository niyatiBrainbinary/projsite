import 'package:flutter/material.dart';
import 'package:ftx/navigationX.dart';
import 'package:proj_site/common/colors/colors.dart';
import 'package:proj_site/common/image_constant/image_constant.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/helper/helper.dart';
import 'package:proj_site/view/subProjectList/asignUsers.dart';

class AddNew extends StatefulWidget {
  static const id = 'AddNew_screen';
  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  _buildProject(){
    return Column(children: [
      Container(
        height: screenHeight(context, dividedBy: 25),
        width: screenWidth(context),
        color: Colors.transparent,
        child: Row(
          children: [
            commonText("Sub Project 1",
                color: Colors.black,
                fontFamily: LexendRegular,
                fontWeight: FontWeight.w400,
                fontSize: 16),
            Spacer(),
            getIconWithUnderlineText(
                width: screenWidth(context, dividedBy: 5),
                text: "View",
                ctx: context,
                icon: icons.ic_eyes,
                iconColor: HexColor.aliceblue,
                textColor: HexColor.aliceblue,
                underlineColor: HexColor.aliceblue,
              onTap: () {

              },
            ),
            getIconWithUnderlineText(
                width: screenWidth(context, dividedBy: 3),
                text: "Assign Users",
                ctx: context,
                icon: icons.ic_assignUser,
                iconColor: HexColor.grren,
                textColor: HexColor.grren,
                underlineColor: HexColor.grren,
              onTap: () {
                Navigation.instance.navigate(AssignUsers.id);
              },
            )
          ],
        ),
      ),
      getDivider(height: 15)
    ],);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithIcon(ctx: context) as PreferredSizeWidget?,
      body: getCommonContainer(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            getSimpleTwoRowTextAndButton(
                ctx: context,
                tittle1: "Sub Project List",
                tittle2: "Project Name",
                buttonName: 'Add New'),
            verticalSpaces(context, height: 20),
            ListView.builder(padding: EdgeInsets.zero,physics: BouncingScrollPhysics(),shrinkWrap: true,itemCount: 10,itemBuilder: (context, index) {
              return _buildProject();
            },)
          ],
        ),
      ),
    );
  }
}

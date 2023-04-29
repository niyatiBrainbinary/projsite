import 'package:flutter/material.dart';
import 'package:proj_site/common/colors/colors.dart';
import 'package:proj_site/common/image_constant/image_constant.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/helper/helper.dart';

class SubmitProjectList extends StatefulWidget {
  static const id = 'SubmitProjectList_screen';
  String? projectName;

  SubmitProjectList({Key? key, this.projectName}) : super(key: key);

  @override
  _SubmitProjectListState createState() => _SubmitProjectListState();
}

class _SubmitProjectListState extends State<SubmitProjectList> {
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  TextEditingController _subName = TextEditingController();

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
                tittle2: widget.projectName ?? ""),
            verticalSpaces(context, height: 20),
           /* getSimpleTextWithAsteriskSymbol(text: "Project"),
            verticalSpaces(context, height: 100),
            Container(
              height: 52,
              width: screenWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
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
            ),*/
            verticalSpaces(context, height: 40),
            getSimpleTextWithAsteriskSymbol(text: "Sub Project Name"),
            verticalSpaces(context, height: 100),
            getRoundedTexfield(hintText: "Enter Sub Project Name", controller: _subName, ctx: context),
            verticalSpaces(context, height: 10),
            Align(alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonButton(context: context, buttonName: "Submit"),
                    horizontal(context, width: 20),
                    commonButton(
                        context: context,
                        buttonName: "Cancel",
                        width: 95,
                        buttonColor: HexColor.Gray53.withOpacity(0.5),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}

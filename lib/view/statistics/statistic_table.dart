import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proj_site/common/colors/colors.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/helper/helper.dart';
import 'package:proj_site/common/image_constant/image_constant.dart';

class StatisticTableScreen extends StatefulWidget {

  const StatisticTableScreen({Key? key}) : super(key: key);

  @override
  State<StatisticTableScreen> createState() => _StatisticTableScreenState();
}

class _StatisticTableScreenState extends State<StatisticTableScreen> {

  List _dropdownValuesContainer = ["One", "Two", "Three", "Four"];
  List _dropdownValuesFraction = ["One", "Two", "Three", "Four"];

  var dropDownValContainer;
  var dropDownValFraction;

  TextEditingController numberOfWasteController = TextEditingController();
  TextEditingController amountOfFractionController = TextEditingController();
  TextEditingController numberOfTransportsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: getAppBarWithIcon(ctx: context) as PreferredSizeWidget?,
      body: getCommonContainer(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCommonContainer(
              height: screenHeight(context,dividedBy: 16),
              width: screenWidth(context),
              color: Colors.transparent,
              child: getContainerWithTralingIcon(ctx: context, text: 'Statistic'),
            ),
            verticalSpaces(context, height: 40),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(

            columns: [
              // Set the name of the column
              DataColumn(label: Text('Id'),),
              DataColumn(label: Text('Name'),),
              DataColumn(label: Text('LastName'),),
              DataColumn(label: Text('Age'),),
            ],
            rows:[
              // Set the values to the columns
              DataRow(cells: [
                DataCell(Text("1")),
                DataCell(Text("Alex")),
                DataCell(Text("Anderson")),
                DataCell(Text("18")),
              ]),
              DataRow(cells: [
                DataCell(Text("2")),
                DataCell(Text("John")),
                DataCell(Text("Anderson")),
                DataCell(Text("24")),
              ]),
            ]
        ),
      ),


            Align(
              alignment: Alignment.center,
              child:  commonButton(context: context, buttonName: "Save", onTap: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

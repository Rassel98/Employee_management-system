import 'dart:io';

import 'package:employ_management_app_06/employ_model.dart';
import 'package:employ_management_app_06/pages/employ_details_page.dart';
import 'package:employ_management_app_06/pages/new_employ_page.dart';
import 'package:flutter/material.dart';

class EmployeeListPage extends StatefulWidget {
  static const routeName='/';
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Employee Page'),
      ),
      body: ListView.builder(
        itemCount: employeeList.length,
          itemBuilder: (context,index){
          final emp=employeeList[index];
          return ListTile(
            onTap:()=>Navigator.pushNamed(context, EmployeeDetailsPage.routeName,arguments: emp) ,
            leading: CircleAvatar(

              backgroundImage: FileImage(File(emp.image)),

            ),
            title: Text(emp.name),
            subtitle: Text(emp.designation),
          );

          }),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pushNamed(context, NewEmployeePage.routeName).then((value) => setState((){

        })),
        child: const Icon(Icons.add),
      ),
    );
  }
}

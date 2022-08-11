import 'package:employ_management_app_06/pages/employ_details_page.dart';
import 'package:employ_management_app_06/pages/employ_list_page.dart';
import 'package:employ_management_app_06/pages/new_employ_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: EmployeeListPage.routeName,
      routes: {
        EmployeeListPage.routeName:(context)=>const EmployeeListPage(),
        EmployeeDetailsPage.routeName:(context)=>const EmployeeDetailsPage(),
        NewEmployeePage.routeName:(context)=>const NewEmployeePage()

      },
    );
  }
}


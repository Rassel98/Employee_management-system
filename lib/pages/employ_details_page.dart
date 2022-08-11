import 'dart:io';

import 'package:employ_management_app_06/employ_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';

class EmployeeDetailsPage extends StatefulWidget {
  static const routeName = '/details';

  const EmployeeDetailsPage({Key? key}) : super(key: key);

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  late EmployeeModel employeeModel;

  @override
  void didChangeDependencies() {
    employeeModel = ModalRoute.of(context)!.settings.arguments as EmployeeModel;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Detail Page'),
      ),
      body: ListView(
        children: [
          Image.file(
            File(employeeModel.image),
            width: double.maxFinite,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Text(employeeModel.mobile),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: _phoneCall, icon: const Icon(Icons.call)),
                IconButton(
                    onPressed: _massageEmployee, icon: const Icon(Icons.sms)),
              ],
            ),
          ),
          ListTile(
            leading: Text(employeeModel.email),
            trailing: IconButton(
                onPressed: _emailEmployee, icon: const Icon(Icons.email)),
          ),
          ListTile(
            leading: Text(employeeModel.streetAddress),
            trailing: IconButton(
                onPressed: () {

                _locationEmployee(
                      latitude: 37.759392, longitude: -122.5107336);
                },
                icon: const Icon(Icons.streetview)),
          ),
          ListTile(
            leading: Text(employeeModel.designation),
            trailing: Text('BDT ${employeeModel.salary}'),
          ),
        ],
      ),
    );
  }

  void _phoneCall() async {
    final url = Uri.parse('tel:${employeeModel.mobile}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Cannot Launch';
    }
  }

  void _massageEmployee() async {
    final url = Uri.parse('sms:${employeeModel.mobile}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Cannot Launch';
    }
  }

  void _emailEmployee() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: employeeModel.email,
      // query: encodeQueryParameters(<String, String>{
      //   'subject': 'Example Subject & Symbols are allowed!'
      // }),
    );

    launchUrl(emailLaunchUri);

  }

  void _locationEmployee(
      {required double latitude, required double longitude}) async {
    final googleMapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl);
    } else {
      throw 'Could not open maps';
    }

  }
}

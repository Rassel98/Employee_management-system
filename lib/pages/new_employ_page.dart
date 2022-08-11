import 'dart:io';

import 'package:employ_management_app_06/employ_model.dart';
import 'package:employ_management_app_06/helper_massage.dart';
//import 'package:employ_management_app_06/pages/employ_details_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewEmployeePage extends StatefulWidget {
  static const routeName = '/new';

  const NewEmployeePage({Key? key}) : super(key: key);

  @override
  State<NewEmployeePage> createState() => _NewEmployeePageState();
}

class _NewEmployeePageState extends State<NewEmployeePage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final designationController = TextEditingController();
  final emailController = TextEditingController();
  final salaryController = TextEditingController();
  final stAddressController = TextEditingController();

  //final imageController = TextEditingController();
  String? dob;
  String? imagePath;
  String gender = 'male';
  String? designation;
  ImageSource source = ImageSource.camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Employee Page'), actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          IconButton(onPressed: _saveEmploy, icon: const Icon(Icons.done)),
        )
      ]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Employee name',
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Enter your Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: mobileController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Enter your Mobile number',
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: stAddressController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.location_on_rounded),
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Enter your address',
            ),
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: salaryController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.money),
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Enter your salary',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Select your Gender'),
              Row(
                children: [
                  Radio(
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      }),
                  const Text('Male'),
                  Radio(
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      }),
                  const Text('Female'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButton( //or akhane <String> likhlei hoto
              hint: const Text('Select your Designation'),
              value: designation,
              isExpanded: true,
              items: designationList
                  .map((e) =>
                  DropdownMenuItem(value: e, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e),
                  )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  designation = value as String;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: selectDate,
                  child: const Text('Select Date of Birth')),
              Chip(label: Text(dob == null ? 'No Date Chosen' : dob!))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 10,
                child: imagePath == null
                    ? Image.asset(
                  'images/person.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
                    : Image.file(
                  File(imagePath!),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        source = ImageSource.camera;
                        getImage();
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text('Camera')),
                  TextButton.icon(
                      onPressed: () {
                        source = ImageSource.gallery;
                        getImage();
                      },
                      icon: const Icon(Icons.photo),
                      label: const Text('Photo')),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    salaryController.dispose();
    stAddressController.dispose();
    designationController.dispose();

    super.dispose();
  }

  selectDate() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        dob = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  void getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: source);
    if (selectedImage != null) {
      setState(() {
        imagePath = selectedImage.path;
        print(imagePath);
      });
    }
  }

  void _saveEmploy() {
    if (nameController.text.isEmpty) {
      showMessage(context, 'Please fill up your name');
      return;
    }
    if (emailController.text.isEmpty) {
      showMessage(context, 'Please fill up your Email');
      return;
    }
    if (stAddressController.text.isEmpty) {
      showMessage(context, 'Give your Address');
      return;
    }
    if (mobileController.text.isEmpty  ) {
      showMessage(context, 'Please give me your number');
      return;
    }

    if (designation == null) {
      showMessage(context, '''Select designation''');
      return;
    }
    if (dob == null) {
      showMessage(context, 'Select your date of birth!!');
      return;
    }
    final employee = EmployeeModel(
        name: nameController.text,
        dateOfBirth: dob!,
        designation: designation!,
        mobile: mobileController.text,
        email: emailController.text,
        streetAddress: stAddressController.text,
        salary: num.parse(salaryController.text),
        image: imagePath!,
        gender: gender);
    employeeList.add(employee);
    Navigator.pop(context,true);

  }
}

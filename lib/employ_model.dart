class EmployeeModel {
  int? empId;
  String name;
  String dateOfBirth;
  String designation;
  String mobile;
  String email;
  String streetAddress;
  num salary;
  String image;
  String gender;


  EmployeeModel(
      {this.empId,
      required this.name,
      required this.dateOfBirth,
      required this.designation,
      required this.mobile,
      required this.email,
      required this.streetAddress,
      required this.salary,
      required this.image,
      required this.gender});
}

List employeeList = <EmployeeModel>[
  EmployeeModel(
      name: 'Mr. Rassel Pathan',
      dateOfBirth: '01/04/2002',
      designation: 'Executive',
      mobile: '01796282030',
      email: 'email@gmail.com',
      streetAddress: '781/A west Shewrapara,Mirpur',
      salary: 50000,
      image: '/data/user/0/com.example.employ_management_app_06/cache/c0e44735-22d0-46df-a6d9-2ae61331c6b25387570178559473591.jpg',
      gender: 'Male')
];

final designationList = <String>[
  'CEO',
  'Senior Developer',
  'Assistant Manager',
  'Junior Developer'
];

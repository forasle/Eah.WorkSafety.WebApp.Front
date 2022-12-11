class EmployeeResponse {
  final double id;
  final double identificationNumber; //tc kimlik numarası
  final String registrationNumber; //sicil numarası
  final String name;
  final String surname;
  final String position;
  final String department;
  final String startDateOfEmployment;
  final String address;
  final String chronicDiseases;
  bool selected = false;

  EmployeeResponse({
    required this.id,
    required this.identificationNumber,
    required this.registrationNumber,
    required this.name,
    required this.surname,
    required this.position,
    required this.department,
    required this.startDateOfEmployment,
    required this.address,
    required this.chronicDiseases,
  });
}

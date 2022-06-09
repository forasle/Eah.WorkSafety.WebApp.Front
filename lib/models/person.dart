class Person {
  final double number;
  final double identificationNumber;
  final String registrationNumber;
  final String name;
  final String surname;
  final String position;
  final String department;
  final String startDateOfEmployment;
  final String address;
  final String chronicDiseases;
  final String periodicMedicalExaminationType;
  final String necessaryPeriodicMedicalExaminationDate;
  bool selected = false;

  Person({
    required this.number,
    required this.identificationNumber,
    required this.registrationNumber,
    required this.name,
    required this.surname,
    required this.position,
    required this.department,
    required this.startDateOfEmployment,
    required this.address,
    required this.chronicDiseases,
    required this.periodicMedicalExaminationType,
    required this.necessaryPeriodicMedicalExaminationDate,
  });
}

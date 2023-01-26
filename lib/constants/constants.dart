import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

var employeeInstance = Employee(
    age: 22,
    gender: 1,
    birthPlace: "123",
    educationStatus: "status",
    nationality: "nationality",
    riskGroup: "Astım",
    title: "Mühendis",
    id: 123,
    identificationNumber: '159',
    registrationNumber: 'Test',
    name: 'Murat',
    surname: 'Dogan',
    position: 'Arge',
    department: 1,
    startDateOfEmployment: DateTime.now(),
    address: 'Test', affectedAccident: [], affectedNearMisses: [], affectedChronicDisease: [], affectedOccupationDisease: [],
);


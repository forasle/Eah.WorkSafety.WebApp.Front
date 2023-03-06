import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Constant {
  static const dividerWithIndent = Divider(
    endIndent: 50,
    indent: 50,
  );

  static const double heightOfAccidentAndNearMissCheckBox = 550;

  static const verticalDivider = VerticalDivider(
    endIndent: 5,
    indent: 5,
  );

  static const padding = EdgeInsets.all(8.0);

  static const sizedBox = SizedBox(
    width: 10,
  );
  static const sizedBox2 = SizedBox(
    width: 2,
  );
  static const sizedBox50 = SizedBox(
    height: 50,
  );

  static const List<DropdownMenuItem<String>> menuItemsForEventType = [
    DropdownMenuItem(child: Text("İş Kazası"), value: "1"),
    DropdownMenuItem(child: Text("Ramak Kala"), value: "2"),
  ];

  static const List<DropdownMenuItem<String>> menuItemsForDepartmentType = [
    DropdownMenuItem(child: Text("Acil"), value: "Acil"),
    DropdownMenuItem(child: Text("Kvc Yoğun Bakım"), value: "Kvc Yoğun Bakım"),
  ];
  static final textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
  );

  static const TextStyle buttonTextStyle = TextStyle(color: Colors.black, fontSize: 25);

  static const TextStyle alertDialogTextStyle = TextStyle(color: Colors.black, fontSize: 15);

  static final List<String> theSubjectOfTheAccident = [
    'Fiziksel şiddete maruz kalma',
    'Sözlü şiddete maruz kalma',
    'Kesici delici alet yaralanmaları',
    'Biyolojik etkene maruz kalma',
    'Düşme,çarpma yaralanmaları',
    'Trafik Kazası(Maddi Hasarlı)',
    'Trafik Kazası(Yaralanmalı)',
    'Kimyasal madde ile temasa maruz kalma',
    'Yangın ve yanığa maruz kalma',
    'Ofis kazaları',
    'Elektrik kazaları',
  ];
  static const List<FormBuilderFieldOption<String>> theSubjectOfTheAccident2 = [
    FormBuilderFieldOption(value: 'Fiziksel şiddete maruz kalma'),
    FormBuilderFieldOption(value: 'Sözlü şiddete maruz kalma'),
    FormBuilderFieldOption(value: 'Kesici delici alet yaralanmaları'),
    FormBuilderFieldOption(value: 'Biyolojik etkene maruz kalma'),
    FormBuilderFieldOption(value: 'Düşme,çarpma yaralanmaları'),
    FormBuilderFieldOption(value: 'Trafik Kazası(Maddi Hasarlı)'),
    FormBuilderFieldOption(value: 'Trafik Kazası(Yaralanmalı)'),
    FormBuilderFieldOption(value: 'Kimyasal madde ile temasa maruz kalma'),
    FormBuilderFieldOption(value: 'Yangın ve yanığa maruz kalma'),
    FormBuilderFieldOption(value: 'Ofis kazaları'),
    FormBuilderFieldOption(value: 'Elektrik kazaları'),
  ];

  static const List<FormBuilderFieldOption<String>> precautionsToBeTaken2 = [
    FormBuilderFieldOption(value: 'Yetkisi olmadan çalışmak'),
    FormBuilderFieldOption(value: 'Hatalı uyarı vermek/almak'),
    FormBuilderFieldOption(value: 'Emniyette hata'),
    FormBuilderFieldOption(value: 'Uygun olmayan hız'),
    FormBuilderFieldOption(value: 'Ekipman koruyucusu kullanmamak'),
    FormBuilderFieldOption(value: 'Kişisel koruyucu donanım kullanmamak'),
    FormBuilderFieldOption(value: 'Ekipman kullanım hatası'),
    FormBuilderFieldOption(value: 'Arızalı ekipman kullanmak'),
    FormBuilderFieldOption(value: 'Bilgisi olmadığı alanda çalışmak'),
    FormBuilderFieldOption(value: 'Talimatlara uymamak'),
    FormBuilderFieldOption(value: 'Yorgunluk/Uykusuzluk/Dalgınlık'),
    FormBuilderFieldOption(value: 'Disiplinsiz çalışma'),
    FormBuilderFieldOption(value: 'Yetersiz makine ekipman muhafazası'),
  ];
  static final List<String> precautionsToBeTaken = [
    'Yetkisi olmadan çalışmak',
    'Hatalı uyarı vermek/almak',
    'Emniyette hata',
    'Uygun olmayan hız',
    'Ekipman koruyucusu kullanmamak',
    'Kişisel koruyucu donanım kullanmamak',
    'Ekipman kullanım hatası',
    'Arızalı ekipman kullanmak',
    'Bilgisi olmadığı alanda çalışmak',
    'Talimatlara uymamak',
    'Yorgunluk/Uykusuzluk/Dalgınlık',
    'Disiplinsiz çalışma',
    'Yetersiz makine ekipman muhafazası',
  ];
  static final List<String> rootCauseAnalysisRequirement = [
    'Kök Neden Analizi Gereksinimi',
  ];

  static List<String> theSubjectOfTheAccidentToStringList(AffectedEmployeeWithPropertyForAccident boolList){
    List<String> result=[];
    if (boolList.theSubjectExposureToPhysicalViolence == true){
      result.add(Constant.theSubjectOfTheAccident[0]);
    }
    if (boolList.theSubjectExposureToVerbalViolence == true){
      result.add(Constant.theSubjectOfTheAccident[1]);
    }
    if (boolList.theSubjectSharpObjectInjuries == true){
      result.add(Constant.theSubjectOfTheAccident[2]);
    }
    if (boolList.theSubjectExposureToBiologicalAgents == true){
      result.add(Constant.theSubjectOfTheAccident[3]);
    }
    if (boolList.theSubjectFallingImpactInjuries == true){
      result.add(Constant.theSubjectOfTheAccident[4]);
    }
    if (boolList.theSubjectMaterialDamagedTrafficAccident == true){
      result.add(Constant.theSubjectOfTheAccident[5]);
    }
    if (boolList.theSubjectInjuredTrafficAccident == true){
      result.add(Constant.theSubjectOfTheAccident[6]);
    }
    if (boolList.theSubjectExposureToChemicals == true){
      result.add(Constant.theSubjectOfTheAccident[7]);
    }
    if (boolList.theSubjectExposureToFireAndBurn == true){
      result.add(Constant.theSubjectOfTheAccident[8]);
    }
    if (boolList.theSubjectOfficeAccidents == true){
      result.add(Constant.theSubjectOfTheAccident[9]);
    }
    if (boolList.theSubjectElectricalAccidents == true){
      result.add(Constant.theSubjectOfTheAccident[10]);
    }
    return result;
  }
  static List<String> thePrecautionsToBeTakenToStringList(AffectedEmployeeWithPropertyForAccident boolList){
    List<String> result=[];
    if (boolList.thePrecautionsWorkingWithoutAuthorization == true){
      result.add(Constant.precautionsToBeTaken[0]);
    }
    if (boolList.thePrecautionsGiveOrReceiveFalseWarnings== true){
      result.add(Constant.precautionsToBeTaken[1]);
    }
    if (boolList.thePrecautionsErrorInSafety == true){
      result.add(Constant.precautionsToBeTaken[2]);
    }
    if (boolList.thePrecautionsImproperSpeed == true){
      result.add(Constant.precautionsToBeTaken[3]);
    }
    if (boolList.thePrecautionsNotUsingEquipmentProtectors == true){
      result.add(Constant.precautionsToBeTaken[4]);
    }
    if (boolList.thePrecautionsNotUsingPersonalProtectiveEquipment == true){
      result.add(Constant.precautionsToBeTaken[5]);
    }
    if (boolList.thePrecautionsEquipmentUsageError == true){
      result.add(Constant.precautionsToBeTaken[6]);
    }
    if (boolList.thePrecautionsUsingFaultyEquipment == true){
      result.add(Constant.precautionsToBeTaken[7]);
    }
    if (boolList.thePrecautionsWorkingInAnUnfamiliarField== true){
      result.add(Constant.precautionsToBeTaken[8]);
    }
    if (boolList.thePrecautionsDisobeyingInstructions == true){
      result.add(Constant.precautionsToBeTaken[9]);
    }
    if (boolList.thePrecautionsTirednessOrInsomniaOrDrowsiness == true){
      result.add(Constant.precautionsToBeTaken[10]);
    }
    if (boolList.thePrecautionsWorkingWithoutDiscipline == true){
      result.add(Constant.precautionsToBeTaken[11]);
    }
    if (boolList.thePrecautionsInsufficientMachineEquipmentEnclosure == true){
      result.add(Constant.precautionsToBeTaken[12]);
    }
    return result;
  }
}
class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(key: key),
  ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

Padding title(BuildContext context, String title) {
  return Padding(
    padding: Constant.padding,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    ),
  );
}

Padding subtitle({required String subtitle, required double height, required double width}) {
  return Padding(
    padding: Constant.padding,
    child: SizedBox(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          subtitle,
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
      ),
    ),
  );
}

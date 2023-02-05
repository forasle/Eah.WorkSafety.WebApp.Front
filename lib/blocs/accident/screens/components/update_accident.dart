import 'package:aeah_work_safety/blocs/accident/accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/accident_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/add_new_accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:aeah_work_safety/blocs/accident/models/accident_response.dart';
import 'package:aeah_work_safety/blocs/accident/update_accident_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdateAccidentPage extends StatelessWidget {
  const UpdateAccidentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _accidentResponse = ModalRoute.of(context)!.settings.arguments as Accident;
    final _formKey = GlobalKey<FormBuilderState>();
    //final TextEditingController _nameController = TextEditingController();
    return CustomScaffold(
      body: FormBuilder(
        key: _formKey,
        onChanged: () {
          _formKey.currentState!.save();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'İş Kazası', routeName: accidentPageRoute),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'Yeni İş Kazası Ekle', routeName: addNewAccident),
                  ],
                ),
              ),
            ),
            Constant.dividerWithIndent,
            title(context, 'Genel Bilgiler'),
            Constant.dividerWithIndent,
            Constant.sizedBox50,
            IntrinsicHeight(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: Constant.padding,
                      child: Column(
                        children: [
                          subtitle(subtitle: 'Kimlik Numarası:', height: 80, width: 150),
                          subtitle(subtitle: 'Kaza Tarihi:', height: 80, width: 150),
                          subtitle(subtitle: 'Kayıp Gün Sayısı:', height: 80, width: 150),
                          subtitle(subtitle: 'Olay Tanımı:', height: 150, width: 150),
                          subtitle(subtitle: 'Yapılan İş:', height: 150, width: 150),
                        ],
                      ),
                    ),
                  ),
                  Constant.verticalDivider,
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: Constant.padding,
                      child: Column(
                        children: [
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderTextField(
                                initialValue:
                                    _accidentResponse.affectedEmployeeWithPropertyForAccident[0].identificationNumber,
                                name: "identificationNumber",
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                                onSubmitted: (value) {
                                  context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: value!));
                                },
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Kimlik Numarası Giriniz',
                                  labelText: 'Kimlik Numarası',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderDateTimePicker(
                                initialValue: _accidentResponse.date,
                                validator: (value) {
                                  if (value == null) {
                                    return "Lütfen Tarih Giriniz";
                                  }
                                  return null;
                                },
                                name: 'accidentDate',
                                format: DateFormat('dd-MM-yyyy    HH:mm'),
                                initialEntryMode: DatePickerEntryMode.calendar,
                                //initialValue: DateTime.now(),
                                inputType: InputType.both,
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Kaza Tarihi  Giriniz',
                                  labelText: 'Kaza Tarihi',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                initialTime: const TimeOfDay(hour: 8, minute: 0),
                                // locale: const Locale.fromSubtags(languageCode: 'fr'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderTextField(
                                initialValue:
                                    _accidentResponse.affectedEmployeeWithPropertyForAccident[0].lostDays.toString(),
                                validator: (value) {
                                  if (value == null) {
                                    return "Lütfen Kayıp Gün Giriniz";
                                  }
                                  return null;
                                },
                                name: "lostDay",
                                //controller: lostDayController,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Kayıp Gün Giriniz',
                                  labelText: 'Kayıp Gün',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 150,
                              child: Center(
                                child: FormBuilderTextField(
                                  initialValue: _accidentResponse.accidentInfo,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen Olay Tanımı Giriniz";
                                    }
                                    return null;
                                  },
                                  name: "accidentInfo",
                                  //controller: eventDescriptionController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen Olay Tanımını Yapınız',
                                    labelText: 'Olay Tanımı',
                                    //filled: true,
                                    border: Constant.textFieldBorder,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 150,
                              child: Center(
                                child: FormBuilderTextField(
                                  initialValue: _accidentResponse.performedJob,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen Yapılan İşi Giriniz";
                                    }
                                    return null;
                                  },
                                  name: "performedJob",
                                  //controller: performedJobController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen Yapılan İşi Giriniz',
                                    labelText: 'Yapılan İş',
                                    //filled: true,
                                    border: Constant.textFieldBorder,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Constant.sizedBox50,
            title(context, 'Olay Yeri'),
            Constant.dividerWithIndent,
            Constant.sizedBox50,
            IntrinsicHeight(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: Constant.padding,
                      child: Column(
                        children: [
                          subtitle(subtitle: 'Departman:', height: 90, width: 150),
                          subtitle(subtitle: 'Olay Yeri:', height: 80, width: 150),
                          subtitle(subtitle: 'Olayın Konusu:', height: 110, width: 150),
                          subtitle(subtitle: 'Alınması Gereken Önlem:', height: 110, width: 150),
                        ],
                      ),
                    ),
                  ),
                  Constant.verticalDivider,
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: Constant.padding,
                      child: Column(
                        children: [
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 90,
                              child: FormBuilderDropdown<String>(
                                initialValue: _accidentResponse.relatedDepartment,
                                name: 'relatedDepartment',
                                validator: FormBuilderValidators.compose([
                                  (val) {
                                    return val == null ? "Lütfen Departman Seçiniz" : null;
                                  },
                                  FormBuilderValidators.required(errorText: "Lütfen Departman Seçiniz")
                                ]),
                                items: Constant.menuItemsForDepartmentType,
                                decoration: InputDecoration(
                                  hintText: 'Departman Seçiniz',
                                  labelText: 'Departman',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                onChanged: (val) {},
                                //valueTransformer: (val) => val?.toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderTextField(
                                initialValue: _accidentResponse.referenceNumber,
                                validator: (value) {
                                  if (value == null) {
                                    return "Lütfen Olay Yerini Giriniz";
                                  }
                                  return null;
                                },
                                name: "sceneOfAccident",
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Olay Yerini Giriniz',
                                  labelText: 'Olay Yeri',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 110,
                              child: FormBuilderCheckboxGroup<String>(
                                initialValue: Constant.theSubjectOfTheAccidentToStringList(
                                    _accidentResponse.affectedEmployeeWithPropertyForAccident[0]),
                                decoration: InputDecoration(
                                  hintText: 'Olayın Konusunu Seçiniz',
                                  labelText: 'Olayın Konusu',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'theSubjectOfTheAccidentStringList',
                                // initialValue: const ['Dart'],
                                options: Constant.theSubjectOfTheAccident2,
                                orientation: OptionsOrientation.horizontal,
                                separator: const VerticalDivider(
                                  width: 10,
                                  thickness: 5,
                                  color: Colors.red,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.minLength(1, errorText: "Lütfen En Az Bir Adet Seçiniz"),
                                ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 110,
                              child: FormBuilderCheckboxGroup<String>(
                                initialValue: Constant.thePrecautionsToBeTakenToStringList(
                                    _accidentResponse.affectedEmployeeWithPropertyForAccident[0]),
                                decoration: InputDecoration(
                                  hintText: 'Alınması Gereken Önlem',
                                  labelText: 'Alınması Gereken Önlem',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'precautionsToBeTakenStringList',
                                // initialValue: const ['Dart'],
                                options: Constant.precautionsToBeTaken2,
                                orientation: OptionsOrientation.horizontal,
                                separator: const VerticalDivider(
                                  width: 10,
                                  thickness: 5,
                                  color: Colors.red,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.minLength(1, errorText: "Lütfen En Az Bir Adet Seçiniz"),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Constant.sizedBox50,
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        Map<String, dynamic>? value = _formKey.currentState?.value;

                        context
                            .read<UpdateAccidentBloc>()
                            .add(UpdateAccident(accident: value!, id: _accidentResponse.id));
                        LoadingDialog.hide(context);
                        Navigator.of(context).pushReplacementNamed(accidentPageRoute);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kaza Güncellendi")));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text("Tüm bilgileri eksiksiz doldurun")));
                      }
                    },
                    child: const Text(
                      'Kaydet',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                    },
                    // color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      'İptal',
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
            Constant.sizedBox50
          ],
        ),
      ),
    );
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

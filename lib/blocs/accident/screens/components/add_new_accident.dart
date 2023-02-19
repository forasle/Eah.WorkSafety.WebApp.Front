import 'package:aeah_work_safety/blocs/accident/accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/add_new_accident_bloc.dart';
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
import 'package:textfield_search/textfield_search.dart';

class AddNewAccident extends StatelessWidget {
  const AddNewAccident({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    TextEditingController myController = TextEditingController();
    myController.addListener(() {
      if (myController.text.length > 3) {
        context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: myController.text));
      }
    });
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
                              child: BlocBuilder<EmployeeBloc, EmployeeState>(
                                builder: (context, state) {
                                  return TextFieldSearch(
                                    //getSelectedValue: (var value)=>print(value.toString()+"Test"),
                                    label: 'Kimlik Numarası',
                                    controller: myController,
                                    future: () async {
                                      List _list = <dynamic>[];
                                      if (state is EmployeeDataFiltered) {
                                        if (state.employeeResponse.data.isNotEmpty) {
                                          for (var employee in state.employeeResponse.data) {
                                            _list.add(employee.identificationNumber);
                                            //print(state.employeeResponse.data)
                                          }
                                        }

                                        //print(state.employeeResponse.data);
                                        //_list.add(state.employeeResponse.data);
                                      }
                                      //context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: value!));
                                      //return fetchSimpleData();
                                      // create a list from the text input of three items
                                      // to mock a list of items from an http call

                                      return _list;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen Kimlik Numarasını  Giriniz',
                                      labelText: 'Kimlik Numarası',
                                      //filled: true,
                                      border: Constant.textFieldBorder,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: FormBuilderDateTimePicker(
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
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderTextField(
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
                          subtitle(subtitle: 'Olayın Konusu:', height: 500, width: 150),
                          subtitle(subtitle: 'Alınması Gereken Önlem:', height: 500, width: 150),
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
                                name: 'relatedDepartment',
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(errorText: "Lütfen Departman Seçiniz")]),
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
                              height: 500,
                              child: FormBuilderCheckboxGroup<String>(
                                decoration: InputDecoration(
                                  hintText: 'Olayın Konusunu Seçiniz',
                                  labelText: 'Olayın Konusu',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'theSubjectOfTheAccidentStringList',
                                // initialValue: const ['Dart'],
                                options: Constant.theSubjectOfTheAccident2,
                                orientation: OptionsOrientation.vertical,
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
                              height: 500,
                              child: FormBuilderCheckboxGroup<String>(
                                decoration: InputDecoration(
                                  hintText: 'Alınması Gereken Önlem',
                                  labelText: 'Alınması Gereken Önlem',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'precautionsToBeTakenStringList',
                                // initialValue: const ['Dart'],
                                options: Constant.precautionsToBeTaken2,
                                orientation: OptionsOrientation.vertical,
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
              children:[
                Expanded(
                  child: BlocListener<AddNewAccidentBloc, AddNewAccidentState>(
                    listener: (context, state) {
                      if (state is NewAccidentCreated) {
                        context.read<AccidentBloc>().add(const GetAccidentData(needsRefresh: true));
                        //Navigator.of(context).pushReplacementNamed(accidentPageRoute);
                        LoadingDialog.hide(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kaza eklendi")));
                      }
                      if (state is NewAccidentCreationError) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Kaza eklenemedi. Lütfen kimlik numarasını kontrol ediniz.")));
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          Map<String, dynamic>? value = _formKey.currentState?.value;
                          context
                              .read<AddNewAccidentBloc>()
                              .add(CreateNewAccident(accident: value!, identificationNumber: myController.text));
                          //LoadingDialog.hide(context);

                          //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kaza Eklendi")));
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
            style: Theme.of(context).textTheme.headlineMedium,
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

/*
FormBuilderTextField(
                                name: "identificationNumber",
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                                onChanged: (value) {
                                  if(value!=null){
                                    if(value.length==10){
                                      context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: value!));
                                    }
                                  }
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Lütfen TC Kimlik Numarasını Kontrol Ediniz.";
                                  }
                                  if (value.length != 11) {
                                    return "Lütfen TC Kimlik Numarasını Kontrol Ediniz.";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Kimlik Numarası Giriniz',
                                  labelText: 'Kimlik Numarası',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                              ),
 */

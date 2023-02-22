import 'package:aeah_work_safety/blocs/near_miss/add_new_near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/near_miss_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/near_miss/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:textfield_search/textfield_search.dart';

class AddNewNearMiss extends StatelessWidget {
  const AddNewNearMiss({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    TextEditingController myController = TextEditingController();
    myController.addListener(() {
      if (myController.text.length > 5) {
        context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: myController.text,needsRefresh: true));
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
                    RoutingBarWidget(pageName: 'Ramak Kala Olaylar', routeName: nearMissPageRoute),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'Yeni Ramak Kala Ekle', routeName: addNewNearMiss),
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
                                    label: 'Kimlik Numarası',
                                    controller: myController,
                                    future: () async {
                                      List _list = <dynamic>[];
                                      if (state is EmployeeDataFiltered) {
                                        if (state.employeeResponse.isNotEmpty) {
                                          for (var employee in state.employeeResponse) {
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
                                  name: 'nearMissDate',
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
                                  name: "nearMissInfo",
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
                          subtitle(subtitle: 'Olayın Konusu:', height: Constant.heightOfAccidentAndNearMissCheckBox, width: 150),
                          subtitle(subtitle: 'Alınması Gereken Önlem:', height: Constant.heightOfAccidentAndNearMissCheckBox, width: 150),
                          subtitle(subtitle: 'Kök Neden Analizi Gereksinimi:', height: 80, width: 150),
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
                                name: "sceneOfNearMiss",
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
                              height: Constant.heightOfAccidentAndNearMissCheckBox,
                              child: FormBuilderCheckboxGroup<String>(
                                decoration: InputDecoration(
                                  hintText: 'Olayın Konusunu Seçiniz',
                                  labelText: 'Olayın Konusu',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'theSubjectOfTheNearMissStringList',
                                // initialValue: const ['Dart'],
                                options: Constant.theSubjectOfTheNearMiss2,
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
                              height: Constant.heightOfAccidentAndNearMissCheckBox,
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
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderCheckbox(
                                decoration: InputDecoration(
                                  hintText: 'Kök Neden Analizi Seçiniz',
                                  labelText: 'Kök Neden Analizi',
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'rootCauseAnalysisRequirement',
                                initialValue: false,
                                title: const Text("Kök Neden Gereksinimi"),
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
                  child: BlocListener<AddNewNearMissBloc, AddNewNearMissState>(
                    listener: (context, state) {
                      if (state is NewNearMissCreated) {
                        context.read<NearMissBloc>().add(const GetNearMissData(needsRefresh: true));
                        //Navigator.of(context).pushReplacementNamed(nearMissPageRoute);
                        LoadingDialog.hide(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kaza eklendi")));
                      }
                      if (state is NewNearMissCreationError) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Kaza eklenemedi. Lütfen kimlik numarasını kontrol ediniz.")));
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          Map<String, dynamic>? value = _formKey.currentState?.value;
                          context
                              .read<AddNewNearMissBloc>()
                              .add(CreateNewNearMiss(nearMiss: value!, identificationNumber: myController.text));
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

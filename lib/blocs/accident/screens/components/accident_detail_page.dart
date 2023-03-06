
import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AccidentDetailPage extends StatelessWidget {
  const AccidentDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _accidentResponse = ModalRoute.of(context)!.settings.arguments as Accident;
    //context.read<AccidentBloc>().add(const AccidentInitialEvent());
    final _formKey = GlobalKey<FormBuilderState>();
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
                    RoutingBarWidget(pageName: 'İş Kazası Detayları', routeName: accidentDetailPage),
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
                          subtitle(subtitle: 'Adı Soyadı:', height: 80, width: 150),
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
                                  readOnly: true,
                                  name: "identificationNumber",
                                  initialValue:
                                      _accidentResponse.affectedEmployeeWithPropertyForAccident[0].name.toString() +
                                          " " +
                                          _accidentResponse.affectedEmployeeWithPropertyForAccident[0].surname,
                                  decoration: InputDecoration(
                                    labelText: 'Adı Soyadı',
                                    //filled: true,
                                    border: Constant.textFieldBorder,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: FormBuilderTextField(
                                  readOnly: true,
                                  initialValue: DateFormat('dd-MM-yyyy    HH:mm').format(_accidentResponse.accidentDate),
                                  name: 'accidentDate',
                                  decoration: InputDecoration(
                                    labelText: 'Kaza Tarihi',
                                    //filled: true,
                                    border: Constant.textFieldBorder,
                                  ),
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
                                readOnly: true,
                                name: "lostDay",
                                initialValue:
                                    _accidentResponse.affectedEmployeeWithPropertyForAccident[0].lostDays.toString(),
                                //controller: lostDayController,
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
                                  readOnly: true,
                                  initialValue: _accidentResponse.accidentInfo,
                                  name: "accidentInfo",
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
                                  readOnly: true,
                                  initialValue: _accidentResponse.performedJob,
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
                              child: FormBuilderTextField(
                                readOnly: true,
                                initialValue: _accidentResponse.relatedDepartment,
                                name: 'relatedDepartment',
                                decoration: InputDecoration(
                                  hintText: 'Departman Seçiniz',
                                  labelText: 'Departman',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                //valueTransformer: (val) => val?.toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderTextField(
                                readOnly: true,
                                initialValue: _accidentResponse.sceneOfAccident,
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
                              height: Constant.heightOfAccidentAndNearMissCheckBox,
                              child: FormBuilderCheckboxGroup<String>(
                                disabled: Constant.theSubjectOfTheAccident,
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
                                orientation: OptionsOrientation.vertical,
                                separator: const VerticalDivider(
                                  width: 10,
                                  thickness: 5,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: Constant.heightOfAccidentAndNearMissCheckBox,
                              child: FormBuilderCheckboxGroup<String>(
                                disabled: Constant.precautionsToBeTaken,
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
                                orientation: OptionsOrientation.vertical,
                                separator: const VerticalDivider(
                                  width: 10,
                                  thickness: 5,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderCheckbox(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: 'Kök Neden Analizi Seçiniz',
                                  labelText: 'Kök Neden Analizi',
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'rootCauseAnalysisRequirement',
                                initialValue: _accidentResponse.rootCauseAnalysis,
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
          ],
        ),
      ),
    );
  }
}

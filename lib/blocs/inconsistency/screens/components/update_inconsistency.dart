import 'package:aeah_work_safety/blocs/inconsistency/inconsistency_bloc.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/update_inconsistency_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/inconsistency/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdateInconsistencyPage extends StatelessWidget {
  const UpdateInconsistencyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _inconsistencyResponse = ModalRoute.of(context)!.settings.arguments as Inconsistency;
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
                    RoutingBarWidget(pageName: 'Uygunsuzluklar', routeName: inconsistenciesDetailPage),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'Uygunsuzluk Güncelle', routeName: addNewInconsistencies),
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
                          subtitle(subtitle: 'Uygunsuzluk Tarihi:', height: 80, width: 150),
                          subtitle(subtitle: 'Risk Skoru:', height: 80, width: 150),
                          subtitle(subtitle: 'Uygunsuzluk Tanımı:', height: 150, width: 150),
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
                              child: Center(
                                child: FormBuilderDateTimePicker(
                                  initialValue: _inconsistencyResponse.date,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen Tarih Giriniz";
                                    }
                                    return null;
                                  },
                                  name: 'date',
                                  format: DateFormat('dd-MM-yyyy    HH:mm'),
                                  initialEntryMode: DatePickerEntryMode.calendar,
                                  //initialValue: DateTime.now(),
                                  inputType: InputType.both,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen Uygunsuzluk Tarihi Giriniz',
                                    labelText: 'Uygunsuzluk Tarihi',
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
                                initialValue: _inconsistencyResponse.riskScore.toString(),
                                validator: (value) {
                                  if (value == null) {
                                    return "Lütfen Risk Skoru Giriniz";
                                  }
                                  return null;
                                },
                                name: "riskScore",
                                //controller: lostDayController,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Risk Skoru Giriniz',
                                  labelText: 'Risk Skoru',
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
                                  initialValue: _inconsistencyResponse.information,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen Uygunsuzluk Tanımı Giriniz";
                                    }
                                    return null;
                                  },
                                  name: "information",
                                  //controller: eventDescriptionController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen Uygunsuzluk Tanımını Yapınız',
                                    labelText: 'Uygunsuzluk Tanımı',
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
                          subtitle(subtitle: 'Uygunsuzluk Yeri:', height: 80, width: 150),
                          subtitle(subtitle: 'Kök Neden Analizi Gereksinimi:', height: 80, width: 150),
                          subtitle(subtitle: 'Uygunsuzluk Durumu:', height: 80, width: 150),
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
                                initialValue: _inconsistencyResponse.department,
                                name: 'department',
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
                                initialValue: _inconsistencyResponse.referenceNumber,
                                validator: (value) {
                                  if (value == null) {
                                    return "Lütfen Uygunsuzluk Yerini Giriniz";
                                  }
                                  return null;
                                },
                                name: "referenceNumber",
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Uygunsuzluk Yerini Giriniz',
                                  labelText: 'Uygunsuzluk Yeri',
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
                              child: FormBuilderCheckbox(
                                decoration: InputDecoration(
                                  hintText: 'Kök Neden Analizi Seçiniz',
                                  labelText: 'Kök Neden Analizi',
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'rootCauseAnalysisRequirement',
                                initialValue: _inconsistencyResponse.rootCauseAnalysisRequirement,
                                title: const Text("Kök Neden Gereksinimi"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderCheckbox(
                                decoration: InputDecoration(
                                  hintText: 'Uygunsuzluk Durumunu Seçiniz',
                                  labelText: 'Uygunsuzluk Durumu',
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'status',
                                initialValue: _inconsistencyResponse.status,
                                title: const Text("Uygunsuzluk Durumu"),
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
                  child: BlocListener<UpdateInconsistencyBloc, UpdateInconsistencyState>(
                    listener: (context, state) {
                      if (state is UpdateInconsistencyCompleted) {
                        context.read<InconsistencyBloc>().add(const GetInconsistencyData(needsRefresh: true));
                        //Navigator.of(context).pushReplacementNamed(inconsistencyPageRoute);
                        LoadingDialog.hide(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Uygunsuzluk güncellendi")));
                      }
                      if (state is UpdateInconsistencyError) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Uygunsuzluk güncellenemedi. Lütfen bilgileri kontrol ediniz.")));
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          Map<String, dynamic>? value = _formKey.currentState?.value;
                          context
                              .read<UpdateInconsistencyBloc>()
                              .add(UpdateInconsistency(id: _inconsistencyResponse.id,inconsistency: value!));
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
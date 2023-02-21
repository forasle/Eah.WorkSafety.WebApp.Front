import 'package:aeah_work_safety/blocs/preventive_activity/preventive_activity_bloc.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/update_preventive_activity_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/preventive_activities/constants.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdatePreventiveActivityPage extends StatelessWidget {
  const UpdatePreventiveActivityPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _preventiveActivityResponse = ModalRoute.of(context)!.settings.arguments as PreventiveActivity;
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
                    RoutingBarWidget(pageName: "DÖF'ler", routeName: inconsistenciesDetailPage),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'DÖF Güncelle', routeName: addNewInconsistencies),
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
                          subtitle(subtitle: 'DÖF Tarihi:', height: 80, width: 150),
                          subtitle(subtitle: 'DÖF Bitiş Tarihi:', height: 80, width: 150),
                          subtitle(subtitle: 'DÖF adı:', height: 80, width: 150),
                          subtitle(subtitle: 'DÖF Tanımı:', height: 150, width: 150),
                          subtitle(subtitle: 'Kullanılan Metot:', height: 80, width: 150),
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
                                  initialValue: _preventiveActivityResponse.date,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen DÖF Tarihi Giriniz";
                                    }
                                    return null;
                                  },
                                  name: 'date',
                                  format: DateFormat('dd-MM-yyyy    HH:mm'),
                                  initialEntryMode: DatePickerEntryMode.calendar,
                                  //initialValue: DateTime.now(),
                                  inputType: InputType.both,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen DÖF Tarihi Giriniz',
                                    labelText: 'DÖF Tarihi',
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
                              child: Center(
                                child: FormBuilderDateTimePicker(
                                  initialValue: _preventiveActivityResponse.deadline,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen DÖF Bitiş Tarihi Giriniz";
                                    }
                                    return null;
                                  },
                                  name: 'deadline',
                                  format: DateFormat('dd-MM-yyyy    HH:mm'),
                                  initialEntryMode: DatePickerEntryMode.calendar,
                                  //initialValue: DateTime.now(),
                                  inputType: InputType.both,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen DÖF Bitiş Tarihi Giriniz',
                                    labelText: 'DÖF Bitiş Tarihi',
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
                                initialValue: _preventiveActivityResponse.referenceNumber.toString(),
                                validator: (value) {
                                  if (value == null) {
                                    return "Lütfen DÖF Adı Giriniz";
                                  }
                                  return null;
                                },
                                name: "name",
                                //controller: lostDayController,
                                //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                                decoration: InputDecoration(
                                  hintText: 'Lütfen DÖF Adı Giriniz',
                                  labelText: 'DÖF Adı',
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
                                  initialValue: _preventiveActivityResponse.information,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen DÖF Tanımı Giriniz";
                                    }
                                    return null;
                                  },
                                  name: "information",
                                  //controller: eventDescriptionController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen DÖF Tanımını Yapınız',
                                    labelText: 'DÖF Tanımı',
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
                              height: 80,
                              child: Center(
                                child: FormBuilderTextField(
                                  initialValue: _preventiveActivityResponse.method,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Lütfen Kullanılan Metodu Giriniz";
                                    }
                                    return null;
                                  },
                                  name: "method",
                                  //controller: eventDescriptionController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen Kullanılan Metodu Yapınız',
                                    labelText: 'Kullanılan Metot',
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
                          subtitle(subtitle: 'Kök Neden Analizi Gereksinimi:', height: 80, width: 150),
                          subtitle(subtitle: 'DÖF Durumu:', height: 80, width: 150),
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
                              child: FormBuilderCheckboxGroup<String>(
                                initialValue: _preventiveActivityResponse.rootCauseAnalysis==true ? ['Kök Neden Analizi Gereksinimi'] : [""],
                                decoration: InputDecoration(
                                  hintText: 'Kök Neden Analizi Seçiniz',
                                  labelText: 'Kök Neden Analizi',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'rootCauseAnalysisRequirement',
                                // initialValue: const ['Dart'],
                                options: const [FormBuilderFieldOption(value: 'Kök Neden Analizi Gereksinimi')],
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
                              child: FormBuilderCheckboxGroup<String>(
                                initialValue: _preventiveActivityResponse.status==true ? ['Uygunsuzluk Durumu'] : [""],
                                decoration: InputDecoration(
                                  hintText: 'Uygunsuzluk Durumu Seçiniz',
                                  labelText: 'Uygunsuzluk Durumu',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'status',
                                // initialValue: const ['Dart'],
                                options: const [FormBuilderFieldOption(value: 'Uygunsuzluk Durumu')],
                                orientation: OptionsOrientation.vertical,
                                separator: const VerticalDivider(
                                  width: 10,
                                  thickness: 5,
                                  color: Colors.red,
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
            Row(
              children:[
                Expanded(
                  child: BlocListener<UpdatePreventiveActivityBloc, UpdatePreventiveActivityState>(
                    listener: (context, state) {
                      if (state is UpdatePreventiveActivityCompleted) {
                        context.read<PreventiveActivityBloc>().add(const GetPreventiveActivityData(needsRefresh: true));
                        //Navigator.of(context).pushReplacementNamed(preventiveActivityPageRoute);
                        LoadingDialog.hide(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Uygunsuzluk eklendi")));
                      }
                      if (state is UpdatePreventiveActivityError) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Uygunsuzluk eklenemedi. Lütfen bilgileri kontrol ediniz.")));
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          Map<String, dynamic>? value = _formKey.currentState?.value;
                          context
                              .read<UpdatePreventiveActivityBloc>()
                              .add(UpdatePreventiveActivity(id: _preventiveActivityResponse.id,preventiveActivity: value!));
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
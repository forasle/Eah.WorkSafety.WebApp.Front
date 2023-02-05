

import 'package:aeah_work_safety/blocs/near_miss/add_new_near_miss_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/near_miss/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AddNewNearMiss extends StatelessWidget {
  const AddNewNearMiss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => AddNewNearMissFormBloc(),
        child: Builder(builder: (context) {
          final formBloc = context.read<AddNewNearMissFormBloc>();
          return FormBlocListener<AddNewNearMissFormBloc, String, String>(
            onSubmitting: (context, state) {
              //LoadingDialog.show(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Row(
                    children: const [
                      CircularProgressIndicator(),
                      Constant.sizedBoxHeight,
                      Text("Ramak Kala veritabanına ekleniyor"),
                    ],
                  )));
            },
            onSubmissionFailed: (context, state) {
              //LoadingDialog.hide(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tüm bilgileri eksiksiz doldurun")));
            },
            onFailure: (context, state) {
              //LoadingDialog.hide(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failureResponse!)));
            },
            onSuccess: (context, state) {
              LoadingDialog.hide(context);
              Navigator.of(context).pushReplacementNamed(nearMissPageRoute);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Ramak Kala Eklendi")));
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
                        RoutingBarWidget(pageName: 'Ramak Kala', routeName: nearMissPageRoute),
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
                                  child: TextFieldBlocBuilder(
                                    textFieldBloc: formBloc.identificationNumber,
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
                                  child: Center(
                                    child: DateTimeFieldBlocBuilder(
                                      canSelectTime: true,
                                      dateTimeFieldBloc: formBloc.nearMissDate,
                                      format: DateFormat('dd-MM-yyyy  hh:mm'),
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      decoration: InputDecoration(
                                        hintText: 'Lütfen Ramak Kala Tarihi  Giriniz',
                                        labelText: 'Ramak Kala Tarihi',
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
                                  child: TextFieldBlocBuilder(
                                    textFieldBloc: formBloc.lostDay,
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
                                    child: TextFieldBlocBuilder(
                                      maxLines: 5,
                                      textFieldBloc: formBloc.nearMissInfo,
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
                                    child: TextFieldBlocBuilder(
                                      maxLines: 5,
                                      textFieldBloc: formBloc.performedJob,
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
                                  child: DropdownFieldBlocBuilder<String>(
                                    selectFieldBloc: formBloc.relatedDepartment,
                                    decoration: InputDecoration(
                                      hintText: 'Departman Seçiniz',
                                      labelText: 'Departman',
                                      //filled: true,
                                      border: Constant.textFieldBorder,
                                    ),
                                    itemBuilder: (context, value) => FieldItem(
                                      isEnabled: value != 'Option 1',
                                      child: Text(value),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: Constant.padding,
                                child: SizedBox(
                                  height: 80,
                                  child: TextFieldBlocBuilder(
                                    textFieldBloc: formBloc.sceneOfNearMiss,
                                    decoration: InputDecoration(
                                      hintText: 'Olay Yeri Giriniz',
                                      labelText: 'Olay Yeri',
                                      //filled: true,
                                      border: Constant.textFieldBorder,
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: formBloc.cancelSubmission,
                        child: const Text("İPTAL"),
                      ),
                      const SizedBox(width: 50),
                      ElevatedButton(
                        onPressed: formBloc.submit,
                        child: const Text("KAYDET"),
                      ),
                    ],
                  ),
                ),
                Constant.sizedBox50
              ],
            ),
          );
        }),
      ),
    );
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
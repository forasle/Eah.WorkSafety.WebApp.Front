import 'package:aeah_work_safety/blocs/accident/add_new_accident_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AddNewAccident extends StatelessWidget {
  const AddNewAccident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFieldsFormBloc(),
      child: Builder(builder: (context) {
        final formBloc = BlocProvider.of<AllFieldsFormBloc>(context);
        return CustomScaffold(
          body: FormBlocListener<AllFieldsFormBloc, String, String>(
            onSubmitting: (context, state) {
              print("onSubmit");
            },
            onSuccess: (context, state) {
              print("success");
            },
            onFailure: (context, state) {
              print("failure");
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                ScrollableFormBlocManager(
                  formBloc: formBloc,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title(context, 'Genel Bilgiler'),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text1,
                          decoration: InputDecoration(
                              labelText: 'Kazazedenin Tc Kimlik Numarası',
                              prefixIcon: const Icon(Icons.numbers),
                              border: Constant.textFieldBorder),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text2,
                          decoration: InputDecoration(
                              labelText: 'Yaranın Türü',
                              prefixIcon: const Icon(Icons.personal_injury),
                              border: Constant.textFieldBorder),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text3,
                          decoration: InputDecoration(
                              labelText: 'Yaralanmanın Vücuttaki Yeri',
                              prefixIcon: const Icon(Icons.person),
                              border: Constant.textFieldBorder),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text4,
                          decoration: InputDecoration(
                              labelText: 'Yaralanmaya Neden Olan Araç/Gereç',
                              prefixIcon: const Icon(Icons.dangerous),
                              border: Constant.textFieldBorder),
                        ),
                        DateTimeFieldBlocBuilder(
                          dateTimeFieldBloc: formBloc.dateAndTime1,
                          canSelectTime: true,
                          format: DateFormat('dd-MM-yyyy  hh:mm'),
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          decoration: InputDecoration(
                              labelText: 'Bildirimin Yapıldığı Tarih Saat',
                              prefixIcon: const Icon(Icons.date_range),
                              helperText: 'Date and Time',
                              border: Constant.textFieldBorder),
                        ),
                        DateTimeFieldBlocBuilder(
                          dateTimeFieldBloc: formBloc.dateAndTime2,
                          canSelectTime: true,
                          format: DateFormat('dd-MM-yyyy  hh:mm'),
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          decoration: InputDecoration(
                              labelText: 'Kazanın Meydana Geldiği Tarih Saat',
                              prefixIcon: const Icon(Icons.date_range),
                              helperText: 'Date and Time',
                              border: Constant.textFieldBorder),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text1,
                          decoration: InputDecoration(
                              labelText: 'Kazanın Meydana Geldiği Yer',
                              prefixIcon: const Icon(Icons.add_road),
                              border: Constant.textFieldBorder),
                        ),
                        title(context, 'Olayın Konusu'),
                        CheckboxGroupFieldBlocBuilder<String>(
                          multiSelectFieldBloc: formBloc.multiSelect1,
                          decoration: InputDecoration(labelText: 'Olayın Konusu', border: Constant.textFieldBorder),
                          groupStyle: const FlexGroupStyle(),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(item, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        title(context, 'Emniyetsiz Davranış/Emniyetsiz Durum Seçimi'),
                        CheckboxGroupFieldBlocBuilder<String>(
                          multiSelectFieldBloc: formBloc.multiSelect2,
                          decoration:
                          InputDecoration(labelText: 'Emniyetsiz Davranış', border: Constant.textFieldBorder),
                          groupStyle: const FlexGroupStyle(),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(item, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        CheckboxGroupFieldBlocBuilder<String>(
                          multiSelectFieldBloc: formBloc.multiSelect3,
                          decoration: InputDecoration(labelText: 'Emniyetsiz Durum', border: Constant.textFieldBorder),
                          groupStyle: const FlexGroupStyle(),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(item, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                print("4");
                                formBloc.submit;
                                print("5");
                              },
                              child: const Text("Kaydet", style: Constant.buttonTextStyle)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
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
}

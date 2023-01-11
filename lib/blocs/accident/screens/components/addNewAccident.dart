import 'package:aeah_work_safety/blocs/accident/add_new_accident_form_bloc.dart';
import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
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
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => AddNewAccidentFormBloc(),
        child: Builder(builder: (context) {
          final formBloc = context.read<AddNewAccidentFormBloc>();
          return Column(
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
              const SizedBox(height: 50),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: Constant.padding,
                        child: Column(
                          children: [
                            subtitle(subtitle: 'Kimlik Numarası:', height: 60, width: 150),
                            subtitle(subtitle: 'Kaza Tarihi:', height: 60, width: 150),
                            subtitle(subtitle: 'Kaza Kayıt Tarihi:', height: 60, width: 150),
                            subtitle(subtitle: 'Olay Tanımı:', height: 150, width: 150),
                            subtitle(subtitle: 'Yapılan İş:', height: 100, width: 150),
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

                                  textFieldBloc: formBloc.text2,
                                  decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 60,
                                child: Center(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.runtimeType != DateTime) {
                                        return "Lütfen Geçerli Tarih Giriniz";
                                      }
                                      return null;
                                    },
                                    onTap: () async {},
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen Tarih Giriniz',
                                      labelText: 'Tarih Giriniz',
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
                                height: 60,
                                child: Center(
                                  child: TextFormField(
                                    onTap: () async {},
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                        hintText: 'Lütfen Saat Giriniz',
                                        labelText: 'Saat Giriniz',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,

                                        border: Constant.textFieldBorder),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 150,
                                child: Center(
                                  child: TextField(
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                        hintText: 'Lütfen olay tanımını yapınız',
                                        labelText: 'Olay Tanımı',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,

                                        border: Constant.textFieldBorder),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 100,
                                child: Center(
                                  child: TextField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                        hintText: 'Lütfen yapılan iş açıklaması giriniz',
                                        labelText: 'Yapılan İş',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,
                                        border: Constant.textFieldBorder),
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
            ],
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

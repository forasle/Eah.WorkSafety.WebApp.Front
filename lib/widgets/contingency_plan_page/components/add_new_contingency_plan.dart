import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/contingency_plan/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewContingencyPlan extends StatelessWidget {
  const AddNewContingencyPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(
                  pageName: 'Acil Durum Planları',
                  routeName: contingencyPlanPage),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(
                  pageName: 'Yeni Acil Durum Planı Ekle',
                  routeName: addNewContingencyPlan),
            ],
          ),
          Constant.dividerWithIndent,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(context, 'Acil Durum Planı Bilgileri'),
                  Constant.dividerWithIndent,
                  Constant.sizedBox50H,
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: Constant.padding8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                subtitle(
                                    subtitle: 'Referans No:',
                                    height: 50,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Belge Hazırlama Tarihi:',
                                    height: 50,
                                    width: 150),
                                subtitle(
                                    subtitle:
                                        'Bir Sonraki Acil Durum Planı Tarihi:',
                                    height: 50,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Toplanma Yeri:',
                                    height: 50,
                                    width: 150),
                              ],
                            ),
                          ),
                        ),
                        Constant.verticalDivider,
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: Constant.padding8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: TextField(
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText: 'Acil Durum Plan Adı',
                                          labelText:
                                              'Lütfen Acil Durum Planının Adını Giriniz',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: Constant.textFormFieldBorder
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: TextFormField(
                                        onTap: () async {
                                          showDatePicker(
                                              locale: const Locale('tr'),
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2021),
                                              lastDate: DateTime(2023));
                                        },
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText: 'Belge Hazırlama Tarihi',
                                          labelText:
                                              'Lütfen Belge Hazırlama Tarihini Giriniz',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: Constant.textFormFieldBorder
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: TextFormField(
                                        onTap: () async {
                                          showDatePicker(
                                              locale: const Locale('tr'),
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2021),
                                              lastDate: DateTime(2023));
                                        },
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Bir Sonraki Acil Durum Planı Tarihi',
                                          labelText:
                                              'Lütfen Bir Sonraki Acil Durum Planı Tarihini Giriniz',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: Constant.textFormFieldBorder
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: TextField(
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText: 'Toplanma Yeri',
                                          labelText:
                                              'Lütfen Toplanma Yerini Giriniz',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: Constant.textFormFieldBorder
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
                  Constant.sizedBox50H,
                  title(context, 'Yeni Döküman Ekle'),
                  Constant.dividerWithIndent,
                  Constant.sizedBox50H,
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: Constant.padding8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'Ad   ',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'Düzenleme Tarihi   ',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Constant.verticalDivider,
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: Constant.padding8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: TextField(
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          hintText: 'Döküman adını giriniz',
                                          labelText: 'Döküman Adı',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,
                                          border: Constant.textFormFieldBorder
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Constant.padding8,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: TextFormField(
                                        onTap: () async {
                                          showDatePicker(
                                              locale: const Locale('tr'),
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2021),
                                              lastDate: DateTime(2023));
                                        },
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Lütfen Düzenleme Tarihi Giriniz',
                                          labelText: 'Tarih Giriniz',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: Constant.textFormFieldBorder
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding title(BuildContext context, String title) {
    return Padding(
      padding: Constant.padding8,
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

  Padding subtitle(
      {required String subtitle,
      required double height,
      required double width}) {
    return Padding(
      padding: Constant.padding8,
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Text(
            subtitle,
          ),
        ),
      ),
    );
  }
}

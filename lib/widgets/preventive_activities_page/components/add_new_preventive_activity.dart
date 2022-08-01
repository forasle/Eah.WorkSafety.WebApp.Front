import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewPreventiveActivity extends StatelessWidget {
  const AddNewPreventiveActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizantalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              routingBarWidget(pageName: 'Panaroma', routeName: panaromaRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'DÖF', routeName: preventiveActivitiesPageRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Yeni DÖF ekle',
                  routeName: addNewPreventiveActivity),
            ],
          ),
          dividerWithIndents(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(context, 'Genel Bilgiler'),
                  dividerWithIndents(),
                  const SizedBox(height: 50),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                subtitle(
                                    subtitle: 'Döf Türü:',
                                    height: 50,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Oluşturma Tarihi:',
                                    height: 50,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Tespit Tarihi:',
                                    height: 50,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Açıklama:',
                                    height: 150,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Faaliyet İsmi Giriniz:',
                                    height: 100,
                                    width: 150),
                              ],
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          endIndent: 5,
                          indent: 5,
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: DropdownMenu(
                                          menuItems:
                                              menuItemsForPreventiveActivities)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                              'Lütfen Oluşturma Tarihi Giriniz',
                                          labelText: 'Oluşturma Tarihi Giriniz',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            borderSide: new BorderSide(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                              'Lütfen Tespit Tarihi Giriniz',
                                          labelText: 'Tespit Tarihi Giriniz',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            borderSide: new BorderSide(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 150,
                                    child: Center(
                                      child: TextField(
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText: 'Lütfen açıklama giriniz',
                                          labelText: 'Açıklama',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,

                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            borderSide: new BorderSide(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: TextField(
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          hintText: 'Faaliyet İsmi Giriniz',
                                          labelText: 'Faaliyet İsmi',
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          //filled: true,
                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            borderSide: new BorderSide(),
                                          ),
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
                  const SizedBox(height: 50),
                  title(context, 'Olay Yeri'),
                  dividerWithIndents(),
                  const SizedBox(height: 50),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'İlişkili Departman:   ',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          endIndent: 5,
                          indent: 5,
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Center(
                                          child: DropdownMenu(
                                              menuItems:
                                                  menuItemsForDepartmentType))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  title(context, 'Kaza Araştırma'),
                  dividerWithIndents(),
                  const SizedBox(height: 50),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle:
                                        'Kök Neden Analizi Gerekiyor Mu?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle:
                                        'Yıllık Çalışma Planına Dahil Edilsin Mi?  '),
                              ],
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          endIndent: 5,
                          indent: 5,
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: true, onChanged: (value) {})),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: true, onChanged: (value) {})),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  title(context, 'Yeni Döküman Ekle'),
                  dividerWithIndents(),
                  const SizedBox(height: 50),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.all(8.0),
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
                        const VerticalDivider(
                          endIndent: 5,
                          indent: 5,
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            borderSide: new BorderSide(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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

                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            borderSide: new BorderSide(),
                                          ),
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
      padding: const EdgeInsets.all(8.0),
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
      padding: const EdgeInsets.all(8.0),
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

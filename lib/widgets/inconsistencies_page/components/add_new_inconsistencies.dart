import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewInconsistencies extends StatelessWidget {
  const AddNewInconsistencies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizantalController = ScrollController();
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              routingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Uygunsuzluklar',
                  routeName: inconsistenciesPageRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Yeni Uygunsuzluk Ekle',
                  routeName: addNewInconsistencies),
            ],
          ),
          Constant.dividerWithIndents(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(context, 'Genel Bilgiler'),
              Constant.dividerWithIndents(),
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
                                subtitle: 'Uygunsuzluk Kısa Tanımı:',
                                height: 50,
                                width: 150),
                            subtitle(subtitle: 'Tür:', height: 50, width: 150),
                            subtitle(
                                subtitle: 'Tarih:', height: 50, width: 150),
                            subtitle(subtitle: 'Saat:', height: 50, width: 150),
                            subtitle(
                                subtitle: 'Açıklama:', height: 150, width: 150),
                            subtitle(
                                subtitle: 'İlişkili Departman:',
                                height: 50,
                                width: 150)
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
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Uygunsuzluk kısa tanımını yapınız',
                                      labelText: 'Uygunsuzluk Tanımı Yapınız',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: DropdownMenu(
                                      menuItems:
                                      Constant.menuItemsForInconsistenciesType),
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
                                      hintText: 'Lütfen Tarih Giriniz',
                                      labelText: 'Tarih Giriniz',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                                      showTimePicker(
                                          hourLabelText: 'Saat',
                                          minuteLabelText: 'Dakika',
                                          cancelText: 'İPTAL',
                                          confirmText: 'Tamam',
                                          helpText: 'Saat Seçin',
                                          context: context,
                                          initialTime: TimeOfDay.now());
                                    },
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen Saat Giriniz',
                                      labelText: 'Saat Giriniz',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                                      hintText: 'Lütfen açıklama yapınız',
                                      labelText: 'Açıklama',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: DropdownMenu(
                                        menuItems: Constant.menuItemsForDepartmentType),
                                  )),
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
              Constant.dividerWithIndents(),
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
                                subtitle: 'Kök Neden Analizi Gerekiyor Mu?   '),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              title(context, 'Yeni Döküman Ekle'),
              Constant.dividerWithIndents(),
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
                                child: Text(
                                  'Ad   ',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                width: 150,
                                child: Text(
                                  'Düzenleme Tarihi   ',
                                  overflow: TextOverflow.ellipsis,
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
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
              title(context, 'Önceliklendirme'),
              Constant.dividerWithIndents(),
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
                                child: Text(
                                  'Risk Değerlendirme Metodu Seçiniz:',
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
                                  child: DropdownMenu(
                                      menuItems: Constant.menuItemsForRiskMethodType),
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
        child: Text(
          subtitle,
        ),
      ),
    );
  }
}

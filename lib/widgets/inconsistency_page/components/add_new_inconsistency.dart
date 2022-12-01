import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/inconsistency/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewInconsistency extends StatelessWidget {
  const AddNewInconsistency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(
                  pageName: 'Uygunsuzluklar',
                  routeName: inconsistenciesPageRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(
                  pageName: 'Yeni Uygunsuzluk Ekle',
                  routeName: addNewInconsistencies),
            ],
          ),
          Constant.dividerWithIndent,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    Constant.verticalDivider,
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: Constant.padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: Constant.padding,
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

                                      border: Constant.textFormFieldBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: DropdownMenu(
                                      menuItems: Constant
                                          .menuItemsForInconsistenciesType),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
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

                                      border: Constant.textFormFieldBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
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

                                      border: Constant.textFormFieldBorder
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
                                  child: TextField(
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen açıklama yapınız',
                                      labelText: 'Açıklama',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      //filled: true,

                                      border: Constant.textFormFieldBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: DropdownMenu(
                                        menuItems: Constant
                                            .menuItemsForDepartmentType),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             Constant.sizedBox50H,
              title(context, 'Kaza Araştırma'),
              Constant.dividerWithIndent,
              Constant.sizedBox50H,
              IntrinsicHeight(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: Constant.padding,
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
                    Constant.verticalDivider,
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: Constant.padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: Constant.padding,
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
                        padding: Constant.padding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Padding(
                              padding: Constant.padding,
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
                              padding: Constant.padding,
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
                   Constant.verticalDivider,
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: Constant.padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: Constant.padding,
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
                                      border: Constant.textFormFieldBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
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
              title(context, 'Önceliklendirme'),
              Constant.dividerWithIndent,
              Constant.sizedBox50H,
              IntrinsicHeight(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: Constant.padding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Padding(
                              padding: Constant.padding,
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
Constant.verticalDivider,
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: Constant.padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: DropdownMenu(
                                      menuItems:
                                          Constant.menuItemsForRiskMethodType),
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

  Padding subtitle(
      {required String subtitle,
      required double height,
      required double width}) {
    return Padding(
      padding: Constant.padding,
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

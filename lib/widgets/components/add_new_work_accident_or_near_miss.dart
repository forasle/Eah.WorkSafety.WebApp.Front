import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewWorkAccidentOrNearMiss extends StatelessWidget {
  const AddNewWorkAccidentOrNearMiss({Key? key}) : super(key: key);

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
                  pageName: 'Ramak Kala', routeName: nearMissPageRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Yeni İş Kazası/Ramak Kala Ekle',
                  routeName: addNewWorkAccidentOrNearMiss),
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
                                    subtitle: 'Olay Türü:',
                                    height: 50,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Tarih:', height: 50, width: 150),
                                subtitle(
                                    subtitle: 'Saat:', height: 50, width: 150),
                                subtitle(
                                    subtitle: 'Olay Tanımı:',
                                    height: 150,
                                    width: 150),
                                subtitle(
                                    subtitle: 'Yapılan İş:',
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
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Center(
                                          child: DropdownMenu(
                                        menuItems: menuItemsForEventType,
                                      ))),
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
                                          hintText:
                                              'Lütfen olay tanımını yapınız',
                                          labelText: 'Olay Tanımı',
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
                                          hintText:
                                              'Lütfen yapılan iş açıklaması giriniz',
                                          labelText: 'Yapılan İş',
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
                  title(context, 'Analiz'),
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
                                    subtitle: 'İlk Yardım Gerektirdi Mi?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle: 'Tıbbi Müdehale Yapıldı Mı?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle: 'Alt Yüklenici Kazası Mı?   '),
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
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: false, onChanged: (value) {})),
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
                                    subtitle: 'Maddi hasar var mı?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle: 'Kamera kaydı var mı?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle:
                                        'Operasyonel Kaza / Rutin İş Esnasında?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle:
                                        'İş durdu mu/aksadı mı? (Çalışan kayıp gün durumu hariç)?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle:
                                        'Olaya katkıda bulunan faktörler risk değerlendirmesinde belirtilmiş mi?   '),
                                subtitle(
                                    height: 50,
                                    width: 150,
                                    subtitle:
                                        'Risk değerlendirmede belirtilen önlemler alınmış mı? Çalışma şekillerine uyulmuş mu?   '),
                                subtitle(
                                    height: 100,
                                    width: 150,
                                    subtitle:
                                        'Kullanılması Gereken (Kullanılmamış) KKD:   '),
                                subtitle(
                                    height: 100,
                                    width: 150,
                                    subtitle: 'Sebep:   '),
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
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: false, onChanged: (value) {})),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: false, onChanged: (value) {})),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: false, onChanged: (value) {})),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: false, onChanged: (value) {})),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 50,
                                      child: Switch(
                                          value: false, onChanged: (value) {})),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 100,
                                            child: Center(
                                              child: TextField(
                                                maxLines: 3,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Kullanılması Gereken KKD Giriniz',
                                                  labelText: 'KKD Giriniz',
                                                  labelStyle: const TextStyle(
                                                      color: Colors.white),
                                                  //filled: true,
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(5.0),
                                                    borderSide:
                                                        new BorderSide(),
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
                                                  hintText:
                                                      'Lütfen Sebep Giriniz',
                                                  labelText: 'Sebep Giriniz',
                                                  labelStyle: const TextStyle(
                                                      color: Colors.white),
                                                  //filled: true,
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(5.0),
                                                    borderSide:
                                                        new BorderSide(),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  title(context, 'Tanık/Tanık İfadesi'),
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
                                        'Görgü tanığı var mı?   ',
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

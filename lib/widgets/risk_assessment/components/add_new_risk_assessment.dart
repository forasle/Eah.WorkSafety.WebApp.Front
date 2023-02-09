import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/risk_exposed_person_button.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/risk_assessment/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewRiskAssessment extends StatefulWidget {
  const AddNewRiskAssessment({Key? key}) : super(key: key);

  @override
  State<AddNewRiskAssessment> createState() => _AddNewRiskAssessmentState();
}

class _AddNewRiskAssessmentState extends State<AddNewRiskAssessment> {
  List<bool> methodType = [false, false]; //[fine kinney method, 5x5 matrix method]

  @override
  Widget build(BuildContext context) {
    //ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
                const Icon(Icons.arrow_right),
                RoutingBarWidget(pageName: 'Risk Değerlendirme', routeName: riskAssessmentPage),
                const Icon(Icons.arrow_right),
                RoutingBarWidget(pageName: 'Yeni Risk Değerlendirme Ekle', routeName: addNewRiskAssessment),
              ],
            ),
          ),
          Constant.dividerWithIndent,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(context, 'Risk Değerlendirme Bilgileri'),
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
                                subtitle(subtitle: 'Referans No:', height: 50, width: 150),
                                subtitle(subtitle: 'Revizyon Tarihi:', height: 50, width: 150),
                                subtitle(
                                    subtitle: 'Bir Sonraki (Azami) Risk Değerlendirme Tarihi', height: 50, width: 150),
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
                                          hintText: 'Referans No',
                                          labelText: 'Lütfen Risk Değerlendirme Revizyon Tarihini Giriniz',
                                          labelStyle: const TextStyle(color: Colors.white),
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
                                          hintText: 'Revizyon Tarihi',
                                          labelText: 'Lütfen Revizyon Tarihini Giriniz',
                                          labelStyle: const TextStyle(color: Colors.white),
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
                                          hintText: 'Bir Sonraki Risk Değerlendirme Tarihi',
                                          labelText: 'Lütfen Bir Sonraki Risk Değerlendirme Tarihini Giriniz',
                                          labelStyle: const TextStyle(color: Colors.white),
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
                  Constant.sizedBox50H,
                  title(context, 'Yapısal Özellikler'),
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
                                subtitle(subtitle: 'Risk Değerlendirme Şablonu Seçiniz:', height: 50, width: 150),
                                subtitle(subtitle: 'Risk Değerlendirme Yöntemi:', height: 100, width: 150),
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
                                const Padding(
                                  padding: Constant.padding,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      //child: DropdownMenu(menuItems: Constant.menuItemsForTemplate),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Constant.padding,
                                  child: SizedBox(
                                    height: 100,
                                    child: Wrap(children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              methodType = methodType.map<bool>((v) => false).toList();
                                              methodType[0] = true;
                                            });
                                          },
                                          child: const Text('Fine Kinney Metodu')),
                                      Constant.sizedBox10W,
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              methodType = methodType.map<bool>((v) => false).toList();
                                              methodType[1] = true;
                                            });
                                          },
                                          child: const Text('5x5 Matris Metodu'))
                                    ]),
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
                  Visibility(
                    visible: methodType[0],
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: Constant.padding,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        subtitle(subtitle: 'Genel Tehlike:', height: 50, width: 150),
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
                                                decoration: InputDecoration(
                                                  hintText: 'Genel Tehlike Adını Giriniz',
                                                  labelText: 'Genel Tehlike Adı',
                                                  labelStyle: const TextStyle(color: Colors.white),
                                                  //filled: true,
                                                  border: Constant.textFieldBorder,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Padding(
                                                  padding: Constant.padding,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      subtitle(subtitle: 'Mevcut Tehlike:', height: 50, width: 150),
                                                      subtitle(subtitle: 'Oluşacak Risk:', height: 50, width: 150),
                                                      subtitle(subtitle: 'Sonuç:', height: 50, width: 150),
                                                      subtitle(subtitle: 'Maruz Kalanlar:', height: 100, width: 150),
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
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: Constant.padding,
                                                        child: SizedBox(
                                                          height: 50,
                                                          child: Center(
                                                            child: TextField(
                                                              decoration: InputDecoration(
                                                                  hintText: 'Mevcut Tehlike Giriniz',
                                                                  labelText: 'Mevcut Tehlike',
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
                                                          height: 50,
                                                          child: Center(
                                                            child: TextField(
                                                              decoration: InputDecoration(
                                                                  hintText: 'Oluşacak Risk Giriniz',
                                                                  labelText: 'Oluşacak Risk',
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
                                                          height: 50,
                                                          child: Center(
                                                            child: TextField(
                                                              decoration: InputDecoration(
                                                                  hintText: 'Sonuç Giriniz',
                                                                  labelText: 'Sonuç',
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
                                                          child: Wrap(
                                                            children: const [
                                                              RiskExposedPersonButton(
                                                                text: 'Doktor',
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              RiskExposedPersonButton(
                                                                text: 'Hemşire',
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              RiskExposedPersonButton(
                                                                text: 'Teknisyen',
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              RiskExposedPersonButton(
                                                                text: 'Refakatçi',
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              RiskExposedPersonButton(
                                                                text: 'Misafir',
                                                              )
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Constant.sizedBox50H
                        ],
                      ),
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
                                    child: Center(
                                      child: Text(
                                        'Ad   ',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Constant.padding,
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
                                            hintText: 'Lütfen Düzenleme Tarihi Giriniz',
                                            labelText: 'Tarih Giriniz',
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
        child: Center(
          child: Text(
            subtitle,
          ),
        ),
      ),
    );
  }
}

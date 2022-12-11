import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/risk_assessment/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class RiskAssessmentDetailPage extends StatelessWidget {
  const RiskAssessmentDetailPage({Key? key}) : super(key: key);

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
              RoutingBarWidget(pageName: 'Risk Değerlendirme', routeName: riskAssessmentPage),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(pageName: 'Risk Değerlendirme Detay', routeName: riskAssessmentDetailPage),
            ],
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
                                subtitle(subtitle: 'Referans No:', height: 50, width: 150),
                                subtitle(subtitle: 'Belge Hazırlama Tarihi:', height: 50, width: 150),
                                subtitle(subtitle: 'Bir Sonraki Acil Durum Planı Tarihi:', height: 50, width: 150),
                                subtitle(subtitle: 'Toplanma Yeri:', height: 50, width: 150),
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
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [Text('Referans No')],
                                      )),
                                ),
                                Padding(
                                  padding: Constant.padding,
                                  child: SizedBox(
                                      height: 50,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [Text('01.01.2022')],
                                      )),
                                ),
                                Padding(
                                  padding: Constant.padding,
                                  child: SizedBox(
                                      height: 50,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [Text('01.02.2022')],
                                      )),
                                ),
                                Padding(
                                  padding: Constant.padding,
                                  child: SizedBox(
                                    height: 50,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [Text('Toplantı Odası')],
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

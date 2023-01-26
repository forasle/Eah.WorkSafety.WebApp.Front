import 'package:aeah_work_safety/blocs/occupation_disease/models/occupation_disease.dart';
import 'package:aeah_work_safety/constants/chronic_disease/constants.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class OccupationDiseaseDetailPage extends StatelessWidget {
  const OccupationDiseaseDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OccupationDisease _occupationDiseaseDetail = ModalRoute.of(context)?.settings.arguments as OccupationDisease;
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
              RoutingBarWidget(pageName: 'Kronik Hastalıklar', routeName: occupationDiseasesPageRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(pageName: 'Kronik Hastalık', routeName: occupationDiseaseDetailPageRoute),
            ],
          ),
          Constant.dividerWithIndent,
          Column(
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
                          children: [
                            subtitle(subtitle: 'Olay Türü:', height: 50, width: 150),
                            subtitle(subtitle: 'Tarih:', height: 50, width: 150),
                            subtitle(subtitle: 'Saat:', height: 50, width: 150),
                            subtitle(subtitle: 'Olay Tanımı:', height: 150, width: 150),
                            subtitle(subtitle: 'Yapılan İş:', height: 100, width: 150),
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
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('İş Kazası'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('01.01.2023'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [Text('00:00')]),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Olay Tanımı'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Yapılan İş'),
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
                                  children: const [
                                    Text('Acil'),
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
              Constant.sizedBox50,
              title(context, 'Analiz'),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            subtitle(height: 50, width: 150, subtitle: 'İlk Yardım Gerektirdi Mi?   '),
                            subtitle(height: 50, width: 150, subtitle: 'Tıbbi Müdehale Yapıldı Mı?   '),
                            subtitle(height: 50, width: 150, subtitle: 'Alt Yüklenici Kazası Mı?   '),
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
                              child: SizedBox(height: 50, child: Switch(value: true, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: true, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: false, onChanged: (value) {})),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Constant.sizedBox50,
              title(context, 'Kaza Araştırma'),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            subtitle(height: 50, width: 150, subtitle: 'Kök Neden Analizi Gerekiyor Mu?   '),
                            subtitle(height: 50, width: 150, subtitle: 'Maddi hasar var mı?   '),
                            subtitle(height: 50, width: 150, subtitle: 'Kamera kaydı var mı?   '),
                            subtitle(height: 50, width: 150, subtitle: 'Operasyonel Kaza / Rutin İş Esnasında?   '),
                            subtitle(
                                height: 50,
                                width: 150,
                                subtitle: 'İş durdu mu/aksadı mı? (Çalışan kayıp gün durumu hariç)?   '),
                            subtitle(
                                height: 50,
                                width: 150,
                                subtitle: 'Olaya katkıda bulunan faktörler risk değerlendirmesinde belirtilmiş mi?   '),
                            subtitle(
                                height: 50,
                                width: 150,
                                subtitle:
                                'Risk değerlendirmede belirtilen önlemler alınmış mı? Çalışma şekillerine uyulmuş mu?   '),
                            subtitle(height: 100, width: 150, subtitle: 'Kullanılması Gereken (Kullanılmamış) KKD:   '),
                            subtitle(height: 100, width: 150, subtitle: 'Sebep:   '),
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
                              child: SizedBox(height: 50, child: Switch(value: true, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: true, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: false, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: false, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: false, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: false, onChanged: (value) {})),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(height: 50, child: Switch(value: false, onChanged: (value) {})),
                            ),
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
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text('KKD'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: Constant.padding,
                                      child: SizedBox(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text('Sebep'),
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
                    ),
                  ],
                ),
              ),
              Constant.sizedBox50,
              title(context, 'Tanık/Tanık İfadesi'),
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
                              child: SizedBox(height: 50, child: Switch(value: true, onChanged: (value) {})),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Constant.sizedBox50,
              title(context, 'Dökümanlar'),
              Constant.dividerWithIndent,
              Constant.sizedBox50,
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

import 'package:aeah_work_safety/models/near_miss.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class InconsistenciesDetailPage extends StatelessWidget {
  const InconsistenciesDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NearMiss test;
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
                  pageName: 'Uygunsuzluklar',
                  routeName: inconsistenciesPageRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Uygunsuzluk Detayları',
                  routeName: workAccidentDetailPage),
            ],
          ),
          Constant.dividerWithIndents(),
          Column(
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
                          children: [
                            subtitle(
                                subtitle: 'Olay Türü:', height: 50, width: 150),
                            subtitle(
                                subtitle: 'Tarih:', height: 50, width: 150),
                            subtitle(subtitle: 'Saat:', height: 50, width: 150),
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
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Uygunsuzluk'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('01.01.2023'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text('00:00')]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Olay Tanımı'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
              const SizedBox(height: 50),
              title(context, 'Olay Yeri'),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
              const SizedBox(height: 50),
              title(context, 'Analiz'),
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
                                height: 100, width: 150, subtitle: 'Sebep:   '),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('KKD'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
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
              const SizedBox(height: 50),
              title(context, 'Tanık/Tanık İfadesi'),
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
              title(context, 'Dökümanlar'),
              Constant.dividerWithIndents(),
              const SizedBox(height: 50),
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

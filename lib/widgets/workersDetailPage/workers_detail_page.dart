import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/workersDetailPage/components/oldExperiences_data_table.dart';
import 'package:flutter/material.dart';

class WorkersDetailPage extends StatelessWidget {
  const WorkersDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizantalScrollController = ScrollController();
    return CustomScaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            routingBarWidget(pageName: 'Panaroma', routeName: panaromaRoute),
            Icon(Icons.arrow_right),
            routingBarWidget(
                pageName: 'Çalışanlar', routeName: workersMainPageRoute),
            Icon(Icons.arrow_right),
            routingBarWidget(
                pageName: 'Murat Doğan', routeName: workersDetailPageRoute),
          ],
        ),
        dividerWithIndents(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Çalışan Bilgileri',
                  style: Theme.of(context).textTheme.headline4),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        SizedBox.fromSize(
                          size: Size.fromRadius(125),
                          child: FittedBox(
                            child: Icon(Icons.person),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Düzenle'),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    endIndent: 75,
                    indent: 75,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Adı Soyadı:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'TC Kimlik No:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Cinsiyeti:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text('Yaş:    '),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Doğum Yeri:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Uyruğu:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Medeni Durumu:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Çocuk Sayısı:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Birim/Departman:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Calışan Sicil No:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Eğitim Durumu:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Mezun Olduğu Bölüm:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'İşe Giriş Tarihi:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Geçerli Görevine Başlama Tarihi:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Görevi:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text('Ünvanı:    '),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Birim/Departman:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Yaptığı İş Tanımı:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Risk Grupları:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(
                    endIndent: 75,
                    indent: 75,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Murat Doğan',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            '10000000000',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Erkek',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            '33',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'London',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Dünya Vatandaşı',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Evli',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            '2',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Arge',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'MM132',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Yükseköğretim',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Mühendislik Fakültesi',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            '10/05/2006 (16 yıl önce)',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            '10/05/2006 (16 yıl önce)',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            '8161.11 : ArGe Mühendisi',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Mühendis',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Arge',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          Text(
                            'Arge Mühendisi',
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.redAccent)),
                            child: Text(
                              'Alerji',
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {},
                          ),
                          sizedBoxBetweenPersonalDetailPage(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        dividerWithIndents(),
      ]),
    );
  }
}

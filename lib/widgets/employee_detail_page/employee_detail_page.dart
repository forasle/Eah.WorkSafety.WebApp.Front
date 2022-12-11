import 'package:aeah_work_safety/constants/employee/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter/material.dart';

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizontalScrollController = ScrollController();
    return CustomScaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
            const Icon(Icons.arrow_right),
            RoutingBarWidget(pageName: 'Çalışanlar', routeName: workersMainPageRoute),
            const Icon(Icons.arrow_right),
            RoutingBarWidget(pageName: 'Murat Doğan', routeName: workersDetailPageRoute),
          ],
        ),
        Constant.dividerWithIndent,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Çalışan Bilgileri', style: Theme.of(context).textTheme.headline4),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        SizedBox.fromSize(
                          size: const Size.fromRadius(125),
                          child: const FittedBox(
                            child: Icon(Icons.person),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Düzenle'),
                        ),
                      ],
                    ),
                  ),
                  Constant.verticalDivider,
                  Constant.sizedBox,
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Adı Soyadı:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'TC Kimlik No:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Cinsiyeti:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text('Yaş:    '),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Doğum Yeri:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Uyruğu:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Medeni Durumu:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Çocuk Sayısı:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Birim/Departman:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Calışan Sicil No:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Eğitim Durumu:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Mezun Olduğu Bölüm:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'İşe Giriş Tarihi:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Geçerli Görevine Başlama Tarihi:   ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Görevi:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text('Ünvanı:    '),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Birim/Departman:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Yaptığı İş Tanımı:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          Text(
                            'Risk Grupları:    ',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Constant.verticalDivider,
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Murat Doğan',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            '10000000000',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Erkek',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            '33',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'London',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Dünya Vatandaşı',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Evli',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            '2',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Arge',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'MM132',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Yükseköğretim',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Mühendislik Fakültesi',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            '10/05/2006 (16 yıl önce)',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            '10/05/2006 (16 yıl önce)',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            '8161.11 : ArGe Mühendisi',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Mühendis',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Arge',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          const Text(
                            'Arge Mühendisi',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Constant.sizedBoxForEmployee,
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
                            child: const Text(
                              'Alerji',
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {},
                          ),
                          Constant.sizedBoxForEmployee,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Constant.dividerWithIndent,
      ]),
    );
  }
}

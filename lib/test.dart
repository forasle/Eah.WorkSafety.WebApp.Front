import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Wrap(
                //alignment: WrapAlignment.spaceEvenly,
                children: [
              [
                'Kronik Hastalıklı Çalışan',
                '500',
                Colors.blueGrey,
                'Tüm Kaza ve Ramak Kalalar'
              ],
              ['Yapılmamış Muayene', '399', Colors.yellowAccent.shade700, '-'],
              [
                'Yapılmamış İşe Giriş Muayenesi',
                '199',
                Colors.blueAccent.shade700,
                '-'
              ],
              [
                'Geçerli Muayene Oranı',
                '0.20',
                Colors.orangeAccent.shade700,
                '-'
              ],
              [
                'Kronik Hastalıklı Çalışan Yüzdesi',
                '20',
                Colors.blueGrey.shade700,
                '-'
              ],
              [
                'Ortalama Çalışma Süresi(Yıl)',
                '9.59',
                Colors.yellowAccent.shade700,
                '-'
              ],
              ['Ortalama Yaş', '29', Colors.lightBlueAccent.shade700, '-'],
              ['Toplam Muayene', '-', Colors.orangeAccent.shade700, '-'],
              ['Toplam Periyodik Muayene', '-', Colors.blueGrey.shade700, '-'],
              [
                'Toplam İşe Giriş Muayenesi',
                '-',
                Colors.redAccent.shade700,
                '-'
              ],
            ]
                    .map(
                      (e) => CardWidget(
                          cardText: e[0] as String,
                          cardDouble: e[1] as String,
                          cardColor: e[2] as Color,
                          cardSubText: e[3] as String),
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}

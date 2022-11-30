import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter/material.dart';

class AddNewWorker extends StatelessWidget {
  const AddNewWorker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizantalScrollController = ScrollController();
    return CustomScaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            routingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
            Icon(Icons.arrow_right),
            routingBarWidget(
                pageName: 'Yeni Çalışan Ekle', routeName: workersMainPageRoute),
            Icon(Icons.arrow_right),
          ],
        ),
        Constant.dividerWithIndents(),
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
                    flex: 1,
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
                          child: Text('Ekle'),
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
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Ad-Soyad',
                                labelText: 'Çalışan Adı-Soyadını Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'TC Kimlik No',
                                labelText: 'TC Kimlik No Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Yaş',
                                labelText: 'Yaş Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                              child: DropdownMenu(
                            menuItems: Constant.menuItemsForGender,
                          )),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Doğum Yeri',
                                labelText: 'Doğum Yeri Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Uyruğu',
                                labelText: 'Uyruğu Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Medeni Durumu',
                                labelText: 'Medeni Durumu Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Çocuk Sayısı',
                                labelText: 'Çocuk Sayısı Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Birim-Departman',
                                labelText: 'Birim-Departman Seçiniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Çalışan Sicil No',
                                labelText: 'Çalışan Sicil No Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Eğitim Durumu',
                                labelText: 'Eğitim Durumu Seçiniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Mezun Olduğu Bölüm',
                                labelText: 'Mezun Olduğu Bölüm Seçiniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'İşe Giriş Tarihi',
                                labelText: 'İşe Giriş Tarihi Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Geçerli Görevine Başlama Tarihi ',
                                labelText:
                                    'Geçerli Görevine Başlama Tarihi Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Görevi',
                                labelText: 'Görevini Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Ünvanı',
                                labelText: 'Ünvanını Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Yaptığı İş Tanımı',
                                labelText: 'Yaptığı İş Tanımını Giriniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                          Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Risk Grupları',
                                labelText: 'Risk Gurubu Seçiniz',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                //filled: true,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Constant.sizedBoxBetweenPersonalDetailPage(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Constant.dividerWithIndents(),
      ]),
    );
  }
}

import 'package:aeah_work_safety/widgets/components/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewEducation extends StatelessWidget {
  const AddNewEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizantalController = ScrollController();
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              routingBarWidget(pageName: 'Panaroma', routeName: panaromaRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Eğitim', routeName: educationPageRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Yeni Eğitim Ekle', routeName: addNewEducation),
            ],
          ),
          dividerWithIndents(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(context, 'Eğitim Seans Bilgileri'),
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
                            subtitle(subtitle: 'Süre:', height: 50, width: 150),
                            subtitle(
                                subtitle: 'Başlangıç Tarihi:',
                                height: 50,
                                width: 150),
                            subtitle(
                                subtitle: 'Bitiş Tarihi:',
                                height: 50,
                                width: 150),
                            subtitle(
                                subtitle: 'Sertifika Tarihi:',
                                height: 50,
                                width: 150),
                            subtitle(
                                subtitle: 'Eğitim Yeri:',
                                height: 50,
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
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: TextField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen Eğitim Süresi Giriniz',
                                      labelText: 'Süre',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                                          'Lütfen Eğitim Başlangıç Tarihini Giriniz',
                                      labelText: 'Başlangıç Tarihini Giriniz',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                                          'Lütfen Eğitim Bitiş Tarihini Giriniz',
                                      labelText: 'Bitiş Tarihini Giriniz',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                                          'Lütfen Eğitim Sertifika Tarihini Giriniz',
                                      labelText: 'Sertifika Tarihini Giriniz',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
                                  child: TextField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen eğitim yerini giriniz',
                                      labelText: 'Eğitim Yeri',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
              title(context, 'Eğitici Bilgileri'),
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
                                    'Eğitici:   ',
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
                                      hintText: 'Lütfen Eğitici Adını Giriniz',
                                      labelText: 'Eğitici Adı',
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
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
        child: Text(
          subtitle,
        ),
      ),
    );
  }
}

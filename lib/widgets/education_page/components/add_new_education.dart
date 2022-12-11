import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/education/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';

class AddNewEducation extends StatelessWidget {
  const AddNewEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(pageName: 'Eğitim', routeName: educationPageRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(pageName: 'Yeni Eğitim Ekle', routeName: addNewEducation),
            ],
          ),
          Constant.dividerWithIndent,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(context, 'Eğitim Seans Bilgileri'),
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
                            subtitle(subtitle: 'Süre:', height: 50, width: 150),
                            subtitle(subtitle: 'Başlangıç Tarihi:', height: 50, width: 150),
                            subtitle(subtitle: 'Bitiş Tarihi:', height: 50, width: 150),
                            subtitle(subtitle: 'Sertifika Tarihi:', height: 50, width: 150),
                            subtitle(subtitle: 'Eğitim Yeri:', height: 50, width: 150),
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
                                        hintText: 'Lütfen Eğitim Süresi Giriniz',
                                        labelText: 'Süre',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,
                                        border: Constant.textFormFieldBorder),
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
                                        hintText: 'Lütfen Eğitim Başlangıç Tarihini Giriniz',
                                        labelText: 'Başlangıç Tarihini Giriniz',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,

                                        border: Constant.textFormFieldBorder),
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
                                        hintText: 'Lütfen Eğitim Bitiş Tarihini Giriniz',
                                        labelText: 'Bitiş Tarihini Giriniz',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,

                                        border: Constant.textFormFieldBorder),
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
                                        hintText: 'Lütfen Eğitim Sertifika Tarihini Giriniz',
                                        labelText: 'Sertifika Tarihini Giriniz',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,

                                        border: Constant.textFormFieldBorder),
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
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                        hintText: 'Lütfen eğitim yerini giriniz',
                                        labelText: 'Eğitim Yeri',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,
                                        border: Constant.textFormFieldBorder),
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
              title(context, 'Eğitici Bilgileri'),
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
                                        hintText: 'Lütfen Eğitici Adını Giriniz',
                                        labelText: 'Eğitici Adı',
                                        labelStyle: const TextStyle(color: Colors.white),
                                        //filled: true,
                                        border: Constant.textFormFieldBorder),
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
        child: Text(
          subtitle,
        ),
      ),
    );
  }
}

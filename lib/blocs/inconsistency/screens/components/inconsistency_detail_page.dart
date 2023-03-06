
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/constants/inconsistency/constants.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InconsistencyDetailPage extends StatelessWidget {
  const InconsistencyDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _inconsistencyResponse = ModalRoute.of(context)!.settings.arguments as Inconsistency;
    //context.read<InconsistencyBloc>().add(const InconsistencyInitialEvent());
    final _formKey = GlobalKey<FormBuilderState>();
    return CustomScaffold(
      body: FormBuilder(
        key: _formKey,
        onChanged: () {
          _formKey.currentState!.save();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'Uygunsuzluklar', routeName: inconsistenciesPageRoute),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'Uygunsuzluk Detayları', routeName: inconsistencyDetailPage),
                  ],
                ),
              ),
            ),
            Constant.dividerWithIndent,
            title(context, 'Genel Bilgiler'),
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
                        children: [
                          subtitle(subtitle: 'Uygunsuzluk Tarihi:', height: 80, width: 150),
                          subtitle(subtitle: 'Risk Skoru:', height: 80, width: 150),
                          subtitle(subtitle: 'Uygunsuzluk Tanımı:', height: 150, width: 150),
                        ],
                      ),
                    ),
                  ),
                  Constant.verticalDivider,
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: Constant.padding,
                      child: Column(
                        children: [
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: FormBuilderTextField(
                                  readOnly: true,
                                  initialValue: DateFormat('dd-MM-yyyy    HH:mm').format(_inconsistencyResponse.creationDate!),
                                  name: 'date',
                                  decoration: InputDecoration(
                                    labelText: 'Uygunsuzluk Tarihi',
                                    //filled: true,
                                    border: Constant.textFieldBorder,
                                  ),
                                  // locale: const Locale.fromSubtags(languageCode: 'fr'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderTextField(
                                readOnly: true,
                                name: "riskScore",
                                initialValue:
                                    _inconsistencyResponse.riskScore.toString(),
                                //controller: lostDayController,
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Risk Skoru Giriniz',
                                  labelText: 'Risk Score',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 150,
                              child: Center(
                                child: FormBuilderTextField(
                                  readOnly: true,
                                  initialValue: _inconsistencyResponse.information,
                                  name: "information",
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Lütfen Uygunsuzluk Tanımını Yapınız',
                                    labelText: 'Uygunsuzluk Tanımı',
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
                        children: [
                          subtitle(subtitle: 'Departman:', height: 90, width: 150),
                          subtitle(subtitle: 'Olay Yeri:', height: 80, width: 150),
                          subtitle(subtitle: 'Kök Neden Analizi Gereksinimi:', height: 80, width: 150),
                          subtitle(subtitle: 'Uygunsuzluk Durumu:', height: 80, width: 150),
                        ],
                      ),
                    ),
                  ),
                  Constant.verticalDivider,
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: Constant.padding,
                      child: Column(
                        children: [
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 90,
                              child: FormBuilderTextField(
                                readOnly: true,
                                initialValue: _inconsistencyResponse.department,
                                name: 'deparment',
                                decoration: InputDecoration(
                                  hintText: 'Departman Seçiniz',
                                  labelText: 'Departman',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                                //valueTransformer: (val) => val?.toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderTextField(
                                readOnly: true,
                                initialValue: _inconsistencyResponse.sceneOfInconsistency,
                                name: "referenceNumber",
                                decoration: InputDecoration(
                                  hintText: 'Lütfen Uygunsuzluk Yerini Giriniz',
                                  labelText: 'Uygunsuzluk Yeri',
                                  //filled: true,
                                  border: Constant.textFieldBorder,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderCheckbox(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: 'Kök Neden Analizi Seçiniz',
                                  labelText: 'Kök Neden Analizi',
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'rootCauseAnalysisRequirement',
                                initialValue: _inconsistencyResponse.rootCauseAnalysisRequirement,
                                title: const Text("Kök Neden Gereksinimi"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constant.padding,
                            child: SizedBox(
                              height: 80,
                              child: FormBuilderCheckbox(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: 'Uygunsuzluk Durumunu Seçiniz',
                                  labelText: 'Uygunsuzluk Durumu',
                                  border: Constant.textFieldBorder,
                                ),
                                name: 'status',
                                initialValue: _inconsistencyResponse.status,
                                title: const Text("Uygunsuzluk Durumu"),
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
          ],
        ),
      ),
    );
  }
}

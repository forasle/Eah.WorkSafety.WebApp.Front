import 'package:aeah_work_safety/blocs/accident/add_new_accident_form_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:aeah_work_safety/blocs/accident/screens/components/add_new_accident.dart';
import 'package:aeah_work_safety/blocs/accident/update_accident_form_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AccidentDetailPage extends StatelessWidget {
  const AccidentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Accident _accidentDetail = ModalRoute.of(context)?.settings.arguments as Accident;
    context.read<EmployeeBloc>().add(GetEmployeeDataById(id: _accidentDetail.affectedEmployeeWithPropertyForAccident[0].employeeId));
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => UpdateAccidentFormBloc(),
        child: Builder(builder: (context) {
          final formBloc = context.read<UpdateAccidentFormBloc>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
                      const Icon(Icons.arrow_right),
                      RoutingBarWidget(pageName: 'İş Kazaları', routeName: accidentPageRoute),
                      const Icon(Icons.arrow_right),
                      RoutingBarWidget(pageName: 'İş Kazası', routeName: addNewAccident),
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
                            subtitle(subtitle: 'Adı Soyadı:', height: 80, width: 150),
                            subtitle(subtitle: 'Kaza Tarihi:', height: 80, width: 150),
                            subtitle(subtitle: 'Kayıp Gün Sayısı:', height: 80, width: 150),
                            subtitle(subtitle: 'Olay Tanımı:', height: 150, width: 150),
                            subtitle(subtitle: 'Yapılan İş:', height: 150, width: 150),
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
                                child: BlocBuilder<EmployeeBloc, EmployeeState>(
                                  builder: (context, state) {
                                    if(state is EmployeeDataByIdLoaded){
                                      return TextFormField(
                                        readOnly: true,
                                        initialValue: state.employee.name.toString()+" "+state.employee.surname,
                                        //textFieldBloc: formBloc.identificationNumber,
                                        decoration: InputDecoration(
                                          labelText: 'Adı Soyadı',

                                          //filled: true,
                                          border: Constant.textFieldBorder,
                                        ),
                                      );
                                    }
                                    else{
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 80,
                                child: Center(
                                  child: TextFormField(
                                    readOnly: true,
                                    initialValue: _accidentDetail.date.toString(),
                                    decoration: InputDecoration(
                                      hintText: "Lütfen Kaza Tarihi Giriniz",
                                      labelText: 'Kaza Tarihi',
                                      //filled: true,
                                      border: Constant.textFieldBorder,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 80,
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue: _accidentDetail.affectedEmployeeWithPropertyForAccident[0].lostDays.toString(),
                                  decoration: InputDecoration(
                                    labelText: 'Kayıp Gün',
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
                                  child: TextFormField(
                                    readOnly: true,
                                    initialValue: _accidentDetail.accidentInfo,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen Olay Tanımını Yapınız',
                                      labelText: 'Olay Tanımı',
                                      //filled: true,
                                      border: Constant.textFieldBorder,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 150,
                                child: Center(
                                  child: TextFormField(
                                    readOnly: true,
                                    initialValue: _accidentDetail.performedJob,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: 'Lütfen Yapılan İşi Giriniz',
                                      labelText: 'Yapılan İş',
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
                            subtitle(subtitle: 'Olayın Konusu:', height: 80, width: 150),
                            subtitle(subtitle: 'Alınması Gereken Önlem:', height: 80, width: 150),
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
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue: _accidentDetail.relatedDepartment.toString(),
                                  decoration: InputDecoration(
                                    hintText: 'Departman Seçiniz',
                                    labelText: 'Departman',
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
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue: _accidentDetail.referenceNumber,
                                  decoration: InputDecoration(
                                    hintText: 'Olay Yeri Giriniz',
                                    labelText: 'Olay Yeri',
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
                                child: CheckboxGroupFieldBlocBuilder<String>(
                                  
                                  multiSelectFieldBloc: formBloc.theSubjectOfTheAccidentStringList,
                                  decoration: InputDecoration(
                                    hintText: 'Olayın Konusunu Seçiniz',
                                    labelText: 'Olayın Konusu',
                                    //filled: true,
                                    border: Constant.textFieldBorder,
                                  ),
                                  groupStyle: const ListGroupStyle(

                                    //width: 500,
                                    //width: 800,
                                    scrollDirection: Axis.horizontal,
                                    height: 300,
                                  ),
                                  itemBuilder: (context, item) => FieldItem(
                                    child: Text(item),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: Constant.padding,
                              child: SizedBox(
                                height: 80,
                                child: CheckboxGroupFieldBlocBuilder<String>(
                                  multiSelectFieldBloc: formBloc.precautionsToBeTakenStringList,
                                  decoration: InputDecoration(
                                    hintText: 'Alınması Gereken Önlem',
                                    labelText: 'Alınması Gereken Önlem',
                                    //filled: true,
                                    border: Constant.textFieldBorder,
                                  ),
                                  groupStyle: const ListGroupStyle(
                                    //width: 500,
                                    //width: 800,
                                    scrollDirection: Axis.horizontal,
                                    height: 80,
                                  ),
                                  itemBuilder: (context, item) => FieldItem(
                                    child: Text(item),
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
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: formBloc.cancelSubmission,
                      child: const Text("İPTAL"),
                    ),
                    const SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: formBloc.submit,
                      child: const Text("KAYDET"),
                    ),
                  ],
                ),
              ),
              Constant.sizedBox50
            ],
          );
        }),
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

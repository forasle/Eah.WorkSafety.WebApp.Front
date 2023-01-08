import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _filter = "";
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        onSaved: (value) {
          _filter = value!;
        },
        validator: (value) {
          if (value!.length < 4) {
            return 'Filtre 3 karakterden kısa olamaz';
          }
          else{
            _formKey.currentState!.save();
            context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: _filter));
          }
          return null;
        },
        decoration: (const InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.person),
            hintText: 'Filtrele',
            labelText: 'Filtrelenecek Kelimeyi Yazınız')),
      ),
    );
  }
}

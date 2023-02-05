import 'package:aeah_work_safety/blocs/inconsistency/inconsistency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _filter = "";
    return BlocBuilder<InconsistencyBloc, InconsistencyState>(
      builder: (context, state) {
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
              else {
                _formKey.currentState!.save();
                // context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: _filter));
              }

              return null;
            },
            onChanged: (value) {
              if(value.length>3){
                context.read<InconsistencyBloc>().add(GetInconsistencyFiltered(filter: value));
              }
            },
            decoration: (InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.person),
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<InconsistencyBloc>().add(const GetInconsistencyData());
                  },
                  icon: const Icon(Icons.clear),
                ),
                hintText: 'Filtrele',
                labelText: 'Filtrelenecek Kelimeyi Yazınız')),
          ),
        );
      },
    );
  }
}
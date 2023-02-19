import 'package:aeah_work_safety/blocs/near_miss/near_miss_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchBarController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return BlocBuilder<NearMissBloc, NearMissState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: searchBarController,
            validator: (value) {
              if (value!.length < 4) {
                return 'Filtre 3 karakterden kısa olamaz';
              } else {
                _formKey.currentState!.save();
                // context.read<NearMissBloc>().add(GetNearMissFiltered(filter: _filter));
              }
              return null;
            },
            autofocus: true,

            onChanged: (value) {
              if (value.length > 3) {
                context.read<NearMissBloc>().add(GetNearMissFiltered(filter: value, needsRefresh: true));
              }
              else{
                context.read<NearMissBloc>().add(const GetNearMissData(needsRefresh: true));
              }
            },
            decoration: (InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.person),
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<NearMissBloc>().add(const GetNearMissData(needsRefresh: true));
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

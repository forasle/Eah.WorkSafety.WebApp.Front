part of 'add_new_preventive_activity_bloc.dart';

abstract class AddNewPreventiveActivityEvent extends Equatable {
  const AddNewPreventiveActivityEvent();
  @override
  List<Object> get props => [];
}

class CreateNewPreventiveActivity extends AddNewPreventiveActivityEvent{
  final Map<String, dynamic> preventiveActivity;
  const CreateNewPreventiveActivity({required this.preventiveActivity});

  @override
  List<Object> get props => [preventiveActivity];
}
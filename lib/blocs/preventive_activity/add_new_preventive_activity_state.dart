part of 'add_new_preventive_activity_bloc.dart';

abstract class AddNewPreventiveActivityState extends Equatable {
  const AddNewPreventiveActivityState();
}

class AddNewPreventiveActivityInitial extends AddNewPreventiveActivityState {
  @override
  List<Object> get props => [];
  const AddNewPreventiveActivityInitial();
}

class NewPreventiveActivityCreated extends AddNewPreventiveActivityState{
  final String message;

  const NewPreventiveActivityCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewPreventiveActivityCreationError extends AddNewPreventiveActivityState{
  final String message;

  const NewPreventiveActivityCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}

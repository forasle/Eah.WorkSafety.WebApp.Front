
part of 'preventive_activity_by_id_bloc.dart';

abstract class PreventiveActivityByIdState extends Equatable {
  const PreventiveActivityByIdState();
}

class PreventiveActivityByIdInitial extends PreventiveActivityByIdState {
  @override
  List<Object> get props => [];
}

class PreventiveActivityDataLoadedById extends PreventiveActivityByIdState{
  final PreventiveActivity preventiveActivity;

  const PreventiveActivityDataLoadedById({required this.preventiveActivity});

  @override
  List<Object?> get props => [preventiveActivity];
}

class PreventiveActivityByIdDataError extends PreventiveActivityByIdState{
  final String message;

  const PreventiveActivityByIdDataError({required this.message});

  @override
  List<Object?> get props => [message];

}

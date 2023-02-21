part of 'delete_preventive_activity_bloc.dart';

abstract class DeletePreventiveActivityEvent extends Equatable {
  const DeletePreventiveActivityEvent();
}

class DeletePreventiveActivity extends DeletePreventiveActivityEvent{
  final int id;
  const DeletePreventiveActivity({required this.id});

  @override
  List<Object> get props => [id];
}

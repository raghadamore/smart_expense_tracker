import 'package:equatable/equatable.dart';

abstract class Failuer extends Equatable {}
class OfflineFailure extends Failuer {
  @override
  List<Object?> get props => [];
}
class ServerFailure extends Failuer {
  @override
  List<Object?> get props => [];
  
}
class EmptyCacheFailure extends Failuer {
  @override
  List<Object?> get props => [];
  
}

class DatabaseFailure extends Failuer {
  @override
  List<Object?> get props => [];
  
}
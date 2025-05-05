import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shein_ui_clone/core/errors/error.dart';

// Base class for Use Cases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// Used when no parameters are needed
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

// Used for Stream Use Cases
abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

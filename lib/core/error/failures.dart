abstract class Failure {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

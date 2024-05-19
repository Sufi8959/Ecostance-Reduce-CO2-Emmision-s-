class Failure {
  String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure({message}) : super(message);
}

class ClientFailure extends Failure {
  ClientFailure({message}) : super(message);
}

class UnAuthorizedFailure extends Failure {
  UnAuthorizedFailure(message) : super(message);
}

class AccountHold extends Failure {
  AccountHold({message}) : super(message);
}

class PrimaryEmalAtemptsExceeded extends Failure {
  PrimaryEmalAtemptsExceeded({message}) : super(message);
}

class ReviewAlreadyAdded extends Failure {
  ReviewAlreadyAdded(super.message);
}

extension GenericFailiure on Failure {
  Failure orGeneric(String message) {
    return this is ClientFailure ? this : ServerFailure(message: message);
  }
}

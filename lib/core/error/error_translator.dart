import 'package:injectable/injectable.dart';

import 'exceptions.dart';

/// convert exception to error.
@lazySingleton
class ErrorTranslator {
  String call(Object err) {
    // Todo - handle exception types.
    if (err is NotFoundException) return 'User Not Found!';
    if (err is WrongInfoException) return 'Wrong information!';

    return 'Something went wrong! Try again.';
  }
}

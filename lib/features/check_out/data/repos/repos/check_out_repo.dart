import 'package:dartz/dartz.dart';

import '../../../../../core/network/error_handler.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      {required String amount, required String currency});
}


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/network/error_handler.dart';
import '../../../../../core/network/stripe_service.dart';
import 'check_out_repo.dart';

class CheckOutRepoImplementation extends CheckOutRepo {
  final StripeService _stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required String amount, required String currency}) async {
    try {
      await _stripeService.makePayment(amount: amount, currency: currency);

      return const Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(Failure(errorMsg: e.toString()));
      } else {
        return Left(Failure(errorMsg: e.toString()));
      }
    }
  }
}

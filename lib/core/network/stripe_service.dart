import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/check_out/data/models/payment_intent_model/payment_intent_model.dart';
import 'api_keys.dart';
import 'stripe_api_service.dart';

class StripeService {
  final ApiService _apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      {required String amount, required String currency}) async {
    var response = await _apiService.post(
        url: 'https://api.stripe.com/v1/payment_intents',
        data: {'amount': amount, 'currency': currency},
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType);

    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'ExampleInc',
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required String amount, required String currency}) async {
    var paymentIntentModel =
        await createPaymentIntent(amount: amount, currency: currency);

    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}

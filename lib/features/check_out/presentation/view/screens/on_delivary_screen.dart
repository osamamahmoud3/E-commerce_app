import 'package:ecommerce/features/check_out/presentation/view/widgets/address_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class OnDelivaryScreen extends StatelessWidget {
  const OnDelivaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                S.of(context).Your_order_will_be_delivered_soon,
                style: AppStyles.font18Blod,
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: ListTile(
                      leading: const Icon(
                        Icons.check,
                        color: AppColors.primaryColor,
                      ),
                      title: Text(S.of(context).Kur_Delivered),
                      subtitle: Text(location),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                          ),
                          Text(
                            S.of(context).minutes,
                            style: AppStyles.font18Blod,
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Lottie.asset(
                'assets/animate_images/delivery.json',
                repeat: true,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              CustomButton(
                bgColor: AppColors.primaryColor,
                text: Text(S.of(context).back_to_home),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

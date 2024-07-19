import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../settings/presentation/controller/about_app_cubit/about_app_cubit.dart';

class AboutDetails extends StatelessWidget {
  const AboutDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutAppCubit, AboutAppState>(
      builder: (context, state) {
        if (state is AboutAppSuccess) {
          return Text(
            state.aboutEntity.aboutApp,
            style: AppStyles.font14SemiBold.copyWith(color: Colors.black45),
          );
        } else if (state is AboutAppFailure) {
          return Text(state.errorMsg);
        } else {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3),
            child: Center(
              child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.secondaryColor,
                  ))),
            ),
          );
        }
      },
    );
  }
}

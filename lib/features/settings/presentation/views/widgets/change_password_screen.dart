import 'package:ecommerce/core/notifications/local_notifications.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/settings/presentation/controller/change_password/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../generated/l10n.dart';
import '../../../../authentication/presentation/view/widgets/text_feild_component.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordLoading) {
              customLoadingIndicator(context);
            } else if (state is ChangePasswordSuccess) {
              LocalNotificationService.showbasicNotification(
                  massBody:S.of(context).Password_changed_successfully);
              Navigator.pop(context);
              Navigator.pop(context);
            } else if (state is ChangePasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                  content: Text(state.errorMsg),
                ),
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFieldComponent(
                    controller: oldPassword,
                    title: S.of(context).Current_Password,
                    icon: SvgPicture.asset('assets/images/Unlock.svg'),
                    hint: S.of(context).Enter_Your_Current_Password),
                const SizedBox(
                  height: 20,
                ),
                TextFieldComponent(
                    controller: newPassword,
                    title: S.of(context).New_Password,
                    icon: SvgPicture.asset('assets/images/Unlock.svg'),
                    hint: S.of(context).Enter_Your_New_Password),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  bgColor: AppColors.secondaryColor,
                  text: Text(
                    S.of(context).Change_Password,
                    style:
                        AppStyles.font18SemiBold.copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<ChangePasswordCubit>(context)
                        .changePassword(
                            oldPassword: oldPassword.text,
                            newPassword: newPassword.text);
                  },
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}

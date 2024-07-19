import 'dart:io';

import 'package:ecommerce/core/dependency_injection/service_locator.dart';
import 'package:ecommerce/features/authentication/presentation/view/widgets/error_dialog.dart';
import 'package:ecommerce/features/authentication/presentation/view/widgets/text_feild_component.dart';
import 'package:ecommerce/features/settings/data/repos/settings_repo_impl.dart';
import 'package:ecommerce/features/settings/presentation/controller/update_user_data_cubit.dart/updata_user_data_cubit.dart';
import 'package:ecommerce/features/settings/presentation/controller/user_info_cubit/user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/notifications/local_notifications.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../generated/l10n.dart';

class ModifyScreen extends StatefulWidget {
  const ModifyScreen(
      {super.key,
      required this.userImage,
      required this.name,
      required this.email,
      required this.phone});
  final String userImage;
  final String name;
  final String email;

  final String phone;

  @override
  State<ModifyScreen> createState() => _ModifyScreenState();
}

class _ModifyScreenState extends State<ModifyScreen> {
  File image = File('');
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit(getIt<SettingsRepoimpl>()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: BlocConsumer<UpdataUserDataCubit, UpdataUserDataState>(
              listener: (context, state) {
                if (state is UpdataUserDataFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                      content: Text(state.errorMsg),
                    ),
                  );
                  Navigator.pop(context);
                } else if (state is UpdataUserDataSuccess) {
                  LocalNotificationService.showbasicNotification(
                      massBody: S.of(context).Data_updated_successfully);

                  Navigator.pop(context);
                  Navigator.pop(context);
                } else if (state is UpdataUserDataFailure) {
                  errorDialog(context, state.errorMsg);
                } else if (state is UpdataUserDataLoading) {
                  customLoadingIndicator(context);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          pickImage(context);
                        },
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: image.path == ''
                              ? NetworkImage(widget.userImage) as ImageProvider
                              : FileImage(image),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFieldComponent(
                          onSubmitted: (data) {
                            name.text = data;
                          },
                          title: S.of(context).User_Name,
                          icon:
                              SvgPicture.asset('assets/images/email_icon.svg'),
                          hint: S.of(context).Name,
                          controller: name..text = widget.name),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFieldComponent(
                          onSubmitted: (data) {
                            email.text = data;
                          },
                          title: S.of(context).Email,
                          icon:
                              SvgPicture.asset('assets/images/email_icon.svg'),
                          hint: S.of(context).Email,
                          controller: email..text = widget.email),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFieldComponent(
                          onSubmitted: (data) {
                            phone.text = data;
                          },
                          title: S.of(context).Phone_Number,
                          icon:
                              SvgPicture.asset('assets/images/email_icon.svg'),
                          hint: S.of(context).Phone_Number,
                          controller: phone..text = widget.phone),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        bgColor: AppColors.secondaryColor,
                        text: Text(
                          'Update Data',
                          style: AppStyles.font18SemiBold
                              .copyWith(color: Colors.white),
                        ),
                        onPressed: () async {
                          await BlocProvider.of<UpdataUserDataCubit>(context)
                              .updateUserData(
                                  image: image.path,
                                  name: name.text,
                                  email: email.text,
                                  phone: phone.text);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage(BuildContext context) async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickImage != null) {
        image = File(pickImage.path);
      } else {
        print('No image selected.');
      }
    });
  }
}

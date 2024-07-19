import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:ecommerce/features/settings/presentation/controller/update_user_data_cubit.dart/updata_user_data_cubit.dart';
import 'package:ecommerce/features/settings/presentation/controller/user_info_cubit/user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependency_injection/service_locator.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/repos/settings_repo_impl.dart';
import 'modify_screen.dart';

class SettingsUserCard extends StatefulWidget {
  const SettingsUserCard({
    super.key,
  });

  @override
  State<SettingsUserCard> createState() => _SettingsUserCardState();
}

class _SettingsUserCardState extends State<SettingsUserCard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInfoCubit, UserInfoState>(
      listener: (context, state) {
        if (state is UserInfoFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
              content: Text(state.errorMsg),
            ),
          );
        } else if (state is UserInfoLaoding) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        if (state is UserInfoSuccess) {
          return BigUserCard(
            backgroundColor: const Color(0XFF2A629A),
            userName: state.userDataEntity.userName,
            userMoreInfo: Text(
              state.userDataEntity.userEmail,
              style: AppStyles.font13Medium.copyWith(
                  color: Colors.white, overflow: TextOverflow.ellipsis),
              maxLines: 1,
            ),
            userProfilePic:
                NetworkImage(state.userDataEntity.userImage, scale: 4),
            cardActionWidget: SettingsItem(
              icons: Icons.edit,
              iconStyle: IconStyle(
                withBackground: true,
                borderRadius: 50,
                backgroundColor: Colors.yellow[600],
              ),
              title: S.of(context).Modify,
              subtitle: S.of(context).Tap_to_change_your_data,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => UpdataUserDataCubit(
                        getIt<SettingsRepoimpl>(),
                      ),
                      child: ModifyScreen(
                        name: state.userDataEntity.userName,
                        email: state.userDataEntity.userEmail,
                        phone: state.userDataEntity.userPhone,
                        userImage: state.userDataEntity.userImage,
                      ),
                    ),
                  ),
                ).then((_) {
                  setState(() {
                    BlocProvider.of<UserInfoCubit>(context).getUserData();
                  });
                });
              },
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: MediaQuery.sizeOf(context).height / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color:  Color(0xFF2A629A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white.withOpacity(.1),
                  ),
                ),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

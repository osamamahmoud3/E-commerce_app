import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/settings/domin/repos/settings_repo.dart';
import 'package:meta/meta.dart';

import '../../../domin/entities/about_entity.dart';

part 'about_app_state.dart';

class AboutAppCubit extends Cubit<AboutAppState> {
  final SettingsRepo settingsRepo;
  AboutAppCubit(this.settingsRepo) : super(AboutAppInitial());

  Future<void> getAboutApp() async {
    emit(AboutAppLoading());
    var result = await settingsRepo.aboutApp();
    result.fold((l) {
      emit(AboutAppFailure(errorMsg: l.errorMsg));
    }, (r) {
      emit(AboutAppSuccess(aboutEntity: r));
    });
  }
}

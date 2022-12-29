import 'package:bloc/bloc.dart';
import 'package:flutter_application/cubit/app_cubit_states.dart';
import 'package:flutter_application/model/data_model.dart';
import 'package:flutter_application/pages/detail_page.dart';
import 'package:flutter_application/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}

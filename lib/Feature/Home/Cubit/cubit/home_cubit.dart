import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfr/Feature/Home/Model/old_orders_model.dart';
import 'package:tfr/Feature/Home/Service/home_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeService homeService)
      : _homeService = homeService,
        super(const HomeState());
  final HomeService _homeService;

  Future<void> getOldOrdersPage() async {
    emit(const HomeState(isLoading: true));
    final response = await _homeService.getOldOrders();

    emit(HomeState(
        isLoading: false,
        oldOrders: response is OldOrders ? response : null,
        isCompleted: response is OldOrders ? true : false));
  }
}

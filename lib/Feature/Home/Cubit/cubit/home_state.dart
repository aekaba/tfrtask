part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.isCompleted = false, this.isLoading = false, this.oldOrders});

  final bool isLoading;
  final OldOrders? oldOrders;
  final bool isCompleted;

  @override
  List<Object> get props => [isLoading];
}

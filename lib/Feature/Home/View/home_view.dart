import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tfr/Feature/Home/Cubit/cubit/home_cubit.dart';
import 'package:tfr/Feature/Home/Service/home_service.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    // final myBox = Hive.box("Token");
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeService())..getOldOrdersPage(),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(96, 108, 93, 1),
            title: Text(
              "The Food Runners",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.isCompleted) {
                return ListView.builder(
                  itemCount: state.oldOrders?.count,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, right: 4, left: 4),
                      child: Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .18,
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.oldOrders!.results![index].populatedOrder!
                                    .orderNumber
                                    .toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                myDateFormatter(state.oldOrders!.results![index]
                                    .populatedOrder!.deliverDate
                                    .toString()),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .8,
                                child: Text(
                                  state.oldOrders!.results![index]
                                      .populatedOrder!.populatedRestaurant!.name
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .8,
                                child: Text(
                                  state
                                      .oldOrders!
                                      .results![index]
                                      .populatedOrder!
                                      .populatedRestaurant!
                                      .address
                                      .toString(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.start,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              if (state.isLoading) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 6,
                          color: Color.fromRGBO(96, 108, 93, 1),
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}

String myDateFormatter(String encDate) {
  DateTime date = DateTime.parse(encDate);
  return DateFormat.yMd().add_jm().format(date);
}

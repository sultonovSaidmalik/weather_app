import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/constants/text_style.dart';

import '../bloc/home_bloc/home_bloc.dart';
class WListView extends StatelessWidget {
  const WListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 25,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccessWeatherState) {
            return ListView.separated(
              itemCount: state.weather.daily?.length ?? 0,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ColoredBox(
                      color: Colors.white.withOpacity(0.5),
                      child: Row(
                        children: [
                          /// Day
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              height: 25.96,
                              child: Text(
                                "Y: ${state.weather.daily![index].dateTime?.year} M: ${state.weather.daily![index].dateTime?.month} D: ${state.weather.daily![index].dateTime?.day}"
                                    .toString(),
                                style: Styles.size16,
                              ),
                            ),
                          ),
                          const Spacer(),

                          /// Kunduzgi
                          SizedBox(
                            height: 25.96,
                            child: Row(
                              children: [
                                const ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/image/quyosh.png"),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${"${state.weather.daily![index].temp!.day}" ?? ""} °C',
                                  style: Styles.size16,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),

                          /// Gradus kechki
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: SizedBox(
                              height: 25.96,
                              child: Row(
                                children: [
                                  const ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)),
                                    child: Image(
                                      image: AssetImage(
                                        "assets/image/img_2.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${"${state.weather.daily![index].temp!.day}" ?? ""} °C',
                                    style: Styles.size16
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 15);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

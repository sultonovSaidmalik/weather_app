import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:radial_button/widget/circle_floating_button.dart';
import 'package:weather_app/src/screens/add_card_screen/add_card_screen.dart';
import 'package:weather_app/src/screens/add_card_screen/bloc/add_card_bloc/add_card_bloc.dart';
import 'package:weather_app/src/screens/card_screen/card_screen.dart';
import '../../common/constants/text_style.dart';
import 'view/w_list_view.dart';
import 'view/w_size_box.dart';

part './mixin/home_mixin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFEB054), Color(0xFFFEA14E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:  const Text(
            "Next 8 Days",
            style: Styles.w700size22
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              WSizeBox(),

              /// List Tile widget
              WListView()
            ],
          ),
        ),
        floatingActionButton: CircleFloatingButton.floatingActionButton(
          items: itemsActionBar,
          color: Colors.white,
          icon: Icons.add,
          duration: const Duration(milliseconds: 500),
          curveAnim: Curves.ease,
          useOpacity: false,
        ),
      ),
    );
  }
}

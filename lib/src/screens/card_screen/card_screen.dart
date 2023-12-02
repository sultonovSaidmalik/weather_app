import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/constants/text_style.dart';
import 'package:weather_app/src/common/view/w_back.dart';
import 'package:weather_app/src/screens/add_card_screen/add_card_screen.dart';

import '../add_card_screen/bloc/add_card_bloc/add_card_bloc.dart';

part './mixin/card_mixin.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> with CardMixin {
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
            leading: const WBack(),
            title: const Text(
              "Card",
              style: Styles.w700size22,
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  flex: 20,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(AddCardMixin.cards[index].backgroundImg,),
                                    fit: BoxFit.cover,

                                  ),
                                ),
                              ),
                            ),
                            /// Card number
                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Align(
                                alignment: const Alignment(-0, 0.5),
                                child: Text(
                                  AddCardMixin.cards[index].cardNumber,
                                  style: Styles.w700size22,
                                ),
                              ),
                            ),

                            /// Card years
                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Align(
                                alignment: const Alignment(-0, 0.8),
                                child: Text(
                                  AddCardMixin.cards[index].expiryDate,
                                  style: Styles.w700size22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: AddCardMixin.cards.length,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:weather_app/src/common/constants/text_style.dart';
import 'package:weather_app/src/common/view/w_back.dart';
import 'package:weather_app/src/screens/add_card_screen/bloc/add_card_bloc/add_card_bloc.dart';

import '../../core/utils/utils.dart';
import 'model/card_model.dart';
import 'view/w_create_button.dart';
import 'view/w_text_field_widget.dart';

part './mixin/add_card_mixin.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> with AddCardMixin {
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
      child: BlocListener<AddCardBloc, AddCardState>(
        listener: (context, state) {
          if (state is AddCardSuccessState) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: const WBack(),
            title: const Text(
              "Add Card",
              style: Styles.w700size22,
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.9,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              /// Card image
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 250,
                                  child: PageView.builder(
                                    controller: screenController,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: cardImage.length,
                                    onPageChanged: (index) {
                                      context.read<AddCardBloc>().add(
                                            AddCardBackgroundEvent(
                                              img: cardImage[index],
                                            ),
                                          );
                                      print(cardImage[index]);
                                    },
                                    itemBuilder: (context, index) {
                                      return Image(
                                        image: AssetImage(cardImage[index]),
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),

                              /// Card number
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 150, left: 50),
                                child: BlocBuilder<AddCardBloc, AddCardState>(
                                  buildWhen: (previous, current) =>
                                      previous.cardNumber != current.cardNumber,
                                  builder: (context, state) {
                                    return Text(
                                      "${state.cardNumber}",
                                      style: Styles.w700size22,
                                    );
                                  },
                                ),
                              ),

                              /// Card years
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 180, left: 150),
                                child: BlocBuilder<AddCardBloc, AddCardState>(
                                  buildWhen: (previous, current) =>
                                      previous.expiryDate != current.expiryDate,
                                  builder: (context, state) {
                                    return Text(
                                      "${state.expiryDate}",
                                      style: Styles.w700size22,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          WidgetTextField(
                            onChanged: (p0) {
                              context
                                  .read<AddCardBloc>()
                                  .add(AddCardChangeEvent(cardNumber: p0));
                            },
                            controller: numberCard,
                            hintText: 'Card Number',
                            textInputType: TextInputType.number,
                            formatter: MaskTextInputFormatter(
                              mask: '#### #### #### ####',
                              filter: {"#": RegExp('[0-9]')},
                              type: MaskAutoCompletionType.lazy,
                            ),
                          ),
                          const SizedBox(height: 10),
                          WidgetTextField(
                            onChanged: (p0) {
                              context
                                  .read<AddCardBloc>()
                                  .add(AddCardChangeEvent(expiryDate: p0));
                            },
                            controller: yearsCard,
                            hintText: 'Card Years',
                            textInputType: TextInputType.number,
                            formatter: MaskTextInputFormatter(
                              mask: '##/##',
                              filter: {"#": RegExp('[0-9]')},
                              type: MaskAutoCompletionType.lazy,
                            ),
                          ),
                          const Spacer(),
                          /// Create Button
                          CreateButton(
                            onPressed: () {
                              context
                                  .read<AddCardBloc>()
                                  .add(const CardAddEvent());
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

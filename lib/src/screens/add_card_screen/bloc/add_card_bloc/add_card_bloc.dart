import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/screens/add_card_screen/add_card_screen.dart';
import 'package:weather_app/src/screens/add_card_screen/model/card_model.dart';

part 'add_card_event.dart';

part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc() : super(const AddCardInitial()) {
    on<AddCardChangeEvent>(_cardChange);
    on<CardAddEvent>(_addCard);
    on<AddCardBackgroundEvent>(_changeBackgroundImg);
  }

  void _cardChange(AddCardChangeEvent event, Emitter emitter) {
    if (event.cardNumber != null) {
      emit(AddCardChangeFieldState(
        cardNumber: event.cardNumber,
        expiryDate: state.expiryDate,
        backgroundImg: state.backgroundImg,
      ));
    }
    if (event.expiryDate != null) {
      emit(AddCardChangeFieldState(
        cardNumber: state.cardNumber,
        expiryDate: event.expiryDate,
        backgroundImg: state.backgroundImg,
      ));
    }
  }

  Future<void> _addCard(CardAddEvent event, Emitter emitter) async {
    if (state.cardNumber!.length > 18 &&
        state.expiryDate!.length > 4 &&
        state.backgroundImg!.isNotEmpty) {
      final card = CardModel(
        cardNumber: state.cardNumber!,
        expiryDate: state.expiryDate!,
        backgroundImg: state.backgroundImg!,
      );
      AddCardMixin.cards.add(card);
      emit(const AddCardSuccessState());
    }
  }

  void _changeBackgroundImg(AddCardBackgroundEvent event, Emitter emit) {
    emit(
      AddCardChangeFieldState(
        backgroundImg: event.img,
        cardNumber: state.cardNumber,
        expiryDate: state.expiryDate,
      ),
    );
  }
}

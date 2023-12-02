part of 'add_card_bloc.dart';

abstract class AddCardEvent extends Equatable {
  const AddCardEvent();
}

class AddCardBackgroundEvent extends AddCardEvent {
  final String? img;

  const AddCardBackgroundEvent({ this.img});

  @override
  List<Object?> get props => [img];
}

class AddCardChangeEvent extends AddCardEvent {
  final String? cardNumber;
  final String? expiryDate;

  const AddCardChangeEvent({
    this.cardNumber,
    this.expiryDate,
  });

  @override
  List<Object?> get props => [cardNumber, expiryDate];
}



class CardAddEvent extends AddCardEvent {
  const CardAddEvent();

  @override
  List<Object?> get props => [];
}



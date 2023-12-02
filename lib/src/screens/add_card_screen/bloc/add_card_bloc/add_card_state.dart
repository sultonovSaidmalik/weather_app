part of 'add_card_bloc.dart';

@immutable
abstract class AddCardState {
  final String? cardNumber;
  final String? expiryDate;
  final String? backgroundImg;

  const AddCardState({
    this.backgroundImg = "assets/card/img_card_eight.png",
    this.cardNumber = "8600 0000 0000 0000",
    this.expiryDate = "04/24",
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddCardState &&
          runtimeType == other.runtimeType &&
          cardNumber == other.cardNumber &&
          expiryDate == other.expiryDate &&
          backgroundImg == other.backgroundImg;

  @override
  int get hashCode =>
      cardNumber.hashCode ^ expiryDate.hashCode ^ backgroundImg.hashCode;
}

class AddCardInitial extends AddCardState {
  const AddCardInitial();
}

class AddCardLoadingState extends AddCardState {
  const AddCardLoadingState();
}

class AddCardChangeFieldState extends AddCardState {
  const AddCardChangeFieldState({
    super.cardNumber,
    super.expiryDate,
    super.backgroundImg,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is AddCardChangeFieldState &&
          runtimeType == other.runtimeType &&
          cardNumber == other.cardNumber &&
          expiryDate == other.expiryDate &&
          backgroundImg == other.backgroundImg;

  @override
  int get hashCode => super.hashCode;
}

class AddCardSuccessState extends AddCardState {
  const AddCardSuccessState();
}

class AddCardErrorState extends AddCardState {
  const AddCardErrorState();
}

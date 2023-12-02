import 'dart:ui';

class CardModel {
  String backgroundImg;
  String cardNumber;
  String expiryDate;

  CardModel({
    required this.backgroundImg,
    required this.cardNumber,
    required this.expiryDate,
  });

  Map<String, Object?> toJson() {
    return {
      'backgroundImg': backgroundImg,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
    };
  }

  factory CardModel.fromJson(Map<String, Object?> json) {
    return CardModel(
      backgroundImg: json['backgroundImg'] as String,
      cardNumber: json['cardNumber'] as String,
      expiryDate: json['expiryDate'] as String,
    );
  }

  @override
  String toString() {
    return 'CardModel{ backgroundImg: $backgroundImg, cardNumber: $cardNumber, expiryDate: $expiryDate}';
  }
}

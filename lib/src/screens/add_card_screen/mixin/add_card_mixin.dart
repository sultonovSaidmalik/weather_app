part of '../add_card_screen.dart';



mixin AddCardMixin on State<AddCardScreen> {

  final PageController screenController = PageController(initialPage: 0);
  TextEditingController numberCard = TextEditingController();
  TextEditingController yearsCard = TextEditingController();
  final cardImage = [
    "assets/card/img_card_eight.png",
    "assets/card/img_card_eighteen.png",
    "assets/card/img_card_eleven.png",
    "assets/card/img_card_five.png",
    "assets/card/img_card_fiveteen.png",
    "assets/card/img_card_four.png",
    "assets/card/img_card_fourteen.png",
    "assets/card/img_card_nine.png",
    "assets/card/img_card_one.png",
    "assets/card/img_card_seven.png",
    "assets/card/img_card_six.png",
    "assets/card/img_card_sixteen.png",
    "assets/card/img_card_ten.png",
    "assets/card/img_card_thirteen.png",
    "assets/card/img_card_three.png",
    "assets/card/img_card_twelve.png",
    "assets/card/img_card_two.png",
  ];

  void _createProduct(BuildContext context) {
    if(numberCard.text.isEmpty ) return AppUtils.msg(context, "Karta raqami kiritilmadi");
    if(yearsCard.text.isEmpty) return AppUtils.msg(context, "Karta raqami toliq kiritilmadi");
    Navigator.pop(context);
  }

  static List<CardModel> cards = [];

}

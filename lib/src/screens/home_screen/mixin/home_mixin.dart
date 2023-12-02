part of '../home_screen.dart';

mixin HomeMixin on State<HomeScreen> {
  var itemsActionBar = [
    Builder(builder: (context) {
      return FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.5),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CardScreen(),
            ),
          );
        },
        child: const Icon(Icons.credit_card_rounded),
      );
    }),
    Builder(builder: (context) {
      return FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.5),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (BuildContext context) => AddCardBloc(),
                child: const AddCardScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add_card_outlined),
      );
    }),
  ];
}

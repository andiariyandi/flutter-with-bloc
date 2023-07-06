class AppStates {
  int counter;
  AppStates({required this.counter});
}

// @override
class InitState extends AppStates {
  InitState() : super(counter: 0);
}

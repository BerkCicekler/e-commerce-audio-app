part of '../../home_page.dart';

mixin _ScrollableContainersMixin on State<_ScrollAbleContainers> {
  int _currentCardIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.92,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _setCard(int index) {
    setState(() {
      _currentCardIndex = index;
    });
  }
}

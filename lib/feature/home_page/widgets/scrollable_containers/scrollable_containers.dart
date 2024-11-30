part of '../../home_page.dart';

final class _ScrollAbleContainers extends StatefulWidget {
  const _ScrollAbleContainers();

  @override
  State<_ScrollAbleContainers> createState() => _ScrollAbleContainersState();
}

final class _ScrollAbleContainersState extends State<_ScrollAbleContainers>
    with _ScrollableContainersMixin {
  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoriesCubit>().state;
    return Container(
      height: 250,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            height: 30,
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length * 2,
              itemBuilder: (c, i) {
                return (i % 2).isOdd
                    ? _TopHeader(
                        isSelected: (i / 2).toInt() == _currentCardIndex,
                        text: categories[(i / 2).toInt()].name,
                      )
                    : SizedBox(
                        width:
                            i == 0 ? AppPaddingConstants.pageConst.right : 15,
                      );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              itemCount: categories.length,
              controller: PageController(
                viewportFraction: 0.92,
              ),
              onPageChanged: _setCard,
              padEnds: false,
              itemBuilder: (context, index) {
                return const FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.04,
                  child: _SpecialContainer(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final class _TopHeader extends StatelessWidget {
  const _TopHeader({
    required this.isSelected,
    required this.text,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.onPrimary : null,
        borderRadius: RadiusConstants.largeBorderRadius,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColorConstants.greyDark,
          fontSize: 15.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

///This is a dummy widget
///just created for the make UI prettier
final class _SpecialContainer extends StatelessWidget {
  const _SpecialContainer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: AppPaddingConstants.pageConst,
      margin: AppPaddingConstants.pageConst.copyWith(top: 0, bottom: 0),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: RadiusConstants.smallBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TMA-2 Modular Headphone',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0,
                    height: 1.2,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      _HomePageLocalization.shopNow,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      SvgConstants.arrowRight,
                      width: 23,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              AppImageConstants.headphone,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

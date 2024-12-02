part of '../../product_page.dart';

final class _OverviewView extends StatelessWidget {
  const _OverviewView();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ScrollAbleImages(),
          SizedBox(height: 30),
          _ReviewsHolder(),
        ],
      ),
    );
  }
}

/// dummy scrollable images
final class _ScrollAbleImages extends StatelessWidget {
  const _ScrollAbleImages();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: PageView(
        controller: PageController(viewportFraction: 0.82),
        padEnds: false,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.9,
            child: Container(
              decoration: BoxDecoration(
                color: AppColorConstants.greyLight,
                borderRadius: RadiusConstants.smallBorderRadius,
              ),
              child: Image.asset(AppImageConstants.headphoneFront),
            ),
          ),
          ClipRRect(
            borderRadius: RadiusConstants.smallBorderRadius,
            child: Image.asset(
              AppImageConstants.headphoneJak,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

final class _ReviewsHolder extends StatelessWidget {
  const _ReviewsHolder();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Review (102)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (_, i) {
            return const _Review();
          },
        ),
        const Text(
          'See All Reviews',
          style: TextStyle(color: AppColorConstants.greyDark, fontSize: 16),
        )
      ],
    );
  }
}

/// dummy review widget
final class _Review extends StatelessWidget {
  const _Review();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(AppImageConstants.profilePic),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Berk Cicekler',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '1 Month Ago',
                      style: TextStyle(
                        color: AppColorConstants.greyDark,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                RatingBar.builder(
                  itemBuilder: (_, i) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  initialRating: 4,
                  ignoreGestures: true,
                  itemSize: 25,
                  onRatingUpdate: (val) {},
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incident ut labore et dolore magna aliqua.',
                  style: TextStyle(fontSize: 15.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

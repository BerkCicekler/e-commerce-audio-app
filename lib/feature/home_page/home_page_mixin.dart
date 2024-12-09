part of 'home_page.dart';

mixin _HomePageMixin on State<HomePage> {
  @override
  void initState() {
    super.initState();
    _featuredProductsCubit =
        FeaturedProductsCubit(searchService: SearchService());
    loadCategoriesAndFeatured();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late final FeaturedProductsCubit _featuredProductsCubit;

  Future<void> loadCategoriesAndFeatured() async {
    await context.read<CategoriesCubit>().fetchCategories();
    _featuredProductsCubit
        .fetchFeaturedProducts(context.read<CategoriesCubit>().state[0].id);

    context.read<BasketBloc>().add(BasketFetchEvent());
  }
}

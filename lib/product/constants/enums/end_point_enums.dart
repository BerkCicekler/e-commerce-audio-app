/// Back-end's end-points stored in this enum
/// We always choose from these constants when we send request
enum EndPointEnums {
  authLogin('user/login'),
  authRegister('user/register'),
  authOauth('user/oauth'),

  basketFetch('basket/'),
  basketAddCountToItem('basket/update'),
  basketAddItem('basket/add'),
  basketRemoveItem('basket/removeOne'),
  basketRemoveAllItems('basket/removeAll'),

  categories('categories/'),

  shopFeatured('shop/featured/');

  final String value;

  const EndPointEnums(this.value);
}

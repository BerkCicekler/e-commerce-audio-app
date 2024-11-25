/// This enums used in picking a request type in our network_service
enum ApiRequestMethodsEnum {
  GET('get'),
  UPDATE('update'),
  POST('post'),
  delete('delete');

  final String value;

  const ApiRequestMethodsEnum(this.value);
}

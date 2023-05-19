class ApiHelper {
  static const String _baseUrl = 'https://www.uniqgold.net/api';
  static const String SPLASH = '$_baseUrl/splash';

  // static const String Register = '$_baseUrl/register';
  // static const String LOGIN = '$_baseUrl/login';
  // static const String Logout = '$_baseUrl/logout';
  // static const String Setting = '$_baseUrl/setting';
  // static const String Sliders = '$_baseUrl/sliders';
  // static const String MAIN_CATEGORIES = '$_baseUrl/main_category';
  // static const String BRANDS_CATEGORIES = '$_baseUrl/brands?main_category_id=';
  // static const String CATEGORIES_BRANDS = '$_baseUrl/brands_category?brand_id=';
  // static const String PRODUCTS = "$_baseUrl/products?";
  //
  // static const String Contact_us = '$_baseUrl/contact_us';
  // static const String Analysis = '$_baseUrl/statics?type=';
  // static const String Forget_Password = '$_baseUrl/forget_password';
  // static const String ResetPassword = '$_baseUrl/reset_password';
  //
  // static const String Carts = '$_baseUrl/cart/getCart';
  // static const String PRODUCT_DETAILS = '$_baseUrl/product?product_id=';
  // static const String ADD_TO_CART = '$_baseUrl/cart/addToCart';
  // static const String CHECK_COUPON = '$_baseUrl/cart/apply_coupon?coupons=';
  // static const String CHECKOUT = '$_baseUrl/cart/checkout';
  // static const String TASFIAT = '$_baseUrl/tasfiat';

  static Map<String, String> registerHeader(
      {required String language, required String deviceName}) {
    return {
      'lang': language,
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Client-Device-Name': deviceName,
      'Connection': 'keep-alive',
    };
  }

  static Map<String, String> langHeader({required String language}) {
    return {'lang': language};
  }

  static Map<String, String> tokenHeader({required String token}) {
    return {'Authorization': token};
  }

  static Map<String, String> allHeader(
      {required String token, required String language}) {
    return {
      'Content-Type': 'application/json',
      'Authorization': token,
      'lang': language
    };
  }

  static Map<String, String> adminHeader(
      {required String token, required String language}) {
    return {
      'Accept': 'application/json',
      'Authorization': token,
      'lang': language
    };
  }

  static String get baseUrl => _baseUrl;

  static Map<String, String> getHeader(
      {required String token, required String appLanguage}) {
    return {'Authorization': token, 'applocale': appLanguage};
  }
}

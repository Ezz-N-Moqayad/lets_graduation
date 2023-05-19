import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class ApiRequestes {
//   static final _client = http.Client();
//
//   static Future<Splash?> getSplash({required String language}) async {
//     http.Response response = await _client.get(Uri.parse(ApiHelper.SPLASH),
//         headers: ApiHelper.langHeader(language: language));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Splash splash = Splash.fromJson(body);
//       // print('SUCCESS: ${jsonEncode(splash)}');
//       return splash;
//     } else {
//       print('ERROR getSplash: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Auth?> register({
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String phone,
//     required String password,
//   }) async {
//     print('firstName: $firstName');
//     print('lastName: $lastName');
//     print('PASSWORD: $email');
//     print('PASSWORD: $phone');
//     print('PASSWORD: $password');
//
//     String deviceName = AppHelper.getDeviceName();
//
//     print('DEVICE: $deviceName');
//
//     Map<String, String> headers = {
//       'X-Requested-With': 'XMLHttpRequest',
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'X-Client-Device-Name': '$deviceName',
//       'Connection': 'keep-alive',
//     };
//
//     http.Response response = await _client.post(Uri.parse(ApiHelper.Register),
//         headers: ApiHelper.registerHeader(language: AppHelper.getAppLanguage(), deviceName: deviceName),
//         body: jsonEncode(<String, dynamic>{
//           'first_name': firstName,
//           'last_name': lastName,
//           'email': email,
//           'phone': phone,
//           'password': password,
//         }),
//         encoding: Encoding.getByName('utf-8'));
//     Auth user = Auth();
//     //conecction sueccess
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var body = jsonDecode(response.body);
//       user = Auth.fromJson(body);
//       print('SUUCESS signUp: ${jsonEncode(user)}');
//       return user;
//     } else {
//       print('ERROR: ${jsonDecode(response.body)}');
//       var body = jsonDecode(response.body);
//       ErrorMessage message = ErrorMessage.fromJson(body);
//       for(String erro in message.errors!.email!){
//         AppHelper.showToast(message: erro, color: Colors.redAccent);
//         print('MESSAGE EMAIL: ${erro}');
//       }
//       for(String erro in message.errors!.phone!) {
//         print('MESSAGE PHONE: ${erro}');
//         AppHelper.showToast(message: erro, color: Colors.redAccent);
//       }
//       print('ERROR: $body}');
//       return null;
//     }
//   }
//
//   static Future<Auth?> login(
//       {required String email, required String password}) async {
//     String deviceName = AppHelper.getDeviceName();
//     print('DEVICE_NAME: ${AppHelper.getDeviceName()}');
//     print('DEVICE_NAME: $deviceName');
//     print('EMAIL: $email');
//     print('PASSWORD: $password');
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'X-Client-Device-Name': '$deviceName',
//     };
//     http.Response response = await _client.post(Uri.parse(ApiHelper.LOGIN),
//         headers: headers,
//         body:
//         jsonEncode(<String, dynamic>{'email': email, 'password': password}),
//         encoding: Encoding.getByName('utf-8'));
//     // print("LOGIN: ${jsonDecode(response.body)}");
//     Auth user = Auth();
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var body = jsonDecode(response.body);
//       user = Auth.fromJson(body);
//       // print('SUUCESS login: ${jsonEncode(user)}');
//       return user;
//     } else {
//       var body = jsonDecode(response.body);
//       user = Auth.fromJson(body);
//       AppHelper.showToast(message: '${user.msg}', color: Colors.redAccent);
//       print('ERROR login: ${jsonEncode(user)}');
//       return user;
//     }
//   }
//
//   //TODO LOGOUT
//   static Future<Logout?> logout({required String token}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.Logout),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'token'
//         });
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Logout logout = Logout.fromJson(body);
//       // print('SUCCESS: ${jsonEncode(logout)}');
//       return logout;
//     } else {
//       // print('ERROR logout: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
// //TODO app_settings
//   static Future<AppSettings?> getSettings({required String appLanguage}) async {
//     print("getSettings: $appLanguage");
//     http.Response response = await _client.get(Uri.parse(ApiHelper.Setting),
//         headers: ApiHelper.langHeader(language: appLanguage));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       AppSettings settings = AppSettings.fromJson(body);
//       // print('SUCCESS : ${jsonEncode(settings)}');
//       return settings;
//     } else {
//       print('ERROR:${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   //TODO Slider
//   static Future<Sliders?> slider({required String appLanguage}) async {
//     http.Response response = await _client.get(Uri.parse(ApiHelper.Sliders),
//         headers: ApiHelper.langHeader(language: appLanguage));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Sliders sliders = Sliders.fromJson(body);
//       // print('SUCCESS sliders: ${jsonEncode(sliders)}');
//       return sliders;
//     } else {
//       print('ERROR : ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   //
//   // // TODO get Categories
//   // static Future<Categories?> getCategories(
//   //     {required String appLanguage}) async {
//   //   http.Response response = await _client.get(Uri.parse(ApiHelper.CATEGORIES),
//   //       headers: ApiHelper.getHeader(token: '', appLanguage: appLanguage));
//   //
//   //   if (response.statusCode == 200) {
//   //     var body = jsonDecode(response.body);
//   //     Categories categories = Categories.fromJson(body);
//   //     // print('SUCCESS getCategories: ${jsonEncode(categories)}');
//   //     return categories;
//   //   } else {
//   //     print('ERROR getCategories: ${jsonDecode(response.body)}');
//   //     return null;
//   //   }
//   // }
//
// //TODO Categories
//
//   static Future<Category_m?> Categories({required String appLanguage}) async {
//     http.Response response = await _client.get(
//         Uri.parse(ApiHelper.MAIN_CATEGORIES),
//         headers: ApiHelper.getHeader(token: '', appLanguage: appLanguage));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Category_m brandsCategory = Category_m.fromJson(body);
//       // print('SUCCESS getCategories: ${jsonEncode(brandsCategory)}');
//       return brandsCategory;
//     } else {
//       // print('ERROR getCategories: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   //TODD TASFIAT
//   static Future<Tasfiat?> tasfiat({required String appLanguage}) async {
//     http.Response response = await _client.get(
//       Uri.parse(ApiHelper.TASFIAT),
//       headers: ApiHelper.getHeader(token: '', appLanguage: appLanguage),
//     );
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Tasfiat tasfiat = Tasfiat.fromJson(body);
//       return tasfiat;
//     } else {
//       return null;
//     }
//   }
//
//   //TODO Brand_Categories
//   static Future<CategoryByBrand?> getCategoriesbyBrand(
//       {required String language, required int brandId}) async {
//     http.Response response = await _client.get(
//         Uri.parse('${ApiHelper.CATEGORIES_BRANDS}$brandId'),
//         headers: ApiHelper.langHeader(language: language));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       CategoryByBrand brand = CategoryByBrand.fromJson(body);
//       // print('SUCCESS Brand: ${jsonEncode(brand)}');
//       return brand;
//     } else {
//       print('ERROR Brand: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Products?> getProducts(
//       {categoryId, title, brandId, productId, required String language}) async {
//     print("catId: $categoryId");
//     print("brandId: $brandId");
//     print("title: $title");
//     print("proId: $productId");
//
//     String params =
//         "category_id=$categoryId&brand_id=$brandId&title=$title&product_id=$productId";
//     http.Response response = await _client.get(
//         Uri.parse("${ApiHelper.PRODUCTS}$params"),
//         headers: ApiHelper.langHeader(language: language));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Products product = Products.fromJson(body);
//       // print("SUCCESS: ${jsonEncode(product)}");
//       return product;
//     } else {
//       print("ERROR: ${jsonDecode(response.body)}");
//       return null;
//     }
//   }
//
//   static Future<ProductDetails?> getProductDetails(
//       {required String language, required int productId}) async {
//     http.Response response = await _client.get(
//         Uri.parse('${ApiHelper.PRODUCT_DETAILS}$productId'),
//         headers: ApiHelper.langHeader(language: language));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       ProductDetails product = ProductDetails.fromJson(body);
//       // print('SUCCESS getProductDetails: ${jsonEncode(product)}');
//       return product;
//     } else {
//       print('ERROR getProductDetails: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Brand?> getBrands(
//       {required String language, required int categoryId}) async {
//     http.Response response = await _client.get(
//         Uri.parse('${ApiHelper.BRANDS_CATEGORIES}$categoryId'),
//         headers: ApiHelper.langHeader(language: language));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Brand brand = Brand.fromJson(body);
//       // print('SUCCESS getBrands: ${jsonEncode(brand)}');
//       return brand;
//     } else {
//       print('ERROR getBrands: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<AddToCart?> addToCart({required String language,
//     required String token,
//     required int productId,
//     required int colorId,
//     required int sizeId,
//     required int quantity}) async {
//     print('PRODUCT ID: ${productId}');
//     print('SIZE ID: ${sizeId}');
//     print('COLOR ID: ${colorId}');
//     print('QUANTITIy: ${quantity}');
//
//     http.Response response = await _client.post(
//         Uri.parse(ApiHelper.ADD_TO_CART),
//         headers: ApiHelper.allHeader(token: token, language: language),
//         body: jsonEncode(<String, dynamic>{
//           'product_id': productId,
//           'size_id': sizeId,
//           'color_id': colorId,
//           'qty': quantity
//         }),
//         encoding: Encoding.getByName('utf-8'));
//     print("ADD_TO_CART: ${jsonDecode(response.body)}");
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       AddToCart cart = AddToCart.fromJson(body);
//       // print('SUCCESS addTOCART: ${jsonEncode(cart)}');
//       return cart;
//     } else {
//       print('ERROR addToCart: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<ApplyCoupon?> applyCoupon(
//       {required String token, required String coupon}) async {
//     http.Response response = await _client.post(
//         Uri.parse('${ApiHelper.CHECK_COUPON}$coupon'),
//         headers: ApiHelper.tokenHeader(token: token));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       ApplyCoupon coupon = ApplyCoupon.fromJson(body);
//       // print('SUUCESS: ${jsonEncode(coupon)}');
//       return coupon;
//     } else {
//       print('ERROR addToCart: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Checkout?> checkout({required String token,
//     required String language,
//     required String coupon,
//     required int countryId,
//     required String address,
//     required String notes,
//     required String payment,
//     required String cardNumber,
//     required String month,
//     required String year,
//     required String cvv,
//     required String fullName}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.CHECKOUT),
//         headers: ApiHelper.allHeader(token: token, language: language),
//         body: jsonEncode(<String, dynamic>{
//           "coupon": "i780aVpRx3",
//           "country_id": 3,
//           "address": "new test address",
//           "notes": "test write address",
//           "payment": "stripe",
//           "cardNumber": "4333677398440524",
//           "month": "01",
//           "year": "26",
//           "cvv": "998",
//           "fullName": "ALYAZI ALNANSOORI",
//         }),
//         encoding: Encoding.getByName('utf-8'));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Checkout checkout = Checkout.fromJson(body);
//       print('SUCCESS: checkout: ${checkout}');
//       return checkout;
//     } else {
//       print('ERROR checkout: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Carts?> getCarts(
//       {required String token, required String appLanguage}) async {
//     http.Response response = await _client.get(Uri.parse(ApiHelper.Carts),
//         headers: ApiHelper.getHeader(token: token, appLanguage: appLanguage));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Carts carts = Carts.fromJson(body);
//       // print('Succes : getCarts${jsonEncode(carts)}');
//       return carts;
//     } else {
//       print('ERROR getCarts: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
// //TODO Contact_US
//   static Future<ContactUs?> contactUs({
//     required String subject,
//     required String message,
//   }) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.Contact_us),
//         headers: {'Content-Type': 'application/json'});
//     if (response.statusCode == 200) {
//       ContactUs contact = ContactUs();
//       var body = jsonDecode(response.body);
//       contact = ContactUs.fromJson(body);
//       // print('Succes : ${jsonEncode(contact)}');
//       return contact;
//     } else {
//       print('ERROR : ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   // static Future<Carts?> getCarts(
//   //     {required String token, required String appLanguage}) async {
//   //   http.Response response = await _client.get(Uri.parse(ApiHelper.Carts),
//   //       headers: ApiHelper.getHeader(token: '', appLanguage: appLanguage));
//   //
//   //   if (response.statusCode == 200) {
//   //     var body = jsonDecode(response.body);
//   //     var carts = Carts.fromJson(body);
//   //     print('Succes : getCarts${jsonEncode(carts)}');
//   //     return carts;
//   //   } else {
//   //     print('ERROR getCarts: ${jsonDecode(response.body)}');
//   //     return null;
//   //   }
//   // }
//
//   static Future<Analysis?> getAnalysis({required String token,
//     required String appLanguage,
//     required String type}) async {
//     // print('getAnalysis');
//     http.Response response = await _client.get(
//         Uri.parse('${ApiHelper.Analysis}$type'),
//         headers: ApiHelper.adminHeader(token: token, language: appLanguage));
//     // print('getAnalysis: ${jsonDecode(response.body)}');
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Analysis analysis = Analysis.fromJson(body);
//       print('Succes : getAnalysis${jsonEncode(analysis)}');
//       return analysis;
//     } else {
//       print('ERROR getAnalysis: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   //TODO ForgetPass
//   static Future<ForgetModel?> forgetPassword(
//       {required String language, required String email}) async {
//
//     String deviceName = AppHelper.getDeviceName();
//
//     print('DEVICE: $deviceName');
//
//     Map<String, String> headers = {
//       'X-Requested-With': 'XMLHttpRequest',
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'X-Client-Device-Name': '$deviceName',
//       'Connection': 'keep-alive',
//     };
//
//     print('forgetPassword: $email');
//     http.Response response = await _client.post(
//         Uri.parse(ApiHelper.Forget_Password),
//         headers: ApiHelper.registerHeader(language: AppHelper.getAppLanguage(), deviceName: deviceName),
//         body: jsonEncode(<String, dynamic>{'email': email}),
//         encoding: Encoding.getByName('utf-8'));
//     print('${response.statusCode}');
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       ForgetModel forget_m = ForgetModel.fromJson(body);
//       print('SUCCESS Forget: ${jsonEncode(forget_m)}');
//       return forget_m;
//     } else {
//       print('ERROR Forget: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<ResetPassword?> Resetpassword({required String token,
//     required String language,
//     required String password,
//     required String password_confirmation}) async {
//     http.Response response = await _client.post(
//         Uri.parse(ApiHelper.ResetPassword),
//         headers: ApiHelper.allHeader(token: token, language: language),
//         body: jsonEncode(<String, dynamic>{
//           'password': password,
//           'password_confirmation': password_confirmation
//         }),
//         encoding: Encoding.getByName('utf-8'));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       ResetPassword resetPassword = ResetPassword.fromJson(body);
//       // print('SUCCESS resetPassword: ${jsonEncode(resetPassword)}');
//     } else {
//       print('ERROR resetPassword: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
// }

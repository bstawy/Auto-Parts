class ApiConstants {
  static const String baseUrl = "https://motormania0.000webhostapp.com/api/";
  static const String localHostBaseUrl = "http://10.0.2.2/motor_mania/api/";
}

class EndPoints {
  static const String register = "auth/register.php";
  static const String login = "auth/login.php";
  static const String refreshToken = "auth/refreshTokens.php";
  static const String allCategories = "categories/allCategories.php";
  static const String allProducts = "products/getAllProducts.php";
  static const String categoryProducts = "categories/categoryProducts.php";
  static const String userSelectedCar = "cars/getUserSelectedCar.php";
  static const String productDetails = "products/getProduct.php";
  static const String allFavorites = "favorites/allFavorites.php";
  static const String addToFavorites = "favorites/addProduct.php";
  static const String removeFromFavorites = "favorites/removeProduct.php";
  static const String search = "products/searchProduct.php";
  static const String allCartProducts = "cart/allCartProducts.php";
  static const String addProductToCart = "cart/addProduct.php";
  static const String removeProductFromCart = "cart/removeProduct.php";
  static const String homeOffers = "offers/getOffers.php";
}

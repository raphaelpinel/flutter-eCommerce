import 'package:flutter_ecommerce/models/app_state.dart';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:flutter_ecommerce/redux/actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      user: userReducer(state.user, action),
      products: productsReducer(state.products, action));
}

User userReducer(User user, dynamic action) {
  if (action is GetUserAction) {
    // return user from action
    return action.user;
  }
  return user;
}

productsReducer(products, action) {
  if (action is GetProductsAction) {
    return action.products;
  }
  return products;
}

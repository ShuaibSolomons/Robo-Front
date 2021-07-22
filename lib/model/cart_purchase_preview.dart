import 'package:flutter/cupertino.dart';
import 'package:robo_front/utils/enum.dart';

import 'base_response.dart';

class CartPurchasePreviewModel {
  CartPurchasePreviewResponse screemRoute;
  PurchaseResponseStatus responseStatus;

  BaseRoboResponse response;

  CartPurchasePreviewModel(
      {@required this.screemRoute, this.responseStatus, this.response});
}

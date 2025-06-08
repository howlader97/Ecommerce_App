import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/features/home/repository/home_repository.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart' show RefreshController;

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});


}
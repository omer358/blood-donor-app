import 'dart:developer';

import 'package:get/get.dart';

import '../service/donation_service.dart';

class NotificationsController extends GetxController {
  var donationRequests = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  final DonationService _donationService;

  NotificationsController(this._donationService);

  @override
  void onInit() {
    log("NotificationController is being initialized");
    super.onInit();
    listenToDonationRequests();
    _donationService.listenToDonationRequests();
  }

  void listenToDonationRequests() {
    isLoading.value = true;

    _donationService.getDonationRequestsStream().listen((requests) {
      donationRequests.value = requests;
      isLoading.value = false;
    });
  }
}

import 'package:get/get.dart';

import '../service/donation_service.dart';


class NotificationsController extends GetxController {
  var donationRequests = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  final DonationService donationService;

  NotificationsController(this.donationService);

  @override
  void onInit() {
    super.onInit();
    listenToDonationRequests();
  }

  // Listen to real-time updates from Firestore
  void listenToDonationRequests() {
    isLoading(true);
    donationService.getDonationRequestsStream().listen((requests) {
      donationRequests.assignAll(requests);
      isLoading(false);
    });
  }
}

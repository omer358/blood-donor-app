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
    fetchDonationRequests();
  }

  Future<void> fetchDonationRequests() async {
    try {
      isLoading(true);
      var requests = await donationService.fetchDonationRequests();
      donationRequests.assignAll(requests);
    } finally {
      isLoading(false);
    }
  }
}

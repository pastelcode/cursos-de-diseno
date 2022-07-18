import 'package:url_launcher/url_launcher.dart';

import 'scaffold_messenger_service.dart';

class UrlLauncherService {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  UrlLauncherService._();

  static Future<void> launch(String url) async {
    final uri = Uri.parse(url);
    try {
      launchUrl(uri);
    } catch (e) {
      SnackBarService.showErrorOnLaunchingUrlSnackBar();
    }
  }
}

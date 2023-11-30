import 'package:url_launcher/url_launcher.dart';

export 'package:url_launcher/url_launcher_string.dart';

Future<bool> launchURL(
  String url, {
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  try {
    return await launchUrl(Uri.parse(url), mode: mode);
  } catch (_) {
    // ErrorHandler().onError('Could not launch $url, \n\n$_)');

    return false;
  }
}

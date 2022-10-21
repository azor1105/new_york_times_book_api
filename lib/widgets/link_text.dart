import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  const LinkText({Key? key, required this.uri, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: GestureDetector(
        onTap: () async {
          await launchUrl(Uri.parse(uri));
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  final String uri;
  final String title;
}

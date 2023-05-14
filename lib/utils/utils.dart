import 'package:flutter/material.dart';
import 'package:qr_rect/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

launchUrl(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipo == 'http') {
    // Abrir el sitio web
    //final Uri _url = Uri.https(scan.valor);
    if (!await launchUrlString(url)) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}

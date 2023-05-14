import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_rect/models/scan_model.dart';
import 'package:qr_rect/providers/scan_list_provider.dart';
import 'package:qr_rect/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(
                  this.tipo == 'http'
                      ? Icons.home_outlined
                      : Icons.map_outlined,
                  color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor),
              subtitle: Text(scans[i].id.toString()),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              onTap: () => launchUrl(context, scans[i] as ScanModel),
            ));
  }
}

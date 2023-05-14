import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_rect/providers/scan_list_provider.dart';
import 'package:qr_rect/widgets/scan_tiles.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}

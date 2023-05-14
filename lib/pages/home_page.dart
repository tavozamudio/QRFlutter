import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_rect/pages/direcciones_page.dart';
import 'package:qr_rect/pages/mapas_page.dart';
import 'package:qr_rect/providers/db_provider.dart';
import 'package:qr_rect/providers/scan_list_provider.dart';
import 'package:qr_rect/providers/ui_provider.dart';
import 'package:qr_rect/widgets/custom_naviagtor_bar.dart';
import 'package:qr_rect/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selcted menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la página respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cragarScansPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cragarScansPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}

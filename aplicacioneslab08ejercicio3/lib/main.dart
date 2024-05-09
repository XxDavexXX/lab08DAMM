import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.primera,
      routes: {
        Routes.primera: (context) => PrimeraPantalla(),
        Routes.segunda: (context) => SegundaPantalla(),
      },
    );
  }
}

class PrimeraPantalla extends StatefulWidget {
  @override
  _PrimeraPantallaState createState() => _PrimeraPantallaState();
}

class _PrimeraPantallaState extends State<PrimeraPantalla> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escribir texto a pasar:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Escribir texto a pasar',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String texto = _controller.text;
                Navigator.pushNamed(
                  context,
                  Routes.segunda,
                  arguments: texto,
                );
              },
              child: Text('pagina 2'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpiar el controlador cuando el Widget se elimine del árbol de widgets
    _controller.dispose();
    super.dispose();
  }
}

class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener los argumentos
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Texto recibido:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              args,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('volver pagina 1'),
            ),
          ],
        ),
      ),
    );
  }
}

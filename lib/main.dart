import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.light,
);

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary: Colors.green[900],
              secondary: Colors.red[300]),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                )
              ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.red),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
            ),
          )
      ),
      home: ListaTransferencias(),
    );
  }
}

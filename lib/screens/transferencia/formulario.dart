import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferencia';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0000-00';
const _rotuloCampoConta = 'Número da Conta';
const _dicaCampoConta = '0.00';
const _textoBotaoConfirmar = 'Confirmar';


class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(_controladorCampoNumeroConta,
                  dica: _dicaCampoConta, rotulo: _rotuloCampoConta),
              Editor(_controladorCampoValor,
                  rotulo: _rotuloCampoValor, dica: _dicaCampoValor, icone: Icons.monetization_on),
              ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textoBotaoConfirmar),
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta.isNotEmpty && valor != null) {
      final transferenciaCriada = Transferencia(numeroConta, valor);

      Navigator.pop(context, transferenciaCriada);
    }
  }
}
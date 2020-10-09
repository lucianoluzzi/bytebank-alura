import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    const _titulo = "Formulário";
    const _labelNumeroConta = "Número da conta";
    const _hintNumeroConta = "000";
    const _labelValor = "Valor";
    const _hintValor = "100.00";
    const _buttonConfirmarText = "Confirmar";

    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: widget._controladorCampoNumeroConta,
              label: _labelNumeroConta,
              hint: _hintNumeroConta,
            ),
            Editor(
              controlador: widget._controladorCampoValor,
              label: _labelValor,
              hint: _hintValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_buttonConfirmarText),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}

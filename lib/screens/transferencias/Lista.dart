import 'package:bytebank/components/ItemTransferencia.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Formulario.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, int indice) {
          final Transferencia transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
          future.then((transferencia) {
            _atualiza(transferencia);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferencia) {
    if (transferencia != null) {
      setState(() {
        widget._transferencias.add(transferencia);
      });
    }
  }
}

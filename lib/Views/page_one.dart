import 'package:flutter/material.dart';
import 'package:projeto_final/Widgets/text_form_field.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  TextEditingController _tensaoController = TextEditingController();
  TextEditingController _correnteController = TextEditingController();

  String _result = 'Preencha os campos';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0), child: buildForm()),
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFormField(
              label: "Tensão (Volts)",
              error: "insira a tensão!",
              controller: _tensaoController),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          buildTextFormField(
              label: "Corrente (Ampere)",
              error: "Insira a corrente!",
              controller: _correnteController),
          buildTextResult(),
          buildCalculateButton(),
        ],
      ),
    );
  }

  Widget buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _result,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget buildCalculateButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: RaisedButton(
        color: Colors.red,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            calculateResist();
          }
        },
        child: Text('CALCULAR RESISTÊNCIA',
            style: TextStyle(color: Colors.black, fontSize: 15.0)),
      ),
    );
  }

  void calculateResist() {
    double tensao = double.parse(_tensaoController.text);
    double corrente = double.parse(_correnteController.text);

    double resist = tensao / corrente;

    setState(() {
      _result = " Resistência  = ${resist.toStringAsPrecision(2)}  Ohms\n";
    });
  }
}

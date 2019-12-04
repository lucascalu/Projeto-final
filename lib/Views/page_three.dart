import 'package:flutter/material.dart';
import 'package:projeto_final/Widgets/text_form_field.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  TextEditingController _correnteController = TextEditingController();
  TextEditingController _resistController = TextEditingController();

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
              label: "Corrente (Ampere)",
              error: "insira a Corrente!",
              controller: _correnteController),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          buildTextFormField(
              label: "Resistência (Ohms)",
              error: "Insira a resistência!",
              controller: _resistController),
          buildTextResult(),
          buildCalculateButton(),
          resetFields()
        ],
      ),
    );
  }
  
  Widget resetFields(){
      return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: RaisedButton(
        color: Colors.red,
        onPressed: () {
          _correnteController.text = "";
          _resistController.text ='';
        },
        child: Text('REINICIAR CAMPOS',
            style: TextStyle(color: Colors.black, fontSize: 15.0)),
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
        child: Text('CALCULAR TENSÃO',
            style: TextStyle(color: Colors.black, fontSize: 15.0)),
      ),
    );
  }

  void calculateResist() {
    double corrente = double.parse(_correnteController.text);
    double resist = double.parse(_resistController.text);

    double tensao = corrente * resist;

    setState(() {
      _result = " Tensão  = ${tensao.toStringAsPrecision(2)}  Volt(s)\n";
    });
  }
}

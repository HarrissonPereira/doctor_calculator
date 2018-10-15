import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorScreenState createState() => new _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  //Validações
  bool _hasDecimal = false;
  bool _isNum1 = true;
  bool _isNovoCalculo = true;

  //Componentes para cálculos
  double _num1 = 0.0,
      _num2 = 0.0,
      _resultadoCalculo = 0.0,
      _resultadoFinal = 0.0;
  String _operador = "";


  //Apresentações de valores
  String _historico = "";
  String _entradaNumeros = "";


  //region Métodos Calcular
  soma() {
    _resultadoCalculo = _resultadoCalculo + _num2;
  }

  subtracao() {
    _resultadoCalculo = _resultadoCalculo - _num2;
  }

  multiplicacao() {
    _resultadoCalculo = _resultadoCalculo * _num2;
  }

  divisao() {
    _resultadoCalculo = _resultadoCalculo / _num2;
  }

  //endregion

  calcular() {
    switch (_operador) {
      case "+":
        soma();
        break;

      case "-":
        subtracao();
        break;

      case "x":
        multiplicacao();
        break;

      case "÷":
        divisao();
        break;
    }
  }

  digitar(String entrada) {
    setState(() {
      _entradaNumeros += entrada;
    });
  }

  resetar() {
    _isNum1 = true;
    _hasDecimal = false;
    _operador = "";
    _num1 = 0.0;
    _num2 = 0.0;
    _resultadoCalculo = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(

          title: new Text(widget.title),
        ),
        body: new Center(

          child: new Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                margin: const EdgeInsets.only(right: 25.0, bottom: 10.0),
                alignment: Alignment.centerRight,
                child: new Text(
                  _historico,
                  style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 25.0, right: 25.0, bottom: 90.0),
                alignment: Alignment.centerRight,
                child: new Text(
                  _entradaNumeros,
                  style: new TextStyle(
                      fontSize: 30.0
                  ),
                ),
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [

                  new MaterialButton(
                    child: new Text(
                        "7",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    //onPressed: digitar("7")
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "7";
                      });
                    },
                  ),

                  new MaterialButton(
                    child: new Text(
                        "8",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "8";
                      });
                    },
                  ),

                  new MaterialButton(
                    child: new Text(
                        "9",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "9";
                      });
                    },
                  ),

                  new MaterialButton(
                      child: new Text(
                        "+",
                        style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.greenAccent,
                      onPressed: () {
                        setState(() {
                          if (_resultadoFinal != 0.0) {
                            _resultadoCalculo = _resultadoFinal;
                            _operador = "+";
                            _historico = _historico + _operador;
                            _isNum1 = false;
                          }

                          if (_isNum1) {
                            _num1 = double.parse(_entradaNumeros);
                            _resultadoCalculo = _num1;

                            _historico = _num1.toString() + " + ";
                            _operador = "+";

                            _entradaNumeros = "";
                            _hasDecimal = false;

                            _isNum1 = !_isNum1;
                          } else {
                            if (_operador != "") {
                              _num2 = double.parse(_entradaNumeros);
                              calcular();

                              if (_resultadoCalculo != double.infinity) {
                                _operador = "+";
                                _historico =
                                    _resultadoCalculo.toString() + _operador;
                              }
                              else {
                                _historico = "Não é possível dividir por zero!";
                                resetar();

                                _resultadoFinal = 0.0;
                              }
                            }

                            _entradaNumeros = "";
                            _hasDecimal = false;
                          }
                        });
                      })
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>
                [
                  new MaterialButton(
                    child: new Text(
                        "4",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "4";
                      });
                    },
                  ),

                  new MaterialButton(
                    child: new Text(
                        "5",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          if (_isNovoCalculo) {
                            if (_isNovoCalculo) {
                              _historico = "";
                              _isNovoCalculo = !_isNovoCalculo;
                            }
                            _isNovoCalculo = !_isNovoCalculo;
                          }

                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "5";
                      });
                    },
                  ),

                  new MaterialButton(
                    child: new Text(
                        "6",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();

                          if (_isNovoCalculo) {
                            if (_isNovoCalculo) {
                              _historico = "";
                              _isNovoCalculo = !_isNovoCalculo;
                            }
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "6";
                      });
                    },
                  ),

                  new MaterialButton(
                      child: new Text(
                        "-",
                        style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.greenAccent,
                      onPressed: () {
                        setState(() {
                          if (_resultadoFinal != 0.0) {
                            _resultadoCalculo = _resultadoFinal;
                            _operador = "-";
                            _historico = _historico + _operador;
                            _isNum1 = false;
                          }

                          if (_isNum1) {
                            _num1 = double.parse(_entradaNumeros);
                            _resultadoCalculo = _num1;

                            _historico = _num1.toString() + " - ";
                            _operador = "-";

                            _entradaNumeros = "";
                            _hasDecimal = false;

                            _isNum1 = !_isNum1;
                          } else {
                            if (_operador != "") {
                              _num2 = double.parse(_entradaNumeros);
                              calcular();

                              if (_resultadoCalculo != double.infinity) {
                                _operador = "-";
                                _historico =
                                    _resultadoCalculo.toString() + _operador;
                              }
                              else {
                                _historico = "Não é possível dividir por zero!";
                                resetar();
                                _resultadoFinal = 0.0;
                              }
                            }

                            _entradaNumeros = "";
                            _hasDecimal = false;
                          }
                        });
                      }

                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>
                [
                  new MaterialButton(
                    child: new Text(
                        "1",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }


                        _entradaNumeros = _entradaNumeros + "1";
                      });
                    },
                  ),

                  new MaterialButton(
                    child: new Text(
                        "2",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "2";
                      });
                    },
                  ),

                  new MaterialButton(
                    child: new Text(
                        "3",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                          _resultadoFinal = 0.0;
                        }

                        _entradaNumeros = _entradaNumeros + "3";
                      });
                    },
                  ),

                  new MaterialButton(
                      child: new Text(
                        "x",
                        style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.greenAccent,
                      onPressed: () {
                        setState(() {
                          if (_resultadoFinal != 0.0) {
                            _resultadoCalculo = _resultadoFinal;
                            _operador = "x";
                            _historico = _historico + _operador;
                            _isNum1 = false;
                          }

                          if (_isNum1) {
                            _num1 = double.parse(_entradaNumeros);
                            _resultadoCalculo = _num1;

                            _historico = _num1.toString() + " x ";
                            _operador = "x";

                            _entradaNumeros = "";
                            _hasDecimal = false;

                            _isNum1 = !_isNum1;
                          } else {
                            if (_operador != "") {
                              _num2 = double.parse(_entradaNumeros);
                              calcular();

                              if (_resultadoCalculo != double.infinity) {
                                _operador = "x";
                                _historico =
                                    _resultadoCalculo.toString() + _operador;
                              }
                              else {
                                _historico = "Não é possível dividir por zero!";
                                resetar();

                                _resultadoFinal = 0.0;
                              }
                            }

                            _entradaNumeros = "";
                            _hasDecimal = false;
                          }
                        });
                      }
                  )
                ],
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>
                [
                  new MaterialButton(
                    child: new Text(
                        ".",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (!_hasDecimal && _entradaNumeros.length > 0) {
                          _entradaNumeros = _entradaNumeros + ".";
                          _hasDecimal = !_hasDecimal;
                        }
                      });
                    },
                  ),

                  new MaterialButton(
                    child: new Text(
                        "0",
                        style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        if (_operador.length == 0) {
                          resetar();
                          if (_isNovoCalculo) {
                            _historico = "";
                            _isNovoCalculo = !_isNovoCalculo;
                          }
                        }

                        _entradaNumeros = _entradaNumeros + "0";
                      });
                    },
                  ),

                  new MaterialButton(
                      child: new Text(
                        "=",
                        style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          if (_operador != "") {
                            _num2 = double.parse(_entradaNumeros);
                            calcular();

                            if (_resultadoCalculo != double.infinity) {
                              _resultadoFinal = _resultadoCalculo;
                              _historico = _resultadoCalculo.toString();
                            }
                            else {
                              _historico = "Não é possível dividir por zero!";
                              _resultadoFinal = 0.0;
                            }

                            resetar();
                            _entradaNumeros = "";
                            _isNovoCalculo = true;
                          }
                        });
                      }
                  ),

                  new MaterialButton(
                      child: new Text(
                        "÷",
                        style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.greenAccent,
                      onPressed: () {
                        setState(() {
                          if (_resultadoFinal != 0.0) {
                            _resultadoCalculo = _resultadoFinal;
                            _operador = "÷";
                            _historico = _historico + _operador;
                            _isNum1 = false;
                          }

                          if (_isNum1) {
                            _num1 = double.parse(_entradaNumeros);
                            _resultadoCalculo = _num1;

                            _historico = _num1.toString() + " ÷ ";
                            _operador = "÷";

                            _entradaNumeros = "";
                            _hasDecimal = false;

                            _isNum1 = !_isNum1;
                          } else {
                            if (_operador != "") {
                              _num2 = double.parse(_entradaNumeros);
                              calcular();

                              if (_resultadoCalculo != double.infinity) {
                                _operador = "÷";
                                _historico =
                                    _resultadoCalculo.toString() + _operador;
                              }
                              else {
                                _historico = "Não é possível dividir por zero!";
                                resetar();
                                _resultadoFinal = 0.0;
                              }
                            }
                            _entradaNumeros = "";
                            _hasDecimal = false;
                          }
                        });
                      }
                  )
                ],
              ),

              new Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>
                  [
                    new MaterialButton(
                      child: new Text(
                          "C",
                          style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _entradaNumeros = "";
                        });
                      },
                    ),

                    new MaterialButton(
                      child: new Text(
                          "CE",
                          style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          resetar();
                          _resultadoFinal = 0.0;
                          _entradaNumeros = "";
                          _historico = "";
                        });
                      },
                    ),
                  ]
              ),

            ],
          ),


        )
    );
  }
}
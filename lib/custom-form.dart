import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCustomForm extends StatelessWidget {
  MyCustomForm({Key key, this.savedData: '', @required this.onChanged})
      : super(key: key);

  final ValueChanged<String> onChanged;
  final String savedData;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void _onSubmitButton(String data) {
    onChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(30),
        child: Form(
            key: _formKey,
            child: ListView(
                children: <Widget>[
                  // Add TextFormFields and RaisedButton here.
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Name:')
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      alignment: Alignment.topLeft,
                      child: Text('Age:')
                  ),
                  TextFormField(
                    controller: ageController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your age';
                      }
                      return null;
                    },
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold
                                .of(context)
                                .showSnackBar(
                                SnackBar(
                                    content: Text('Processing data')
                                ));
                            _onSubmitButton(nameController.text);
                            // Navigator.pop(context);
                          }
                        },
                        child: Text('Submit'),
                      )
                  ),
                ]
            )
        )
    );
  }
}
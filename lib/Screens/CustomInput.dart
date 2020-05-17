import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  Icon fieldIcon;
  String hintText;
  String text;

  CustomInput(this.fieldIcon, this.hintText, this.text);
// final _formkey= new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      // key:_formkey,
      width: 250,
      child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.deepOrange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fieldIcon,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                width: 200,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter email';
                        } else
                          print(input);
                      },
                      onSaved: (input) => text = input,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: TextStyle(fontSize: 20.0, color: Colors.black)),
                ),
              ),
            ],
          )),
    );
  }
}

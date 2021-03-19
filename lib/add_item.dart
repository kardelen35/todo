import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  String _itemName;
  String _contentName;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: Text('Ekleme'),
      ),
      body: SimpleDialog(
        title: Text(
          'Listeye Birşeyler Ekle',
        ),
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Error';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _itemName = value,
                          autofocus: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        //Password
                        TextFormField(
                          controller: jobController,
                          decoration: InputDecoration(
                            labelText: 'job',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          obscureText: true, //Hides Password
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Error';
                            }
                            return null;
                          },
                          onSaved: (value) => _contentName = value,
                          autofocus: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FlatButton(
                  color: Colors.cyan[300],
                  child: Text(
                    'Ekle',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      Navigator.pop(context, _itemName);
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

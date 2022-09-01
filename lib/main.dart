import 'package:flutter/material.dart';

void main() {
  runApp(const flutterform.flutterForm());
}

enum Gender{male, female}

class flutterform extends StatefulWidget {
  const flutterform.flutterForm({Key? key}) : super(key: key);

  @override
  State<flutterform> createState() => _flutterformState();
}

class _flutterformState extends State<flutterform> {
  Gender _gender = Gender.female;
  bool _isChecked = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Flutterform2'),
          centerTitle: true,
        ),
        body: Form(
          //automatically checks the content if the imput is valid
          autovalidateMode: AutovalidateMode.always, key: _key,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('FirstName'),
                ),
                onSaved: (String? val){},
                validator: (String? val){
                  if(val!.isEmpty){
                    return 'please type something';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('Last Name'),
                ),
                onSaved: (String? val){},
                validator: (String? val){
                  if(val!.isEmpty){
                    return 'please type something';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  label: Text('Email'),
                ),
                onSaved: (String? val){},
                validator: (String? val){
                  if(val!.isEmpty){
                    return 'please type something';
                  }
                  return null;
                },
              ),TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  label: Text('Contact'),
                ),
                onSaved: (String? val){},
                validator: (String? val){
                  if(val!.isEmpty){
                    return 'please type something';
                  }
                  return null;
                },
              ),
              FormField<bool>(
                  builder: (FormFieldState<bool> state){
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Female'),
                          leading: Radio<Gender>(
                            value: Gender.female,
                            groupValue: _gender,
                            onChanged:(Gender? value) {
                              setState(() {
                                _gender  = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('male'),
                          leading: Radio<Gender>(
                            value: Gender.male,
                            groupValue: _gender,
                            onChanged:(Gender? value) {
                              setState(() {
                                _gender  = value!;
                              });
                            },
                          ),
                        )
                      ],
                    );
              },

              ),
              FormField(
                  builder: (FormFieldState<bool> state){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Are you a human'),
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value){
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                      ],
                    );
                  }
              ),
              Center(
                child: TextButton(
                  onPressed: (){
                    // here is where the validation begins
                    if (_key.currentState!.validate()){
                      _key.currentState!.save();
                    }
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';

class Myform3 extends StatefulWidget {
  const Myform3({super.key});

  @override
  State<Myform3> createState() => _Myform3State();
}

class _Myform3State extends State<Myform3> {
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  trysubmit() {
    final _isvalid = _formkey.currentState!.validate();
    if (_isvalid) {
      _formkey.currentState!.save();
      submitform();
    } else
      print('Error');
  }

  submitform() {
    print(name);
    print(email);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const BeveledRectangleBorder(),
        title: const Center(
          child: Text(
            'R E G I S T E R     N O W ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(children: [
        Stack(children: [
          Positioned(
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/pexels-anush-1229356.jpg')),
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
            ),
          ),
          const Positioned(
              left: 20,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ))
        ]),
        Container(
          height: 327,
          decoration: BoxDecoration(),
          child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Form(
                  key: _formkey,
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.only(right: 30, left: 30),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          key: ValueKey('name'),
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person_2_rounded,
                                color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'N A M E',
                          ),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'This field is mandatory';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            name = value.toString();
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.only(right: 30, left: 30),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          key: ValueKey('email'),
                          decoration: InputDecoration(
                            icon: Icon(Icons.mail, color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'E M A I L',
                          ),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'This field is mandatory';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            email = value.toString();
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.only(right: 20, left: 30),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          key: ValueKey('password'),
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock, color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: 'P A S S W O R D',
                              helperText:
                                  'Password must be minimum of 7 charachters',
                              helperStyle: TextStyle(color: Colors.white)),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'This field is mandatory';
                            } else if (value.toString().length < 7) {
                              return 'wrong password';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            password = value.toString();
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            overlayColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {
                            trysubmit();
                          },
                          child: Text('S I G N   U P')),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Text('Forgot Passwors?'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: TextButton(
                                child: Text(
                                  'Already Registered',
                                  style: TextStyle(
                                      color: Colors.blue[400],
                                      decoration: TextDecoration.underline),
                                ),
                                onPressed: () {},
                                style: ButtonStyle()),
                          ),
                        ],
                      )
                    ],
                  ))),
        ),
      ]),
    );
  }
}

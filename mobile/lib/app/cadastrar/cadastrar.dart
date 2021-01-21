import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/shared/cores.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  GlobalKey<FormState> _key = GlobalKey();

  List<TextEditingController> textControllers = List();

  File _image;

  loopCriarControllers() {
    for (int i = 0; i <= 3; i++) {
      textControllers.add(new TextEditingController());
    }
  }

  _imgDaCamera() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image.path);
    });
  }

  _imgDaGaleria() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image.path);
    });
  }

  void _mostrarOpcoes(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgDaGaleria();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgDaCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loopCriarControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cadastrar",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Press Start 2P',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Cores.primaria,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Center(
              child: Form(
                key: _key,
                child: _getFormulario(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFormulario() {
    return Column(
      children: <Widget>[
        Text(
          "Calltalog",
          style: TextStyle(
            fontFamily: 'Press Start 2P',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () {
            _mostrarOpcoes(context);
          },
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Cores.primaria,
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Nome',
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
          ),
          controller: textControllers[0],
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Login',
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
          ),
          controller: textControllers[1],
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Senha',
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
          ),
          controller: textControllers[2],
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Confirmação de Senha',
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
          ),
          controller: textControllers[3],
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: null, //_enviarParaServer,
            padding: EdgeInsets.all(12),
            color: Cores.primaria,
            child: Text(
              "Entrar",
              style: TextStyle(
                fontFamily: 'Press Start 2P',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

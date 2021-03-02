import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/repository/repository_shared.dart';
import 'package:mobile/shared/cores.dart';

class CadastrarEntretenimento extends StatefulWidget {
  @override
  _CadastrarEntretenimentoState createState() =>
      _CadastrarEntretenimentoState();
}

class _CadastrarEntretenimentoState extends State<CadastrarEntretenimento> {
  GlobalKey<FormState> _key = GlobalKey();
  RepositoryShared repositoryShared;
  List<TextEditingController> textControllers = List();

  File _image;
  DateTime dataLancamento;
  String radioItem = '1';

  loopCriarControllers() {
    for (int i = 0; i <= 5; i++) {
      textControllers.add(new TextEditingController());
    }
  }

  _imgDaCamera() async {
    PickedFile image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
    });
  }

  _imgDaGaleria() async {
    PickedFile image =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  _enviarParaServer() async {
    String titulo = textControllers[0].text;
    String descricao = textControllers[1].text;
    int tempo = int.parse(textControllers[2].text);
    int avaliacao = int.parse(textControllers[3].text);
    int temporada = 1;
    int episodios = 1;
    if (radioItem == '1') {
      temporada = int.parse(textControllers[4].text);
      episodios = int.parse(textControllers[5].text);
    }

    bool cadastrado;
    cadastrado = await repositoryShared.cadastrarEntretenimento(
        titulo,
        descricao,
        tempo,
        avaliacao,
        temporada,
        episodios,
        dataLancamento,
        _image);

    if (cadastrado) {
      Navigator.pushReplacementNamed(context, 'splash');
    }
  }

  _voltarParaHome() {
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  void initState() {
    super.initState();
    loopCriarControllers();
    repositoryShared = RepositoryShared();
    dataLancamento = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cadastrar Entretenimento",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Press Start 2P',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Cores.primaria,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: _voltarParaHome,
        ),
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
          //Editar Aqui
          child: Container(
            child: _image != null
                ? ClipRRect(
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
                    ),
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
            hintText: 'Titulo',
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
            hintText: 'Descricao',
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
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Tempo",
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
        ListTile(
          title: Text(
              "${dataLancamento.day}, ${dataLancamento.month}, ${dataLancamento.year}"),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: _getData,
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Avaliação",
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
          ),
          controller: textControllers[3],
        ),
        RadioListTile(
          value: '1',
          groupValue: radioItem,
          title: Text("Série"),
          onChanged: (val) {
            setState(() {
              radioItem = val;
            });
          },
        ),
        RadioListTile(
          value: '2',
          groupValue: radioItem,
          title: Text("Filme"),
          onChanged: (val) {
            setState(() {
              radioItem = val;
            });
          },
        ),
        _verificarFilmeOuSerie(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: _enviarParaServer,
            padding: EdgeInsets.all(12),
            color: Cores.primaria,
            child: Text(
              "Cadastrar",
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

  _verificarFilmeOuSerie() {
    if (radioItem == '2') {
      return SizedBox(
        height: 15,
      );
    } else {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Temporada",
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  32,
                ),
              ),
            ),
            controller: textControllers[4],
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Episódios",
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  32,
                ),
              ),
            ),
            controller: textControllers[5],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      );
    }
  }

  _getData() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 126),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        dataLancamento = date;
      });
    }
  }
}

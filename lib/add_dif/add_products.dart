import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProd extends StatefulWidget {
  const AddProd({Key? key}) : super(key: key);

  @override
  _AddProdState createState() => _AddProdState();
}

class _AddProdState extends State<AddProd> {
  int _currentStep = 0;
  bool uploading = false;
  List<File> _image = [];
  double val = 0;
  final picker = ImagePicker();

  TextEditingController _itemController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  TextEditingController _codeController = new TextEditingController();
  String _typeSelected = '';


  @override
  Widget _buildContactType(String catego) {
    return InkWell(
      child: Container(
        //height: 45,
        width: 100, //MediaQuery.of(context).size.width*0.25,
        decoration: BoxDecoration(
          color: _typeSelected == catego
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            catego,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = catego;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter Une Annonce'),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: _currentStep,
        onStepContinue: () {
          final isLastStep = _currentStep == getSteps().length - 1;
          if (isLastStep) {
            print('Completed');
            //send data to server
          } else {
            setState(() => _currentStep += 1);
          }
        },
        onStepCancel:
            _currentStep == 0 ? null : () => setState(() => _currentStep -= 1),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: _currentStep >= 0,
          title: Text('Images'),
          content: Stack(
            children: [
              Container(
                //height: 300, // zedtha 10h34**************
                padding: EdgeInsets.all(44),
                child: GridView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), // zedtha 10h34***************
                    shrinkWrap: true, // zedtha 10h34***************
                    itemCount: _image.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //mainAxisExtent: 2
                    ),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Center(
                              child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      !uploading ? chooseImage() : null),
                            )
                          : Container(
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(_image[index - 1]),
                                      fit: BoxFit.cover)),
                            );
                    }),
              ),
              uploading
                  ? Center(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            'uploading...',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: val,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        )
                      ],
                    ))
                  : Container(),
            ],
          ),
        ),
        Step(
          isActive: _currentStep >= 1,
          title: Text('Formulaire'),
          content: Column(
            children: [
              TextFormField(
                controller: _itemController,
                decoration: InputDecoration(
                  hintText: 'Enter Item',
                  prefixIcon: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  hintText: 'Enter Code',
                  prefixIcon: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: 'Enter Price',
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    size: 30,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
//CATEGORIES**********************************************************
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildContactType('Hotel'),
                      SizedBox(width: 10),
                      _buildContactType('Residence'),
                      SizedBox(width: 10),
                      _buildContactType('Agence'),
                      SizedBox(width: 10),
                      _buildContactType('Autres'),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          isActive: _currentStep >= 2,
          title: Text('Complete'),
          content: Container(),
        ),
      ];

  chooseImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 40,
        maxHeight: 1080,
        maxWidth: 1920);

    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }
}

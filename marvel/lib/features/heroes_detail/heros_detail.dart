import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/models/heroes.dart';
import 'package:marvel/services/marvel_service.dart';
import 'package:transparent_image/transparent_image.dart';

class HerosDetail extends StatefulWidget {
  final AllHeroesReponse model;
  MarvelService service = MarvelServiceImpl();

  HerosDetail([this.model, this.service]);

  @override
  _MarvelDetailState createState() => _MarvelDetailState();
}

//ViewModel
class ViewModel {
  Function didUpdate;

  AllHeroesReponse allHeroesReponse;

  ViewModel({this.didUpdate});

  fetchHerosWithId(MarvelService marvelService) {
    marvelService.fetchAllMavelWithId("1009144").then((response) {
      var json = jsonDecode(response.body);
      var result = json['data']['results'];
      AllHeroesReponse heroesList;
      for (var heroesJson in result) {
        heroesList = AllHeroesReponse.fromMappedJson(heroesJson);
      }
      allHeroesReponse = heroesList;
      didUpdate();
    });
  }
}

//View
class _MarvelDetailState extends State<HerosDetail> {
  AllHeroesReponse heroesResponseModel;

  ViewModel viewModel;

  _MarvelDetailState() {
    Function callback = () {
      setState(() {});
    };
    viewModel = ViewModel(didUpdate: callback);
  }

  @override
  void initState() {
    super.initState();
    viewModel.fetchHerosWithId(widget.service);
    viewModel.didUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // resizeToAvoidBottomInset: false,
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            widget.model.name.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          actionsForegroundColor: Colors.white,
          backgroundColor: Colors.blueGrey,
        ),
        child: Container(
            color: Colors.blueGrey.withOpacity(0.8),
            child: viewModel.allHeroesReponse != null
                ? Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 50,
                          color: Color(0xff758A97),
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Divider(
                                    color: Colors.white,
                                    height: 0,
                                    thickness: 0.5,
                                  ),
                                ),
                                Text("Name: ${widget.model.name}",
                                    style: TextStyle(color: Colors.white)),
                                Text("Description: ${widget.model.description}",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 50,
                          color: Color(0xff758A97),
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 24),
                                  child: Divider(
                                    color: Colors.white,
                                    height: 0,
                                    thickness: 0.5,
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 60,
                                ),
                                FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image:
                                      "${widget.model.path}.${widget.model.extensionHeroes}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        animating: true,
                      ),
                    ),
                  )));
                  
  }

}

class SmoothImageLoader extends StatelessWidget {
  double placeholderHeight;
  String imageName;

  SmoothImageLoader({this.placeholderHeight = 50, this.imageName});

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: placeholderHeight,
          width: placeholderHeight,
        ),
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageName,
        ),
      ],
    );
  }
}

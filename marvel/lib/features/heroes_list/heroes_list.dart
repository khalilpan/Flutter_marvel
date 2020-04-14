import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/models/heroes.dart';
import 'package:marvel/services/marvel_service.dart';
import 'heroes_list_cell.dart';


class HeroesListPage extends StatefulWidget {
  MarvelService service = MarvelServiceImpl();

  HeroesListPage([this.service]);

  @override
  _HeroesListPageState createState() => _HeroesListPageState();
}

//viewModel
class ViewModel {
  Function didUpdate;

  List<AllHeroesReponse> dataSource = [];

  ViewModel({this.didUpdate});

  dataSourceHeroes(MarvelService marvelService) {
    marvelService.fetchAllMavel().then((response) {
      var json = jsonDecode(response.body);
      List<AllHeroesReponse> heroesList = [];
      var list = json["data"]["results"];
      if (list != null) {
        for (var heroesJson in list) {
          var heroesResponse = AllHeroesReponse.fromMappedJson(heroesJson);
          heroesList.add(heroesResponse);
        }
        dataSource = heroesList;
        didUpdate();
      }
    });
  }
}

//view
class _HeroesListPageState extends State<HeroesListPage> {
  List<AllHeroesReponse> dataSource = [];
  ViewModel viewModel;

  _HeroesListPageState() {
    Function callback = () {
      setState(() {});
    };
    viewModel = ViewModel(didUpdate: callback);
  }

  @override
  initState() {
    super.initState();
    viewModel.dataSourceHeroes(widget.service);
    viewModel.didUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "HEROES MARVEL",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        child: Container(
            color: Colors.blueGrey.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: viewModel.dataSource.isNotEmpty //dataSource.isNotEmpty
                  ? ListView(
                      children: viewModel.dataSource.map((heros) {
                        //dataSource.map((heros) {
                        return Container(
                            height: 50,
                            child: HeroesListPageCell(
                              model: heros,
                            ));
                      }).toList(),
                    )
                  : Container(),
            )));

  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarvelGridPage extends StatelessWidget {


  List<String> dataSource = [];

  MarvelGridPage() {
    
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/1/b0/5269678709fb7/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/9/30/535feab462a64/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/3/80/4c00358ec7548/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/5/e0/4c0035c9c425d/standard_medium.gif");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/4/60/52695285d6e7e/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/9/a0/4ce18a834b7f5/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/b/70/4c0035adc7d3a/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce5a385a2e82/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/2/c0/4c00377144d5a/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/9/20/5102c774ebae7/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/b/03/52740e4619f54/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/b/c0/4ce5a1a50e56b/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/8/80/4c0041fb5a90d/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/9/60/4c0041f84c9fe/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/5/a0/4c0035890fb0a/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/d/80/52695253215f4/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/c/80/4ce59eb840da5/standard_medium.gif");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/5/90/4c0040b8329ad/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/2/80/511a79a0451a3/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/5/a0/4c0035813dc4c/standard_medium.jpg");
    dataSource.add("http://i.annihil.us/u/prod/marvel/i/mg/5/d0/53176a9be110c/standard_medium.jpg");


  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "CATALOG",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        child: Container(
          color: Colors.blueGrey.withOpacity(0.8),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            padding: EdgeInsets.all(8),
            children: dataSource.map((value) {
              return Image.network(value);
            }).toList(),
          ),
        ));
        
  }

}


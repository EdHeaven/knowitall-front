import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenAppbar extends StatelessWidget {
  const HomeScreenAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child: Image.asset("assets/images/Logo.png", width: 25, height: 25, )),
              const SizedBox(width: 5,),
              Text(
                'KnowItAll',
                style: GoogleFonts.nunito(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700)
              ),
              const SizedBox(width: 206,),
              IconButton(
                  onPressed:(){
                    showSearch(
                        context: context,
                        delegate: MySearchDelegate(),);
                  },
                  icon: const Icon(Icons.search, size: 35,),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Математика',
    'Языки програмирования',
    'Физика',
    'История',
    'География',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back)
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var category in searchTerms) {
      if (category.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(category);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
    throw UnimplementedError();
  }

  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var category in searchTerms) {
      if (category.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(category);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
    throw UnimplementedError();
  }}

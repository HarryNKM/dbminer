class HomeModel {
  int? id;
  String? category;
  String? quotesList;
  String? authorList;

  HomeModel({this.id, this.category, this.quotesList,  this.authorList});

  factory HomeModel.mapToModel(Map m1) {
    List<String> cat=m1['author'];
    List<String> qu=m1['quotes'];
    return HomeModel(
      id: m1['id'],
      category: m1['category'],
      authorList: cat,
      quotesList:qu ,
    );
  }
}





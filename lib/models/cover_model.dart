

class CoverModel {
  final String image, name;

  CoverModel({required this.image, required this.name});

 static List<CoverModel> cover = [
    CoverModel(image: 'assets/cover/cover1.png', name: 'Black collection'),
    CoverModel(image: 'assets/cover/cover2.png', name: 'HAE BY HAEKIM'),
    CoverModel(image: 'assets/cover/cover3.png', name: 'White collection')
  ];
}

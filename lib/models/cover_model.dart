class CoverModel {
  final String image;
  final String title;

  CoverModel({required this.image, required this.title});
}

List<CoverModel> covers = [
  CoverModel(
    image: 'assets/cover/slider cover1.png',
    title: 'BLACK COLLECTION',
  ),
   CoverModel(
    image: 'assets/cover/cover2.png',
    title: 'WHITE COLLECTION',
  ),

   CoverModel(
    image: 'assets/cover/slider caver3.png',
    title: 'HAE BY HAEKIM',
  ),
];

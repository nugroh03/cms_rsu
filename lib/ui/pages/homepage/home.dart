part of '../pages.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imagesMenu = [
    {
      'images': 'assets/icon-bangunan.svg',
      'idtiket': 'BG',
      'title': 'Bangunan'
    },
    {'images': 'assets/icon-it.svg', 'idtiket': 'IT', 'title': 'IT'},
    {
      'images': 'assets/icon-kendaraan.svg',
      'idtiket': 'KD',
      'title': 'Kendaraan'
    },
    {'images': 'assets/icon-alkes.svg', 'idtiket': 'AK', 'title': 'Alkes'},
    {
      'images': 'assets/icon-elektrikal.svg',
      'idtiket': 'EL',
      'title': 'Elektrikal'
    },
    {
      'images': 'assets/icon-sanitary.svg',
      'idtiket': 'SA',
      'title': 'Sanitari'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 50, left: 5, right: 5),
      child: GridView.count(
        childAspectRatio: 4 / 5,
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        children: imagesMenu
            .map<Widget>((item) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormPengaduan(
                                  idTiket: item['idtiket'],
                                )));
                  },
                  child: menuHome(
                    image: item['images'],
                    title: item['title'],
                  ),
                ))
            .toList(),
      ),
    ));
  }
}

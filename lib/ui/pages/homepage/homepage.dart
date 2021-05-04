part of '../pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List dataPengaduan = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<UserProvider>(context);

    return SafeArea(
        child: Scaffold(
            body: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            padding: EdgeInsets.only(top: 10),
            child: Text('Hai,' + ' ' + userprovider.user.name,
                style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 30)),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, right: 20),
                  child: FaIcon(FontAwesomeIcons.cog)),
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[greenColor2, greenColor1])),
          ),
          bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: whiteColor,
              controller: _tabController,
              tabs: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 30,
                  child: Text(
                    'Home',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 30,
                  child: Text(
                    'Pengaduan',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 30,
                  child: Text(
                    'Riwayat',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            Home(),
            Container(
              child: ListView(
                  padding: EdgeInsets.only(bottom: 60),
                  children: dataPengaduan.length > 0
                      ? dataPengaduan
                          .map<Widget>(
                            (item) => Pengaduan(
                              noTiket: item['noTiket'],
                              tanggalTiket: item['tglTiket'],
                            ),
                          )
                          .toList()
                      : [PengaduanKosong()]),
            ),
            ListView(
                padding: EdgeInsets.only(bottom: 60),
                children: dataPengaduan.length > 0
                    ? dataPengaduan
                        .map<Widget>(
                          (item) => Riwayat(
                            noTiket: item['noTiket'],
                            tanggalTiket: item['tglTiket'],
                          ),
                        )
                        .toList()
                    : [RiwayatKosong()]),

            // OrderPage(
            //   nextpage: () async {
            //     // final SharedPreferences prefs1 =
            //     //     await SharedPreferences.getInstance();
            //     // prefs1.setString('toko', keranjang);

            //     setState(() {
            //       _toggleTab();
            //     });
            //   },
            // ),
            // KeranjangPage(),
            // LacakPage(),
            // TagihanPage(),
          ],
        ),
      ),
    )));
  }
}

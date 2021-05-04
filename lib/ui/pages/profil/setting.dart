part of '../pages.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int jmlproduk = 0;
  bool _blockvisible = false;

  void _incrementCounter() {
    setState(() {});
  }

  Widget _block() {
    return Visibility(
      visible: _blockvisible,
      child: InkWell(
          onTap: () {
            this.setState(() {});
          },
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(0, 0, 0, 0.70),
              child: Text(""))),
    );
  }

  Widget menubantuan(image, title, onpress) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border(left: BorderSide(width: 5, color: greenColor2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: image),
            ),
            Flexible(
                flex: 3,
                child: Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    child:
                        Text(title, style: GoogleFonts.poppins(fontSize: 17)))),
            Flexible(
                flex: 1,
                child: Container(
                    transformAlignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue[50]),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                        onTap: onpress,
                        child: Icon(
                          Icons.arrow_forward,
                          color: greenColor2,
                        )))),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onPressed: () {}),
                SizedBox(width: 10),
                Text('Service', style: GoogleFonts.poppins(fontSize: 30)),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[greenColor1, greenColor2])),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [
              menubantuan(SvgPicture.asset('assets/icon-account.svg'),
                  'Atur Profil', () {}),
              menubantuan(SvgPicture.asset('assets/icon-secure.svg'),
                  'Password', () {}),
              menubantuan(SvgPicture.asset('assets/icon-mail.svg'),
                  'Hubungi Kami', () {}),
              menubantuan(SvgPicture.asset('assets/icon-calendar.svg'),
                  'Syarat dan Ketentuan', () {}),
              menubantuan(SvgPicture.asset('assets/icon-padlock.svg'),
                  'Kebijakan Privasi', () {}),
              menubantuan(
                  SvgPicture.asset('assets/icon-power.svg'), 'Keluar', () {}),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 100,
                      child: Image.asset('assets/logo-rsu.png'),
                    ),
                    Text('Versi 1.0',
                        style: blackTextStyle.copyWith(fontSize: 14)),
                  ],
                ),
              )
            ])));
  }
}

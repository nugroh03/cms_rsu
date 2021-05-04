part of '../pages.dart';

class PengaduanKosong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.2),
            child: SvgPicture.asset(
              'assets/icon-nopengaduan.svg',
              height: 80,
            ),
          ),
          Text('Belum ada pengaduan',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          Text('Silahkan buat pengaduan terlebih dahulu',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontSize: 17,
              )),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              height: 35,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [greenColor2, greenColor1])),
              child: Text('Buat Pengaduan',
                  style: whiteTextStyle.copyWith(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}

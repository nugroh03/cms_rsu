part of '../pages.dart';

class Pengaduan extends StatelessWidget {
  const Pengaduan({
    Key key,
    this.noTiket,
    this.tanggalTiket,
  }) : super(key: key);

  final String noTiket, tanggalTiket;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: whiteColor,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Text(
                        noTiket,
                        style: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Container(
                      child: Text(
                    tanggalTiket,
                    style: greyTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
          ),
          Container(
              height: 40,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[50],
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPengaduan()));
                  },
                  icon: Icon(Icons.arrow_forward_ios)))
        ],
      ),
    );
  }
}

part of '../pages.dart';

class DetailRiwayat extends StatelessWidget {
  List dataPengaduan = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              title: Container(
                child: Text('Form Pengaduan',
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[greenColor2, greenColor1])),
              ),
            ),
            body: Container(
              color: whiteColor,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text('No. Tiket',
                                  style: greyTextStyle.copyWith(fontSize: 16)),
                            ),
                            Text(':',
                                style: greyTextStyle.copyWith(fontSize: 16)),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'BG1290421',
                                style: greyTextStyle.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text('Tanggal Tiket',
                                  style: greyTextStyle.copyWith(fontSize: 16)),
                            ),
                            Text(':',
                                style: greyTextStyle.copyWith(fontSize: 16)),
                            Expanded(
                                child: Container(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  '29-04-2021',
                                  style: greyTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text('Lokasi',
                                  style: greyTextStyle.copyWith(fontSize: 16)),
                            ),
                            Text(':',
                                style: greyTextStyle.copyWith(fontSize: 16)),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Lorong Gedung A',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    )))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text('Uraian',
                                  style: greyTextStyle.copyWith(fontSize: 16)),
                            ),
                            Text(':',
                                style: greyTextStyle.copyWith(fontSize: 16)),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Keran dekat taman patah',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    )))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Photo',
                                  style: greyTextStyle.copyWith(fontSize: 16)),
                            ),
                            /*Container(
                              margin: EdgeInsets.only(left: 30, top: 30),
                              child: SvgPicture.asset(
                                'assets/icon-camera.svg',
                                height: 50,
                              ),
                            )*/
                            Container(
                              height: 150,
                              child: Image.asset('assets/kranpatah.jpg'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text('Responses',
                                  style: greyTextStyle.copyWith(fontSize: 16)),
                            ),
                            Text(':',
                                style: greyTextStyle.copyWith(fontSize: 16)),
                            Expanded(
                                child: Container(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Belum ditangani',
                                  style: greyTextStyle.copyWith(fontSize: 16),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}

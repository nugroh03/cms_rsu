part of '../pages.dart';

class FormPengaduan extends StatefulWidget {
  const FormPengaduan({
    Key key,
    this.idTiket,
  }) : super(key: key);

  final String idTiket;

  @override
  _FormPengaduanState createState() => _FormPengaduanState();
}

class _FormPengaduanState extends State<FormPengaduan> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    DateTime datenow = DateTime.now();
    String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(datenow);

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
                              child: Row(
                                children: [
                                  Text(
                                    widget.idTiket,
                                    style: greyTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '-',
                                    style: greyTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    randomNumeric(6),
                                    style: greyTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
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
                                  '$date',
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
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                //controller: fieldpin,
                                autofocus: false,
                                decoration: InputDecoration(
                                  hoverColor: Colors.red[50],
                                  hintText: 'Isi detail lokasi',
                                  hintStyle:
                                      greyTextStyle.copyWith(fontSize: 13),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greenColor2, width: 1),
                                  ),
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
                              child: Text('Uraian',
                                  style: greyTextStyle.copyWith(fontSize: 16)),
                            ),
                            Text(':',
                                style: greyTextStyle.copyWith(fontSize: 16)),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                //controller: fieldpin,
                                autofocus: false,
                                decoration: InputDecoration(
                                  hoverColor: Colors.red[50],
                                  hintText:
                                      'Isi detail kerusakan dan apa yang harus di perbaiki',
                                  hintStyle:
                                      greyTextStyle.copyWith(fontSize: 13),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greenColor2, width: 1),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
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
                            Container(
                              margin: EdgeInsets.only(left: 30, top: 30),
                              child: SvgPicture.asset(
                                'assets/icon-camera.svg',
                                height: 50,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [greyColor, Colors.black54])),
                                child: Text('BATAL',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pengajuan_terkirim(context);
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [greenColor2, greenColor1])),
                                child: Text('AJUKAN',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}

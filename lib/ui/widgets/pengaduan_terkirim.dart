part of 'widgets.dart';

pengajuan_terkirim(
  context,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Pengajuan Terkirim',
                      style: regularTextStyle.copyWith(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Terima kasih Anda sudah membantu kami dengan melakukan pengaduan untuk permasalahan teknis dilingkungan RSUD dr. Slamet. Pengaduan Anda akan segera kami tindak lanjuti.',
                      style: regularTextStyle.copyWith(
                          fontSize: 15, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: SvgPicture.asset(
                      'assets/icon-ceklist.svg',
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [greenColor2, greenColor1])),
                      child: Text('OK',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

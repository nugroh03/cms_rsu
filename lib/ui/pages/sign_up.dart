part of 'pages.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = new TextEditingController();

  TextEditingController nipController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<AuthProvider>(context);
    var userprovider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: redColor,
        content: Text(message),
      ));
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 150,
                  width: 300,
                  child: Image.asset(
                    'assets/logo-cms.png',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Daftar',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Masukkan data anda dengan benar',
                        style: greenTextStyle),
                  ],
                )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NAMA',
                          style: greyTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 50,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Nama',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NIP',
                          style: greyTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 50,
                        child: TextField(
                          controller: nipController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'NIP',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PASSWORD',
                          style: greyTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 50,
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    UserModel user = await authprovider.register(
                        nipController.text,
                        nameController.text,
                        passwordController.text);
                    if (user == null) {
                      showError('nip sudah terdaftar');
                    } else {
                      setState(() {
                        isLoading = true;
                      });

                      userprovider.user = user;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    width: width,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [greenColor2, greenColor1])),
                    child: Text('MASUK',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 20)),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah memiliki akun?' + ' ',
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Masuk',
                          style: redTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

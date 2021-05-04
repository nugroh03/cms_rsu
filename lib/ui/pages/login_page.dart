part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nipController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    getLogin();
    super.initState();
  }

  void getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    if (token != null && token != '') {
      UserProvider user = Provider.of(context, listen: false);
      user.getUserService(token).then((value) async {
        if (value != null) {
          print('set user done');

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HomePage()));
        } else {
          print('set user gagal');
        }
      });
    }
  }

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
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                height: height * 0.3,
                width: width,
                child: Image.asset(
                  'assets/logo-cms.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nipController,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'NIP',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: greenColor1, width: 3.0),
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: greenColor2, width: 3),
                            borderRadius: BorderRadius.circular(32.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: greenColor1, width: 3.0),
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.poppins(color: Colors.blue, fontSize: 15),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GestureDetector(
                      onTap: () async {
                        if (nipController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          showError('Semua wajib diisi');
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          UserModel user = await authprovider.login(
                              nipController.text, passwordController.text);

                          setState(() {
                            isLoading = false;
                          });

                          if (user == null) {
                            showError('nip atau password salah');
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            print(user.token);
                            userprovider.user = user;

                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString("token", user.token);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.15),
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
                margin: EdgeInsets.only(bottom: 30),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum memiliki akun?' + ' ',
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.normal),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Daftar',
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
    ));
  }
}

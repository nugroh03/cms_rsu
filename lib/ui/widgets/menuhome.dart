part of 'widgets.dart';

class menuHome extends StatelessWidget {
  const menuHome({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                    color: whiteColor,
                    height: 80,
                    width: 100,
                    child: SvgPicture.asset(image)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]));
  }
}

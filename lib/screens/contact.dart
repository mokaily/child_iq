import 'package:flutter/material.dart';
import '../data/theme.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatefulWidget {
  ContactMe({Key key}) : super(key: key);

  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final TextEditingController msg = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var marginFixed = MediaQuery.of(context).size.width * 0.040;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: StyleCustom().bg,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.black)),
            title: Text(
              "تواصل معي",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            )),
        backgroundColor: StyleCustom().bg,
        body: Container(
            margin: EdgeInsets.only(left: marginFixed, right: marginFixed),
            child: ListView(children: <Widget>[
              inputReady(context, "من فضلك أدخل أسمك", "الأسم", name,
                  StyleCustom().blue, Icon(Icons.person)),
              inputReady(context, "من فضلك أدخل أسم دولتك", "الدولة", country,
                  StyleCustom().orange, Icon(Icons.location_on)),
              inputReady(context, "من فضلك أدخل بريدك", "الإيميل", email,
                  StyleCustom().silver, Icon(Icons.email)),
              Container(
                  padding: EdgeInsets.all(marginFixed),
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black12)),
                  child: TextField(
                      controller: msg,
                      maxLength: 255,
                      maxLines: 6,
                      cursorColor: Colors.black38,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                          hintText: "اكتب رسالتك هنا",
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              color: Colors.black38),
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          alignLabelWithHint: false,
                          contentPadding: EdgeInsets.all(0)))),
              FlatButton(
                onPressed: () async {
                  if (checkEmpty(context, msg, name, country, email) == true) {
                    final MailOptions mailOptions = MailOptions(
                      body:
                          'السلام عليكم أسمى ${name.text} أنا من ${country.text} رسالتى: ${msg.text} تم الإرسال من تطبيق إختبار الذكاء لإبنى',
                      subject: '${name.text}',
                      recipients: ['fahad.alnegaithan@gmail.com'],
                      isHTML: true,
                    );
                    await FlutterMailer.send(mailOptions);
                  }
                },
                color: StyleCustom().mainBlue,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 14,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text("ارسل الرسالة",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14))
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              Divider(),
              FlatButton(
                onPressed: () async {
                  const url = 'https://twitter.com/FAHAD577';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                color: Color(0xff1da1f2),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/tw.png',
                        width: 14,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text("راسلنى على تويتر",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14))
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ])));
  }

  inputReady(BuildContext context, String hint, String name,
      TextEditingController variable, Color x, Icon y) {
    var marginFixed = MediaQuery.of(context).size.width * 0.040;
    return Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Row(children: <Widget>[
          Container(
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width / 3.5,
              decoration: BoxDecoration(
                  color: x,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(children: <Widget>[
                Icon(y.icon, color: Colors.white, size: 18),
                Padding(padding: EdgeInsets.all(2)),
                Text(name,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w300))
              ])),
          Container(
              padding: EdgeInsets.only(right: 3),
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 4.5) -
                  (marginFixed * 4),
              child: TextField(
                  controller: variable,
                  cursorColor: x,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: Colors.black38),
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      alignLabelWithHint: false,
                      contentPadding: EdgeInsets.all(0))))
        ]),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.black12)));
  }
}

checkEmpty(
    BuildContext context,
    TextEditingController msg,
    TextEditingController name,
    TextEditingController country,
    TextEditingController email) {
  if (name.text == "") {
    alert(context, "اسمك");
  } else if (country.text == "") {
    alert(context, "دولتك");
  } else if (email.text == "") {
    alert(context, "ايميل");
  } else if (msg.text == "") {
    alert(context, "رسالتك");
  } else
    return true;
}

void alert(BuildContext context, var name) {
  var alertDialog = AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Container(
          height: 50,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.assignment,
                  size: 15,
                ),
                Text(
                  "من فضلك أدخل $name",
                  style: TextStyle(fontSize: 14),
                ),
              ])));
  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

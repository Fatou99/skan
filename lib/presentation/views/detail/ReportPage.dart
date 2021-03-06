import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_reader/core/model/Report.dart';
import 'package:news_reader/presentation/views/detail/dataSearch.dart';
import 'package:news_reader/presentation/widgets/ReportRow.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<Report> reports;
  List<Report> reportsTrue;
  List<Report> reportsFalse;
  var list;
  var random;
bool value=false;
  @override
  void initState() {
    super.initState();
    random = Random();
    list = List.generate(random.nextInt(10), (i) => "Item $i");

    reports = new List<Report>();
    reportsTrue = new List<Report>();
    reportsFalse = new List<Report>();
    addReports();
    for (var i = 0; i < reports.length; i++) {
      final Report report = reports[i];
      if (report.affichage == true) {
        reportsTrue.add(report);
      } else {
        reportsFalse.add(report);
      }
    }
  }

  void addReports() {
    reports.add(new Report(
        8.793253,
        36.566389,
        "resto",
        "https://scontent.ftun7-1.fna.fbcdn.net/v/t1.15752-9/89925838_489363825280104_1717714553048924160_n.png?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=FM15CjRP85UAX_hPoAX&_nc_ht=scontent.ftun7-1.fna&oh=7dd9d964fa2570859a74b85e04c6a11e&oe=5E9B7050",
        "00:48:04.901462",
        true));
    reports.add(new Report(
        10.340294,
        36.729070,
        "cafe",
        "https://shamelesspopery.com/media/2014/01/Bebada2-247x450.jpg",
        "01:30",
        true));
    reports.add(new Report(
        9.867040,
        37.274560,
        "cafe",
        "https://media-cdn.tripadvisor.com/media/photo-s/0a/ec/c5/ab/taken-with-cell-phone.jpg",
        "01:30",
        true));
    reports.add(new Report(8.835415, 35.168926, "cafe",
        "https://i.redd.it/ku0gu5avkj911.jpg", "01:30", true));
    reports.add(new Report(
        10.422828,
        32.910221,
        "cafe",
        "https://scontent.ftun7-1.fna.fbcdn.net/v/t1.15752-9/89714805_243938279979275_2983177111482662912_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=1-Ny_hjFphsAX-7RuvX&_nc_ht=scontent.ftun7-1.fna&oh=10150086f59d5a8c31ac964a2ef4d51b&oe=5E9AF4B1",
        "01:30",
        true));
    reports.add(new Report(
        10.422828,
        32.910221,
        "cafe",
        "https://scontent.ftun7-1.fna.fbcdn.net/v/t1.15752-9/89714805_243938279979275_2983177111482662912_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=1-Ny_hjFphsAX-7RuvX&_nc_ht=scontent.ftun7-1.fna&oh=10150086f59d5a8c31ac964a2ef4d51b&oe=5E9AF4B1",
        "01:30",
        true));
    reports.add(new Report(
        10.422828,
        32.910221,
        "cafe",
        "https://scontent.ftun7-1.fna.fbcdn.net/v/t1.15752-9/89714805_243938279979275_2983177111482662912_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=1-Ny_hjFphsAX-7RuvX&_nc_ht=scontent.ftun7-1.fna&oh=10150086f59d5a8c31ac964a2ef4d51b&oe=5E9AF4B1",
        "01:30",
        true));
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // list=List.generate(random.nextInt(10), (i)=> "Item $i");
      reportsTrue.add(new Report(
          10.422828,
          32.910221,
          "cafe",
          "https://scontent.ftun7-1.fna.fbcdn.net/v/t1.15752-9/89714805_243938279979275_2983177111482662912_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=1-Ny_hjFphsAX-7RuvX&_nc_ht=scontent.ftun7-1.fna&oh=10150086f59d5a8c31ac964a2ef4d51b&oe=5E9AF4B1",
          "01:30",
          true));
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<bool> gouvernorats = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];

    // print(gouvernorats.length);

    final List<String> gouvernoratsName = [
      "Ariana",
      "Béja",
      "Ben Arous",
      "Bizerte",
      "Gabès",
      "Gafsa",
      "Jendouba",
      "Kairouan",
      "Kasserine",
      "Kébili",
      "Kef",
      "Mahdia",
      "Manouba",
      "Médenine",
      "Monastir",
      "Nabeul",
      "Sfax",
      "Sidi Bouzid",
      "Siliana",
      "Sousse",
      "Tataouine",
      "Tozeur",
      "Tunis",
      "Zaghouan",
    ];
    // print(gouvernoratsName.length);
    List<String> gouvernoratSelected = new List<String>();

    Drawer sideNav() {
      return Drawer(
          child: Stack(children: <Widget>[
        //first child be the blur background
        BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0), //this is dependent on the import statment above
            child: Container(
                decoration:
                    BoxDecoration(color: Colors.grey.withOpacity(0.5)))),
        ListView(padding: EdgeInsets.zero, children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("User Name"),
            accountEmail: new Text("User Email"),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/images/nature.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/46.jpg")),
          ),
          new ListTile(
              leading: Icon(Icons.do_not_disturb),
              title: new Text("Déconnexion"),
              onTap: () {
                Navigator.pushNamed(context, "/logIn");
              }),
          new ListTile(
              leading: Icon(Icons.add),
              title: new Text("Ajouter un autre administrateur"),
              onTap: () {
                Navigator.pushNamed(context, "/signUp");
              }),
          new ListTile(
              leading: Icon(Icons.directions_subway),
              title: new Text("Trier par distance"),
              onTap: () {
                print(gouvernoratSelected);
              }),
          new ListTile(
              leading: Icon(Icons.date_range),
              title: new Text("Trier par date"),
              onTap: () {
                // Navigator.pop(context, "/signUp");
              }),
          new ListTile(
              leading: Icon(Icons.date_range),
              title: new Text("Choisir le gouvernorat"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      // StatefulBuilder
                      builder: (context, setState) {
                        return SingleChildScrollView(
                          child: AlertDialog(
                            actions: <Widget>[
                              Container(
                                width: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Les gouvernorats:",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[0],
                                      title: Text(gouvernoratsName[0]),
                                      onChanged: (value) {
                                        setState(() {
                                          // gouvernorats[0]=value;
                                          gouvernorats[0] = !gouvernorats[0];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[1],
                                      title: Text(gouvernoratsName[1]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[1] = !gouvernorats[1];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[2],
                                      title: Text(gouvernoratsName[2]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[2] = !gouvernorats[2];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[3],
                                      title: Text(gouvernoratsName[3]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[3] = !gouvernorats[3];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[4],
                                      title: Text(gouvernoratsName[4]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[4] = !gouvernorats[4];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[5],
                                      title: Text(gouvernoratsName[5]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[5] = !gouvernorats[5];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[6],
                                      title: Text(gouvernoratsName[6]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[6] = !gouvernorats[6];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[7],
                                      title: Text(gouvernoratsName[7]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[7] = !gouvernorats[7];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[8],
                                      title: Text(gouvernoratsName[8]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[8] = !gouvernorats[8];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[9],
                                      title: Text(gouvernoratsName[9]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[9] = !gouvernorats[9];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[10],
                                      title: Text(gouvernoratsName[10]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[10] = !gouvernorats[10];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[11],
                                      title: Text(gouvernoratsName[11]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[11] = !gouvernorats[11];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[12],
                                      title: Text(gouvernoratsName[12]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[12] = !gouvernorats[12];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[13],
                                      title: Text(gouvernoratsName[13]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[13] = !gouvernorats[13];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[14],
                                      title: Text(gouvernoratsName[14]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[14] = !gouvernorats[14];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[15],
                                      title: Text(gouvernoratsName[15]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[15] = !gouvernorats[15];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[16],
                                      title: Text(gouvernoratsName[16]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[16] = !gouvernorats[16];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[17],
                                      title: Text(gouvernoratsName[17]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[17] = !gouvernorats[17];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[18],
                                      title: Text(gouvernoratsName[18]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[18] = !gouvernorats[18];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[19],
                                      title: Text(gouvernoratsName[19]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[19] = !gouvernorats[19];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[20],
                                      title: Text(gouvernoratsName[20]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[20] = !gouvernorats[20];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[21],
                                      title: Text(gouvernoratsName[21]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[21] = !gouvernorats[21];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[22],
                                      title: Text(gouvernoratsName[22]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[22] = !gouvernorats[22];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    CheckboxListTile(
                                      value: gouvernorats[23],
                                      title: Text(gouvernoratsName[23]),
                                      onChanged: (value) {
                                        setState(() {
                                          gouvernorats[23] = !gouvernorats[23];
                                        });
                                      },
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Material(
                                          elevation: 5.0,
                                          color: Colors.teal,
                                          child: MaterialButton(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 5.0, 10.0, 5.0),
                                            onPressed: () {
                                              print(gouvernorats);
                                              // setState(() {
                                              for (int i = 0; i < 24; i++) {
                                                if (gouvernorats[i] == true) {
                                                  gouvernoratSelected
                                                      .add(gouvernoratsName[i]);
                                                }
                                              }
                                              Navigator.of(context).pop();
                                              // });
                                            },
                                            child: Text("Save",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                )),
                                          ),
                                        ),
                                        Material(
                                          elevation: 5.0,
                                          color: Colors.red,
                                          child: MaterialButton(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 5.0, 10.0, 5.0),
                                            onPressed: () {
                                              setState(() {
                                                  for (int i = 0; i < 24; i++) {
                                                    gouvernorats[i]=false;
                                                  }
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: Text("Cancel",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                )),
                                          ),
                                        ),
                                        Material(
                                          elevation: 5.0,
                                          color: Colors.blue[900],
                                          child: MaterialButton(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 5.0, 10.0, 5.0),
                                            onPressed: () {
                                              setState(() {
                                                for (int i = 0;
                                                    i < gouvernorats.length;
                                                    i++) {
                                                  gouvernorats[i] = true;
                                                }
                                              });
                                              // Navigator.of(context).pop();
                                            },
                                            child: Text("Select All",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                )),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              }),
        ])
      ]));
    }

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        color: Colors.red[300],
        child: new ButtonBar(
          // buttonTextTheme:
          children: <Widget>[
            Text("Cliquez pour voir les rapports cachés",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Switch(
              value: value,
              activeColor: Colors.green,
              onChanged: (bool e) {
                if (e) {
                  setState(() {
                     value = true;
                
                  });
                 
                } else {
                  setState(() {
                    value=false;
                  });
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text('Les dépassements'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Recherche',
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: sideNav()),
      body: RefreshIndicator(
        child: makeBody(context),
        onRefresh: refreshList,
      ),
    ));
  }

  Widget makeBody(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.4, 0.9],
          colors: [
            Colors.teal,
            Color.fromRGBO(60, 157, 155, 1),
            Color(0xFFFF3F1A),
          ],
        ),
      ),
      child: AnimationLimiter(
        child: 
        (value) ?
            ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: reportsFalse.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = reportsFalse[index];

                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1500),
                          child: SlideAnimation(
                            horizontalOffset: -1000.0,
                            //  child: SlideAnimation(
                            child: ReportRow(item),
                          ),
                        );
                      })
                      :
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: reportsTrue.length,
            itemBuilder: (BuildContext context, int index) {
              final item = reportsTrue[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1500),
                child: SlideAnimation(
                  horizontalOffset: -1000.0,
                  //  child: SlideAnimation(
                  child: Dismissible(
                    // Show a red background as the item is swiped away.
                    background: Container(
                      color: Colors.red,
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (this.mounted) {
                        setState(() {
                          reportsFalse.add(item);
                          reportsTrue.removeAt(index);
                        });
                      }

                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Elément masqué avec succès")));
                    },
                    child: ReportRow(item),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

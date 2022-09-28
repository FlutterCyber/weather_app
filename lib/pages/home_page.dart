import 'package:flutter/material.dart';
import 'package:weather_app/model/info_list.dart';
import '../model/full_info_model.dart';
import '../service/network_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FullInfo> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }

  void _apiEmpList() {
    Network.GET(Network.API, Network.paramsGet()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _showResponse(String response) {
    InfoList infoList = Network.parseList(response);


    setState(() {
      items.addAll(infoList.data);
    });
    print("Length: ${items.length}");
    print(items);
    //print("Ma'lumotlar soni: ${emplist.data.length}");

    // EmpOne empone = Network.parseEmpOne(response);
    // print("ISMI: ${empone.data.employee_age}");

    // print("Nimadir: ${empone.data.employee_name}");

    // setState(() {
    //   data = response;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Employee List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i) {
              return itemsOfList(items[i]);
            }),
      ),
    );
  }

  Widget itemsOfList(FullInfo fullinfo){
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fullinfo.weather.icon +
                " " +
                fullinfo.app_temp.toString() +
                ": " +
                fullinfo.clouds.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            "Oylik: " + fullinfo.datetime.toString() + " \$",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );

  }
}

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
  List items2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiList();
  }

  void _apiList() {
    Network.GET(Network.API, Network.paramsGet()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _showResponse(String response) {
    InfoList infoList = Network.parseList(response);
    items2.add(infoList.city_name);
    items2.add(infoList.country_code);
    items2.add(infoList.lat);
    items2.add(infoList.state_code);

    setState(() {
      items.addAll(infoList.data);
      items.add(infoList.data[1]);
    });
    print("Length: ${items.length}");

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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Employee List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i) {
              return itemsOfList(items[i], items2);
            }),
      ),
    );
  }

  Widget itemsOfList(FullInfo fullinfo, List lst) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ITEMS2 uchun: ${lst[0]}"),
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
          Text(fullinfo.weather.code.toString()),
          SizedBox(
            height: 18,
          ),
          Text(fullinfo.wind_spd.toString()),
          SizedBox(
            height: 18,
          ),
          Text(
            "Time: " + fullinfo.datetime.toString(),
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

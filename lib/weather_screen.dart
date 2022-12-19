import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forcast/api_class.dart';

import 'package:weather_forcast/models.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
late String name;

  final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(30));

  TextEditingController _searchController = TextEditingController();
  final _dataservice = DataService();
  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      Positioned(
        bottom: MediaQuery.of(context).size.height / 2.3,
        child: Image.network(
            "https://images.unsplash.com/photo-1586766193036-6d93c6c6c703?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmVvbiUyMGNpdHl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
      ),
      Positioned(
        bottom: 0,
        child: Container(
            height: MediaQuery.of(context).size.height / 2.3,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent),
      ),
      Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.dehaze_rounded),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://funkylife.in/wp-content/uploads/2022/09/girl-dp-image-260.jpg"),
                  backgroundColor: Colors.black26,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Hello Khewana",
                    style: GoogleFonts.share(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Check the weather by the city",
                    style: GoogleFonts.b612(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder, //initialized at top
                      border: inputBorder,
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _search();
                        },
                        icon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 155,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Location",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ))
                    ],
                  ),
                 SizedBox(
                   height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 40),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(
                                  "https://w0.peakpx.com/wallpaper/362/492/HD-wallpaper-chicago-landscape-cities-city-panoramic-sea-seaview-sky-sunset-thumbnail.jpg",
                                  height:
                                      MediaQuery.of(context).size.height / 3.3,
                                ),
                                Column(children: [
                                  if (_response != null)
                                    Text("${_response?.name}",
                                        style: GoogleFonts.spectral(
                                            fontSize: 40, color: Colors.black)),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize:30,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Text(

                                    "${_response?.tempInfo.temp
                                    }",

                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Text(
                                     "${_response?.weatherInfo.icon}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),



                                ]),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.network(
                                    "https://i.pinimg.com/736x/fc/c2/44/fcc244f86075aadf9dda8ea1a7bef13c.jpg",
                                    height: MediaQuery.of(context).size.height /3.3,
                                  ),
                                  Column(
                                    children: [
                                      if (_response != null)
                                        Text("${_response?.weatherInfo.description}",
                                            style: GoogleFonts.k2d(
                                                fontSize:30,
                                                color: Colors.black)),
                                      Text(
                                        "${_response?.name}",
                                        style: GoogleFonts.k2d(
                                            fontSize:30,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                 )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  void _search() async {
    final response = await _dataservice.getWeather(_searchController.text);

    setState(() => _response = response);
    // print(response.name);
    // print(response.tempInfo.temp);
    // print(response.weatherInfo.icon);
    // print(response.weatherInfo.description);
  }
}

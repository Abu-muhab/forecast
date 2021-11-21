import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/data/models/place_search_result_model.dart';
import 'package:forecast/presentation/pages/forecast/forecast.dart';
import 'package:forecast/presentation/pages/forecast/forecast_action_box.dart';
import 'package:forecast/presentation/pages/forecast/forecast_loading_box.dart';
import 'package:forecast/presentation/providers/forecast_provider.dart';
import 'package:forecast/presentation/providers/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: kPrimaryColor,
          child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 24, right: 25, top: 30, bottom: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(8)),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: TextField(
                              controller: searchController,
                              onSubmitted: (value) {
                                Provider.of<LocationProvider>(context,
                                        listen: false)
                                    .searchLocation(value);
                              },
                              textInputAction: TextInputAction.search,
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Selector<LocationProvider, Tuple3>(
                    selector: (context, model) => Tuple3(
                        model.isSearchingLocation,
                        model.searchResult,
                        model.errorSearching),
                    builder: (context, tuple3, _) {
                      if (tuple3.item1 == true) {
                        return Center(
                          child: ForecastLoadingBox(),
                        );
                      }

                      if (tuple3.item3 == true) {
                        return Center(
                          child: ForecastActionBox(
                              onActionButtonPressed: () {
                                Provider.of<LocationProvider>(context,
                                        listen: false)
                                    .searchLocation(searchController.text);
                              },
                              promptText: "Error searching location",
                              actionButtonIcon: Icons.search,
                              actionButtonText: "Try again"),
                        );
                      }

                      if (tuple3.item2 == null) {
                        return Container();
                      }

                      List<Place> searchResult = (tuple3.item2 as List<Place>);

                      if (searchResult.length == 0) {
                        return Center(
                          child: Text(
                            "Location Not found",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      return ListView.builder(
                          itemBuilder: (context, count) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForecastScreen(
                                              place: searchResult[count],
                                            ))).then((value) {
                                  Provider.of<ForecastProvider>(context,
                                          listen: false)
                                      .setSearchMode(false);
                                });
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      searchResult[count].formattedAddress,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: searchResult.length);
                    },
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

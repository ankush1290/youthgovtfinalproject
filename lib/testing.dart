import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youthgovt/blockchainfiles/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:youthgovt/blockchainfiles/features/dashboard/ui/dashboard_page.dart';
import 'package:youthgovt/blockchainfiles/features/entry/addentry_page.dart';
import 'package:youthgovt/blockchainfiles/features/entry/editentry_page.dart';
import 'package:youthgovt/blockchainfiles/features/search/accountsearch_page.dart';

class service extends StatefulWidget {
  @override
  _serviceState createState() => _serviceState();
}

class _serviceState extends State<service> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  String currentOption = "Edit"; // Default option

  Widget _buildEditPageContent() {
    return EditEntryPage(dashboardBloc: dashboardBloc);
  }

  Widget _buildAddEntryPageContent() {
    return AddEntryPage(dashboardBloc: dashboardBloc);
  }

  Widget _buildSearchPageContent() {
    return AccountSeachpage(dashboardBloc: dashboardBloc,);
  }

  Widget _buildHistoryPageContent() {
    return DashboardPage();
  }

  Widget _buildSelectedOptionContent() {
    switch (currentOption) {
      case "Edit":
        return _buildEditPageContent();
      case "Add Entry":
        return _buildAddEntryPageContent();
      case "Search":
        return _buildSearchPageContent();
      case "History":
        return _buildHistoryPageContent();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: Text("APPLICATION",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Row(
        children: [
          // Side navigation
          Container(
            width: 200,
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentOption = "Edit";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Edit Application",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: currentOption == "Edit" ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentOption = "Add Entry";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "New Application",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: currentOption == "Add Entry" ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentOption = "Search";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: currentOption == "Search" ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentOption = "History";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "History",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: currentOption == "History" ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main content
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Current Option: $currentOption",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: _buildSelectedOptionContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

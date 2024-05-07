// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:youthgovt/blockchainfiles/features/dashboard/bloc/dashboard_bloc.dart';
// import 'package:youthgovt/blockchainfiles/features/entry/addentry_page.dart';
// import 'package:youthgovt/blockchainfiles/features/entry/editentry_page.dart';
// import 'package:youthgovt/blockchainfiles/features/search/accountsearch_page.dart';
// import 'package:youthgovt/blockchainfiles/utils/colors.dart';

// class maindashboradpage extends StatefulWidget {
//   const maindashboradpage({super.key});

//   @override
//   State<maindashboradpage> createState() => _maindashboradpageState();
// }

// class _maindashboradpageState extends State<maindashboradpage> {
 
//   final DashboardBloc dashboardBloc = DashboardBloc();
//   // static const IconData history = IconData(0xe314, fontFamily: 'MaterialIcons');

//   @override
//   void initState() {
//     dashboardBloc.add(DashboardInitialFechEvent());
//     super.initState();
//   } @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.dashboardpageAccent,
//         appBar: AppBar(
//           title: const Text("DashBoard"),
//           backgroundColor: AppColors.dashboardAppBarAccent,
//           titleTextStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 40,
//             //fontWeight: FontWeight.bold,
//           ),
//         ),

//         //body
//         body: BlocConsumer<DashboardBloc, DashboardState>(
//           bloc: dashboardBloc,
//           listener: (context, state) {},
//           builder: (context, state) {
//             switch (state.runtimeType) {
//               case DashBoardLoadingState:
//                 return Center(child: CircularProgressIndicator());
//               case DashBoardErrorState:
//                 return Center(child: Text("Error"));
//               case DashBoardSuccessState:
//                 final successState = state as DashBoardSuccessState;
//                 return Container(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                   child: Column(
//                     children: [
//                       //Top row
//                       Container(
//                         color:Colors.red ,
//                         child: Row(
//                           children: [
//                             //add entry
//                             Expanded(
//                               child: InkWell(
//                                 onTap: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => AddEntryPage(
//                                               dashboardBloc: dashboardBloc,
//                                             ))),
//                                 child: Container(
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: AppColors.buttonAccents,
//                                   ),
//                                   child: const Center(
//                                     child: Text(
//                                       "Add Entry",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             //edit entry
//                             Expanded(
//                               child: InkWell(
//                                 onTap: () => Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => EditEntryPage(
//                                             dashboardBloc: dashboardBloc,
//                                           )),
//                                 ),
//                                 child: Container(
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: AppColors.buttonAccents,
//                                   ),
//                                   child: const Center(
//                                     child: Text(
//                                       "Edit Entry",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),

//                             const SizedBox(width: 10),
//                             //Fetch Account
//                             Expanded(
//                               child: InkWell(
//                                 onTap: () => Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => AccountSeachpage(
//                                             dashboardBloc: dashboardBloc,
//                                           )),
//                                 ),
//                                 child: Container(
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: AppColors.buttonAccents,
//                                   ),
//                                   child: const Center(
//                                     child: Text(
//                                       "Search",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                   ))));
//             }}

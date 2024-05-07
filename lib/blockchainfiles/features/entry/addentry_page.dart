import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youthgovt/blockchainfiles/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:youthgovt/blockchainfiles/models/transaction_model.dart';
import 'package:youthgovt/blockchainfiles/utils/colors.dart';
// import 'package:flutter_record_magering_portal/features/dashboard/bloc/dashboard_bloc.dart';
// import 'package:flutter_record_magering_portal/models/transaction_model.dart';
// import 'package:flutter_record_magering_portal/utils/colors.dart';

class AddEntryPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const AddEntryPage({Key? key, required this.dashboardBloc}) : super(key: key);

  @override
  State<AddEntryPage> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntryPage> {
  final TextEditingController uanController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController minorityController = TextEditingController();
  final TextEditingController materialStatusController =
      TextEditingController();
  final TextEditingController identityTypeController = TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();
  final TextEditingController permanentlocalityController =
      TextEditingController();
  final TextEditingController permanentstateController =
      TextEditingController();
  final TextEditingController permanentcityController = TextEditingController();
  final TextEditingController permanentdistrictController =
      TextEditingController();
  final TextEditingController permanentpincodeController =
      TextEditingController();
  final TextEditingController currentlocalityController =
      TextEditingController();
  final TextEditingController currentstateController = TextEditingController();
  final TextEditingController currentcityController = TextEditingController();
  final TextEditingController currentdistrictController =
      TextEditingController();
  final TextEditingController currentpincodeController =
      TextEditingController();
  final TextEditingController workingoccupationController =
      TextEditingController();
  final TextEditingController workingmobileNumberController =
      TextEditingController();
  final TextEditingController workingstateController = TextEditingController();
  final TextEditingController workingcityController = TextEditingController();

  String personalDetails = '';
  String personalSubDetails = '';
  String permanentAddressDetails = '';
  String currentAddressDetails = '';
  String workingDetails = '';

  String defaultGenderValue = 'Gender';
  String defaultPwdValue = 'PWD';
  String defaultMinorityValue = 'Minority';
  String defaultmaritalValue = 'Marital Status';
  String defaultIdentityTypeValue = 'Identity Type';

  @override
  void dispose() {
    uanController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    fathernameController.dispose();
    dobController.dispose();
    genderController.dispose();
    bloodTypeController.dispose();
    mobileNumberController.dispose();
    pwdController.dispose();
    categoryController.dispose();
    materialStatusController.dispose();
    minorityController.dispose();
    identityTypeController.dispose();
    identityNumberController.dispose();
    permanentlocalityController.dispose();
    permanentstateController.dispose();
    permanentcityController.dispose();
    permanentdistrictController.dispose();
    permanentpincodeController.dispose();
    currentlocalityController.dispose();
    currentstateController.dispose();
    currentcityController.dispose();
    currentdistrictController.dispose();
    currentpincodeController.dispose();
    workingoccupationController.dispose();
    workingmobileNumberController.dispose();
    workingstateController.dispose();
    workingcityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Send a signal to refresh the dashboard page

        widget.dashboardBloc.add(DashboardInitialFechEvent());
        return true;
      },
      child: Scaffold(
        backgroundColor:Colors.grey.shade300,
        appBar: AppBar(backgroundColor: Colors.blueGrey.shade400,title: const Text("Add Entry")),
        body: BlocConsumer<DashboardBloc, DashboardState>(
          bloc: widget.dashboardBloc,
          listener: (context, state) {
            if (state is EntrySuccessState) {
              _showSuccessDialog(context);
            }
            if (state is EntryErrorState) {
              _showErrorDialog(context, state.errorMessage.substring(86, 145));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              
                child: Container(
                  color:Colors.grey.shade300,
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        color: Colors.grey.shade500,
                         height: 40,
                        padding: EdgeInsets.only(left: 10,top: 5),
                        child: const Text("Personal Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      const SizedBox(height: 20),
                      Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        "Universal Account Number",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                style: TextStyle(fontSize: 14),
                controller: uanController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Universal Account Number",
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 8),
      Text(
        "Mobile Number",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                style: TextStyle(fontSize: 14),
                controller: mobileNumberController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Mobile Number",
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),

                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("First name",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border:UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "First Name",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Last name",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Last Name",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Father Name",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: fathernameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Father Name",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          
                          children: [
                            Text("Gender",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: InputDecorator(
                                  //  TextStyle(fontSize: 10),
                        
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: null,
                                      isExpanded: true,
                                      hint: Text(defaultGenderValue,style: TextStyle(fontSize: 14),),
                                      items: const [
                                        DropdownMenuItem<String>(
                                            value: 'Male', child: Text("Male")),
                                        DropdownMenuItem<String>(
                                            value: 'Female', child: Text("Female")),
                                        DropdownMenuItem<String>(
                                            value: 'Other', child: Text("Other")),
                                      ],
                                      onChanged: (String? value) {
                                        setState(() {
                                          defaultGenderValue = value.toString();
                                          genderController.text = value ?? '';
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Date of Birth",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  // selectionHeightStyle: Ui.BoxHeightstyle.tight,
                                  style: TextStyle(fontSize: 14),
                                  controller: dobController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: "dd/mm/yyyy",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Blood Type",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  controller: bloodTypeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Blood Type",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("PWD",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6)),
                                      contentPadding: const EdgeInsets.all(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: null,
                                      isExpanded: true,
                                      hint: Text(defaultPwdValue,style: TextStyle(fontSize: 14),),
                                      items: const [
                                        DropdownMenuItem<String>(
                                            value: 'Yes', child: Text("Yes")),
                                        DropdownMenuItem<String>(
                                            value: 'No', child: Text("No")),
                                      ],
                                      onChanged: (String? value) {
                                        setState(() {
                                          defaultPwdValue = value.toString();
                                          pwdController.text = value ?? '';
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Category",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: categoryController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Category",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Minority",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6)),
                                      contentPadding: const EdgeInsets.all(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: null,
                                      isExpanded: true,
                                      hint: Text(defaultMinorityValue,style: TextStyle(fontSize: 14),),
                                      items: const [
                                        DropdownMenuItem<String>(
                                            value: 'Yes', child: Text("Yes")),
                                        DropdownMenuItem<String>(
                                            value: 'No', child: Text("No")),
                                      ],
                                      onChanged: (String? value) {
                                        setState(() {
                                          defaultMinorityValue = value.toString();
                                          minorityController.text = value ?? '';
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Marital Status",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6)),
                                      contentPadding: const EdgeInsets.all(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: null,
                                      isExpanded: true,
                                      hint: Text(defaultmaritalValue,style: TextStyle(fontSize: 14),),
                                      items: const [
                                        DropdownMenuItem<String>(
                                            value: 'Yes', child: Text("Yes")),
                                        DropdownMenuItem<String>(
                                            value: 'No', child: Text("No")),
                                      ],
                                      onChanged: (String? value) {
                                        setState(() {
                                          defaultmaritalValue = value.toString();
                                          materialStatusController.text = value ?? '';
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Identity Type",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6)),
                                      contentPadding: const EdgeInsets.all(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: null,
                                      isExpanded: true,
                                      hint: Text(defaultIdentityTypeValue,style: TextStyle(fontSize: 14),),
                                      items: const [
                                        DropdownMenuItem<String>(
                                            value: 'Aadhar', child: Text("Aadhar")),
                                        DropdownMenuItem<String>(
                                            value: 'Pancard', child: Text("Pancard")),
                                        DropdownMenuItem<String>(
                                            value: 'Driving Licence',
                                            child: Text("Driving Licence")),
                                      ],
                                      onChanged: (String? value) {
                                        setState(() {
                                          defaultIdentityTypeValue = value.toString();
                                          identityTypeController.text = value ?? '';
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Identity Number",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: identityNumberController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Identity Number",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.grey.shade500,
                        alignment: Alignment.topLeft,
                         height: 40,
                        padding: EdgeInsets.only(left: 10,top: 5),
                        child: const Text("Permanent Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Locality",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: permanentlocalityController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Locality",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("District",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: permanentdistrictController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "District",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("City",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: permanentcityController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "City",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("State",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  controller: permanentstateController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "State",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Pincode",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: permanentpincodeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Pincode",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                       color: Colors.grey.shade500,
                        alignment: Alignment.topLeft,
                         height: 40,
                        padding: EdgeInsets.only(left: 10,top: 5),
                        child: const Text("Current Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Locality",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: currentlocalityController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Locality",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("District",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: currentdistrictController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "District",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("City",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            const SizedBox(height: 20),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: currentcityController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "City",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("State",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: currentstateController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "State",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Pincode",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: currentpincodeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Pincode",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.grey.shade500,
                        alignment: Alignment.topLeft,
                         height: 40,
                        padding: EdgeInsets.only(left: 10,top: 5),
                        child: const Text("Working Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Occupation",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: workingoccupationController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border:UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Occupation",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Telephone Number",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: workingmobileNumberController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "Telephone Number",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("State",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                    style: TextStyle(fontSize: 14),
                                
                                  controller: workingstateController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "State",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("City",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                        
                                  controller: workingcityController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: "City",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (uanController.text.isEmpty ||
                              firstNameController.text.isEmpty ||
                              lastNameController.text.isEmpty ||
                              fathernameController.text.isEmpty ||
                              dobController.text.isEmpty ||
                              genderController.text.isEmpty ||
                              bloodTypeController.text.isEmpty ||
                              mobileNumberController.text.isEmpty ||
                              pwdController.text.isEmpty ||
                              categoryController.text.isEmpty ||
                              minorityController.text.isEmpty ||
                              identityTypeController.text.isEmpty ||
                              identityNumberController.text.isEmpty ||
                              permanentlocalityController.text.isEmpty ||
                              permanentstateController.text.isEmpty ||
                              permanentcityController.text.isEmpty ||
                              permanentdistrictController.text.isEmpty ||
                              permanentpincodeController.text.isEmpty ||
                              currentlocalityController.text.isEmpty ||
                              currentstateController.text.isEmpty ||
                              currentcityController.text.isEmpty ||
                              currentdistrictController.text.isEmpty ||
                              currentpincodeController.text.isEmpty ||
                              workingoccupationController.text.isEmpty ||
                              workingmobileNumberController.text.isEmpty ||
                              workingstateController.text.isEmpty ||
                              workingcityController.text.isEmpty) {
                            _showInErrorDialog(
                                context, "Please fill all the fields");
                          } else {
                            personalDetails =
                                "First Name: ${firstNameController.text}; Last Name: ${lastNameController.text}; Father Name: ${fathernameController.text}; Date of Birth: ${dobController.text} ; Gender: ${genderController.text}; Blood Type: ${bloodTypeController.text}; Mobile Number: ${mobileNumberController.text}";
                            personalSubDetails =
                                "Pwd: ${pwdController.text}; Category: ${categoryController.text}; Minority: ${minorityController.text}; Marital Status: ${materialStatusController.text}; Identity Type: ${identityTypeController.text}; Identity Number: ${identityNumberController.text}";
                            permanentAddressDetails =
                                "Locality: ${permanentlocalityController.text}; State: ${permanentstateController.text}; City: ${permanentcityController.text}; District: ${permanentdistrictController.text}; Pincode: ${permanentpincodeController.text};";
                            currentAddressDetails =
                                "Locality: ${currentlocalityController.text}; State: ${currentstateController.text}; City: ${currentcityController.text}; District: ${currentdistrictController.text}; Pincode: ${currentpincodeController.text};";
                            workingDetails =
                                "Occupation: ${workingoccupationController.text}; MobileNumber: ${workingmobileNumberController.text}; State: ${workingstateController.text}; City: ${workingcityController.text};";
                            // Add Entry logic
                            widget.dashboardBloc.add(DashBoardAddEntry(
                              transactionModel: TransactionModel(
                                  "",
                                  DateTime.now(),
                                  int.parse(uanController.text),
                                  personalDetails,
                                  personalSubDetails,
                                  permanentAddressDetails,
                                  currentAddressDetails,
                                  workingDetails),
                            ));
                          }
                        },
                        child: Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.greenAccent, width: 1),
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              
            );
          },
        ),
      ),
    );
  }

  void _showInErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("Okay"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Successful"),
          content: const Text("Press Okay to Continue"),
          actions: <Widget>[
            TextButton(
              child: const Text("Okay"),
              onPressed: () {
                // Dismiss the dialog and navigate back to the previous screen
                Navigator.pop(context);
                // Send a signal to refresh the dashboard page
                widget.dashboardBloc.add(DashboardInitialFechEvent());
                Navigator.pop(context); // Navigate back to the previous screen
              },
            )
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Please Try Again"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("Okay"),
              onPressed: () {
                // Dismiss the dialog and navigate back to the previous screen
                Navigator.pop(context);
                // Navigate back to the previous screen
              },
            )
          ],
        );
      },
    );
  }
}

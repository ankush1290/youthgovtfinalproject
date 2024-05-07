import 'package:flutter/material.dart';
import 'package:youthgovt/appbarimages/imagesrow.dart';
import 'package:youthgovt/blockchainfiles/features/dashboard/ui/dashboard_page.dart';
import 'package:youthgovt/graph/mainfile.dart';
import 'package:youthgovt/home/homepage.dart';
import 'package:youthgovt/testing.dart';

class HeadPage extends StatefulWidget {
  const HeadPage({super.key});

  @override
  State<HeadPage> createState() => _HeadPageState();
}

class _HeadPageState extends State<HeadPage> {
  String currentOption = "Graph"; // Default option

  Widget _buildEditPageContent() {
    return mainfilegraph();
  }

  Widget _buildAddEntryPageContent() {
    return service();
  }

  Widget _buildSearchPageContent() {
    return Text("Account excess id");
  }

  Widget _buildHistoryPageContent() {
    return DashboardPage();
  }

  Widget _buildSelectedOptionContent() {
    switch (currentOption) {
      case "Graph":
        return _buildEditPageContent();
      case "Service":
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
      // appbar with title text
      // backgroundColor: Colors.red,
      appBar: AppBar(
        leading: null,
        title: Text('Head Panel'),
        // in action widget we have PopupMenuButton
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          PopupMenuButton<int>(
            tooltip: "My Profile",
            icon: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJQAAACUCAMAAABC4vDmAAABI1BMVEX///8/UbX/t01CQkL/mADTLy9hbr85TLP/pyb/uU3QmUovOEH/kgA7Ozt4Rxl1dXX4+Pj/1rL/tEaoqKj/vU4xRrI0NDQ7PkI0O0JyQRYsQrHiiYnhgoIeOK7RGBjSIiJTYbq7u7srKyv/sjz/+vT/2avV2OyepdWTm9GBi8rHx8dQUFBsbGzp6elUTEOSdEbboUuFhYUcMEHvrUjbmj/MjjpnOBGqci3lpkr/oACOWiP/6dP/37j/8eH/05v/zY2vtdz/yJP/t3b/pkz/r1dyfcXPAAXt7vfJzefrsLDaXV356OjWRETxycmvN1xwSZqLQoKnPGhiTKJ5R5CfPnAHBweVlpgeHh5iVEOvhEe+jkiRdVaZbjn/wnb/vWcMLqy4Lk8CkPBmAAAGfElEQVR4nO2aeVfaShjGCShJtFSMrFEWCaWC2s0FqNKiLYJa7XrtvW2t/f6f4s5CQvbMDJlw7zl5/vCcLMP85pln3hnURCJWrFixYsWKFStWrP+P9jvbGzPtLxoH8NztFpAyUzXWFozUebnbKKRsaizSqux2qpGxEwFl9hbH1NlruBAhqs6CkPbXvru5hKEWlKpOyhElkwoLsWrDa+b0rP+1G3llCGKCU9hIrUXq110wE+L6vhudW9tkTBArdRcVk1/E7WrsRWJWtuBZCtxU2M1GwLRGxQSo9vhTkQfKoHrJmylLzZRKfeddGu5oUq6Lc2XYZ0ACS5BvYdggMapYKqaKljsFrlknYCq9evZ85YWVqrDNkakTAAU8evb8hQxkpcqscbTqpW+NQh4lc3ISKGfzil/U93cDPMrJiAjK6lWD3/x1vIoU8uggZxA5vOJYQF2L1DRHViKnV9ygXGav9Crl8MjwamVGxa0oZO1GlYp/u3pkeNUzqLid2i0FoejnkdMrbpXKdLpbLQGPcv5EiEr3KrPBCWojo3tUCvRo5lURUWV4bX93CKpI5pHJKwTFqyagel76h9Ajg+rHKkcofBBeXaFCAktwBUFx2v1iqBgqhoqh/utQg5+r7FClnwMuTFL/16oNSvYANN9HUKu/JIkDVVORJKlbKpqg5IPDniuV3Ds8kE1QxdIRaKw0Q4d60gefK/0wOZU7Kh8fd12o5O7xcfkoZ3JqBbbtPwkdCholSXLPgJIPHgOVj5xfGI7K8InulbxS6smocTJ0KPSxkpLr9Sx9l7tOp7plC22vJ+MRSaFDaRjKZMghcso5fzKGOjQ9wFBa6FD3fRtUMvn6+HG57Iy63CuXHx+/Nt9CUP370KFOHFBysvu6e+AW9APwIGl+gKFOQofCVlmcSuY8vvOB2znLDQjVfxs+UyLxVurboIilgKZcmMAM3msaG5Sm3HOYO12nTFTaKT8ioBM2KI42AQ1YmJJJLicEQ817lqj/Dn8rtugNA5Tyhi8TU6g45xyIBYo3U+INNZXGe/aY1h/ftYf0ljLqCqf9xaIm5fxpnOsBFl2qIkgUFFUBVXgXTl0DCqu0CFKORX5W4F83Z3pCSKWF/1XPR2Rhjyjkhki8itYnqFMlYA0qSoR50tX87Q/1O7J1Z9a65PWbIPi7IGl9EUyJ9UdLmscUKtrSo4VBPVqSFOfXdkUCDxYHhaTByCM0GcZbw3cXDAUkGTJuLR4KUdgu/xNQNsVQMRQLFJQrEFT0UK3hqFLPNk/Pzt8tWcjgxbvzs9Nmtq62J63oiMbDtKDmhQrqsjk4OXuPweCP92cnA3Qqb1WEvCqMhtEgtdqqKgpA4mh2c7B+dn5+tm46GIzwO6q6w9+uSVrMC7rG5idbW+arsfFSXhjxxWqlK6Iw6+6p6dHmxcWm6fLpDF0QK2l+WOORaEICndVnf1jcqi4vV2deZevWN8X22O0T59cwnxesqkz0Z5sXy0AzryYV26t5ccgBaTyyIwED0tOH0Ccow6u06Hg5PwrdrInDJkSFspLdulie6mILzWjLyQQTP/Hvg1Y7bkignx30dLOqQ1U3fV4XLStjbrVVVybQD54S3aoLPH1jN6Og1J3QkLIucdJ7GeJXNmuQqTYN+tBrDILaDgsq7ckEqgJ+5RqvvmmJqHs5BSY8JCpvnyAVDu8NSlX1Bl1MvJnC8soj49aRX2KoS3TR9m8RQtqH9jJoUwVF3ZypcVCLuStDy78DMB1o4FsYCi2+p54x1zVnFc36ZHaqOugie4WhrkDSx/WgFvl0cMd+Ch61kAezcf0B16kP17D2BzapDOdhct0ubIJnvWt977t23facmuco47+O9HGPEzd6Rb8JjDlSfo7K3nog6ABWhUvdqUuycQgP7FkfkcwEjDpefHD5BcccSWQuoSSJglKHVzrUlfe2ZxNrqvxruWnY6Zp+dKkRxVyY7eTUIh20IN7qTt0SMgmiwMbkOGd766Me9I/ETSps89cmHTXQHwz1h7wFW1UYk8YD6hPeZj6RtxBHLP/4GbgVW4ShaFrUWeZvQpxzOO7PgKr2mcJbQWU5wZAWBKwv0KkvNC1UlsMeTaSAbmu1W6oG+VEwg0M0swf0tVr9StVA/85BJaLN2NRHrUZnrVChZxpTQgnfvlFCPdBDtcjrOdYXqpgLTMcXaihqMWw0kweRsx7ooVr1NGcxlfRYsWJx1b/C5NMRY/INwAAAAABJRU5ErkJggg=="), // Replace with your avatar URL
            ),

            itemBuilder: (context) => [
              // PopupMenuItem 1
              PopupMenuItem(
                value: 1,
                // row with 2 children
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text("My Profile")
                  ],
                ),
              ),
              // PopupMenuItem 2
              PopupMenuItem(
                value: 2,
                // row with two children
                child: Row(
                  children: [
                    Icon(Icons.login),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Sign out")
                  ],
                ),
              ),
            ],
            offset: Offset(0, 100),
            color: Colors.white,
            elevation: 2,
            // on selected we show the dialog box
            onSelected: (value) {
              // if value 1 show dialog
              if (value == 1) {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HeadPage()));

                // if value 2 show dialog
              } else if (value == 2) {
                 _showDialog(context);
              }
            },
          ),
        ],
      ),
      //   child: CircleAvatar(
      //     radius: 10,
      //     backgroundImage: NetworkImage(
      //          "data:image/png;base64,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"), // Replace with your avatar URL
      //   ),),
      // )

      //   ],
      // ),
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
                      currentOption = "Graph";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      // width: 30,
                      decoration: BoxDecoration(
                        color: currentOption == "Graph"
                            ? Colors.blue
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: currentOption == "Graph"
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentOption = "Service";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: currentOption == "service"
                            ? Colors.blue
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Service",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: currentOption == "service"
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentOption = "Excess";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: currentOption == "Excess"
                            ? Colors.blue
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Excess",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: currentOption == "Excess"
                              ? Colors.grey
                              : Colors.black,
                        ),
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
                      "All Detail",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: currentOption == "History"
                            ? Colors.grey
                            : Colors.black,
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

  Widget _buildSocialMediaIcon(IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Icon(iconData, color: Colors.white),
    );
  }

// void showAvatarMenu(BuildContext context) {
//   final RenderBox appBar = Scaffold.of(context).appBarMaxHeight as RenderBox;
//   final Offset appBarPosition = appBar.localToGlobal(Offset.zero);

//   // Calculate the position to show the menu below the app bar
//   final double dx = appBarPosition.dx;
//   final double dy = appBarPosition.dy + appBar.size.height;

//   // Show the menu at the calculated position
//   showMenu(
//     context: context,
//     // position: RelativeRect.fromLTRB(dx, dy, 0, 0),
//     items: [
//       PopupMenuItem(
//         child: Text('Item 1'),
//         value: 1,
//       ),
//       PopupMenuItem(
//         child: Text('Item 2'),
//         value: 2,
//       ),
//       PopupMenuItem(
//         child: Text('Item 3'),
//         value: 3,
//       ),
//     ],
//   );
// }
// }
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert!!"),
            content: Text("Sign out"),
            actions: [
              MaterialButton(
                child: Text("OK"),
                onPressed: () {
                   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
          );
        });
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: double.infinity,
      color: Colors.white,
    );
  }
}

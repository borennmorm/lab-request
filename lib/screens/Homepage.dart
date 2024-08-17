import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(57, 108, 105, 105),
        centerTitle: true,
        leading: Icon(Icons.sort),
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date"),
                  Text("Today, 11 August 2024"),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Horizontal Scrollable Container Rows
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(7, (index) {
                  // Create a list of Container widgets for each day of the week
                  final daysOfWeek = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"];
                  bool isWhiteBackground = index % 2 == 1; // Change background color conditionally

                  return Container(
                    height: 100,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isWhiteBackground ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          daysOfWeek[index],
                          style: TextStyle(color: isWhiteBackground ? Colors.black : Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "11",
                          style: TextStyle(color: isWhiteBackground ? Colors.black : Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),

            // Computer Room Section
            Text("Computer Room", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildLabContainer("Lab 014"),
                  SizedBox(height: 20),
                  _buildLabContainer("Lab 013"),
                    SizedBox(height: 20),
                  _buildLabContainer("Lab 013"),
                ],
              ),
            ),
            SizedBox(height: 30), // Increased bottom padding for Computer Room section

            // Sessions Section
            Text("Sessions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                _buildSessionStatus(Colors.red, "Busy"),
                SizedBox(width: 20),
                _buildSessionStatus(Colors.green, "Free"),
              ],
            ),
            SizedBox(height: 20),

            // Time Slots
            _buildTimeSlots(Colors.green, true),
            SizedBox(height: 10),
            _buildTimeSlots(Colors.red, false),
            SizedBox(height: 20),

            // Request TextField
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Request",
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for Lab Containers
  Widget _buildLabContainer(String labName) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildLabDetail(Icons.computer, "Computer : 30",),
              _buildLabDetail(Icons.camera, "Camera : 01"),
              _buildLabDetail(Icons.volume_up_rounded, "Volume : 0"),
     
            ],
          ),
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/a/a5/Contemporary_Computer_Lab.jpg",
            width: 150,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  // Helper widget for Lab Details
  Widget _buildLabDetail(IconData icon, String detail) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Text(detail),
      ],
    );
  }

  // Helper widget for Time Slots
  Widget _buildTimeSlots(Color borderColor, bool isFree) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) {
          final timeSlot = [
            "07:00 - 08:00 AM",
            "09:00 - 10:00 AM",
            "08:00 - 09:00 AM"
          ][index];
          final status = isFree ? "Free" : "Eng Titya";
          final statusColor = isFree ? Colors.green : Colors.red;
          final icon = isFree ? Icons.check_box : Icons.close;
          return Container(
            width: 170,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: statusColor),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(timeSlot),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(status, style: TextStyle(color: statusColor)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Helper widget for Session Status
  Widget _buildSessionStatus(Color color, String status) {
    return Row(
      children: [
        Icon(Icons.check_box_outline_blank, color: color),
        SizedBox(width: 5),
        Text(status, style: TextStyle(color: color)),
      ],
    );
  }
}

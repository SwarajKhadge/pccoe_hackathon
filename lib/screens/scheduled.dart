import 'package:flutter/material.dart';
import 'package:hack/appointment/doctordata.dart';

class Scheduled extends StatefulWidget {
  @override
  State<Scheduled> createState() => _ScheduledState();
}

class _ScheduledState extends State<Scheduled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upcoming Appointments",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.lock_clock_outlined),
          )
        ],
      ),
      body: DoctorListView(),
    );
  }
}

class DoctorListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorListItem(index);
        });
  }
}

Widget DoctorListItem(int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ListTile(
        leading: Container(
          width: 70,
          height: 70,
          child: Image.asset(doctors[index].imageurl),
        ),
        title: Text(
          doctors[index].name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Qualification: ${doctors[index].qualifications}"),
            Text("Specialist Area: ${doctors[index].area}"),
            Text("Clinic Name: ${doctors[index].clinic}"),
          ],
        ),
        onTap: () {
          // Add functionality to book appointment when tapped
          // You can navigate to another screen or show a dialog
          // with appointment booking options
          // Example:
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AppointmentDialog(doctor: doctor);
          //   },
          // );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

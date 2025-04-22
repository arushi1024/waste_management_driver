import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewComplaintsScreen extends StatelessWidget {
  const ViewComplaintsScreen({super.key});

  // Function to fetch user complaints based on the vehicle number
  Future<List<Map<String, dynamic>>> fetchUserComplaints() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return [];

    // Assuming the vehicle number is stored in the user's profile or another source
    // You need to retrieve the vehicle number associated with the current user
    final userSnapshot = await FirebaseFirestore.instance
        .collection('users') // Replace 'users' with the actual collection name
        .doc(uid)
        .get();

    final vehicleNumber = userSnapshot.data()?['vehicleNumber'];
    if (vehicleNumber == null) return [];

    // Query complaints where vehicleNumber matches the current user's vehicle number
    final snapshot = await FirebaseFirestore.instance
        .collection('complaints')
        .where('vehicleNumber', isEqualTo: vehicleNumber) // Use vehicleNumber to filter complaints
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Complaints")),
      body: FutureBuilder(
        future: fetchUserComplaints(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading complaints"));
          }

          final complaints = snapshot.data as List<Map<String, dynamic>>;

          if (complaints.isEmpty) {
            return Center(child: Text("No complaints found."));
          }

          return ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              final complaint = complaints[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(complaint['vehicleNumber'] ?? 'No Vehicle Number'),
                  subtitle: Text(complaint['reason'] ?? 'No Reason'),
                  trailing: Text(complaint['timestamp']?.toDate().toString() ?? 'No Timestamp'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

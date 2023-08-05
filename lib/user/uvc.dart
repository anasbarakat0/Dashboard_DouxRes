import 'package:flutter/material.dart';
import '../service/service.dart';

class vCodePage extends StatefulWidget {
  const vCodePage({super.key});

  @override
  State<vCodePage> createState() => _vCodePageState();
}
var data = getAllVerCode();
class _vCodePageState extends State<vCodePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllVerCode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;

            List<dynamic>? vCodeList = data['data'];
            print(data['data']);
            if (vCodeList == null || vCodeList.isEmpty) {
              return const Center(
                child: Text('No restaurants found.'),
              );
            }

            return SingleChildScrollView(
              child: DataTable(columns: [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('phone')),
          DataColumn(label: Text('verification Code')),
        ], rows: [
         
        ]),
            );
          } else {
            return const Center(
              child: Text('Failed to fetch data.'),
            );
          }
        },
      );
  }
}
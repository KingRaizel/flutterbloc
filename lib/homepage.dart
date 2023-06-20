// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:block_app/employee.dart';
import 'package:block_app/employeebloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMployee'),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: ((context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text("${snapshot.data![index].id}"),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${snapshot.data![index].name}"),
                              Text("₹ ${snapshot.data![index].salary}"),
                            ],
                          ),
                        ),
                        Container(
                          child: IconButton(
                              onPressed: () {
                                _employeeBloc.employeeSalaryIncrment
                                    .add(snapshot.data![index]);
                              },
                              color: Colors.green,
                              icon: Icon(Icons.thumb_up)),
                        ),
                        Container(
                          child: IconButton(
                              onPressed: () {
                                _employeeBloc.employeeSalarydecrment
                                    .add(snapshot.data![index]);
                              },
                              color: Colors.red,
                              icon: Icon(Icons.thumb_down)),
                        ),
                      ],
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}

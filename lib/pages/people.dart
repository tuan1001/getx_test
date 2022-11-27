import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:getxtest/controller/people_controller.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  PeopleController peopleController = Get.put(PeopleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => peopleController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: peopleController.people?.data.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(peopleController.people?.data[index].firstName ?? ''),
                    subtitle: Text(peopleController.people?.data[index].lastName ?? ''),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(peopleController.people?.data[index].avatar ?? ''),
                    ),
                    trailing: Text(peopleController.people?.page.toString() ?? ''),
                  );
                },
              ),
      ),
    );
  }
}

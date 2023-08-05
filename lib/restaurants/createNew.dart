import 'dart:convert';
import 'dart:io';

import 'package:dashboard/service/service.dart';
import 'package:dashboard/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewRest extends StatefulWidget {
  const CreateNewRest({super.key});

  @override
  State<CreateNewRest> createState() => _CreateNewRestState();
}

class _CreateNewRestState extends State<CreateNewRest> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController table = TextEditingController();
  TextEditingController open = TextEditingController();
  TextEditingController close = TextEditingController();
  TextEditingController description = TextEditingController();
  final List<TextEditingController> _categories = [TextEditingController()];
  final ImagePicker _picker = ImagePicker();

  void _addTextField() {
    setState(() {
      _categories.add(TextEditingController());
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File selectedImageFile = File(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Restaurant'),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                label: Text('Restaurant Name'),
              ),
            ),
            TextField(
              controller: address,
              decoration: const InputDecoration(
                label: Text('Address'),
              ),
            ),
            TextField(
              controller: phone,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Phone'),
              ),
            ),
            TextField(
              controller: mobile,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Mobile'),
              ),
            ),
            TextField(
              controller: table,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('number of tables'),
              ),
            ),
            TextField(
              controller: open,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Opening Time'),
              ),
            ),
            TextField(
              controller: close,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Closing Time'),
              ),
            ),
            TextField(
              controller: description,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('description'),
              ),
            ),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _categories[index],
                            decoration: InputDecoration(
                              labelText: 'Categorie ${index + 1}',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _addTextField,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Restaurant logo',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: _pickImage,
                  tooltip: 'Pick Image',
                  icon: const Icon(Icons.add_a_photo),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  var status = await creatNewRestaurant(
                      name.text,
                      address.text,
                      phone.text,
                      mobile.text,
                      open.text,
                      close.text,
                      description.text,
                      _categories
                          .map((_categories) => _categories.text)
                          .toList(),
                      int.parse(table.text));
                  if (status[0] == true) {

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${status[1]['message']}")),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${status[1]}"),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Restaurant'))
          ],
        ),
      ),
    );
  }
}

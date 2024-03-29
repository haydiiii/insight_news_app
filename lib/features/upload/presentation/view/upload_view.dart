import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insight_news_app/core/constants/iamge_assets.dart';
import 'package:insight_news_app/core/functions/routing.dart';
import 'package:insight_news_app/core/services/local_storage.dart';
import 'package:insight_news_app/core/utils/colors.dart';
import 'package:insight_news_app/core/widgets/custom_elev_button.dart';
import 'package:insight_news_app/features/home/presentation/view/home_view.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  pushWithReplacement(context,  const HomeView());
                  AppLocalStorage.cashData(
                      'name', name);
                       AppLocalStorage.cashData('Image', path);
                 AppLocalStorage.cashData ('isUploaded', true);
                } else if (path != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please Enter Your Name'),
                    backgroundColor: Colors.red,
                  ));
                } else if (path == null && name.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please Upload Your Image'),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text('Please Enter Your Name and Upload Your Image'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text(
                'Done',
                style: TextStyle(color: AppColors.primary),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: path != null
                      ? FileImage(File(path!)) as ImageProvider
                      : AssetImage(ImagesAssets.user),
                  radius: 60,
                ),
                const Gap(20),
                CustomElevButton(
                    onPressed: () => uploadImage(isCamera: true),
                    text: 'Upload From Camera ',
                    width: 250),
                const Gap(15),
                CustomElevButton(
                    onPressed: () {
                      uploadImage(isCamera: false);
                    },
                    text: 'Upload From Gallery ',
                    width: 250),
                const Gap(20),
                Divider(
                  color: AppColors.primary,
                  endIndent: 40,
                  indent: 40,
                ),
                const Gap(15),
                TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_2_rounded,
                          color: AppColors.primary,
                        ),
                        filled: true,
                        hintText: 'Enter Your username',
                        hintStyle: TextStyle(color: AppColors.white),
                        fillColor: AppColors.cardColor))
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage({required isCamera}) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}

import 'dart:io';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardImage extends StatefulWidget {
  CardImage({
    super.key,
    this.imageUrl,
    required this.onUpload,
  });

  final String? imageUrl;
  final void Function(String? imageUrl) onUpload;

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  final supabase = Supabase.instance.client;

  File? _imageFile;
  // String?uploadedImageUrl;  // Store the uploaded image URL

//pick image
  Future pickImage() async {
    //picker
    final ImagePicker picker = ImagePicker();
    //pick from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    //update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        // widget.onUpload(null); // Clear the uploaded image URL
      });
    }
  }

  Future uploadImage() async {
    if (_imageFile == null) {
      return;
    }
    final imageExtension = _imageFile!.path.split('.').last.toLowerCase();
    final ImageBytes = await _imageFile!.readAsBytes();
    // Get the current date in the format "yyyy-MM-dd"
    // final date = DateTime.now().toIso8601String().split('T').first;
    // Construct the file path: "folder/yyyy-MM-dd/filename.extension"
    final filePath = 'uploads/${_imageFile!.path.split('/').last}';
    await supabase.storage.from('images').uploadBinary(
          filePath,
          ImageBytes,
          fileOptions: FileOptions(
            upsert: true,
            contentType: 'image/$imageExtension',
          ),
        );
    String imageUrl = supabase.storage.from('images').getPublicUrl(filePath);
    imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
      't': DateTime.now().millisecondsSinceEpoch.toString()
    }).toString();
    // Update the image URL in the state
    setState(() {
      widget.onUpload(imageUrl); // Notify parent about the uploaded image URL
    });
    widget.onUpload(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: widget.imageUrl != null
              ? SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ) // Display uploaded image from parent
              : _imageFile != null
                  ? SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ),
                      )) // Display picked image locally
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.primary),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            'Choose Photo',
                          ),
                        ),
                      ),
                    ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: pickImage,
              child: Text('Choose'),
            ),
            SizedBox(
              width: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: uploadImage,
              child: Text('Upload'),
            ),
            IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                size: 25,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

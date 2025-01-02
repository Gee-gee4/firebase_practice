import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardImage extends StatelessWidget {
  CardImage({
    super.key,
    this.imageUrl,
    required this.onUpload,
  });

  final String? imageUrl;
  final void Function(String imageUrl) onUpload;
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: imageUrl != null
              ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                  ),
              )
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
        SizedBox(height: 12,),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            if (image == null) {
              return;
            }
            final imageExtension = image.path.split('.').last.toLowerCase();
            final ImageBytes = await image.readAsBytes();
            // Get the current date in the format "yyyy-MM-dd"
            // final date = DateTime.now().toIso8601String().split('T').first;
            // Construct the file path: "folder/yyyy-MM-dd/filename.extension"
            final filePath = 'uploads/${image.name}';
            await supabase.storage.from('images').uploadBinary(
                  filePath,
                  ImageBytes,
                  fileOptions: FileOptions(
                    upsert: true,
                    contentType: 'image/$imageExtension',
                  ),
                );
            String imageUrl =
                supabase.storage.from('images').getPublicUrl(filePath);
            imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
              't': DateTime.now().millisecondsSinceEpoch.toString()
            }).toString();
            onUpload(imageUrl);
          },
          child: Text('Upload Image'),
        ),
      ],
    );
  }
}

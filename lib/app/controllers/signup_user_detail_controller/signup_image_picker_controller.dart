import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupImagePickerController extends GetxController {
  RxString pickedImage = ''.obs;
  Future pickUserImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImage.value = image.path.toString();
    }
  }
}

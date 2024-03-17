import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class TFLiteProvider extends ChangeNotifier {
  File? _image;
  late Interpreter _interpreter;

  File? get image => _image;

  TFLiteProvider() {
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      final interpreterOptions = InterpreterOptions();
      _interpreter = await Interpreter.fromAsset(
          'model/Model_Archi_Weight.tflite',
          options: interpreterOptions);
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<void> uploadImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
      runInference();
    } else {
      print('No image selected.');
    }
  }

  Future<void> runInference() async {
    if (_image == null) {
      print('No image available for inference.');
      return;
    }

    try {
      final inputImageData = await _image!.readAsBytes();
      final outputTensors = _interpreter.getOutputTensors();

      final inputType = outputTensors[0].type;
      final inputShape = outputTensors[0].shape;

      final inputs = [inputImageData];

      final outputs = Map<int, Object>();

      for (int i = 0; i < outputTensors.length; i++) {
        final tensor = outputTensors[i];
        final outputType = tensor.type;
        final outputShape = tensor.shape;
        final outputData = List.generate(tensor.numBytes(), (index) => 0);

        outputs[i] = outputData;
      }

      _interpreter.run(inputs, outputs);

      // Process the outputs
      outputs.forEach((key, value) {
        print('Output tensor $key data: $value');
      });
    } catch (e) {
      print('Error running inference: $e');
    }
  }
}

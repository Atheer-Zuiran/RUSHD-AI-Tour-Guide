import 'dart:io';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class TFLiteHelper {
  Interpreter? _interpreter;

  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('1.tflite');
      print("Model loaded successfully");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  List<dynamic>? classifyImage(File image) {
    if (_interpreter == null) {
      print("Interpreter not initialized");
      return null;
    }

    // Load the image
    img.Image? imageInput = img.decodeImage(image.readAsBytesSync());
    if (imageInput == null) {
      print("Error decoding image");
      return null;
    }

    // Resize the image to the input size expected by the model
    img.Image resizedImage =
        img.copyResize(imageInput, width: 224, height: 224);

    // Convert image to a 1D list of normalized pixel values
    List<List<double>> input =
        imageToByteListFloat32(resizedImage, 224, 224, 127.5);

    var output = List<List<double>>.filled(1, List.filled(1001, 0.0));
    _interpreter!.run(input, output);

    return output[0];
  }

  List<List<double>> imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return [convertedBytes.buffer.asFloat32List()];
  }

  void close() {
    _interpreter?.close();
  }
}

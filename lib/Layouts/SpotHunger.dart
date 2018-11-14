import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vv4/Layouts/SpotHungerPreview.dart';

class SpotHunger extends StatefulWidget {
  @override
  SpotHungerState createState() {
    return SpotHungerState();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class SpotHungerState extends State<SpotHunger> {
  List<CameraDescription> cameras;
  CameraController m_oCameraController;
  bool _isReady = false;
  String StrCapturedImageFilePath;
  String StrThumbnailImageFilePath;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _setupCameras();
  }

  Future<void> _setupCameras() async {
    try {
      cameras = await availableCameras();
      m_oCameraController = new CameraController(cameras[0], ResolutionPreset.high);
      await m_oCameraController.initialize();
    } on CameraException catch (_) {}
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  Widget _cameraPreviewWidget() {
    if (m_oCameraController == null || !m_oCameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: m_oCameraController.value.aspectRatio,
        child: CameraPreview(m_oCameraController),
      );
    }
  }

  Widget bottomCaptureButton() {
    return new Container(
      color: Color.fromRGBO(64, 75, 96, .9),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.camera_enhance),
            color: Colors.white,
            onPressed: m_oCameraController != null && m_oCameraController.value.isInitialized
                ? onTakePictureButtonPressed
                : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: m_oCameraController != null && m_oCameraController.value.isRecordingVideo
                      ? Colors.redAccent
                      : Colors.grey,
                  width: 3.0,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomCaptureButton(),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
  

  void onTakePictureButtonPressed() {
    takePicture().then(( StrCapturedImageFilePath) {
      if (mounted) {
        if (StrCapturedImageFilePath != null) {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (__) => new SpotHungerPreview(StrCapturedImageFilePath:StrCapturedImageFilePath,StrThumbnailImageFilePath:StrThumbnailImageFilePath,)));
        }
      }
    });
  }

  Future<String> takePicture() async {
    if (!m_oCameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    StrCapturedImageFilePath = '$dirPath/${timestamp()}.jpg';
    StrThumbnailImageFilePath = '$dirPath/${timestamp()}Thumbnail.jpg';


    if (m_oCameraController.value.isTakingPicture) {
      return null;
    }

    try {
      await m_oCameraController.takePicture(StrCapturedImageFilePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return StrCapturedImageFilePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

}

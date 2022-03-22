import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_pdf_viewer/android_pdf_viewer.dart';

void main() {
  const MethodChannel channel = MethodChannel('android_pdf_viewer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AndroidPdfViewer.platformVersion, '42');
  });
}

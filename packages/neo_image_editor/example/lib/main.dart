import 'dart:typed_data';

import 'package:example/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:neo_image_editor/l10n/generated/neo_image_editor_localizations.dart';
import 'package:neo_image_editor/neo_image_editor.dart';
import 'package:neo_image_editor/neo_image_filter_editor.dart';
import 'package:neo_image_editor/neo_image_source_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates:
          NeoImageEditorLocalizations.localizationsDelegates,
      locale: const Locale('ru'),
      supportedLocales: NeoImageEditorLocalizations.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Uint8List> croppedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: GridView.count(
          crossAxisCount: 1,
          children: [
            ...croppedImages.map((e) => InkWell(
                  onTap: () {
                    Navigator.of(context).push<List<Uint8List>>(
                        MaterialPageRoute<List<Uint8List>>(
                            builder: (BuildContext context) =>
                                NeoImageFilterEditor(
                                  images: [e],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.memory(e),
                  ),
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              if (mounted) {
                final result =
                    await Navigator.of(context).push<List<Uint8List>>(
                  MaterialPageRoute<List<Uint8List>>(
                      builder: (BuildContext context) => NeoImageEditor(
                            images: croppedImages,
                            maxCount: 6,
                            sourceType: NeoImageSourceType.gallery,
                            permissionDialogBuilder: (
                              type,
                              onClose,
                            ) =>
                                PermissionDialog(
                              type: type,
                              onClose: onClose,
                            ),
                            optimizeSettings: const OptimizeSettings(
                                minWidth: 2000, minHeight: 2000, quality: 70),
                          )),
                );

                if (result != null && mounted) {
                  setState(() {
                    croppedImages = result;
                  });
                }
              }
            }));
  }
}

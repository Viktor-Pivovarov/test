import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:photo_view/photo_view.dart';

class PhotoDialog extends StatefulWidget {
  const PhotoDialog({
    this.photos = const [],
    this.selected = 0,
    super.key,
  });

  final List<String> photos;
  final int selected;

  Future<void> show() {
    return DialogService.showFullscreenDialog<void>(
      dialog: this,
    );
  }

  Future<void> hide(bool? result) async {
    await DialogService.hide<bool>(
      identifier: FullScreenDialog.identifier(),
      result: result,
    );
  }

  @override
  State<PhotoDialog> createState() => _PhotoDialogState();
}

class _PhotoDialogState extends State<PhotoDialog> {
  int selected = 0;

  late PhotoViewScaleStateController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PhotoViewScaleStateController();

    selected = widget.selected;
  }

  void _selectIndex(int index) {
    setState(() {
      selected = index;
    });
  }

  double get size => 94;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        useColor: true,
        actions: [
          IconButton(
            onPressed: () => widget.hide(true),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: PhotoView(
            backgroundDecoration: const BoxDecoration(color: Colors.transparent),
            minScale: PhotoViewComputedScale.contained,
            scaleStateController: _controller,
            onTapDown: (context, details, controllerValue) {},
            imageProvider: NetworkImage(
              widget.photos.elementAt(selected),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: context.color.fillBgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Insets.l),
                topRight: Radius.circular(Insets.l),
              ),
            ),
            height: size + Insets.xxl,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Insets.m),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.photos.mapIndexed((index, e) {
                  final bool isSelected = index == selected;

                  return GestureDetector(
                    onTap: () => _selectIndex(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isSelected ? size : size - 6,
                      height: isSelected ? size : size - 6,
                      margin: const EdgeInsets.symmetric(horizontal: Insets.s),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Insets.s),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                          image: NetworkImage(e),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),),
      ],),
    );
  }
}

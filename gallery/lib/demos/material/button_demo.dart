import 'package:flutter/material.dart';

import '../../l10n/localizations_delegate.dart';

enum ButtonDemoType {
  flat,
  raised,
  outline,
  toggle,
  floating,
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key key, this.type}) : super(key: key);

  final ButtonDemoType type;

  String _title(BuildContext context) {
    switch (type) {
      case ButtonDemoType.flat:
        return GalleryLocalizations.of(context).demoFlatButtonTitle;
      case ButtonDemoType.raised:
        return GalleryLocalizations.of(context).demoRaisedButtonTitle;
      case ButtonDemoType.outline:
        return GalleryLocalizations.of(context).demoOutlineButtonTitle;
      case ButtonDemoType.toggle:
        return GalleryLocalizations.of(context).demoToggleButtonTitle;
      case ButtonDemoType.floating:
        return GalleryLocalizations.of(context).demoFloatingButtonTitle;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    Widget buttons;
    switch (type) {
      case ButtonDemoType.flat:
        buttons = _FlatButtonDemo();
        break;
      case ButtonDemoType.raised:
        buttons = _RaisedButtonDemo();
        break;
      case ButtonDemoType.outline:
        buttons = _OutlineButtonDemo();
        break;
      case ButtonDemoType.toggle:
        buttons = _ToggleButtonsDemo();
        break;
      case ButtonDemoType.floating:
        buttons = _FloatingActionButtonDemo();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_title(context)),
      ),
      body: buttons,
    );
  }
}

class _FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                child: Text(GalleryLocalizations.of(context).buttonTextEnabled),
                onPressed: () {},
              ),
              FlatButton(
                child:
                    Text(GalleryLocalizations.of(context).buttonTextDisabled),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: Text(GalleryLocalizations.of(context).buttonTextEnabled),
                onPressed: () {},
              ),
              FlatButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label:
                    Text(GalleryLocalizations.of(context).buttonTextDisabled),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              RaisedButton(
                child: Text(GalleryLocalizations.of(context).buttonTextEnabled),
                onPressed: () {},
              ),
              RaisedButton(
                child:
                    Text(GalleryLocalizations.of(context).buttonTextDisabled),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: Text(GalleryLocalizations.of(context).buttonTextEnabled),
                onPressed: () {},
              ),
              RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label:
                    Text(GalleryLocalizations.of(context).buttonTextDisabled),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OutlineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlineButton(
                child: Text(GalleryLocalizations.of(context).buttonTextEnabled),
                onPressed: () {},
              ),
              OutlineButton(
                child:
                    Text(GalleryLocalizations.of(context).buttonTextDisabled),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlineButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: Text(GalleryLocalizations.of(context).buttonTextEnabled),
                onPressed: () {},
              ),
              OutlineButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label:
                    Text(GalleryLocalizations.of(context).buttonTextDisabled),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ToggleButtonsDemo extends StatefulWidget {
  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}

class _ToggleButtonsDemoState extends State<_ToggleButtonsDemo> {
  final isSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        children: [
          Icon(Icons.ac_unit),
          Icon(Icons.call),
          Icon(Icons.cake),
        ],
        onPressed: (index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
        isSelected: isSelected,
      ),
    );
  }
}

class _FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
            tooltip: GalleryLocalizations.of(context).buttonTextCreate,
          ),
          SizedBox(height: 20),
          FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: Text(GalleryLocalizations.of(context).buttonTextCreate),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
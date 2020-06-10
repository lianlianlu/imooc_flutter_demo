import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final SearchBarType searchBarType;
  final String hint; //默认提示文案
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  SearchBar(
      {this.enabled,
      this.hideLeft,
      this.searchBarType,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        _textEditingController.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

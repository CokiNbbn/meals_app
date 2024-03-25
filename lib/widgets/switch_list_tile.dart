import 'package:flutter/material.dart';

class MySwitchListTile extends StatefulWidget {
  const MySwitchListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onChanged,
    required this.value,
  });

  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool value) onChanged;

  @override
  State<MySwitchListTile> createState() => _MySwitchListTileState();
}

class _MySwitchListTileState extends State<MySwitchListTile> {

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.value,
      onChanged: widget.onChanged,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        widget.subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}

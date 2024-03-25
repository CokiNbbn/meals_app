import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switch_list_tile.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFilterSet = false;
  var _lactoseFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFilterSet,
            Filter.lactoseFree: _lactoseFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            MySwitchListTile(
              title: 'Gluten-Free',
              subTitle: 'Only include gluten-free meals.',
              onChanged: (isChecked) {
                setState(() {
                  _glutenFilterSet = isChecked;
                });
              },
              value: _glutenFilterSet,
            ),
            MySwitchListTile(
              title: 'Lactose-Free',
              subTitle: 'Only include lactose-free meals.',
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFilterSet = isChecked;
                });
              },
              value: _lactoseFilterSet,
            ),
            MySwitchListTile(
              title: 'Vegetarian',
              subTitle: 'Only include vegetarian meals.',
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              value: _vegetarianFilterSet,
            ),
            MySwitchListTile(
              title: 'Vegan',
              subTitle: 'Only include vegan meals.',
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              value: _veganFilterSet,
            ),
          ],
        ),
      ),
    );
  }
}

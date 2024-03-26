import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/switch_list_tile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          MySwitchListTile(
            title: 'Gluten-Free',
            subTitle: 'Only include gluten-free meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            value: activeFilters[Filter.glutenFree]!,
          ),
          MySwitchListTile(
            title: 'Lactose-Free',
            subTitle: 'Only include lactose-free meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            value: activeFilters[Filter.lactoseFree]!,
          ),
          MySwitchListTile(
            title: 'Vegetarian',
            subTitle: 'Only include vegetarian meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            value: activeFilters[Filter.vegetarian]!,
          ),
          MySwitchListTile(
            title: 'Vegan',
            subTitle: 'Only include vegan meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            value: activeFilters[Filter.vegan]!,
          ),
        ],
      ),
    );
  }
}

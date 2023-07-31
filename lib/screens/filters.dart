import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet =
      false; // we create a  boolean for each filter value and set its state in onChanged function.
  var _lactoseFreeFilterSet = false;
  var _veganFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;

  @override
  void initState() {
    super
        .initState(); // to access the state from our class above, will run before out BUILD method
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: MainDrawer(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'meals') {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
        //   }
        // }),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              // this object inside the pop is manual logic for popping screen when we leave it.
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegan: _veganFreeFilterSet,
              Filter.vegetarian: _vegetarianFreeFilterSet,
            });
            return false; // false is needed to avoid popping twice
          }, // expects a Future - so a valye in the future, will pass along context to out tabs screen
          child: Column(
            children: [
              SwitchListTile(
                onChanged: (isChecked) {
                  // update glutenfreefilterset
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
                },
                value: _glutenFreeFilterSet,
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                onChanged: (isChecked) {
                  // update glutenfreefilterset
                  setState(() {
                    _veganFreeFilterSet = isChecked;
                  });
                },
                value: _veganFreeFilterSet,
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                onChanged: (isChecked) {
                  // update glutenfreefilterset
                  setState(() {
                    _vegetarianFreeFilterSet = isChecked;
                  });
                },
                value: _vegetarianFreeFilterSet,
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegetarian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                onChanged: (isChecked) {
                  // update glutenfreefilterset
                  setState(() {
                    _lactoseFreeFilterSet = isChecked;
                  });
                },
                value: _lactoseFreeFilterSet,
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              )
            ],
          ),
        ));
  }
}

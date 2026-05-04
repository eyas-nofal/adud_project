import 'package:adud_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectOption {
  final String id;
  final String label;

  const SelectOption({required this.id, required this.label});
}

class MultiSelectDropdown extends StatefulWidget {
  final String label;
  final List<SelectOption> options;
  final List<String> selectedIds;
  final Function(List<String>) onChanged;

  const MultiSelectDropdown({
    super.key,
    required this.label,
    required this.options,
    required this.selectedIds,
    required this.onChanged,
  });

  @override
  State<MultiSelectDropdown> createState() => MultiSelectDropdownState();
}

class MultiSelectDropdownState extends State<MultiSelectDropdown> {
  void showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: widget.options,
          initialSelectedItems: widget.selectedIds,
        );
      },
    );

    if (results != null) {
      widget.onChanged(results);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: showMultiSelect,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.grey.shade50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: widget.selectedIds.isEmpty
                      ? Text(
                          AppLocalizations.of(context)!.selectFromList,
                          style: TextStyle(color: Colors.grey.shade600),
                        )
                      : Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: widget.selectedIds.map((id) {
                            final option = widget.options.firstWhere(
                              (element) => element.id == id,
                            );
                            return Chip(
                              label: Text(
                                option.label,
                                style: const TextStyle(fontSize: 12),
                              ),
                              backgroundColor: Colors.blue.shade100,
                              onDeleted: () {
                                List<String> newList = List.from(
                                  widget.selectedIds,
                                );
                                newList.remove(id);
                                widget.onChanged(newList);
                              },
                            );
                          }).toList(),
                        ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.blue),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<SelectOption> items;
  final List<String> initialSelectedItems;

  const MultiSelectDialog({
    super.key,
    required this.items,
    required this.initialSelectedItems,
  });

  @override
  State<MultiSelectDialog> createState() => MultiSelectDialogState();
}

class MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<String> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = List.from(widget.initialSelectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ), // حواف دائرية للمودال
      title: Text(
        AppLocalizations.of(context)!.selectCity,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final item = widget.items[index];
            final isSelected = selectedItems.contains(item.id);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: CheckboxListTile(
                  value: isSelected,
                  title: Text(
                    item.label,
                    style: TextStyle(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.black87,
                    ),
                  ),
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  controlAffinity: ListTileControlAffinity
                      .trailing, 
                  visualDensity: VisualDensity.compact,
                  onChanged: (bool? checked) {
                    setState(() {
                      if (checked == true) {
                        selectedItems.add(item.id);
                      } else {
                        selectedItems.remove(item.id);
                      }
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          onPressed: () => Navigator.pop(context, selectedItems),
          child: Text(AppLocalizations.of(context)!.confirm),
        ),
      ],
    );
  }
}

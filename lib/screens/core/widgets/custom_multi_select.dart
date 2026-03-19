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
      title: Text(AppLocalizations.of(context)!.selectCity),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) {
            final isSelected = selectedItems.contains(item.id);
            return CheckboxListTile(
              value: isSelected,
              title: Text(item.label),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? checked) {
                setState(() {
                  if (checked == true) {
                    selectedItems.add(item.id);
                  } else {
                    selectedItems.remove(item.id);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, selectedItems),
          child: Text(AppLocalizations.of(context)!.confirm),
        ),
      ],
    );
  }
}

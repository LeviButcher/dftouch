# dftouch - date formatted touch

This utility asks exactly like *touch* but it adds the current date to the beginning of the file name. This can be convenient for keeping files sorted by date.

Example:

```
    dftouch journal.md
    ls
    01_21_21_journal.md 
```

Features:
- Adding current date to file name
- Works with both relative and absolute paths


Upcoming Features:
- Support for changing delimiter
- Formatting the date
# HDI_GET_STRUCTURE_INFO

![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Windows-lightgrey)
![4D](https://img.shields.io/badge/4D-21%2B-blue)
[![License](https://img.shields.io/github/license/miyako/HDI_GET_STRUCTURE_INFO)](LICENSE)

**How do I get detailed information on my database structure?**

A 4D "How Do I" (HDI) example that reads the structure of a database at runtime
and presents tables, fields, indexes and relations in a tabbed interface. It also
ships two drop-in methods that replace the obsolete 4D Pack commands
`AP Get table info` and `AP Get field info`.

## Features

- Exports the structure as XML with `EXPORT STRUCTURE`, then parses the DOM tree into a single object.
- Tabbed viewer for **Tables** (with field list), **Indexes** and **Relations**.
- One click to save the structure as an **XML** or **JSON** file and open it.
- `Get table info` and `Get field info`: drop-in replacements for the 4D Pack commands, with the same signatures.
- Dark mode, macOS Tahoe Liquid Glass buttons and English/Japanese localisation.

## Points of interest

| Topic | Where to look |
|-------|---------------|
| Structure object (`table`, `index`, `relation` collections) | `getDatabaseStructure`, built from `getTablesAndFields`, `getIndex`, `getRelations` |
| DOM parsing of the exported structure XML | `getTablesAndFields`, `getIndex`, `getRelations` |
| 4D Pack command replacements | `Get table info`, `Get field info` (shared, invisible; copy them into your own project) |
| XML / JSON export | `exportStructure` |
| Source of the code samples (`.txt` files at the repo root) | `exportMethod` |
| Theme-aware colours resolved at runtime | `getListColors` and the hidden `refListColors` rectangle in `HDI2` |
| Startup pattern (`CALL WORKER` + non-blocking `DIALOG`) | `00_Start` and `HDI/ObjectMethods/BtnDemo.4dm` |

## Project layout

```
Project/Sources/
  Methods/          structure readers, display and selection helpers
  Forms/HDI/        splash form
  Forms/HDI2/       tabbed structure viewer
  TableForms/       default forms of the sample tables
  styleSheets*.css  dark mode, Liquid Glass / Fluent button heights, fonts
  menus.json        menu bars (standard actions)
Resources/
  en.lproj/ ja.lproj/   XLIFF files (HDI, HDI2, TableForms, menu, messages)
```

## Requirements

- 4D 21 or later (project mode, `compatibilityVersion` 2101)
- macOS or Windows

## Usage

1. Open `Project/HDI_GET_STRUCTURE_INFO.4DProject` with 4D.
2. Run the project in **interpreted** mode; the splash form opens automatically (or choose **File > Demo**).
3. Click **Demo**, then browse the *Info*, *Tables*, *Indexes*, *Relations* and *Extra* tabs.

To reuse the readers in your own project, copy `getDatabaseStructure`, `getTablesAndFields`, `getIndex` and `getRelations`
(or `Get table info` / `Get field info`) and call them directly.

## Modernisation notes

Compared to the original 4D v17 example:

- Variables and parameters use `var` / `#DECLARE`; no `C_*` directives remain.
- Startup uses `CALL WORKER` and `DIALOG(...; *)` with window reuse instead of `New process`; state is passed through `Form`.
- Menu items use standard actions (`quit`); the `m_Quit` wrapper was removed.
- Subroutines are hidden from the **Run method** dialog (`"invisible":true`).
- All UI text comes from XLIFF (`:xliff:` references and `Localized string`).
- Colours use `automatic` / `automaticAlternate` plus `prefers-color-scheme` rules; buttons are sized by CSS per `form-theme`.
- Listboxes use `truncateMode: none` and `resizingMode: legacy`.
- The obsolete "4D v16 or later" check on the splash form was dropped.

## References

- Original blog post: <https://blog.4d.com/detailed-analysis-database-structure/>
- Original download (4D v17): <https://downloads.4d.com/Demos/4D_v17/HDI_GET_STRUCTURE_INFO.zip>
- `EXPORT STRUCTURE`: <https://developer.4d.com/docs/commands/export-structure>
- CSS in 4D forms: <https://developer.4d.com/docs/FormEditor/stylesheets>
- Liquid Glass in 4D: <https://blog.4d.com/the-new-macos-tahoe-design-comes-to-your-4d-applications/>

## Origin

A binary `.4DB` HDI example distributed with 4D v17, converted to project mode with 4D 21 and modernised with GitHub Copilot.

## License

[MIT](LICENSE)

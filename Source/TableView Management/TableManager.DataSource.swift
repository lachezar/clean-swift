import UIKit

/// Documentation: https://developer.apple.com/documentation/uikit/uitableviewdatasource?changes=_6
extension TableManager {

  // MARK: - Configuring a Table View
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = self.row(for: indexPath)
    registerCell(row: row)

    let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
    row.onDequeue?(row)

    row.configure(template: cell, path: indexPath)
    if let container = container { row.displayComponent(in: container) }

    return cell
  }

  public func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].count
  }

  public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section].headerTitle
  }

  public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return sections[section].footerTitle
  }

  // MARK: - Inserting or Deleting Table Rows

//  public func tableView(
//    _ tableView: UITableView,
//    commit editingStyle: UITableViewCellEditingStyle,
//    forRowAt indexPath: IndexPath) {
//
//  }

  public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    let row = self.row(for: indexPath)

    return row.editable
  }

  // MARK: - Reordering Table Rows

//  public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//
//  }

//  public func tableView(
//    _ tableView: UITableView,
//    moveRowAt sourceIndexPath: IndexPath,
//    to destinationIndexPath: IndexPath) {
//
//  }

  // MARK: - Configuring an Index
//
//  public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//
//  }
//
//  public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//  }
}

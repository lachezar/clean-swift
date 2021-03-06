import UIKit

// Documentation: https://developer.apple.com/documentation/uikit/uitableviewdelegate?changes=_6
extension TableManager {
  // MARK: - Configuring Rows for the Table View
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let row = self.row(for: indexPath)
//    print("heightForRowAt \(indexPath) | \(row.height)")
    return row.height
  }

  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    self.tableScrolled?()
  }

//  public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//  }

//  public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//
//  }

//  public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//  }

//  public func tableView(
//    _ tableView: UITableView,
//    shouldSpringLoadRowAt indexPath: IndexPath,
//    with context: UISpringLoadedInteractionContext) -> Bool {
//
//  }

  // MARK: - Managing Accessory Views
//  public func tableView(
//    _ tableView: UITableView,
//    editActionsForRowAt indexPath: IndexPath
//    ) -> [UITableViewRowAction]? {
//
//  }

//  public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//
//  }

  // MARK: - Managing Selections
//  public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//
//  }

  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = self.row(for: indexPath)
    row.onSelect?(row)
  }

//  public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
//
//  }

//  public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//  }

  // MARK: - Modifying the Header and Footer of Sections
  public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let header = header(for: section) else {
      return nil }

    registerHeaderFooter(header)

    guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: header.reuseIdentifier) else {
      return nil }

    header.configure(template: headerView, path: IndexPath(row: 0, section: section))
    if let container = container { header.displayComponent(in: container) }

    return headerView
  }

  public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    guard let footer = footer(for: section) else {
      return nil }

    registerHeaderFooter(footer)

    guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footer.reuseIdentifier) else {
      return nil }

    footer.configure(template: footerView, path: IndexPath(row: 0, section: section))
    if let container = container { footer.displayComponent(in: container) }

    return footerView
  }

  public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    let section = sections[section]

    if let header = section.header {
      return header.height
    }

    if section.headerTitle != nil {
      return UITableView.automaticDimension
    } else {
      return 0
    }
  }

//  public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//
//  }

  public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    let section = sections[section]

    if let footer = section.footer {
      return footer.height
    }

    if section.footerTitle != nil {
      return UITableView.automaticDimension
    } else {
      return 0
    }
  }

//  public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//
//  }

//  public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//
//  }

//  public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
//
//  }

  // MARK: - Editing Table Rows
//  public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
//
//  }

//  public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//
//  }

//  public func tableView(
//    _ tableView: UITableView,
//    editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//
//  }

//  public func tableView(
//    _ tableView: UITableView,
//    titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//
//  }

//  public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//
//  }

  // MARK: - Reordering Table Rows
//  public func tableView(
//    _ tableView: UITableView,
//    targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath,
//    toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//
//  }

  // MARK: - Tracking the Removal of Views
//  public func tableView(
//    _ tableView: UITableView,
//    didEndDisplaying cell: UITableViewCell,
//    forRowAt indexPath: IndexPath) {
//  }

  public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
    let header = self.header(for: section)
    header?.removeComponent()
  }
  public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
    let footer = self.footer(for: section)
    footer?.removeComponent()
  }

  // MARK: - Copying and Pasting Row Content
//  public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
//
//  }
//  public func tableView(
//    _ tableView: UITableView,
//    canPerformAction action: Selector,
//    forRowAt indexPath: IndexPath,
//    withSender sender: Any?) -> Bool {
//
//  }
//  public func tableView(
//    _ tableView: UITableView,
//    performAction action: Selector,
//    forRowAt indexPath: IndexPath,
//    withSender sender: Any?) {
//
//  }

  // MARK: - Managing Table View Highlighting
  public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
    let row = self.row(for: indexPath)

    return row.highlightable
  }

  public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
    let row = self.row(for: indexPath)

    row.onHighlight?(row)
  }

//  public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
//
//  }

  // MARK: - Managing Table View Focus
//  public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
//
//  }
//  public func tableView(
//    _ tableView: UITableView,
//    shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
//
//  }
//  public func tableView(
//    _ tableView: UITableView,
//    didUpdateFocusIn context: UITableViewFocusUpdateContext,
//    with coordinator: UIFocusAnimationCoordinator) {
//
//  }
//  public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
//
//  }

  // MARK: - Handling Swipe Actions
//  public func tableView(
//    _ tableView: UITableView,
//    leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//  }
//  public func tableView(
//    _ tableView: UITableView,
//    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//  }
}

import Foundation
import CleanSwift

public final class JustCellsPresenter: Presenter {
  // MARK: - Properties
  public weak var interface: JustCellsVC!
  var state = State.initial { didSet { updateState() } }
  var section = Section(rows: [
    Row(model: JustCell.Model(text: "Text A"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text B"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: """
          Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        """), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
    Row(model: JustCell.Model(text: "Text"), templateClass: JustCell.self),
  ])

  // MARK: - API
  private func updateState() {
    switch state {
    case .initial:
      return
    case .listCells:
      interface.tableManager.reloadData(sections: [section])
    case .appendRow:
      let newRow = Row(model: JustCell.Model(text: "Text Appended"), templateClass: JustCell.self)
      var rows = section.rows
      rows.append(newRow)
      section.set(rows: rows)
      interface.tableManager.update(with: rows, inSectionAt: 0)
    }
  }
}

extension JustCellsPresenter {
  enum State {
    case initial, listCells, appendRow
  }
}

import Foundation
import CleanSwift

public final class MenuPresenter: Presenter {
  // MARK: - Properties
  public weak var interface: MenuVC!
  var state = State.initial { didSet { updateState() } }

  let justCells = Row(model: MenuCell.Model(title: "Just Cells"), templateClass: MenuCell.self)
  let sectionsCell = Row(model: MenuCell.Model(title: "Custom Sections"), templateClass: MenuCell.self)
  var section: Section {
    var section = Section(rows: [justCells, sectionsCell])
    section.headerTitle = "Test menus"
    return section
  }

  func updateState() {
    switch state {
    case .initial:
      return
    case .listMenus:
      justCells.onSelect{ [weak self] _ in
        self?.router.route = .justCells
      }
      sectionsCell.onSelect { [weak self] _ in
        self?.router.route = .customSections
      }
      interface.tableManager.reloadData(sections: [section])
    }
  }
}

extension MenuPresenter {
  enum State {
    case initial, listMenus
  }
}

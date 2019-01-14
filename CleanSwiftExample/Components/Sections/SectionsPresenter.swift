import Foundation
import CleanSwift

public final class SectionsPresenter: Presenter {
  // MARK: - Properties
  public weak var interface: SectionsVC!
  var state = State.initial { didSet { updateState() } }

  private func updateState() {
    switch state {
    case .initial:
      return
    case .listSections:
      var section1 = Section(rows: [
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
      ])
      let model = ExampleHeader.Model(title: "Header 1")
      section1.header = HeaderFooter(model: model, templateClass: ExampleHeader.self)
      section1.footerTitle = "Footer 1"

      var section2 = Section(rows: [
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
        Row(model: SectionCell.Model(title: "Row text."), templateClass: SectionCell.self),
      ])
      let sizingHeaderModel = ExampleSizingHeader.Model(text: """
      Header 2: There are many variations of passages of Lorem Ipsum available,
      but the majority have suffered alteration in some form, by injected humour,
      or randomised words which don't look even slightly believable.
      """)
      section2.header = HeaderFooter(model: sizingHeaderModel, templateClass: ExampleSizingHeader.self)
      let footerModel = ExampleHeader.Model(title: "Footer 2")
      section2.footer = HeaderFooter(model: footerModel, templateClass: ExampleHeader.self)

      interface.tableManager.reloadData(sections: [section1, section2])
    }
  }
}

extension SectionsPresenter {
  enum State {
    case initial, listSections
  }
}

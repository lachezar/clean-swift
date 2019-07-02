import XCTest
@testable import CleanSwift

class RowTests: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testReuseIdentifier() {
    let row = Row(model: TestCell.Model.none, templateClass: TestCell.self)
    XCTAssert(row.reuseIdentifier == "TestCell")
  }

  func testHeight() {
    let cell = TestCell(style: .default, reuseIdentifier: "TestCell")
    cell.height = 10
    let row = Row(model: TestCell.Model.none, templateClass: TestCell.self)
    row.configure(template: cell, path: IndexPath(item: 0, section: 0))

    XCTAssert(row.height == 10)

    cell.height = 0
    XCTAssert(row.height == UITableView.automaticDimension)
  }

}

private class TestCell: UITableViewCell, ElementTemplate {

  enum Model: ElementModel {
    case none
  }

  var height: CGFloat = 0

  func configure(model: ElementModel, path: IndexPath) {}
}

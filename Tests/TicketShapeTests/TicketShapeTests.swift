//
//  TicketShapeTests.swift
//  TicketShape
//
//  Created by Nunzio Giulio Caggegi on 14/11/25.
//

import XCTest
import SwiftUI
@testable import TicketShape

/// Unit tests for TicketShape components.
final class TicketShapeTests: XCTestCase {

  // MARK: - TicketShape Tests

  func testTicketShapeDefaultInitialization() {
    let shape = TicketShape()
    XCTAssertEqual(shape.cutoutYPosition, 0.75, "Default cutout position should be 0.75")
    XCTAssertEqual(shape.cutoutRadius, 8, "Default cutout radius should be 8")
    XCTAssertEqual(shape.cornerRadius, 16, "Default corner radius should be 16")
  }

  func testTicketShapeCustomInitialization() {
    let shape = TicketShape(
      cutoutYPosition: 0.6,
      cutoutRadius: 12,
      cornerRadius: 20
    )
    XCTAssertEqual(shape.cutoutYPosition, 0.6, "Custom cutout position should be 0.6")
    XCTAssertEqual(shape.cutoutRadius, 12, "Custom cutout radius should be 12")
    XCTAssertEqual(shape.cornerRadius, 20, "Custom corner radius should be 20")
  }

  func testTicketShapePathGeneration() {
    let shape = TicketShape()
    let rect = CGRect(x: 0, y: 0, width: 200, height: 300)
    let path = shape.path(in: rect)

    XCTAssertFalse(path.isEmpty, "Path should not be empty")
    XCTAssertEqual(path.boundingRect.width, rect.width, accuracy: 1.0)
    XCTAssertEqual(path.boundingRect.height, rect.height, accuracy: 1.0)
  }

  // MARK: - TicketDashedLine Tests

  func testTicketDashedLineDefaultInitialization() {
    let line = TicketDashedLine()
    XCTAssertEqual(line.yPosition, 0.75, "Default y position should be 0.75")
    XCTAssertEqual(line.offset, 10, "Default offset should be 10")
  }

  func testTicketDashedLineCustomInitialization() {
    let line = TicketDashedLine(yPosition: 0.5, offset: 15)
    XCTAssertEqual(line.yPosition, 0.5, "Custom y position should be 0.5")
    XCTAssertEqual(line.offset, 15, "Custom offset should be 15")
  }

  func testTicketDashedLinePathGeneration() {
    let line = TicketDashedLine()
    let rect = CGRect(x: 0, y: 0, width: 200, height: 300)
    let path = line.path(in: rect)

    XCTAssertFalse(path.isEmpty, "Path should not be empty")
    
    // The line should be horizontal at the specified y position minus offset
    let expectedY = rect.height * 0.75 - 10
    XCTAssertEqual(path.boundingRect.minY, expectedY, accuracy: 1.0)
    XCTAssertEqual(path.boundingRect.maxY, expectedY, accuracy: 1.0)
  }

  // MARK: - TicketShapeView Tests

  func testTicketShapeViewDefaultInitialization() {
    let view = TicketShapeView {
      Text("Test")
    }

    XCTAssertEqual(view.fillColor, .white, "Default fill color should be white")
    XCTAssertEqual(view.cutoutYPosition, 0.75, "Default cutout position should be 0.75")
    XCTAssertEqual(view.cutoutRadius, 8, "Default cutout radius should be 8")
    XCTAssertEqual(view.cornerRadius, 16, "Default corner radius should be 16")
    XCTAssertEqual(view.dashedLineOffset, 10, "Default dashed line offset should be 10")
    XCTAssertTrue(view.showDashedLine, "Dashed line should be shown by default")
  }

  func testTicketShapeViewCustomInitialization() {
    let customColor = Color.blue
    let view = TicketShapeView(
      fillColor: customColor,
      dashedLineColor: .red,
      cutoutYPosition: 0.6,
      cutoutRadius: 12,
      cornerRadius: 20,
      dashedLineOffset: 15,
      showDashedLine: false
    ) {
      Text("Test")
    }

    XCTAssertEqual(view.fillColor, customColor, "Custom fill color should be blue")
    XCTAssertEqual(view.cutoutYPosition, 0.6, "Custom cutout position should be 0.6")
    XCTAssertEqual(view.cutoutRadius, 12, "Custom cutout radius should be 12")
    XCTAssertEqual(view.cornerRadius, 20, "Custom corner radius should be 20")
    XCTAssertEqual(view.dashedLineOffset, 15, "Custom dashed line offset should be 15")
    XCTAssertFalse(view.showDashedLine, "Dashed line should not be shown")
  }

  // MARK: - Convenience Modifiers Tests

  func testTicketFillModifier() {
    let originalView = TicketShapeView { Text("Test") }
    let modifiedView = originalView.ticketFill(.blue)

    XCTAssertEqual(modifiedView.fillColor, .blue, "Fill color should be updated to blue")
  }

  func testDashedLineColorModifier() {
    let originalView = TicketShapeView { Text("Test") }
    let modifiedView = originalView.dashedLineColor(.red)

    XCTAssertEqual(modifiedView.dashedLineColor, .red, "Dashed line color should be updated to red")
  }

  func testDashedLineStyleModifier() {
    let originalView = TicketShapeView { Text("Test") }
    let customStyle = StrokeStyle(lineWidth: 2, dash: [10, 5])
    let modifiedView = originalView.dashedLineStyle(customStyle)

    XCTAssertEqual(modifiedView.dashedLineStroke.lineWidth, 2, "Line width should be 2")
    XCTAssertEqual(modifiedView.dashedLineStroke.dash, [10, 5], "Dash pattern should be [10, 5]")
  }

  func testDashedLineVisibilityModifier() {
    let originalView = TicketShapeView { Text("Test") }
    let modifiedView = originalView.dashedLine(false)

    XCTAssertFalse(modifiedView.showDashedLine, "Dashed line should be hidden")
  }

  // MARK: - Edge Cases Tests

  func testTicketShapeWithZeroRadius() {
    let shape = TicketShape(cutoutRadius: 0, cornerRadius: 0)
    let rect = CGRect(x: 0, y: 0, width: 200, height: 300)
    let path = shape.path(in: rect)

    XCTAssertFalse(path.isEmpty, "Path should not be empty even with zero radii")
  }

  func testTicketShapeWithExtremePositions() {
    // Test at top
    let topShape = TicketShape(cutoutYPosition: 0.0)
    let topRect = CGRect(x: 0, y: 0, width: 200, height: 300)
    let topPath = topShape.path(in: topRect)
    XCTAssertFalse(topPath.isEmpty, "Path should not be empty at top position")

    // Test at bottom
    let bottomShape = TicketShape(cutoutYPosition: 1.0)
    let bottomRect = CGRect(x: 0, y: 0, width: 200, height: 300)
    let bottomPath = bottomShape.path(in: bottomRect)
    XCTAssertFalse(bottomPath.isEmpty, "Path should not be empty at bottom position")
  }

  func testTicketDashedLineWithZeroOffset() {
    let line = TicketDashedLine(offset: 0)
    let rect = CGRect(x: 0, y: 0, width: 200, height: 300)
    let path = line.path(in: rect)

    XCTAssertFalse(path.isEmpty, "Path should not be empty with zero offset")
    
    let expectedY = rect.height * 0.75
    XCTAssertEqual(path.boundingRect.minY, expectedY, accuracy: 1.0)
  }
}

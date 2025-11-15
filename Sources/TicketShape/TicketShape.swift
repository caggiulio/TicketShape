//
//  TicketShape.swift
//  A customizable ticket-shaped SwiftUI component with decorative cutouts
//
//  Created by Nunzio Giulio Caggegi on 08/11/25.
//
//  MIT License
//
//  Copyright (c) 2025 Nunzio Giulio Caggegi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import SwiftUI

// MARK: - Dashed Line

/// A horizontal dashed line positioned above the ticket cutouts.
///
/// This shape creates a decorative separator line that sits above the semi-circular
/// cutouts in a ticket design, enhancing the visual separation between sections.
///
/// Example usage:
/// ```swift
/// TicketDashedLine(yPosition: 0.75, offset: 8)
///     .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
///     .foregroundStyle(.gray)
/// ```
public struct TicketDashedLine: Shape {
  /// The vertical position of the line as a percentage of the total height.
  ///
  /// Values range from 0.0 (top) to 1.0 (bottom).
  /// This should match the cutout position of the ticket shape.
  public var yPosition: CGFloat

  /// The vertical offset above the cutout position, in points.
  ///
  /// Positive values move the line upward from the cutout position.
  public var offset: CGFloat

  /// Creates a dashed line shape.
  ///
  /// - Parameters:
  ///   - yPosition: The vertical position as a percentage (0.0-1.0). Default is 0.75.
  ///   - offset: The vertical offset in points. Default is 10.
  public init(yPosition: CGFloat = 0.75, offset: CGFloat = 10) {
    self.yPosition = yPosition
    self.offset = offset
  }

  /// Creates the path for the dashed line within the given rectangle.
  ///
  /// The line is drawn horizontally spanning the full width of the rect.
  ///
  /// - Parameter rect: The rectangular bounds in which to draw the line.
  /// - Returns: A `Path` representing the horizontal dashed line.
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let y = rect.minY + rect.height * yPosition - offset
    path.move(to: CGPoint(x: rect.minX, y: y))
    path.addLine(to: CGPoint(x: rect.maxX, y: y))
    return path
  }
}

// MARK: - Ticket Shape

/// A custom shape that creates a ticket-like appearance with semi-circular cutouts on the sides.
///
/// The shape features rounded corners and two small semi-circular notches positioned
/// on the left and right sides, mimicking a traditional paper ticket design.
///
/// Example usage:
/// ```swift
/// TicketShape(
///     cutoutYPosition: 0.75,
///     cutoutRadius: 8,
///     cornerRadius: 12
/// )
/// .fill(.white)
/// .shadow(radius: 8)
/// ```
public struct TicketShape: Shape {
  /// The vertical position of the cutouts as a percentage of the total height.
  ///
  /// Values range from 0.0 (top) to 1.0 (bottom).
  public var cutoutYPosition: CGFloat

  /// The radius of the semi-circular cutouts on the sides, in points.
  public var cutoutRadius: CGFloat

  /// The radius for the rounded corners of the ticket, in points.
  public var cornerRadius: CGFloat

  /// Creates a ticket shape with customizable parameters.
  ///
  /// - Parameters:
  ///   - cutoutYPosition: The vertical position of cutouts as a percentage (0.0-1.0). Default is 0.75.
  ///   - cutoutRadius: The radius of the semi-circular cutouts in points. Default is 8.
  ///   - cornerRadius: The radius for the rounded corners in points. Default is 16.
  public init(
    cutoutYPosition: CGFloat = 0.75,
    cutoutRadius: CGFloat = 8,
    cornerRadius: CGFloat = 16
  ) {
    self.cutoutYPosition = cutoutYPosition
    self.cutoutRadius = cutoutRadius
    self.cornerRadius = cornerRadius
  }

  /// Creates the path for the ticket shape within the given rectangle.
  ///
  /// - Parameter rect: The rectangular bounds in which to draw the shape.
  /// - Returns: A `Path` representing the ticket shape with side cutouts.
  public func path(in rect: CGRect) -> Path {
    var path = Path()

    // Calculate the Y position of the cutouts
    let cutoutY = rect.minY + rect.height * cutoutYPosition

    // Start from top-left corner
    path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))

    // Top edge with top-right corner
    path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
    path.addQuadCurve(
      to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius),
      control: CGPoint(x: rect.maxX, y: rect.minY)
    )

    // Right edge down to the cutout
    path.addLine(to: CGPoint(x: rect.maxX, y: cutoutY - cutoutRadius))

    // Right semi-circular cutout (inward)
    path.addArc(
      center: CGPoint(x: rect.maxX, y: cutoutY),
      radius: cutoutRadius,
      startAngle: .degrees(-90),
      endAngle: .degrees(90),
      clockwise: true
    )

    // Continue right edge to bottom-right corner
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))

    // Bottom-right corner
    path.addQuadCurve(
      to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY),
      control: CGPoint(x: rect.maxX, y: rect.maxY)
    )

    // Bottom edge
    path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))

    // Bottom-left corner
    path.addQuadCurve(
      to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius),
      control: CGPoint(x: rect.minX, y: rect.maxY)
    )

    // Left edge up to the cutout
    path.addLine(to: CGPoint(x: rect.minX, y: cutoutY + cutoutRadius))

    // Left semi-circular cutout (inward)
    path.addArc(
      center: CGPoint(x: rect.minX, y: cutoutY),
      radius: cutoutRadius,
      startAngle: .degrees(90),
      endAngle: .degrees(-90),
      clockwise: true
    )

    // Complete left edge to top-left corner
    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))

    // Top-left corner
    path.addQuadCurve(
      to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY),
      control: CGPoint(x: rect.minX, y: rect.minY)
    )

    return path
  }
}

// MARK: - Ticket Shape View

/// A complete ticket view that combines the ticket shape with a decorative dashed separator line.
///
/// This view provides a ready-to-use ticket container with semi-circular cutouts and
/// a horizontal dashed line positioned above them, creating a visual separation
/// typical of tear-off ticket designs.
///
/// Example usage:
/// ```swift
/// TicketShapeView {
///     VStack {
///         Text("Event Name")
///             .font(.headline)
///         Text("Date & Time")
///             .font(.subheadline)
///     }
///     .padding()
/// }
/// .frame(width: 200, height: 300)
/// ```
public struct TicketShapeView<Content: View>: View {
  /// The fill color for the ticket shape.
  public var fillColor: Color

  /// The color of the dashed separator line.
  public var dashedLineColor: Color

  /// The vertical position of cutouts as a percentage (0.0-1.0).
  public var cutoutYPosition: CGFloat

  /// The radius of the semi-circular cutouts in points.
  public var cutoutRadius: CGFloat

  /// The radius for the rounded corners in points.
  public var cornerRadius: CGFloat

  /// The offset of the dashed line above the cutout position, in points.
  public var dashedLineOffset: CGFloat

  /// The style for the dashed line stroke.
  public var dashedLineStroke: StrokeStyle

  /// Whether to show the dashed line.
  public var showDashedLine: Bool

  /// The content to display inside the ticket shape.
  private let content: Content

  /// Creates a ticket-shaped container view with fully customizable parameters.
  ///
  /// - Parameters:
  ///   - fillColor: The fill color for the ticket shape. Default is `.white`.
  ///   - dashedLineColor: The color of the dashed separator line. Default is semi-transparent gray.
  ///   - cutoutYPosition: The vertical position of cutouts as a percentage (0.0-1.0). Default is 0.75.
  ///   - cutoutRadius: The radius of the semi-circular cutouts in points. Default is 8.
  ///   - cornerRadius: The radius for the rounded corners in points. Default is 16.
  ///   - dashedLineOffset: The offset of the dashed line above the cutout position. Default is 10.
  ///   - dashedLineStroke: The style for the dashed line. Default is `StrokeStyle(lineWidth: 0.5, dash: [4, 4])`.
  ///   - showDashedLine: Whether to display the dashed separator line. Default is `true`.
  ///   - content: A view builder that creates the content to display inside the ticket.
  public init(
    fillColor: Color = .white,
    dashedLineColor: Color = .gray.opacity(0.3),
    cutoutYPosition: CGFloat = 0.75,
    cutoutRadius: CGFloat = 8,
    cornerRadius: CGFloat = 16,
    dashedLineOffset: CGFloat = 10,
    dashedLineStroke: StrokeStyle = StrokeStyle(lineWidth: 0.5, dash: [4, 4]),
    showDashedLine: Bool = true,
    @ViewBuilder content: () -> Content
  ) {
    self.fillColor = fillColor
    self.dashedLineColor = dashedLineColor
    self.cutoutYPosition = cutoutYPosition
    self.cutoutRadius = cutoutRadius
    self.cornerRadius = cornerRadius
    self.dashedLineOffset = dashedLineOffset
    self.dashedLineStroke = dashedLineStroke
    self.showDashedLine = showDashedLine
    self.content = content()
  }

  public var body: some View {
    content
      .background(
        ZStack {
          TicketShape(
            cutoutYPosition: cutoutYPosition,
            cutoutRadius: cutoutRadius,
            cornerRadius: cornerRadius
          )
          .fill(fillColor)

          if showDashedLine {
            TicketDashedLine(
              yPosition: cutoutYPosition,
              offset: dashedLineOffset
            )
            .stroke(style: dashedLineStroke)
            .foregroundStyle(dashedLineColor)
          }
        }
      )
  }
}

// MARK: - Convenience Modifiers

public extension TicketShapeView {
  /// Sets the fill color for the ticket shape.
  ///
  /// - Parameter color: The new fill color.
  /// - Returns: A modified ticket view with the new fill color.
  func ticketFill(_ color: Color) -> TicketShapeView {
    var view = self
    view.fillColor = color
    return view
  }

  /// Sets the dashed line color.
  ///
  /// - Parameter color: The new dashed line color.
  /// - Returns: A modified ticket view with the new dashed line color.
  func dashedLineColor(_ color: Color) -> TicketShapeView {
    var view = self
    view.dashedLineColor = color
    return view
  }

  /// Configures the dashed line stroke style.
  ///
  /// - Parameter style: The new stroke style for the dashed line.
  /// - Returns: A modified ticket view with the new stroke style.
  func dashedLineStyle(_ style: StrokeStyle) -> TicketShapeView {
    var view = self
    view.dashedLineStroke = style
    return view
  }

  /// Shows or hides the dashed line.
  ///
  /// - Parameter show: Whether to show the dashed line.
  /// - Returns: A modified ticket view with the dashed line visibility set.
  func dashedLine(_ show: Bool) -> TicketShapeView {
    var view = self
    view.showDashedLine = show
    return view
  }
}

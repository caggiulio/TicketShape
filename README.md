# TicketShape

A customizable, ticket-shaped SwiftUI component with decorative semi-circular cutouts and an optional dashed separator line.

![Platform](https://img.shields.io/badge/platform-iOS%2015.0%2B-blue)
![Swift](https://img.shields.io/badge/Swift-5.5%2B-orange)
![License](https://img.shields.io/badge/license-MIT-green)

## Features

- ✨ **Fully Customizable**: Control every aspect of the ticket's appearance
- 🎨 **Flexible Styling**: Custom colors, stroke styles, and geometry
- 📐 **Precise Control**: Adjustable cutout positions, radii, and corner radii
- 🎯 **SwiftUI Native**: Built with SwiftUI for modern iOS development
- 📱 **Responsive**: Adapts to any frame size
- 🔌 **Easy Integration**: Simple API with sensible defaults

## Preview

```swift
TicketShapeView {
    VStack(spacing: 12) {
        Text("Event Title")
            .font(.headline)
        Text("November 9, 2025")
            .font(.subheadline)
    }
    .padding()
}
.frame(width: 250, height: 350)
```

## Installation

### Swift Package Manager

Add TicketShape to your project through Xcode:

1. File > Add Package Dependencies
2. Enter the repository URL: `https://github.com/yourusername/TicketShape`
3. Select the version you want to use

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/TicketShape", from: "1.0.0")
]
```

### Manual Installation

Simply copy `TicketShape.swift` into your project.

## Usage

### Basic Usage

The simplest way to create a ticket-shaped view:

```swift
TicketShapeView {
    VStack {
        Text("Concert")
            .font(.headline)
        Text("8:00 PM")
            .font(.subheadline)
    }
    .padding()
}
.frame(width: 250, height: 350)
```

### Custom Colors

Customize the fill and dashed line colors:

```swift
TicketShapeView(
    fillColor: .blue.opacity(0.1),
    dashedLineColor: .blue
) {
    // Your content here
}
```

### Custom Geometry

Full control over the shape's dimensions:

```swift
TicketShapeView(
    fillColor: .white,
    dashedLineColor: .gray,
    cutoutYPosition: 0.6,        // Position cutouts at 60% height
    cutoutRadius: 12,             // Larger cutout circles
    cornerRadius: 24,             // More rounded corners
    dashedLineOffset: 15,         // More space above cutouts
    dashedLineStroke: StrokeStyle(
        lineWidth: 1,
        dash: [8, 4]              // Custom dash pattern
    )
) {
    // Your content here
}
```

### Without Dashed Line

Hide the separator line entirely:

```swift
TicketShapeView(
    showDashedLine: false
) {
    // Your content here
}
```

### Using Individual Components

You can also use the shape components separately:

```swift
// Just the ticket shape
TicketShape(
    cutoutYPosition: 0.75,
    cutoutRadius: 8,
    cornerRadius: 16
)
.fill(.white)
.shadow(radius: 8)

// Just the dashed line
TicketDashedLine(
    yPosition: 0.75,
    offset: 10
)
.stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
.foregroundStyle(.gray)
```

### Convenience Modifiers

Use convenience modifiers for cleaner code:

```swift
TicketShapeView {
    // Your content
}
.ticketFill(.blue.opacity(0.1))
.dashedLineColor(.blue)
.dashedLineStyle(StrokeStyle(lineWidth: 1, dash: [8, 4]))
.dashedLine(true)
```

## API Reference

### TicketShapeView

The main container view that combines the ticket shape with content.

#### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `fillColor` | `Color` | `.white` | The fill color for the ticket background |
| `dashedLineColor` | `Color` | `.gray.opacity(0.3)` | Color of the separator line |
| `cutoutYPosition` | `CGFloat` | `0.75` | Vertical position of cutouts (0.0-1.0) |
| `cutoutRadius` | `CGFloat` | `8` | Radius of semi-circular cutouts in points |
| `cornerRadius` | `CGFloat` | `16` | Radius of rounded corners in points |
| `dashedLineOffset` | `CGFloat` | `10` | Offset of dashed line above cutouts |
| `dashedLineStroke` | `StrokeStyle` | `StrokeStyle(lineWidth: 0.5, dash: [4, 4])` | Stroke style for the dashed line |
| `showDashedLine` | `Bool` | `true` | Whether to show the dashed line |
| `content` | `() -> Content` | - | ViewBuilder for ticket content |

### TicketShape

A `Shape` that creates the ticket outline with cutouts.

#### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `cutoutYPosition` | `CGFloat` | `0.75` | Vertical position of cutouts (0.0-1.0) |
| `cutoutRadius` | `CGFloat` | `8` | Radius of semi-circular cutouts |
| `cornerRadius` | `CGFloat` | `16` | Radius of rounded corners |

### TicketDashedLine

A `Shape` that creates the horizontal dashed separator line.

#### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `yPosition` | `CGFloat` | `0.75` | Vertical position as percentage (0.0-1.0) |
| `offset` | `CGFloat` | `10` | Vertical offset in points above cutout position |

## Examples

### Event Ticket

```swift
TicketShapeView(
    fillColor: .purple.opacity(0.1),
    dashedLineColor: .purple
) {
    VStack(spacing: 20) {
        Text("PREMIUM")
            .font(.caption)
            .fontWeight(.semibold)
        
        Text("Theatre Show")
            .font(.title2)
            .fontWeight(.bold)
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Date:")
                    .fontWeight(.semibold)
                Text("Nov 15, 2025")
            }
            HStack {
                Text("Time:")
                    .fontWeight(.semibold)
                Text("7:30 PM")
            }
            HStack {
                Text("Seat:")
                    .fontWeight(.semibold)
                Text("A-12")
            }
        }
        .font(.subheadline)
    }
    .foregroundStyle(.purple)
    .padding()
}
.frame(width: 280, height: 400)
```

### Boarding Pass

```swift
TicketShapeView(
    fillColor: .blue.opacity(0.05),
    dashedLineColor: .blue.opacity(0.5),
    cutoutYPosition: 0.7,
    cornerRadius: 20
) {
    VStack(spacing: 20) {
        HStack {
            VStack(alignment: .leading) {
                Text("NYC")
                    .font(.system(size: 36, weight: .bold))
                Text("New York")
                    .font(.caption)
            }
            
            Spacer()
            
            Image(systemName: "airplane")
                .font(.title)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("LAX")
                    .font(.system(size: 36, weight: .bold))
                Text("Los Angeles")
                    .font(.caption)
            }
        }
        
        Spacer()
        
        HStack {
            VStack(alignment: .leading) {
                Text("PASSENGER")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Text("John Doe")
                    .font(.headline)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("GATE")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Text("B22")
                    .font(.headline)
            }
        }
    }
    .foregroundStyle(.blue)
    .padding(24)
}
.frame(width: 320, height: 450)
```

### Coupon/Voucher

```swift
TicketShapeView(
    fillColor: .orange.opacity(0.1),
    dashedLineColor: .orange,
    cutoutYPosition: 0.65,
    dashedLineStroke: StrokeStyle(lineWidth: 1, dash: [6, 3])
) {
    VStack(spacing: 16) {
        Text("50% OFF")
            .font(.system(size: 44, weight: .bold))
            .foregroundStyle(.orange)
        
        Text("Your Next Purchase")
            .font(.title3)
        
        Spacer()
        
        VStack(spacing: 4) {
            Text("USE CODE:")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text("SAVE50")
                .font(.title2)
                .fontWeight(.bold)
                .tracking(2)
        }
        
        Text("Valid until Dec 31, 2025")
            .font(.caption)
            .foregroundStyle(.secondary)
    }
    .padding()
}
.frame(width: 300, height: 400)
```

## Requirements

- iOS 15.0+
- macOS 12.0+
- tvOS 15.0+
- watchOS 8.0+
- Swift 5.5+

## License

TicketShape is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Author

Nunzio Giulio Caggegi

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Acknowledgments

- Inspired by traditional paper ticket designs
- Built with ❤️ using SwiftUI

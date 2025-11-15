# Quick Start Guide

Get up and running with TicketShape in less than 5 minutes!

## Installation

### Option 1: Swift Package Manager (Recommended)

1. In Xcode, select **File > Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/yourusername/TicketShape`
3. Click **Add Package**

### Option 2: Manual Installation

Download `TicketShape.swift` and add it to your Xcode project.

## Basic Usage

### Step 1: Import TicketShape

```swift
import SwiftUI
import TicketShape // Only needed if using SPM
```

### Step 2: Create Your First Ticket

```swift
struct ContentView: View {
    var body: some View {
        TicketShapeView {
            VStack(spacing: 12) {
                Text("Event Title")
                    .font(.headline)
                Text("Date & Time")
                    .font(.subheadline)
            }
            .padding()
        }
        .frame(width: 250, height: 350)
    }
}
```

That's it! You now have a ticket-shaped view.

## Customization Examples

### Change Colors

```swift
TicketShapeView(
    fillColor: .blue.opacity(0.1),
    dashedLineColor: .blue
) {
    // Your content
}
```

### Adjust Geometry

```swift
TicketShapeView(
    cutoutYPosition: 0.6,    // Move cutouts up
    cutoutRadius: 12,         // Larger cutouts
    cornerRadius: 24          // More rounded corners
) {
    // Your content
}
```

### Hide Dashed Line

```swift
TicketShapeView(
    showDashedLine: false
) {
    // Your content
}
```

### Custom Dash Pattern

```swift
TicketShapeView(
    dashedLineStroke: StrokeStyle(
        lineWidth: 1,
        dash: [8, 4]
    )
) {
    // Your content
}
```

## Common Use Cases

### Concert Ticket

```swift
TicketShapeView(
    fillColor: .purple.opacity(0.1),
    dashedLineColor: .purple
) {
    VStack(spacing: 20) {
        Text("Rock Concert 2025")
            .font(.title2)
            .fontWeight(.bold)
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Date:")
                Text("Nov 15, 2025")
            }
            HStack {
                Text("Time:")
                Text("8:00 PM")
            }
            HStack {
                Text("Seat:")
                Text("A-12")
            }
        }
    }
    .foregroundStyle(.purple)
    .padding()
}
.frame(width: 280, height: 400)
```

### Discount Coupon

```swift
TicketShapeView(
    fillColor: .orange.opacity(0.1),
    dashedLineColor: .orange,
    cutoutYPosition: 0.6
) {
    VStack(spacing: 16) {
        Text("50% OFF")
            .font(.system(size: 44, weight: .bold))
            .foregroundStyle(.orange)
        
        Spacer()
        
        VStack(spacing: 4) {
            Text("USE CODE:")
                .font(.caption)
            Text("SAVE50")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
    .padding()
}
.frame(width: 300, height: 400)
```

## Using Convenience Modifiers

Chain modifiers for cleaner code:

```swift
TicketShapeView {
    // Your content
}
.ticketFill(.blue.opacity(0.1))
.dashedLineColor(.blue)
.dashedLineStyle(StrokeStyle(lineWidth: 1, dash: [8, 4]))
.dashedLine(true)
.frame(width: 250, height: 350)
```

## Using Individual Components

### Just the Shape

```swift
TicketShape(
    cutoutYPosition: 0.75,
    cutoutRadius: 8,
    cornerRadius: 16
)
.fill(.white)
.shadow(radius: 8)
.frame(width: 250, height: 350)
```

### Just the Dashed Line

```swift
TicketDashedLine(
    yPosition: 0.75,
    offset: 10
)
.stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
.foregroundStyle(.gray)
.frame(width: 250, height: 350)
```

## Tips & Tricks

### 1. Responsive Sizing

Let the ticket adapt to its container:

```swift
TicketShapeView {
    // Content
}
.frame(maxWidth: .infinity, maxHeight: .infinity)
.padding()
```

### 2. Adding Shadows

```swift
TicketShapeView {
    // Content
}
.frame(width: 250, height: 350)
.shadow(color: .black.opacity(0.1), radius: 10, y: 5)
```

### 3. Scrollable List

```swift
ScrollView {
    VStack(spacing: 20) {
        ForEach(tickets) { ticket in
            TicketShapeView {
                TicketContent(ticket: ticket)
            }
            .frame(width: 250, height: 350)
        }
    }
    .padding()
}
```

### 4. Animation

```swift
@State private var showTicket = false

var body: some View {
    TicketShapeView {
        // Content
    }
    .frame(width: 250, height: 350)
    .scaleEffect(showTicket ? 1 : 0.5)
    .opacity(showTicket ? 1 : 0)
    .animation(.spring(), value: showTicket)
    .onAppear {
        showTicket = true
    }
}
```

### 5. Dark Mode Support

```swift
TicketShapeView(
    fillColor: Color(uiColor: .systemBackground),
    dashedLineColor: Color(uiColor: .separator)
) {
    // Content
}
```

## Next Steps

- Check out [Example.swift](Example.swift) for more comprehensive examples
- Read the [API Reference](README.md#api-reference) for all available parameters
- Explore the [source code](Sources/TicketShape/TicketShape.swift) to understand the implementation
- Join the discussion on [GitHub](https://github.com/yourusername/TicketShape)

## Need Help?

- 📖 Read the [full documentation](README.md)
- 💬 Ask questions in [GitHub Discussions](https://github.com/yourusername/TicketShape/discussions)
- 🐛 Report issues on [GitHub Issues](https://github.com/yourusername/TicketShape/issues)
- 📧 Contact: [your-email@example.com]

## What's Next?

Now that you have the basics down, try:

1. Creating your own custom ticket designs
2. Combining multiple tickets in a list
3. Adding interactivity (tap gestures, animations)
4. Building a complete ticketing app
5. Contributing back to the project!

Happy coding! 🎉

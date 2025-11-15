# Contributing to TicketShape

First off, thank you for considering contributing to TicketShape! It's people like you that make TicketShape such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to [your-email@example.com].

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible.
* **Provide specific examples to demonstrate the steps**.
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots or animated GIFs** if possible.
* **Include your Swift/Xcode version** and the platform you're targeting.

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps** or provide mockups/examples of how the enhancement would look.
* **Explain why this enhancement would be useful** to most TicketShape users.

### Pull Requests

* Fill in the required template
* Do not include issue numbers in the PR title
* Include screenshots and animated GIFs in your pull request whenever possible
* Follow the Swift style guide
* Include thoughtfully-worded, well-structured tests
* Document new code based on the existing documentation style
* End all files with a newline

## Swift Style Guide

### Code Formatting

* Use 2 spaces for indentation (not tabs)
* Prefer `let` over `var` whenever possible
* Use trailing closures when appropriate
* Use type inference where possible
* Always specify access control explicitly (public, private, internal, etc.)

### Documentation

* All public APIs must be documented using Swift documentation comments (`///`)
* Include example usage in documentation when appropriate
* Document all parameters and return values
* Use clear, concise language

### Example

```swift
/// A descriptive summary of what this does.
///
/// A more detailed explanation if needed, including usage examples:
/// ```swift
/// let example = MyType(value: 42)
/// ```
///
/// - Parameters:
///   - value: Description of the parameter
/// - Returns: Description of what is returned
public func myFunction(value: Int) -> String {
    return "\(value)"
}
```

## Testing

* Write tests for any new functionality
* Ensure all tests pass before submitting a PR
* Aim for high code coverage
* Test on multiple platforms when possible (iOS, macOS, tvOS, watchOS)

## Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* Consider starting the commit message with an applicable emoji:
    * 🎨 `:art:` when improving the format/structure of the code
    * 🐎 `:racehorse:` when improving performance
    * 📝 `:memo:` when writing docs
    * 🐛 `:bug:` when fixing a bug
    * 🔥 `:fire:` when removing code or files
    * ✅ `:white_check_mark:` when adding tests
    * 🔒 `:lock:` when dealing with security
    * ⬆️ `:arrow_up:` when upgrading dependencies
    * ⬇️ `:arrow_down:` when downgrading dependencies

## Development Setup

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/TicketShape.git`
3. Create a feature branch: `git checkout -b feature/my-new-feature`
4. Open `Package.swift` in Xcode
5. Make your changes
6. Commit your changes: `git commit -am 'Add some feature'`
7. Push to the branch: `git push origin feature/my-new-feature`
8. Submit a pull request

## Project Structure

```
TicketShape/
├── Sources/
│   └── TicketShape/
│       └── TicketShape.swift    # Main source file
├── Tests/
│   └── TicketShapeTests/
│       └── TicketShapeTests.swift
├── Package.swift                 # Swift Package Manager manifest
├── README.md                     # Project documentation
├── LICENSE                       # MIT License
├── CHANGELOG.md                  # Version history
└── CONTRIBUTING.md               # This file
```

## Questions?

Feel free to open an issue with your question or reach out directly.

Thank you for contributing! 🎉

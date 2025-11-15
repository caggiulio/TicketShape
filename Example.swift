//
//  Example.swift
//  TicketShape Examples
//
//  Comprehensive examples demonstrating TicketShape usage
//

import SwiftUI
import TicketShape

// MARK: - Basic Examples

/// Simple ticket with default settings
struct BasicTicketExample: View {
  var body: some View {
    TicketShapeView {
      VStack(spacing: 12) {
        Text("Concert")
          .font(.headline)
        Text("November 15, 2025")
          .font(.subheadline)
        Text("8:00 PM")
          .font(.caption)
      }
      .padding()
    }
    .frame(width: 250, height: 350)
  }
}

// MARK: - Event Ticket

/// Full-featured event ticket with detailed information
struct EventTicketExample: View {
  var body: some View {
    TicketShapeView(
      fillColor: .purple.opacity(0.1),
      dashedLineColor: .purple,
      cutoutYPosition: 0.65
    ) {
      VStack(spacing: 20) {
        // Header
        VStack(spacing: 4) {
          Text("PREMIUM")
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.purple.opacity(0.7))
          
          Text("Rock Concert 2025")
            .font(.title2)
            .fontWeight(.bold)
        }
        .padding(.top, 30)
        
        Spacer()
        
        // Details Section
        VStack(alignment: .leading, spacing: 12) {
          DetailRow(label: "Date", value: "Nov 15, 2025")
          DetailRow(label: "Time", value: "8:00 PM")
          DetailRow(label: "Venue", value: "Arena Stadium")
          DetailRow(label: "Seat", value: "Section A, Row 5, Seat 12")
          DetailRow(label: "Price", value: "$99.99")
        }
        .padding(.bottom, 30)
      }
      .foregroundStyle(.purple)
      .padding(.horizontal, 24)
    }
    .frame(width: 300, height: 450)
  }
}

// MARK: - Boarding Pass

/// Airline boarding pass design
struct BoardingPassExample: View {
  var body: some View {
    TicketShapeView(
      fillColor: .blue.opacity(0.05),
      dashedLineColor: .blue.opacity(0.5),
      cutoutYPosition: 0.7,
      cornerRadius: 20,
      dashedLineStroke: StrokeStyle(lineWidth: 1, dash: [6, 3])
    ) {
      VStack(spacing: 0) {
        // Flight Route
        HStack(alignment: .center, spacing: 20) {
          VStack(alignment: .leading, spacing: 4) {
            Text("NYC")
              .font(.system(size: 40, weight: .bold))
            Text("New York")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
          
          VStack(spacing: 4) {
            Image(systemName: "airplane")
              .font(.title2)
            Text("3h 45m")
              .font(.caption2)
              .foregroundStyle(.secondary)
          }
          
          VStack(alignment: .trailing, spacing: 4) {
            Text("LAX")
              .font(.system(size: 40, weight: .bold))
            Text("Los Angeles")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        
        Spacer()
        
        // Passenger Information
        VStack(spacing: 16) {
          HStack {
            InfoColumn(title: "PASSENGER", value: "John Doe")
            Spacer()
            InfoColumn(title: "CLASS", value: "Business")
          }
          
          HStack {
            InfoColumn(title: "FLIGHT", value: "AA 1234")
            Spacer()
            InfoColumn(title: "GATE", value: "B22")
          }
          
          HStack {
            InfoColumn(title: "DATE", value: "Nov 15")
            Spacer()
            InfoColumn(title: "BOARDING", value: "7:30 PM")
          }
        }
        .padding(.bottom, 30)
      }
      .foregroundStyle(.blue)
      .padding(.horizontal, 24)
    }
    .frame(width: 320, height: 480)
  }
}

// MARK: - Coupon/Voucher

/// Discount coupon design
struct CouponExample: View {
  var body: some View {
    TicketShapeView(
      fillColor: .orange.opacity(0.1),
      dashedLineColor: .orange,
      cutoutYPosition: 0.6,
      cutoutRadius: 10,
      dashedLineStroke: StrokeStyle(lineWidth: 1, dash: [8, 4])
    ) {
      VStack(spacing: 0) {
        // Discount Section
        VStack(spacing: 8) {
          Text("50% OFF")
            .font(.system(size: 48, weight: .heavy))
            .foregroundStyle(.orange)
          
          Text("Your Next Purchase")
            .font(.title3)
            .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 40)
        
        Spacer()
        
        // Code Section
        VStack(spacing: 12) {
          VStack(spacing: 4) {
            Text("USE CODE")
              .font(.caption)
              .fontWeight(.semibold)
              .foregroundStyle(.secondary)
            
            Text("SAVE50")
              .font(.title)
              .fontWeight(.bold)
              .tracking(3)
              .padding(.horizontal, 20)
              .padding(.vertical, 8)
              .background(
                RoundedRectangle(cornerRadius: 8)
                  .fill(.orange.opacity(0.1))
                  .overlay(
                    RoundedRectangle(cornerRadius: 8)
                      .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
                      .foregroundStyle(.orange)
                  )
              )
          }
          
          VStack(spacing: 2) {
            Text("Valid until Dec 31, 2025")
              .font(.caption)
              .foregroundStyle(.secondary)
            Text("One time use per customer")
              .font(.caption2)
              .foregroundStyle(.secondary)
          }
        }
        .padding(.bottom, 40)
      }
      .padding(.horizontal, 20)
    }
    .frame(width: 300, height: 420)
  }
}

// MARK: - Movie Ticket

/// Cinema ticket design
struct MovieTicketExample: View {
  var body: some View {
    TicketShapeView(
      fillColor: Color(red: 0.1, green: 0.1, blue: 0.15),
      dashedLineColor: .white.opacity(0.2),
      cutoutYPosition: 0.7,
      dashedLineStroke: StrokeStyle(lineWidth: 0.5, dash: [4, 4])
    ) {
      VStack(spacing: 0) {
        // Movie Info
        VStack(spacing: 12) {
          Text("CINEMA")
            .font(.caption2)
            .fontWeight(.bold)
            .tracking(2)
            .foregroundStyle(.white.opacity(0.6))
          
          Text("The Great Adventure")
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
          
          HStack(spacing: 8) {
            Label("PG-13", systemImage: "info.circle")
            Text("•")
            Text("2h 15m")
          }
          .font(.caption)
          .foregroundStyle(.white.opacity(0.8))
        }
        .padding(.top, 30)
        
        Spacer()
        
        // Screening Details
        VStack(spacing: 12) {
          HStack {
            VStack(alignment: .leading, spacing: 4) {
              Text("SCREEN")
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.6))
              Text("5")
                .font(.title3)
                .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 4) {
              Text("SEAT")
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.6))
              Text("F-14")
                .font(.title3)
                .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
              Text("TIME")
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.6))
              Text("19:45")
                .font(.title3)
                .fontWeight(.bold)
            }
          }
          
          Text("November 15, 2025")
            .font(.caption)
            .foregroundStyle(.white.opacity(0.8))
        }
        .padding(.bottom, 30)
      }
      .foregroundStyle(.white)
      .padding(.horizontal, 24)
    }
    .frame(width: 280, height: 400)
  }
}

// MARK: - Train Ticket

/// Railway ticket design
struct TrainTicketExample: View {
  var body: some View {
    TicketShapeView(
      fillColor: .green.opacity(0.1),
      dashedLineColor: .green,
      cutoutYPosition: 0.65,
      cornerRadius: 12
    ) {
      VStack(spacing: 0) {
        // Route
        HStack(alignment: .bottom, spacing: 16) {
          VStack(alignment: .leading, spacing: 4) {
            Text("FROM")
              .font(.caption2)
              .foregroundStyle(.secondary)
            Text("Milano")
              .font(.title)
              .fontWeight(.bold)
            Text("Centrale")
              .font(.caption)
          }
          
          Image(systemName: "train.side.front.car")
            .font(.title3)
            .foregroundStyle(.green)
            .padding(.bottom, 8)
          
          VStack(alignment: .trailing, spacing: 4) {
            Text("TO")
              .font(.caption2)
              .foregroundStyle(.secondary)
            Text("Roma")
              .font(.title)
              .fontWeight(.bold)
            Text("Termini")
              .font(.caption)
          }
        }
        .padding(.top, 24)
        
        Spacer()
        
        // Details
        VStack(spacing: 12) {
          Divider()
            .background(.green.opacity(0.3))
          
          HStack {
            DetailColumn(label: "Train", value: "FR 9615")
            Spacer()
            DetailColumn(label: "Date", value: "15 Nov")
            Spacer()
            DetailColumn(label: "Depart", value: "14:20")
          }
          
          HStack {
            DetailColumn(label: "Class", value: "2nd")
            Spacer()
            DetailColumn(label: "Car", value: "7")
            Spacer()
            DetailColumn(label: "Seat", value: "45A")
          }
        }
        .padding(.bottom, 24)
      }
      .foregroundStyle(.green)
      .padding(.horizontal, 24)
    }
    .frame(width: 320, height: 420)
  }
}

// MARK: - Supporting Views

private struct DetailRow: View {
  let label: String
  let value: String
  
  var body: some View {
    HStack {
      Text(label)
        .font(.caption)
        .foregroundStyle(.secondary)
      Spacer()
      Text(value)
        .font(.subheadline)
        .fontWeight(.medium)
    }
  }
}

private struct InfoColumn: View {
  let title: String
  let value: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(title)
        .font(.caption2)
        .fontWeight(.semibold)
        .foregroundStyle(.secondary)
      Text(value)
        .font(.callout)
        .fontWeight(.semibold)
    }
  }
}

private struct DetailColumn: View {
  let label: String
  let value: String
  
  var body: some View {
    VStack(spacing: 4) {
      Text(label)
        .font(.caption2)
        .foregroundStyle(.secondary)
      Text(value)
        .font(.callout)
        .fontWeight(.semibold)
    }
  }
}

// MARK: - Preview Container

#if DEBUG
  struct ExamplesPreview: View {
    var body: some View {
      ScrollView {
        VStack(spacing: 30) {
          Group {
            Text("Basic Ticket")
              .font(.headline)
            BasicTicketExample()
            
            Text("Event Ticket")
              .font(.headline)
            EventTicketExample()
            
            Text("Boarding Pass")
              .font(.headline)
            BoardingPassExample()
          }
          
          Group {
            Text("Coupon")
              .font(.headline)
            CouponExample()
            
            Text("Movie Ticket")
              .font(.headline)
            MovieTicketExample()
            
            Text("Train Ticket")
              .font(.headline)
            TrainTicketExample()
          }
        }
        .padding()
      }
    }
  }

  #Preview {
    ExamplesPreview()
  }
#endif

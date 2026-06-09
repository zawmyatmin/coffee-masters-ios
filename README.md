# ☕ Coffee Masters — iOS

A native iOS coffee-ordering app built with **SwiftUI**. Browse a categorised menu, view product details, manage a cart, and place orders — all wrapped in a clean, tab-based interface.

## Features

- **Dynamic Menu** — Categories and products are fetched at launch from a remote JSON API and displayed in a grouped list.
- **Product Details** — Tap any item to see its image, description, and price. Adjust the quantity with a stepper before adding to your cart.
- **Shopping Cart** — Add, review, and remove items. The cart badge on the tab bar shows the current item count at a glance.
- **Order Placement** — Enter your name and phone number, review the total, and confirm your order with a single tap.
- **Offers** — A dedicated tab showcasing promotional deals (e.g., "Early Coffee" discounts, welcome gifts).
- **Info / WebView** — An embedded `WKWebView` loads supplementary content and injects the user's saved name for a personalised experience.
- **Data Persistence** — User details (name and phone) are persisted across sessions via `@AppStorage`.

## Tech Stack

| Layer | Technology |
|---|---|
| **UI Framework** | SwiftUI |
| **Networking** | [Alamofire](https://github.com/Alamofire/Alamofire) (via Swift Package Manager) |
| **Web Content** | WebKit / `WKWebView` |
| **State Management** | `@EnvironmentObject`, `@Published`, `ObservableObject` |
| **Persistence** | `@AppStorage` (UserDefaults) |
| **Language** | Swift 5 |
| **Min Deployment** | iOS 26.1 |

## Project Structure

```
CoffeeMasters/
├── CoffeeMastersApp.swift        # App entry point — injects MenuManager & CartManager
├── ContentView.swift             # Root TabView (Menu, Offers, Orders, Info)
├── Info.plist                    # Launch screen configuration
│
├── Model/
│   ├── Product.swift             # Product data model (Decodable)
│   ├── Category.swift            # Category grouping model
│   ├── MenuManager.swift         # Fetches menu data via Alamofire
│   └── CartManager.swift         # Cart state — add, remove, clear, total
│
├── PageViews/
│   ├── MenuPage.swift            # Categorised product list with navigation
│   ├── DetailsPage.swift         # Product detail view with quantity stepper
│   ├── OrdersPage.swift          # Cart summary, user details form, checkout
│   ├── OffersPage.swift          # Promotional offers display
│   └── InfoPage.swift            # Embedded WKWebView with JS bridge
│
├── Views/
│   ├── AppTitle.swift            # Reusable branded header with logo
│   ├── ProductItem.swift         # Product card (image + name + price)
│   ├── OrderItem.swift           # Cart line-item row with delete action
│   └── Offer.swift               # Offer card with patterned background
│
└── Assets.xcassets/              # App icons, colours, and image assets
```

## Getting Started

### Prerequisites

- **Xcode 16+**
- **iOS 26.1 SDK** (or later)
- An active internet connection (the menu is loaded from a remote API)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/zawmyatmin/coffee-masters-ios.git
   cd coffee-masters-ios
   ```

2. **Open in Xcode**
   ```bash
   open CoffeeMasters.xcodeproj
   ```

3. **Resolve packages** — Xcode will automatically fetch the Alamofire dependency via Swift Package Manager.

4. **Build & Run** — Select a simulator or connected device and press <kbd>⌘ R</kbd>.

## API

The app consumes a public API hosted on GitHub Pages:

| Endpoint | Description |
|---|---|
| `GET /api/menu.json` | Returns the full menu as an array of categories, each containing products |
| `/api/images/{filename}` | Serves product images |
| `/webapp` | Web content loaded in the Info tab |

Base URL: `https://firtman.github.io/coffeemasters`

## Architecture

The app follows a straightforward **MVVM-lite** pattern:

- **Models** — `Product` and `Category` are lightweight `Decodable` structs.
- **Managers (View Models)** — `MenuManager` handles data fetching; `CartManager` owns cart state. Both are `ObservableObject` classes injected into the view hierarchy via `.environmentObject()`.
- **Views** — SwiftUI views observe manager state reactively through `@EnvironmentObject`.

## License

This project is intended for educational purposes.

---

*Built with ❤️ and SwiftUI.*
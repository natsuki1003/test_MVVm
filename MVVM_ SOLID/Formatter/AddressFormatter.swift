// AddressFormatter.swift

// Protocol defining a common interface for formatting an address.
// Any type conforming to this protocol must implement the `format(_:)` method,
// which takes an `Address` object and returns a formatted string representation.
protocol AddressFormatter {
    func format(_ address: Address) -> String
}

// Formatter for Japanese-style addresses.
// This struct conforms to the AddressFormatter protocol, ensuring it implements the `format(_:)` method.
// It formats the address in the Japanese style: "Prefecture City District".
struct JapaneseAddressFormatter: AddressFormatter {
    func format(_ address: Address) -> String {
        // Returns the Japanese address as a single string with spaces separating components.
        return "\(address.ja.prefecture) \(address.ja.address1) \(address.ja.address2)"
    }
}

// Formatter for English-style addresses.
// This struct also conforms to the AddressFormatter protocol.
// It formats the address in the English style: "Prefecture, City, District".
struct EnglishAddressFormatter: AddressFormatter {
    func format(_ address: Address) -> String {
        // Returns the English address as a single string with commas separating components.
        return "\(address.en.prefecture), \(address.en.address1), \(address.en.address2)"
    }
}

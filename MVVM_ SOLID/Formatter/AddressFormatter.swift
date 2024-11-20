// AddressFormatter.swift
protocol AddressFormatter {
    func format(_ address: Address) -> String
}

struct JapaneseAddressFormatter: AddressFormatter {
    func format(_ address: Address) -> String {
        return "\(address.ja.prefecture) \(address.ja.address1) \(address.ja.address2)"
    }
}

struct EnglishAddressFormatter: AddressFormatter {
    func format(_ address: Address) -> String {
        return "\(address.en.prefecture), \(address.en.address1), \(address.en.address2)"
    }
}

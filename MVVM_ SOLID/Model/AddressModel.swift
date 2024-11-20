// AddressModel.swift
struct JPPostalCodeResponse: Codable {
    let postalCode: String
    let addresses: [Address]
}

struct Address: Codable {
    let en: EnglishAddress
    let ja: JapaneseAddress
}

struct EnglishAddress: Codable {
    let prefecture: String
    let address1: String
    let address2: String
    let address3: String
    let address4: String
}

struct JapaneseAddress: Codable {
    let prefecture: String
    let address1: String
    let address2: String
    let address3: String
    let address4: String
}

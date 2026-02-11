//
//  Models.swift
//  NEOViewer
//

import Foundation

struct NeoResponse: Codable, Sendable {
    let elementCount: Int
    let nearEarthObjects: [String: [NearEarthObject]]

    enum CodingKeys: String, CodingKey {
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }
}

struct NearEarthObject: Codable, Identifiable, Equatable, Sendable {
    let id: String
    let name: String
    let absoluteMagnitudeH: Double
    let isPotentiallyHazardous: Bool
    let closeApproachData: [CloseApproachData]

    enum CodingKeys: String, CodingKey {
        case id, name
        case absoluteMagnitudeH = "absolute_magnitude_h"
        case isPotentiallyHazardous = "is_potentially_hazardous_asteroid"
        case closeApproachData = "close_approach_data"
    }
}

struct CloseApproachData: Codable, Equatable, Sendable {
    let closeApproachDate: String
    let relativeVelocity: RelativeVelocity
    let missDistance: MissDistance

    enum CodingKeys: String, CodingKey {
        case closeApproachDate = "close_approach_date"
        case relativeVelocity = "relative_velocity"
        case missDistance = "miss_distance"
    }
}

struct RelativeVelocity: Codable, Equatable, Sendable {
    let kilometersPerHour: String
    enum CodingKeys: String, CodingKey { case kilometersPerHour = "kilometers_per_hour" }
}

struct MissDistance: Codable, Equatable, Sendable {
    let kilometers: String
}

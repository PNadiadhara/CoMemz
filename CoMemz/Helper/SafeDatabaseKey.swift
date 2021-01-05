//
//  SafeDatabaseKey.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/4/21.
//

import Foundation

extension String {
     func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}

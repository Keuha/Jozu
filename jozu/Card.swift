//
//  Card.swift
//  jozu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import Foundation
import SwiftUI

public protocol Card : View {
    var content: String { set get }
}

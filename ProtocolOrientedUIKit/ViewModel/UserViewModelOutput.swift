//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Muhammet Kadir on 26.03.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject {
    func updateView(name: String, email: String, userName: String)
}

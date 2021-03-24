//
//  AuthenConstants.swift
//  FacilityManagementApp iOS
//
//  Created by King Bileygr on 3/21/21.
//

import Foundation
struct AuthenConstants {
    static let authorityError = "There was an error getting the authority URL...Try again"
    static let initError = "There was an error creating MSAL Public client"
    static let userAccountError = "There was an error getting the user account"
    static let silentTokenError = "There was an error getting the token silently"
    static let interactiveTokenError = "There was an error getting the token interactively"
    static let signOutError = "There was an error signing you out"
    static let interactiveTokenSuccess = "The token was successfully gotten interactively"
    static let silentTokenSuccess = "The token was successfully gotten silently"
    static let authoritySuccess = "The authority URL exists"
    static let silentToken = "Account yet to be inputed in cache"
}

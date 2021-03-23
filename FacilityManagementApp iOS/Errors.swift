//
//  Errors.swift
//  FacilityManagementApp iOS
//
//  Created by King Bileygr on 3/23/21.
//

import Foundation

enum AuthenticationErrors: LocalizedError {
    case initializationFailed
    case msAuthFailed
    case tokenError
    case getSilentTokenFailed
    case getInteractiveTokenFailed
    case signOutFailed
    
    var errorDescription: String? {
        switch self {
        case .initializationFailed:
            return AuthenConstants.initError
        case .msAuthFailed:
            return AuthenConstants.authorityError
        case .tokenError:
            return AuthenConstants.userAccountError
        case .getSilentTokenFailed:
            return AuthenConstants.silentTokenError
        case .getInteractiveTokenFailed:
            return AuthenConstants.interactiveTokenError
        case .signOutFailed:
            return AuthenConstants.signOutError
        }
    }
}

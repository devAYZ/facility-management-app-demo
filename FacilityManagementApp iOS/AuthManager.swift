//
//  AuthManager.swift
//  FacilityManagementApp iOS
//
//  Created by King Bileygr on 3/21/21.
//

import Foundation
import MSAL
import MSGraphClientSDK

class AuthManager: NSObject, MSAuthenticationProvider {
    
    static let shared = AuthManager()
    
    private var publicClient: MSALPublicClientApplication? = MSALPublicClientApplication()
    private let appId: String
    private let appAuthorityString: String
    private let redirectURI: String
    private let graphScopes: [String]
    
    private override init() {
        
        let bundle = Bundle.main
        let authConfigPath = bundle.path(forResource: "AuthenticationSettings", ofType: "plist")!
        let authConfig = NSDictionary(contentsOfFile: authConfigPath)!
        
        self.appId = authConfig["AppId"] as! String
        self.appAuthorityString = authConfig["AppAuthority"] as! String
        self.redirectURI = authConfig["RedirectURI"] as! String
        self.graphScopes = authConfig["GraphScopes"] as! [String]
        
        debugPrint("App ID: \(appId)")
        debugPrint("App redirectURI: \(redirectURI)")
        
        do {
            guard let authorityURL = URL(string: appAuthorityString) else {
                debugPrint(AuthenticationErrors.msAuthFailed)
                return
            }
            debugPrint("\(AuthenConstants.authoritySuccess): \(authorityURL)")
            
            let b2cAuthority = try MSALB2CAuthority(url: authorityURL)
            
            // Create MSALPublicClientApplication configuration
            let b2cApplicationConfig = MSALPublicClientApplicationConfig(clientId: self.appId, redirectUri: self.redirectURI, authority: b2cAuthority)
            self.publicClient = try MSALPublicClientApplication.init(configuration: b2cApplicationConfig)
        } catch {
            print("\(AuthenticationErrors.initializationFailed): \(error)")
            self.publicClient = nil
        }
    }
    
    func getAccessToken(for authProviderOptions: MSAuthenticationProviderOptions!, andCompletion completion: ((String?, Error?) -> Void)!) {
        getTokenSilently(completion: completion)
    }
    
    public func getTokenSilently(completion: @escaping(_ accessToken: String?, Error?) -> Void) {
        var userAccount: MSALAccount?
        do {
            userAccount = try publicClient?.allAccounts().first
        } catch {
            print(" \(AuthenticationErrors.tokenError): \(error)")
        }
        
        if userAccount != nil {
            let silentParameters = MSALSilentTokenParameters(scopes: self.graphScopes, account: userAccount!)
            publicClient?.acquireTokenSilent(with: silentParameters, completionBlock: { (result: MSALResult?, error: Error?) in
                guard let tokenResult = result, error == nil else {
                    print("\(AuthenticationErrors.getSilentTokenFailed): \(String(describing: error))")
                    completion(nil, error)
                    return
                }
                print("\(AuthenConstants.silentTokenSuccess): \(tokenResult.accessToken)")
                completion(tokenResult.accessToken, nil)
            })
        } else {
            print(AuthenConstants.silentToken)
            completion(nil, NSError(domain: "AuthenticationManager", code: MSALError.interactionRequired.rawValue, userInfo: nil))
        }
    }
    
    public func getTokenInteractively(parentView: UIViewController, completion: @escaping (_ accessToken: String?, Error?) -> Void) {
        let webParameters = MSALWebviewParameters(authPresentationViewController: parentView)
        let interactiveParameters = MSALInteractiveTokenParameters(scopes: self.graphScopes, webviewParameters: webParameters)
        interactiveParameters.promptType = MSALPromptType.selectAccount
        
        publicClient?.acquireToken(with: interactiveParameters, completionBlock: {(result: MSALResult?, error: Error?) in
            guard let tokenResult = result, error == nil else {
                print("\(AuthenticationErrors.getInteractiveTokenFailed): \(String(describing: error))")
                completion(nil, error)
                return
            }
            print("\(AuthenConstants.interactiveTokenSuccess): \(tokenResult.accessToken)")
            completion(tokenResult.accessToken, nil)
            
        })
    }
    
    public func signOut() {
        do {
            let accounts = try publicClient?.allAccounts()
            try accounts?.forEach({(account: MSALAccount) in
                try publicClient?.remove(account)
            })
            
        } catch {
            print("\(AuthenticationErrors.signOutFailed): \(String(describing: error))")
        }
    }
    
}

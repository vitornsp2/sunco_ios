//
// SunshineConversationsWrapper.swift
// Sunshine Conversations Sample App
//
// Created by Zendesk on 26/10/2021.
//
// Copyright © 2021 Zendesk. All rights reserved.
//
// By downloading or using the Zendesk Mobile SDK, You agree to the Zendesk Master
// Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement
// and Application Developer and API License
//
// Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
// acknowledge that such terms govern Your use of and access to the Mobile SDK.


import Foundation
import Smooch

final class SunshineConversationsWrapper {
    
    static let shared = SunshineConversationsWrapper()
    
    deinit {
        Smooch.destroy()
    }
    
    func initialize(_ completion: @escaping (Error?, [AnyHashable: Any]?) -> Void) {
#warning("Please enter your integrationId below.")
        let settings = SKTSettings(integrationId: "62843b2400169400f58d192b")
        
#warning("Customize your SDK settings below.")
        settings.conversationAccentColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        // Setup the authentication delegate.
        let authenticationDelegate = AuthenticationDelegate()
        settings.authenticationDelegate = authenticationDelegate
        
        // Setup the conversation delegate.
        let delegate = ConversationDelegate()
        Smooch.update(delegate)
        
        Smooch.initWith(settings, completionHandler: completion)
    }
    
    func conversationViewController() -> UIViewController? {
        Smooch.newConversationViewController()
    }
    
    func conversationListViewController() -> UIViewController? {
        Smooch.newConversationListViewController()
    }
    
    func logout(){
        Smooch.logout() { error, userInfo in
                if let error = error {
                   print("❌ failed to logout: \(error.localizedDescription)")
               }
            
               //Smooch.destroy()
            
                print("☀️ User was successfuly logged out.")
            
               return
       }
    }
    
    func login(){
        
        print("🟠 \(#function)")

        let externalId = "73222178100"
        
        let jwtUser = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6ImFwcF82MDY0ODYxY2YzMjk5NjAwZDNjNzVlZTgifQ.eyJzY29wZSI6ImFwcFVzZXIiLCJ1c2VySWQiOiI3MzIyMjE3ODEwMCJ9.-1M48TnNdlhNJYjUhFtEVy3ad_ZPmUIT9iKvVUMApiE"
        
        
        Smooch.login(externalId, jwt: jwtUser) { error, userInfo in
            
            if let error = error {
                print("❌ User \(externalId) failed to login: \(error.localizedDescription), \(String(describing: userInfo?.description))")
                
                return
            }
            print("☀️ User \(externalId) was successfuly logged in.")
        }
    }
}

//
//  Conversation.swift
//  WorkExperience
//
//  Created by Rahala, Jasamrit (Coll) on 04/11/2021.
//

import Foundation

class Conversation{
    var owner: User
    var recipient: [User]
    
    init(owner: User, recipient: [User]){
        self.owner = owner
        self.recipient = recipient
    }
}


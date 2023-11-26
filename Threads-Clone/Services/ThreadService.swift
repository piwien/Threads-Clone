//
//  ThreadService.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 23.11.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    
    static func uploadThread(thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerUid", isEqualTo: uid).getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
    
    static func likeThread(threadID: String, increment: Bool) async throws -> Int {
            let threadRef = Firestore.firestore().collection("threads").document(threadID)
            
            return try await Firestore.firestore().runTransaction({ (transaction, errorPointer) -> Any? in
                let threadDocument: DocumentSnapshot
                do {
                    try threadDocument = transaction.getDocument(threadRef)
                } catch let fetchError as NSError {
                    errorPointer?.pointee = fetchError
                    return nil
                }
                
                guard let oldLikes = threadDocument.data()?["likes"] as? Int else {
                    errorPointer?.pointee = NSError(domain: "AppErrorDomain", code: -1, userInfo: ["Error": "Unable to retrieve likes"])
                    return nil
                }
                
                let newLikes = increment ? oldLikes + 1 : oldLikes - 1
                transaction.updateData(["likes": newLikes], forDocument: threadRef)
                
                return newLikes
            }) as! Int
        }
    
}

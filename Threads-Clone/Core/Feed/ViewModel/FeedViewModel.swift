//
//  FeedViewModel.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 25.11.2023.
//

import Foundation
import Firebase

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    @Published var likeupdate: Int = 0
    
    init() {
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
    
    func plusLike(thread: Thread) async throws {
            do {
                let newLikes = try await ThreadService.likeThread(threadID: thread.id, increment: true)
                print("Transaction succeeded. New likes: \(newLikes)")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    
    func minusLike(thread: Thread) async throws {
            do {
                let newLikes = try await ThreadService.likeThread(threadID: thread.id, increment: false)
                print("Transaction succeeded. New likes: \(newLikes)")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    
//    func plusLike(thread: Thread) async throws {
//        let threadID = thread.id
//        
//        // Artışı gerçekleştirmek için transaction kullanılır
//        let threadRef = Firestore.firestore().collection("threads").document(threadID)
//        
//        Firestore.firestore().runTransaction({ (transaction, errorPointer) -> Any? in
//            let threadDocument: DocumentSnapshot
//            do {
//                try threadDocument = transaction.getDocument(threadRef)
//            } catch let fetchError as NSError {
//                errorPointer?.pointee = fetchError
//                return nil
//            }
//            
//            guard let oldLikes = threadDocument.data()?["likes"] as? Int else {
//                errorPointer?.pointee = NSError(domain: "AppErrorDomain", code: -1, userInfo: ["Error": "Unable to retrieve likes"])
//                return nil
//            }
//            
//            let newLikes = oldLikes + 1
//            transaction.updateData(["likes": newLikes], forDocument: threadRef)
//            
//            return newLikes
//        }) { (object, error) in
//            if let error = error {
//                print("Transaction failed: \(error)")
//            } else if let newLikes = object as? Int {
//                print("Transaction succeeded. New likes: \(newLikes)")
//            }
//        }
//    }
    
//    func minusLike(thread: Thread) async throws {
//        let threadID = thread.id
//        
//        let threadRef = Firestore.firestore().collection("threads").document(threadID)
//        
//        Firestore.firestore().runTransaction({ (transaction, errorPointer) -> Any? in
//            let threadDocument: DocumentSnapshot
//            do {
//                try threadDocument = transaction.getDocument(threadRef)
//            } catch let fetchError as NSError {
//                errorPointer?.pointee = fetchError
//                return nil
//            }
//            
//            guard let oldLikes = threadDocument.data()?["likes"] as? Int else {
//                errorPointer?.pointee = NSError(domain: "AppErrorDomain", code: -1, userInfo: ["Error": "Unable to retrieve likes"])
//                return nil
//            }
//            
//            let newLikes = oldLikes - 1
//            transaction.updateData(["likes": newLikes], forDocument: threadRef)
//            
//            return newLikes
//        }) { (object, error) in
//            if let error = error {
//                print("Transaction failed: \(error)")
//            } else if let newLikes = object as? Int {
//                print("Transaction succeeded. New likes: \(newLikes)")
//            }
//        }
//    }
}

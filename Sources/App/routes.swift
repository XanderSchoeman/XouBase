import Vapor
import Fluent
/// Register your application's routes here.
public func routes(_ router: Router) throws {

    router.get("users") { req -> Future<[User]> in
        return User.query(on: req).all()
    }
    
    router.get { req -> Future<View> in
        return User.query(on: req).all().flatMap(to: View.self) { users in
            let context = ["users": users]
            return try req.view().render("home", context)
        }
    }
    
    router.post("send") { req -> Future<User> in
        let username: String = try req.content.syncGet(at: "username")
        let password: String = try req.content.syncGet(at: "password")
        let profileImage: String = try req.content.syncGet(at: "profileImage")
        let fullName: String = try req.content.syncGet(at: "fullName")
        let email: String = try req.content.syncGet(at: "email")
        let gender: String = try req.content.syncGet(at: "gender")
        let age: Int = try req.content.syncGet(at: "age")
        let favouriteCount: Int = try req.content.syncGet(at: "favouriteCount")
        let genrePref: String = try req.content.syncGet(at: "genrePref")
        let userObj = User(id: nil, username: username, password: password, profileImage: profileImage, fullName: fullName, email: email, gender: gender, age: age, favouriteCount: favouriteCount, genrePref: genrePref)
        return userObj.save(on: req)
    }
    
        router.post("authenticate") { req -> Future<[User]> in
        let username: String = try req.content.syncGet(at: "username")
        let password: String = try req.content.syncGet(at: "password")
        let something = User.query(on: req).filter(\User.username == username).filter(\User.password == password).all()
            return something
    }

}



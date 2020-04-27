import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
        router.get("userList") { request in
            return """
    [
      {
        "id": 1,
        "username": "Xander",
        "password": "1234",
        "profileImage": "https://www.seekpng.com/png/detail/506-5061704_cool-profile-avatar-picture-cool-picture-for-profile.png",
        "fullName": "Xander Schoeman",
        "email": "xander@gmail.com",
        "gender": "male",
        "age": 21,
        "favouriteCount": 0,
        "genrePref": "fantasy"
      },
       {
         "id": 2,
         "username": "Akshar",
         "password": "2341",
         "profileImage": "https://3dandroidwallpaper.com/wp-content/uploads/2019/03/Android-Wallpaper-HD-Pokemon.jpg",
         "fullName": "Akshar The Man",
         "email": "akshar@gmail.com",
         "gender": "male",
         "age": 21,
         "favouriteCount": 0,
         "genrePref": "action"
       }
    ]
    """
        }
//
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
        //let msg = Message(id: nil, username: username, password: password)
        let userObj = User(id: nil, username: username, password: password, profileImage: profileImage, fullName: fullName, email: email, gender: gender, age: age, favouriteCount: favouriteCount, genrePref: genrePref)
        return userObj.save(on: req)
    }
    
//        router.post("authenticate") { req -> Future<User> in
//        let username: String = try req.content.syncGet(at: "username")
//        let password: String = try req.content.syncGet(at: "password")
//            
//         let someUser = User.query(on: req).all()
//                
//                for item in someUser {
//                    if (item.username == username && item.password == password) {
//                        return item
//                    }
//                }
//            }
//        return User()
//    }
    
    
    
    
// Still trying to get the database working correctly
//------------------------------------------------------------------
//    router.get { req -> Future<View> in
//        return ProfileData.query(on: req).all().flatMap(to: View.self) {
//            profiles in
//            return try req.view().render("home",["profiles":profiles])
//            }
//        }
//
//    router.post(ProfileData.self, at: "add") { req, profile -> Future<Response> in
//        return profile.save(on: req).map(to: Response.self) { profile in
//            return req.redirect(to: "/")
//        }
//    }
//
//    router.get("profileInfo") { req -> Future<[ProfileData]> in
//        return ProfileData.query(on: req).all()
//    }
//
//
//
//            router.get { req -> Future<View> in
//                let xanderProfile = ProfileData(id: 1, username: "Xman1998", password: "notSoHidden", profileImage:"https://www.seekpng.com/png/detail/506-5061704_cool-profile-avatar-picture-cool-picture-for-profile.png")
//                let aksharProfile = ProfileData(id: 2, username: "Ak-47", password: "notSoHiddenEither", profileImage:"https://www.seekpng.com/png/detail/506-5061704_cool-profile-avatar-picture-cool-picture-for-profile.png")
//
//                return try req.view().render("home",["profiles":[xanderProfile, aksharProfile]])
//            }
    
    
//------------------------------------------------------------------
    
//    router.get { req in
//        return "Hello user, please consider going to /api/'EnterID'/'EnterUserName'/'EnterPassword'/'EnterProfileImageUrl'"
//    }
//        router.get("profile", String.parameter) { req -> String in
//        let name = try req.parameters.next(String.self)
//
//        return "Welcome, \(name)!"
//    }
//    router.get("profileInfo") { req -> String in
//            let xanderProfile = ProfileData(id: 1, username: "Xman1998", password: "notSoHidden", profileImage:"https://www.seekpng.com/png/detail/506-5061704_cool-profile-avatar-picture-cool-picture-for-profile.png")
//        return "\(xanderProfile)"
//    }
//    router.post(ProfileData.self, at: "profileInfo") { req, data -> ProfileResponse in
//
//        return ProfileResponse(request: data)
//    }
//
//    router.get("api", "id", String.parameter, "username", String.parameter, "password", String.parameter, "profileImage", String.parameter) { req -> String in
//      let id = try req.parameters.next(String.self)
//      let username = try req.parameters.next(String.self)
//      let password = try req.parameters.next(String.self)
//      let profileImage = try req.parameters.next(String.self)
//      return "Your profile information is: \n ID:\(id)\n Username:\(username)\n Password:\(password)\n Profile Image:\(profileImage)"
//    }
//
//    router.post(ProfileData.self, at: "api/name") { req, data -> String in
//        return "Hello \(data.username) \(data.profileImage ?? "")"
//    }
    
}



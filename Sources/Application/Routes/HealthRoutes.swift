import LoggerAPI
import Health
import KituraContracts
import Base32Crockford

public struct Identifier : Codable {
  public let identifier : String
  public let dataType : IdentifierDataType
}

func initializeRoutes(app: App) {
    
  
  app.router.post("/identifier"){ (dataType: IdentifierDataType, respondWith: (Identifier?, RequestError?) -> Void) in
    
    let dataType = dataType ?? .default
    let string = Base32CrockfordEncoding.encoding.generateIdentifier(from: dataType)
    respondWith(Identifier(identifier: string, dataType: dataType), nil)
  }
  
}

extension IdentifierDataType : QueryParams {
  
}

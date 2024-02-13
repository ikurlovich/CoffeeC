public enum Errors: Int, Error {
    case noDataRecieved
    
    case OK //200
    
    case UnprocessableEntity //422
    
    case TooManyRequests //429
    
    case unknownError = 228
    
    case Success //204; Success
    
    case TooManyBackupsException //400; Cannot create a new backup, this server has reached its limit of 3 backups
    
    case BadRequest //400; This status code describes an error caused by an invalid request
    
    case Unauthorized //401; Indicates that the client request has not been completed because it lacks valid authentication credentials for the requested resource
    
    case Conflict //409; Indicates a request conflict with the current state of the target resource=
    
    case BadGateway //502; An error was encountered while processing this request
}

module SimpleJson where

data JValue = 
    JNull
    | JString String
    | JNumber Double
    | JBool   Bool
    | JObject [(String, JValue)]
    | JArray  [JValue]
    deriving (Eq, Ord, Show)



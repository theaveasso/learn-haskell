module SimpleJson where

data JValue = 
    JNull
    | JString String
    | JNumber Double
    | JBool   Bool
    | JObject [(String, JValue)]
    | JArray  [JValue]
    deriving (Eq, Ord, Show)

getStr :: JValue -> Maybe String
getStr (JString str) = Just str
getStr _             = Nothing

getInt :: JValue -> Maybe Int
getInt (JNumber n) = Just (truncate n)
getInt _           = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JNumber n) = Just n
getDouble _           = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b) = Just b 
getBool _         = Nothing

getObj :: JValue -> Maybe [(String, JValue)]
getObj (JObject o) = Just o
getObj _           = Nothing

getArr :: JValue -> Maybe [JValue]
getArr (JArray arr) = Just arr
getArr _            = Nothing

isNull :: JValue -> Bool
isNull JNull = True
isNull _     = False

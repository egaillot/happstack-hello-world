module HappstackHelloWorld
where
import Happstack.Server
import HelloApp

main = simpleHTTP nullConf myApp

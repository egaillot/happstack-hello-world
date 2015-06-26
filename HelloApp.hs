module HelloApp
where
import qualified Text.Blaze.Html5 as H
import Control.Monad (msum)
import Happstack.Server

myApp :: ServerPart Response
myApp = msum [
    dir "u" greetUser,
    defaultGreetPage
  ]

template title body = toResponse $
  H.html $ do
    H.head $ do
      H.title (H.toHtml title)
    H.body $ do
      (H.toHtml body)

greetPage userName = ok $ template "Home" ("Salut " ++ userName ++ "!")

greetUser = 
  path (\userName -> greetPage userName)

defaultGreetPage = greetPage "anonim"

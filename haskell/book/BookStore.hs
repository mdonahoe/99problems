-- bookstore!
data BookInfo = Book { id :: Int, title :: String, authors :: [String] }
                deriving (Show)

--data MovieInfo = Mag { id :: Int, title :: String, actors :: [String] }
--                deriving (Show)
-- i wish "title" could work for both types!
data List a = Cons { myHead :: a, myTail :: (List a)}
            | Nil
              deriving (Show)

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

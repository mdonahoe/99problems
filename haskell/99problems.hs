-- 1
-- Find the last element of a list
myLast :: [a] -> a
--myLast [] = error "you suck"
myLast (x:[]) = x
myLast (x:xs) = myLast xs

-- 2
-- Find the second-to-last element of a list
myButLast :: [a] -> a
myButLast (a:[b]) = a
myButLast (_:xs) = myButLast xs

-- 3
-- find the K'th element of a list
elementAt :: [a] -> Int -> a
elementAt xs 1 = head xs
elementAt xs n = elementAt (tail xs) (n - 1)


-- 4
-- find the number of elements in a list
myLength :: [a] -> Int
myLength [] = 0
myLength (x:[]) = 1
myLength xs = 1 + (myLength $ tail xs)

-- 5
-- reverse a list
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:[]) = [x]
myReverse (x:xs) = (myReverse xs) ++ [x]
-- apparently this is inefficient to to re-consing the list... ?

-- 6
-- detect palindromes
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs) = (x == last xs) && isPalindrome (init xs)
-- (should have just compared the reverse!)

-- 7
-- flatten a nested list
-- *skipped*

-- 8
-- Eliminate consecutive duplicates of list elements
compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:list) = compress' list x [x]
    where
        compress' [] prev compressed = compressed
        compress' (x:xs) prev compressed =
            if x == prev
            then compress' xs prev compressed
            else compress' xs x (compressed ++ [x])

-- 9
-- pack duplicated consecutives into sublists
pack :: Eq a => [a] -> [[a]]
pack [] = [[]]
pack [x] = [[x]]
pack (x:xs) = pack' [] [x] xs
    where
        pack' packed group [] = packed ++ [group]
        pack' packed group list =
            if head group == head list
            then pack' packed (group ++ [head list]) (tail list)
            else pack' (packed ++ [group]) [head list] (tail list)

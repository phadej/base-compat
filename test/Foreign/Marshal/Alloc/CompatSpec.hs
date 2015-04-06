module Foreign.Marshal.Alloc.CompatSpec (main, spec) where

import           Test.Hspec

import           Control.Exception.Compat
import           Foreign.Marshal.Alloc.Compat
import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable.Compat

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "calloc" $
    it "allocates memory with bytes of value zero" $ do
      bracket calloc free $ \ptr -> do
        peek ptr `shouldReturn` (0 :: Int)

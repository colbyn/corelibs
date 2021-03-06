{-# LANGUAGE NoImplicitPrelude #-}
module Core.Utils (
    todo
  , logicError
  , triple
  , ifTrue
) where


-- ~
import Core
import Core.Control.Flow ((|>), (<|))
import Core.List.Util    (flatten)
import Data.Monoid ((<>), Monoid)
import Prelude
    ( return
    , String
    , IO
    , show
    , error
    , (<$>)
    , (>>=)
    , (>>)
    , fromIntegral
    , Bool(..)
    )

import qualified Prelude as Pre

import qualified Control.Monad              as M
import qualified Control.Monad.State        as M
import qualified Control.Monad.Except       as M
import qualified Control.Monad.RWS          as M
import qualified Control.Monad.Identity     as M
import qualified Control.Monad.Reader       as M
import qualified Control.Monad.Writer       as M
import qualified Control.Monad.Trans        as M

import qualified Data.List                    as List
import qualified Data.Text                    as Text
import qualified Data.Text.IO                 as TIO
import qualified Data.Map                     as Map
import qualified Data.Set                     as Set
import qualified Data.Foldable                as Fold
import qualified Data.Monoid                  as Monoid
import qualified Data.Maybe                   as Maybe
import qualified Data.Either                  as Either
import qualified Data.Char                    as Char
import qualified Data.Word                    as Word
import qualified Data.STRef                   as ST
import qualified Data.Bits                    as Bit
import qualified Data.Fixed                   as Fixed
import qualified Data.Vector.Unboxed          as V
import qualified Data.Vector.Unboxed.Mutable  as MV
import qualified Data.Vector.Generic          as VG
import qualified Data.IORef                   as IORef
import qualified Data.ByteString              as BS
import qualified Data.String                  as String

-- + C FFI
import qualified Foreign.C.Types as C

-- + OS APIS & Related
import qualified Path
import qualified System.Directory      as SD
import qualified System.FilePath.Posix as FP
import qualified System.Posix.Time     as Time

-- + Concurrency & Related
import qualified Control.Concurrent       as CC
import qualified Control.Concurrent.Async as Async


-- + Local
-- ~

todo :: a
todo = error "Not yet implemented, this is a stub (use only for development)."

logicError :: String -> a
logicError msg =
    error $ String.unlines
        [ "fatal logic error:"
        , msg
        ]



triple :: a -> b -> c -> (a, b, c)
triple x y z = (x, y, z)


ifTrue f True = do
    f
    return ()
    
ifTrue f False = return ()




{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_parsing1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/ryanchladek/Library/Haskell/bin"
libdir     = "/Users/ryanchladek/Library/Haskell/ghc-8.6.3-x86_64/lib/parsing1-0.1.0.0"
dynlibdir  = "/Users/ryanchladek/Library/Haskell/ghc-8.6.3-x86_64/lib/x86_64-osx-ghc-8.6.3"
datadir    = "/Users/ryanchladek/Library/Haskell/share/ghc-8.6.3-x86_64/parsing1-0.1.0.0"
libexecdir = "/Users/ryanchladek/Library/Haskell/libexec/x86_64-osx-ghc-8.6.3/parsing1-0.1.0.0"
sysconfdir = "/Users/ryanchladek/Library/Haskell/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "parsing1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "parsing1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "parsing1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "parsing1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "parsing1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "parsing1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

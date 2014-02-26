{-# LANGUAGE OverloadedStrings #-}
import Development.NSIS
-- import Text.Printf(printf)

-- main1 :: IO ()
-- main1 = do
--    putStrLn "hello1"
--    -- _ <- printf "%03d\n" (127::Int)
--    putStrLn "hello2"

main :: IO ()
main = writeFile "mdm.nsi" $ nsis $ do
    name "MDMName"                   -- The name of the installer
    outFile "mdm.exe"                -- Where to produce the installer

    --"$DESKTOP/Example1"
    installDir "$PROGRAMFILES/MDM"   -- The default installation directory
    requestExecutionLevel User       -- Request application privileges for Windows Vista

    -- Pages to display
    page Directory                   -- Pick where to install
    page InstFiles                   -- Give a progress bar while installing

    -- The stuff to install
    section "MDM (required)" [Required] $ do
        -- Set output path to the installation directory.
	setOutPath "$INSTDIR"        -- Where to install files in this section

        -- Put file there
        file [] "readme.txt"

	-- Write Uninstaller
        writeUninstaller "uninstall.exe"

    -- Uninstaller
    uninstall $ do
        -- Remove files and uninstaller
        delete [] "$INSTDIR/readme.txt"
        delete [] "$INSTDIR/uninstall.exe"
        -- Remove directories used
        rmdir [] "$INSTDIR"

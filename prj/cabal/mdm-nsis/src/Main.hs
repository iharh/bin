{-# LANGUAGE OverloadedStrings #-}
-- {-# OPTIONS_GHC -fno-warn-unused-do-bind #-}
-- {-# OPTIONS_GHC -fno-warn-wrong-do-bind #-}

import Development.NSIS
-- import Text.Printf(printf)

-- main1 :: IO ()
-- main1 = do
--    putStrLn "hello1"
--    -- _ <- printf "%03d\n" (127::Int)
--    putStrLn "hello2"

main :: IO ()
main = writeFile "mdm.nsi" $ nsis $ do
    _ <- constant "MANUFACT" ("Clarabridge"::Exp String)
    _ <- constant "PRODUCTNAME" ("$MANUFACT CMP"::Exp String)
    mdmName <- constant "MDMNAME" ("MADAMIRA"::Exp String)
    _ <- constant "MDM" ("mdm"::Exp String)

    name mdmName                      -- The name of the installer
    outFile "$MDM.exe"                -- Where to produce the installer

    --"$DESKTOP/Example1"            -- TODO: use readRegStr in the future
    -- [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Clarabridge CMP] "UninstallString"="D:\\clb\\inst\\uninst.exe"
    installDir "$PROGRAMFILES64\\$MANUFACT\\$PRODUCTNAME" -- The default installation directory

    -- Registry key to check for directory (so if you install again, it will overwrite the old one automatically)
    --installDirRegKey HKLM "Software/NSIS_Example2" "Install_Dir"

    requestExecutionLevel Admin      -- Request application privileges for Windows Vista

    -- Pages to display
    page Directory                   -- Pick where to install
    page InstFiles                   -- Give a progress bar while installing

    -- The stuff to install
    section mdmName [Required] $ do
        -- Set output path to the installation directory.
	setOutPath "$INSTDIR"        -- Where to install files in this section

        -- Put file there
        file [] "readme.txt"

        -- Write the uninstall keys
        writeRegStr SHCTX "Software/Microsoft/Windows/CurrentVersion/Uninstall/$MDMNAME" "DisplayName"     "$MDMNAME Analyzer"
        writeRegStr SHCTX "Software/Microsoft/Windows/CurrentVersion/Uninstall/$MDMNAME" "UninstallString" "\"$INSTDIR/uninstall_$MDM.exe\""

	-- Write Uninstaller
        writeUninstaller "uninstall_$MDM.exe"

    -- Uninstaller
    uninstall $ do
        -- Remove files and uninstaller
        delete [] "$INSTDIR/readme.txt"
        delete [] "$INSTDIR/uninstall_$MDM.exe"
        -- Remove directories used
        -- rmdir [] "$INSTDIR"

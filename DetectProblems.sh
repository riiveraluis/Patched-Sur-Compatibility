#!/bin/bash

#  DetectProblems.sh
#  Patched Sur Compatbilty Resources
#
#  Created by Benjamin Sova on 1/18/20.
#
#  This script is run by Patched Sur and
#  is downloaded everytime the pre-install
#  app makes it to the Verifing Mac screen

# Check if this is running alongside Patched Sur
if [[ -d "/Volumes/Patched-Sur" ]]
then
    WITHPATCHER=1
fi

# Define custom print function so that we only
# print if we are not running with Patchd Sur.
function print() {
    if [[ "$WITHPATCHER" != "1" ]]
    then
        echo $@
    fi
}

print "Hello Patched Sur user!"
print "This script is designed to check for"
print "all problems that could happen with a"
print "Patched Sur installation."
print

print "Please note, this will not detect everything"
print "but rather a number of problems it has been"
print "trained to detect. This script is run by"
print "Patched Sur while the verifing this Mac"
print "screen is being shown."
print

print "Starting detections..."

print "Checking for FileVault..."
if [[ "$(fdesetup status)" = "FileVault is On." ]]
then
    FILEVAULT="Fatal;FileVault is Enabled;FileVault prevents use of recovery mode, resulting in a always incorrect password when trying to unlock recovery. You must disable FileVault before continuing."
    FVHUMAN="Fatal: FileVault is Enabled. FileVault prevents use of recovery mode, resulting in a always incorrect password when trying to unlock recovery.You must disable FileVault before continuing."
fi

print "Checking for dosdude1 patches..."
if [[ -d "/Applications/Utilities/Patch Updater.app" ]]
then
    DOSDUDE="Warning;Dosdude1 patches detected;Dosdude1's patches can cause stablity problems with the patcher. While you still can install macOS Big Sur, there may be extra problems that come."
    DDHUMAN="Warning: Dosdude1 patches detected. Dosdude1's patches can cause stablity problems with the patcher. While you still can install macOS Big Sur, there may be extra problems that come."
fi

print "Detecting Mac Model Specific Problems..."
MACMODEL="$(sysctl -n hw.model)"

MACMODEL="MacPro3,1"

print "(Mac Model: $MACMODEL)"

case $MACMODEL in
    iMac14,4|iMac1[5-9],?|iMac[2-9][0-9],?|iMacPro*|MacPro[6-9],?|Macmini[7-9],?|MacBook[89],1|MacBook[1-9][0-9],?|MacBookAir[6-9],?|MacBookAir[1-9][0-9],?|MacBookPro1[1-9],?)
        SUPPORTED="Warning;This Mac Supports Big Sur;This patcher is designed for running macOS Big Sur on unsupported Macs. Your Mac is supported. Find your way to the software update tab in System Preferences to update."
        SPHUMAN="Warning: This Mac Supports Big Sur. This patcher is designed for running macOS Big Sur on unsupported Macs. Your Mac is supported. Find your way to the software update tab in System Preferences to update."
        ;;
    MacPro3,1)
        MACPRO="Fatal;Mac Pros have a better patcher;Mac Pros have many differences in how they should be patcher for macOS Big Sur. This patcher cannot handle everything StarPlayrX's BigMac patcher is suggested for this model."
        MPHUMAN="Fatal: Mac Pros have a better patcher. Mac Pros have many differences in how they should be patcher for macOS Big Sur. This patcher cannot handle everything StarPlayrX's BigMac patcher is suggested for this model."
        ;;
    MacPro[45],1)
        MACPRO="Warning;Mac Pros have a better patcher;Mac Pros have many differences in how they should be patcher for macOS Big Sur. This patcher cannot handle everything StarPlayrX's BigMac patcher is suggested for this model."
        MPHUMAN="Warning: Mac Pros have a better patcher. Mac Pros have many differences in how they should be patcher for macOS Big Sur. This patcher cannot handle everything StarPlayrX's BigMac patcher is suggested for this model."
        ;;
    MacBook[23],1|Macmini2,1|MacPro[12],1|MacBookAir1,1|MacBookPro[23],?|Xserve1,?|MacBookPro6,?)
        OLDCPU="Fatal;This CPU can't boot Big Sur;Your really old Mac has a CPU too old to boot macOS Big Sur. You cannot run macOS Big Sur on this Mac, there's no fixing that."
        OCHUMAN="Fatal: This CPU can't boot Big Sur. Your really old Mac has a CPU too old to boot macOS Big Sur. You cannot run macOS Big Sur on this Mac, there's no fixing that."
        ;;
     MacBook[4-7],?|MacBookAir[234],?|MacBookPro[4578],?|Macmini[345],?)
        ACCEL="Warning;Your Mac does not have Metal;Your Mac has a GPU that is incompatible with metal, and won't have graphics acceleration. This means Big Sur will run extremely slow on your Mac, and will be barely usable."
        ACHUMAN="Warning: Your Mac does not have Metal. Your Mac has a GPU that is incompatible with metal, and won't have graphics acceleration. This means Big Sur will run extremely slow on your Mac, and will be barely usable."
        ;;
    MacPro3,?|iMac[0-9],?|iMac1[012],?)
        ACCEL="Warning;Your Mac might not have Metal;Your Mac might have a GPU that is incompatible with metal, and won't have graphics acceleration. This means Big Sur will run extremely slow on your Mac, and will be barely usable."
        ACHUMAN="Warning: Your Mac might not have Metal. Your Mac might have a GPU that is incompatible with metal, and won't have graphics acceleration. This means Big Sur will run extremely slow on your Mac, and will be barely usable."
        ;;
esac

print "Finallizing results..."

print "The following problems were detected:"
print

print "==Problem List==============================="
print

print $SPHUMAN
print $MPHUMAN
print $OCHUMAN
print $FVHUMAN
print $ACHUMAN
print $DDHUMAN

print
print "============================================="
print


print "============================================="
print "Patched Sur readable:"

echo "$SUPPORTED"
echo "$MACPRO"
echo "$OLDCPU"
echo "$FILEVAULT"
echo "$ACCEL"
echo "$DOSDUDE"
print
print "============================================="

print "Done detecting problems!"

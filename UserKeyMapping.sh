#!/bin/bash

# see: https://www.usb.org/hid [Human Interface Devices (HID) Information]
#      -> HID Usage Tables
readonly KB_APPLICATION='0x700000065'
readonly KB_CAPS_LOCK='0x700000039'
readonly KB_LANG1='0x700000090'
readonly KB_LANG2='0x700000091'
readonly KB_F14='0x700000069'
readonly KP_NUM_LOCK='0x700000053'
readonly KB_INSERT='0x700000049'
readonly KP_ASTERISK='0x700000055'

hidutil property --set "{\"UserKeyMapping\":[
{\"HIDKeyboardModifierMappingSrc\":$KB_APPLICATION,\"HIDKeyboardModifierMappingDst\":$KB_LANG1},
{\"HIDKeyboardModifierMappingSrc\":$KB_CAPS_LOCK,\"HIDKeyboardModifierMappingDst\":$KB_LANG2},
{\"HIDKeyboardModifierMappingSrc\":$KP_NUM_LOCK,\"HIDKeyboardModifierMappingDst\":$KB_F14},
{\"HIDKeyboardModifierMappingSrc\":$KB_INSERT,\"HIDKeyboardModifierMappingDst\":$KP_ASTERISK}
]}"

exit 0
# ----------------
# documents

## clear mapping.
hidutil property --set '{"UserKeyMapping":[]}'

## Load LaunchAgents
launchctl load com.example.UserKeyMapping.plist
launchctl list

## LaunchAgents plist template
: << LaunchAgentsPlistTemplate
<?xml version="1.0" encoding="UTF-8"?>
<plist>
  <dict>
    <key>Label</key>
    <string>com.example.UserKeyMapping</string>

    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/path/to/UserKeyMapping.sh</string>
    </array>

    <key>RunAtLoad</key>
    <true />
  </dict>
</plist>
LaunchAgentsPlistTemplate

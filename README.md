# Patched Sur Compatibility

Patched Sur will soon show a screen that explains the compatibility of each Mac. However, that data has to come from somewhere, so that's why this repo exists. Here you can see or contribute to a list of how well any Macs work with Patched Sur (or general patchers).

## How can I contribute?

**If you are unfamiliar with GitHub**, [just open a discussion](https://github.com/BenSova/Patched-Sur-Compatibility/discussions/new?category=compatibility%20report) and fill it with the following information:

- What Mac you have, this should come in two forms:
  - Mac Type (screen-size, Part-Year)
    - If your Mac does not have a screen do not include screen-size.
    - Example: MacBook Pro (13-inch, Mid-2012)
    - This can be taken directly out of the about this Mac screen.
  - MacTypeX,Y
    - Patched Sur shows this in the post install app in the About This Mac screen, or you could run `sysctl -n hw.model` in terminal
    - Example: MacBookPro9,2
- What works and doesn't work, there's a list of things to include below (look for Works and Warns). Include as many as you can!
- A quick little description of your experience and how well everything works.
- A screenshot of the Patched Sur About This Mac screen.

**If you are familiar with GitHub** and know how to make a pull request (you only need to make one file), then you can make the file Patched Sur uses.

The files are formatted in JSON, so it shouldn't be that hard to use. The title of the file should be MacTypeX,Y.json (ex. MacBookPro9,2.json, you can find the model identifier inside the Patched Sur About This Mac screen or run `sysctl -n hw.model` in terminal).

Here's how to format the file:

```json
{
    "MacName": "Mac Type (screen-size, Part-Year)",
    "Author": "@YourUsername",
    "Details": "A quick little description of your experience and how well everything works.",
    "Works": [
        "One Thing That Works",
        "Another Thing That Works"
    ],
    "Warn": [
        "One thing that does not work",
        "Another thing that doesn't work"
    ]
}
```

MacName can be found in the stock About This Mac screen. Works and Warn items can be found below. Please include in your pull request a screenshot of the About This Mac screen in Patched Sur.

## Works and Warns

Here are details that you can include in your list of what works and what doesn't work. You do not have to include all of them, just the ones you can try. Please test these **after** (successfully) patching kexts, unless you have a Late 2013 iMac where things should work by default. Please also make sure to be on the latest version of Big Sur (11.1 at time of writing).

- WiFi and Ethernet
- Bluetooth
- Personal Hotspots
- WPA2 Enterprise Networks
- I/O Ports
- FileVault (DO NOT TRY TO TEST, ALWAYS PUT THIS IN THE WARNS LIST)
- Graphics Acceleration
- Sleep and Brightness
- *Really any other concerns*

**FileVault will always be in your warns list.**

If you have any other ideas for concerns, open a pull request and add them to this list. 

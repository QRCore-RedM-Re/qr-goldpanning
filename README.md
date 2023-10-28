# qr-goldpanning
- QRCore Gold Panning Script for RedM

## Dependencies
- [qr-core](https://github.com/QRCore-RedM-Re/qr-core)
- [ox_lib](https://github.com/overextended/ox_lib/releases)

## Features
- Useable Gold Pan in Designated Zones
- Configurable Location Zones and Hashes

## Installation
- Download ALL Dependencies
- Download the script and put it into the `[qr]` directory
- Add the following code to your `server.cfg`

```
    ensure qr-core
    ensure qr-goldpanning
```

### Items Installation

```lua
    ['gold_ore']		= {['name'] = 'gold_ore',		['label'] = 'Gold Ore',			['weight'] = 500,	['type'] = 'item',	['image'] = 'gold_ore.png',				            ['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = 'Gold ore'},

    ['goldpanner']		= {['name'] = 'goldpanner',		['label'] = 'Gold Panner',		['weight'] = 500,	['type'] = 'item',	['image'] = 'goldpanner.png',				        ['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = 'Gold Panner'},
```

## Issues, Suggestions & Support
- This resource is still in development. All help with improving the resource is encouraged and appreciated
- Please use the GitHub issues system to report issues or make suggestions
- When making suggestions, please keep [Suggestion] in the title to make it clear that it is a suggestion, or join the Discord
- Discord: https://discord.gg/bEs6cn3225

### Credit
- Based on ```Frankie#0007``` [GoldPanner]

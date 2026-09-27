# Walker — Dynamic TileMap Layers

This is a title-only Walker copy of Godot's `2d/dynamic_tilemap_layers` demo. A
small character walks through a "fake wall". Its tiles have their collision
removed at runtime, and the wall fades to show the secret. It sits in Walker as
a demonstration of per-tile runtime updates on a TileMapLayer. It is a tech
demo, not a game. The import, the runtime startup and 11 headless
input/physics assertions pass. The rendered fade, a physical playtest and both
films are still pending.

## How to run

Open `godot/project.godot` in Godot 4.7 and run the main scene (`world.tscn`).

Controls:

- Move: A/D or the Left/Right arrows, or a gamepad D-pad or left stick.
- Jump: Space, W or Up, or gamepad button 0 or D-pad up.

## Design

- [GDD.md](GDD.md): the recovered game design document (identical copy of
  `design/GDD.md`).
- [design/DECK.html](design/DECK.html): slide deck for review.
- [design/IMPLEMENTATION-MAP.md](design/IMPLEMENTATION-MAP.md): feature → scene/script paths.
- [design/decisions.md](design/decisions.md): open questions.

The GDD is a **recovered, unapproved description** of what the code does,
produced by Walker's `/gdd reverse` pass in silent mode. No design gate has been
signed.

## Source & license

An independent, title-only copy of Godot `2d/dynamic_tilemap_layers`, commit
`a3b5c113112f77291d5f3d1360f33a882fdc52f7`, by the Godot Engine contributors.
The original assets, scripts, scenes, UIDs and README are retained. The upstream
MIT license is copied to LICENSE.md.

## Status

The import, the runtime startup and 11 headless input/physics assertions pass.
The rendered fade, a physical playtest and both native-4K Liam films remain
pending. The original README notes that the modern TileMapLayer also offers a
collision-enabled property. This example specifically demonstrates per-tile
runtime updates. See FRICTIONAL.md for the evidence trail.

Repository: https://github.com/nikbearbrown/walker-2d-dynamic-tilemap-layers

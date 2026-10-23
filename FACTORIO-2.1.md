# Factorio 2.1 notes

Tested with **Factorio 2.1.23**. Current fork version: **1.0.1**.

## Changes

- Retained electric-only checks and supported prototype categories.
- Factorio 2.1 compatibility does not add a runtime script.

## Tests

- Three connected-client profiles: all settings off, all on, and vision-only radar.
- Thirty ten-second energy-loss measurements checked nine device types and a vision-only radar.
- Devices survived save/restart/rejoin between profiles.

Electrical fixtures supplied known baseline drains. These are configurable balance changes, not a measured FPS/UPS optimization.

Tests used private copies of saves and local host/client sessions. Raw player data and test hooks are not shipped.

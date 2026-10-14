# No Power Drains: Improved

A Factorio 2.0.77 fork of [No Power Drains](https://mods.factorio.com/mod/lordodin_no_drains) by LordOdin / yuyaryshev. Original source: [factoriomod_no_drains](https://github.com/yuyaryshev/factoriomod_no_drains). Original Unlicense retained.

## Improvements

- Complete English and Russian names and tooltips for all ten startup settings, included in the release ZIP.
- Fix power/scan-cost changes leaking into non-electric prototypes from other mods.
- Iterate only supported entity categories and keep the settings table local.
- Explain the actual effect of each switch rather than describing every change as idle drain removal.

## What the settings do

Assemblers, electric furnaces, inserters, pumps and electric turrets retain their working power cost while electric idle drain is removed. Roboport energy_usage is set to zero; robot charging_energy is unchanged. Optional beacon power usage is reduced to 1 W. Optional radar usage becomes 1 W, nearby-scan cost 1 J and sector-scan cost 30 J; the vision-only option applies only when distant scan range does not exceed nearby range. The all-radars option takes precedence. Lightning-attractor changes apply only to prototypes with an electric source and may have no effect on vanilla attractors.

These are configurable gameplay balance changes, not an FPS/UPS optimization. Defaults and setting keys are preserved from upstream.

## Installation

Disable **lordodin_no_drains**, then enable **no-power-drains-improved**. There are no custom entities or save migrations. Settings retain the same keys; verify your startup selections when switching. All multiplayer peers need the same fork version and startup settings. Restart Factorio after changing startup options.

## Validation

Factorio 2.0.77 isolated tests: defaults, all off, all on and each individual switch (13 configurations), 32 prototype checks each, including electric/void vision-only radars. Eight powered entity types passed a 601-tick runtime check in a copied player-containing validation save. External mod combinations beyond these fixtures are not exhaustively tested. No runtime control script or per-tick callbacks are added.

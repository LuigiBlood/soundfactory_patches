//Build Sound Factory Patches
architecture snes.cpu

include "./asm/macros.asm"

output "./roms/SoundFactoryPatch.sfc", create
seekAddr(0)
fill $100000,$FF	//Extend to 1MB
seekAddr(0)
insert "./roms/sound.sfc"

include "./asm/patch.asm"

//Edit Header
seekAddr(0xFFB0)
db "01"		//Nintendo
db "NQ  "	//Game Code
db $00, $00, $00, $00, $00, $00
db $00		//Expansion FLASH
db $00		//Expansion RAM
db $00		//Special Version
db $00
db "SOUND FACTORY PATCH  "
db $20		//LoROM+FastROM
db $02		//ROM+RAM+Battery
db $0A		//1MB ROM
db $05		//32KB RAM
db $01		//North America
db $33
db $10		//1.0

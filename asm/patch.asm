//Fix all yellow bugs, the second effect isn't working properly, revert to first effect
seekAddr($9342)
	dw $9D47

//Fix right bound of cursor
seekAddr($950A)
	cmp.w #$00FD
seekAddr($9512)
	lda.w #$00FC

//Change zoom system to 3 zooms instead of just 2 (x1, x2, x4)
seekAddr($95EF)
	jmp zoom_click
seekAddr($FF00)
zoom_click:
	lda $5b
_leftclick:
	bit.b #$01
	beq _rightclick

	ldy $0402
	cpy.w #$0200
	beq _zoomin
	cpy.w #$0400
	beq _zoomin
	bra _ret

_rightclick:
	bit.b #$02
	beq _ret

	ldy $0402
	cpy.w #$0800
	beq _zoomout
	cpy.w #$0400
	beq _zoomout
	bra _ret

_zoomin:
	jsr $99f3
	bra +
_zoomout:
	jsr $9A2A
+;	inc $01,x
_ret:
	rts

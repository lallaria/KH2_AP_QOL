function _OnInit()
    print('AP QOL AWSKIP 1.0')
	if GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
		if ENGINE_VERSION < 5.0 then
		ConsolePrint('LuaBackend is Outdated. Things might not work properly.',2)
	end
	OnPC = true
	Now = 0x0714DB8 - 0x56454E
	Sve = 0x2A09C00 - 0x56450E
	Save = 0x09A7070 - 0x56450E
	Obj0Pointer = 0x2A22730 - 0x56454E
	Sys3Pointer = 0x2AE3550 - 0x56454E
	Btl0Pointer = 0x2AE3558 - 0x56454E
	ARDPointer = 0x2A0CF28 - 0x56454E
	Music = 0x0AB8504 - 0x56450E
	Pause = 0x0AB9038 - 0x56450E
	React = 0x2A0E822 - 0x56450E
	Cntrl = 0x2A148A8 - 0x56450E
	Timer = 0x0AB9010 - 0x56450E
	Songs = 0x0B63534 - 0x56450E
	GScre = 0x0728E90 - 0x56454E
	GMdal = 0x0729024 - 0x56454E
	GKill = 0x0AF4906 - 0x56450E
	CamTyp = 0x0716A58 - 0x56454E
	GamSpd = 0x07151D4 - 0x56454E
	CutNow = 0x0B62758 - 0x56450E
	CutLen = 0x0B62774 - 0x56450E
	CutSkp = 0x0B6275C - 0x56450E
	BtlTyp = 0x2A0EAC4 - 0x56450E
	BtlEnd = 0x2A0D3A0 - 0x56450E
	TxtBox = 0x074BC70 - 0x56454E
	DemCln = 0x2A0CF74 - 0x56450E
	Slot1    = 0x2A20C58 - 0x56450E
	NextSlot = 0x278
	Point1   = 0x2A0D108 - 0x56450E
	NxtPoint = 0x50
	Gauge1   = 0x2A0D1F8 - 0x56450E
	NxtGauge = 0x48
	Menu1    = 0x2A0E7D0 - 0x56450E
	NextMenu = 0x8
	IsDead = 0x2AE5750-0x56454E
	KillByte = 0x820500-0x56454E
	-- if sora is in a form
	SoraForm=0x9AA5D4-0x56454E
	ClientDeathLinkFlag=0x820510-0x56454E
	-- use master form in aw
	offset = 0x56454E
	drive1 = 0x3F059E - offset
	drive2 = 0x3FF734 - offset
	drive3 = 0x3E107C - offset
	drive4 = 0x3FF788 - offset
	drive5 = 0x3FE3C4 - offset
	drive6 = 0x3C07CE - offset
	drive7 = 0x3F05BA - offset
	end
end

function _OnFrame()
    if true then
        World  = ReadByte(Now+0x00)
        Room   = ReadByte(Now+0x01)
        Place  = ReadShort(Now+0x00)
        Door   = ReadShort(Now+0x02)
        Map    = ReadShort(Now+0x04)
        Btl    = ReadShort(Now+0x06)
        Evt    = ReadShort(Now+0x08)
        PrevPlace = ReadShort(Now+0x30)
        if Place == 0xFFFF or not MSN then
            Obj0 = ReadLong(Obj0Pointer)
            Sys3 = ReadLong(Sys3Pointer)
            Btl0 = ReadLong(Btl0Pointer)
            MSN = 0x0BF08C0 - 0x56450E
        end
        ARD = ReadLong(ARDPointer)
        MiniGameSkip()
    end
end

--function in_blacklist(room_id)
--    for index, value in ipairs(skip_minigame_blacklist) do
--        if value == room_id then
--            return true
--        end
--    end
--    return false
--end

function MiniGameSkip()
	if World==9 and Room~=9 then --and in_blacklist==false then
		DebugFlagClearMinigame = ReadLong(0x2AE3488 - offset)+0xB10
		WriteByte(DebugFlagClearMinigame, 1, true)
	end
end
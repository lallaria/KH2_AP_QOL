
function _OnInit()
    if true then
    print('AP QOL AWSKIP 1.0')
    Now = 0x0714DB8 - 0x56454E
	Sve = 0x2A09C00 - 0x56450E
	Save = 0x09A7070 - 0x56450E
    -- remove the -- before the number to add to the blacklist
    -- leave room id commented if you DONT want to do the minigame
    skip_minigame_blacklist={
        9, -- spooky cave id (dont comment out or checks are unobtainable)
        -- 1, -- starry hill room id 
        --8, -- kanga's howse minigame room id
        --6, -- piglets howse minigame room id
        --7, -- rabbits howse minigame room id
    }
end
end
function _OnFrame()
    if true then --Define current values for common addresses
    --print(Now)
        World  = ReadByte(Now+0x00)
        Room   = ReadByte(Now+0x01)
        Place  = ReadShort(Now+0x00)
        Door   = ReadShort(Now+0x02)
        Map    = ReadShort(Now+0x04)
        Btl    = ReadShort(Now+0x06)
        Evt    = ReadShort(Now+0x08)
        PrevPlace = ReadShort(Now+0x30)
        if Place == 0xFFFF or not MSN then
            if not OnPC then
                Obj0 = ReadInt(Obj0Pointer)
                Sys3 = ReadInt(Sys3Pointer)
                Btl0 = ReadInt(Btl0Pointer)
                MSN = 0x04FA440
            else
                Obj0 = ReadLong(Obj0Pointer)
                Sys3 = ReadLong(Sys3Pointer)
                Btl0 = ReadLong(Btl0Pointer)
                MSN = 0x0BF08C0 - 0x56450E
            end
        end
        if not OnPC then
            ARD = ReadInt(ARDPointer)
        else
            ARD = ReadLong(ARDPointer)
        end
    end

    MiniGameSkip()
end
function in_blacklist(room_id)
    for index, value in ipairs(skip_minigame_blacklist) do
        if value == room_id then
            return true
        end
    end

    return false
end

function MiniGameSkip()
    print(Room)
    print(in_blacklist(Room))
	if World==9 and in_blacklist(Room)==false then
		DebugFlagClearMinigame = ReadLong(0x2AE3488 - 0x56454E)+0xB10
		WriteByte(DebugFlagClearMinigame, 1, true)
	end
end
--Legit Anti-Aim111
local screen_size = EngineClient.GetScreenSize()
local antibrute_switch = Menu.Switch("Anti-Aim", "Anti-BruteForce", false)
local aacondition = Menu.Combo("Anti-Aim", "AA Condition", {"Stand", "Moving", "Slow Walking","In-Air"}, 0)
local legitaa_switch = Menu.Switch("Legit Anti-Aim", "Legia AA on key(dont bind e)", false)
local legityawaddmenu = Menu.SliderInt("Legit Anti-Aim", "[Legit] Yaw Add", 0, -180, 180)
local legityawmodimenu = Menu.Combo("Legit Anti-Aim", "[Legit] Modifier", {"Disable", "Jitter", "Offset"}, 0)
local legityawoffset = Menu.SliderInt("Legit Anti-Aim", "[Legit] Offset Degree", 0, -180, 180)
local legityawjitter = Menu.SliderInt("Legit Anti-Aim", "[Legit] Jitter Degree", 0, 0, 60)
local legitinvert = Menu.Combo("Legit Anti-Aim", "[Legit] Invert", {"Swtich after shot", "Random"}, 0)


local legitpitch = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Pitch")
local legityawbase = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Yaw Base")
local legityawadd = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Yaw Add")
local legityawmodi = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Yaw Modifier")
local legityawmodifier = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Modifier Degree")
local fakeoption = Menu.FindVar("Aimbot","Anti Aim","Fake Angle","Fake Options")
local freestandingdesync = Menu.FindVar("Aimbot","Anti Aim","Fake Angle","Freestanding Desync")
local desynconshot = Menu.FindVar("Aimbot","Anti Aim","Fake Angle","Desync On Shot")
local fakelagvalue = Menu.FindVar("Aimbot","Anti Aim","Fake Lag","Limit")
local fakelagrandomize = Menu.FindVar("Aimbot","Anti Aim","Fake Lag","Randomization")
legityawadd:Set(0)
legityawmodi:Set(0)
legityawmodifier:Set(0)

--Stand AA
local standyawaddmenu = Menu.SliderInt("Anti-Aim", "[Stand] Yaw Add", 0, -180, 180)
local standyawmodimenu = Menu.Combo("Anti-Aim", "[Stand] Modifier", {"Disable", "Jitter", "Offset"}, 0)
local standyawoffset = Menu.SliderInt("Anti-Aim", "[Stand] Offset Degree", 0, -180, 180)
local standyawjitter = Menu.SliderInt("Anti-Aim", "[Stand] Jitter Degree", 0, 0, 60)
local standleft = Menu.Combo("Anti-Aim", "[Stand] Left Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local standleftcustom1 = Menu.SliderInt("Anti-Aim", "[Stand] Left Delta 1", 0, 0,58)
local standleftcustom2 = Menu.SliderInt("Anti-Aim", "[Stand] Left Delta 2", 0, 0,58)
local standleftdelay = Menu.SliderFloat("Anti-Aim", "[Stand] Left Change Delay", 0.1, 0.1, 10.0)
local standright = Menu.Combo("Anti-Aim", "[Stand] Right Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local standrightcustom1 = Menu.SliderInt("Anti-Aim", "[Stand] Right Delta 1", 0, 0,58)
local standrightcustom2 = Menu.SliderInt("Anti-Aim", "[Stand] Right Delta 2", 0, 0,58)
local standrightdelay = Menu.SliderFloat("Anti-Aim", "[Stand] Right Change Delay", 0.1, 0.1, 10.0)
local standfakeoption = Menu.MultiCombo("Anti-Aim", "[Stand] Fake Option", {"Avoid Overlap", "Jitter", "Randomize Jitter","Anti-BruteForce"}, 0)
local standonshot = Menu.Combo("Anti-Aim", "[Stand] Onshot", {"Left", "Right","Jitter","Opposite","Freestanding","Switch"}, 0)
local standfree = Menu.Combo("Anti-Aim", "[Stand] Freestanding desync", {"Off", "Peek Fake","Peek Real"}, 0)
local standlefttime = Utils.UnixTime()
local standrighttime = Utils.UnixTime()
local stand_left_degree = 0
local stand_right_degree = 0

--Moving AA
local moveyawaddmenu = Menu.SliderInt("Anti-Aim", "[Moving] Yaw Add", 0, -180, 180)
local moveyawmodimenu = Menu.Combo("Anti-Aim", "[Moving] Modifier", {"Disable", "Jitter", "Offset"}, 0)
local moveyawoffset = Menu.SliderInt("Anti-Aim", "[Moving] Offset Degree", 0, -180, 180)
local moveyawjitter = Menu.SliderInt("Anti-Aim", "[Moving] Jitter Degree", 0, 0, 60)
local moveleft = Menu.Combo("Anti-Aim", "[Moving] Left Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local moveleftcustom1 = Menu.SliderInt("Anti-Aim", "[Moving] Left Delta 1", 0, 0,58)
local moveleftcustom2 = Menu.SliderInt("Anti-Aim", "[Moving] Left Delta 2", 0, 0,58)
local moveleftdelay = Menu.SliderFloat("Anti-Aim", "[Moving] Left Change Delay", 0.1, 0.1, 10.0)
local moveright = Menu.Combo("Anti-Aim", "[Moving] Right Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local moverightcustom1 = Menu.SliderInt("Anti-Aim", "[Moving] Right Delta 1", 0, 0,58)
local moverightcustom2 = Menu.SliderInt("Anti-Aim", "[Moving] Right Delta 2", 0, 0,58)
local moverightdelay = Menu.SliderFloat("Anti-Aim", "[Moving] Right Change Delay", 0.1, 0.1, 10.0)
local movefakeoption = Menu.MultiCombo("Anti-Aim", "[Moving] Fake Option", {"Avoid Overlap", "Jitter", "Randomize Jitter","Anti-BruteForce"}, 0)
local moveonshot = Menu.Combo("Anti-Aim", "[Moving] Onshot", {"Left", "Right","Jitter","Opposite","Freestanding","Switch"}, 0)
local movefree = Menu.Combo("Anti-Aim", "[Moving] Freestanding desync", {"Off", "Peek Fake","Peek Real"}, 0)
local movelefttime =  Utils.UnixTime()
local moverighttime = Utils.UnixTime()
local move_left_degree = 0
local move_right_degree = 0

--Slow Walking AA
local slowyawaddmenu = Menu.SliderInt("Anti-Aim", "[Slow] Yaw Add", 0, -180, 180)
local slowyawmodimenu = Menu.Combo("Anti-Aim", "[Slow] Modifier", {"Disable", "Jitter", "Offset"}, 0)
local slowyawoffset = Menu.SliderInt("Anti-Aim", "[Slow] Offset Degree", 0, -180, 180)
local slowyawjitter = Menu.SliderInt("Anti-Aim", "[Slow] Jitter Degree", 0, 0, 60)
local slowleft = Menu.Combo("Anti-Aim", "[Slow] Left Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local slowleftcustom1 = Menu.SliderInt("Anti-Aim", "[Slow] Left Delta 1", 0, 0,58)
local slowleftcustom2 = Menu.SliderInt("Anti-Aim", "[Slow] Left Delta 2", 0, 0,58)
local slowleftdelay = Menu.SliderFloat("Anti-Aim", "[Slow] Left Change Delay", 0.1, 0.1, 10.0)
local slowright = Menu.Combo("Anti-Aim", "[Slow] Right Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local slowrightcustom1 = Menu.SliderInt("Anti-Aim", "[Slow] Right Delta 1", 0, 0,58)
local slowrightcustom2 = Menu.SliderInt("Anti-Aim", "[Slow] Right Delta 2", 0, 0,58)
local slowrightdelay = Menu.SliderFloat("Anti-Aim", "[Slow] Right Change Delay", 0.1, 0.1, 10.0)
local slowfakeoption = Menu.MultiCombo("Anti-Aim", "[Slow] Fake Option", {"Avoid Overlap", "Jitter", "Randomize Jitter","Anti-BruteForce"}, 0)
local slowonshot = Menu.Combo("Anti-Aim", "[Slow] Onshot", {"Left", "Right","Jitter","Opposite","Freestanding","Switch"}, 0)
local slowfree = Menu.Combo("Anti-Aim", "[Slow] Freestanding desync", {"Off", "Peek Fake","Peek Real"}, 0)
local slowlefttime =  Utils.UnixTime()
local slowrighttime = Utils.UnixTime()
local slow_left_degree = 0
local slow_right_degree = 0

--In Air AA
local airyawaddmenu = Menu.SliderInt("Anti-Aim", "[Air] Yaw Add", 0, -180, 180)
local airyawmodimenu = Menu.Combo("Anti-Aim", "[Air] Modifier", {"Disable", "Jitter", "Offset"}, 0)
local airyawoffset = Menu.SliderInt("Anti-Aim", "[Air] Offset Degree", 0, -180, 180)
local airyawjitter = Menu.SliderInt("Anti-Aim", "[Air] Jitter Degree", 0, 0, 60)
local airleft = Menu.Combo("Anti-Aim", "[Air] Left Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local airleftcustom1 = Menu.SliderInt("Anti-Aim", "[Air] Left Delta 1", 0, 0,58)
local airleftcustom2 = Menu.SliderInt("Anti-Aim", "[Air] Left Delta 2", 0, 0,58)
local airleftdelay = Menu.SliderFloat("Anti-Aim", "[Air] Left Change Delay", 0.1, 0.1, 10.0)
local airright = Menu.Combo("Anti-Aim", "[Air] Right Desync", {"Low Delta", "High Delta", "Custom"}, 0)
local airrightcustom1 = Menu.SliderInt("Anti-Aim", "[Air] Right Delta 1", 0, 0,58)
local airrightcustom2 = Menu.SliderInt("Anti-Aim", "[Air] Right Delta 2", 0, 0,58)
local airrightdelay = Menu.SliderFloat("Anti-Aim", "[Air] Right Change Delay", 0.1, 0.1, 10.0)
local airfakeoption = Menu.MultiCombo("Anti-Aim", "[Air] Fake Option", {"Avoid Overlap", "Jitter", "Randomize Jitter","Anti-BruteForce"}, 0)
local aironshot = Menu.Combo("Anti-Aim", "[Air] Onshot", {"Left", "Right","Jitter","Opposite","Freestanding","Switch"}, 0)
local airfree = Menu.Combo("Anti-Aim", "[Air] Freestanding desync", {"Off", "Peek Fake","Peek Real"}, 0)
local airlefttime =  Utils.UnixTime()
local airrighttime = Utils.UnixTime()
local air_left_degree = 0
local air_right_degree = 0

--fakelag
local fakelagenable = Menu.Switch("Fake-Lag", "Enable Fakelag Extend", false)
local fakelagcondition = Menu.Combo("Fake-Lag", "Fake-Lag Condition", {"Stand", "Moving", "Slow Walking","In Air"}, 0)
local stand_on_shot_lag = Menu.SliderInt("Fake-Lag", "[Stand] On Shot Fakelag", 1, 1, 14)
local moving_on_shot_lag = Menu.SliderInt("Fake-Lag", "[Moving] On Shot Fakelag", 1, 1, 14)
local slow_on_shot_lag = Menu.SliderInt("Fake-Lag", "[Slow] On Shot Fakelag", 1, 1, 14)
local air_on_shot_lag = Menu.SliderInt("Fake-Lag", "[Air] On Shot Fakelag", 1, 1, 14)
local standlagoption = Menu.Combo("Fake-Lag", "[Stand] Amount", {"Jitter", "Switch", "Random"}, 0)
local standjitterlimit = Menu.SliderInt("Fake-Lag", "[Stand] Jitter Limit", 1, 1, 14)
local standlag1 = Menu.SliderInt("Fake-Lag", "[Stand] Fakelag 1", 1, 1, 14)
local standlag2 = Menu.SliderInt("Fake-Lag", "[Stand] Fakelag 2", 1, 1, 14)
local standrandomlimit = Menu.SliderInt("Fake-Lag", "[Stand] Random Limit", 1, 1, 14)
local movinglagoption = Menu.Combo("Fake-Lag", "[Moving] Amount", {"Jitter", "Switch", "Random"}, 0)
local movejitterlimit = Menu.SliderInt("Fake-Lag", "[Moving] Jitter Limit", 1, 1, 14)
local movelag1 = Menu.SliderInt("Fake-Lag", "[Moving] Fakelag 1", 1, 1, 14)
local movelag2 = Menu.SliderInt("Fake-Lag", "[Moving] Fakelag 2", 1, 1, 14)
local moverandomlimit = Menu.SliderInt("Fake-Lag", "[Moving] Random Limit", 1, 1, 14)
local slowlagoption = Menu.Combo("Fake-Lag", "[Slow] Amount", {"Jitter", "Switch", "Random"}, 0)
local slowjitterlimit = Menu.SliderInt("Fake-Lag", "[Slow] Jitter Limit", 1, 1, 14)
local slowlag1 = Menu.SliderInt("Fake-Lag", "[Slow] Fakelag 1", 1, 1, 14)
local slowlag2 = Menu.SliderInt("Fake-Lag", "[Slow] Fakelag 2", 1, 1, 14)
local slowrandomlimit = Menu.SliderInt("Fake-Lag", "[Slow] Random Limit", 1, 1, 14)
local airlagoption = Menu.Combo("Fake-Lag", "[Air] Amount", {"Jitter", "Switch", "Random"}, 0)
local airjitterlimit = Menu.SliderInt("Fake-Lag", "[Air] Jitter Limit", 1, 1, 14)
local airlag1 = Menu.SliderInt("Fake-Lag", "[Air] Fakelag 1", 1, 1, 14)
local airlag2 = Menu.SliderInt("Fake-Lag", "[Air] Fakelag 2", 1, 1, 14)
local airrandomlimit = Menu.SliderInt("Fake-Lag", "[Air] Random Limit", 1, 1, 14)
local on_shot_lag_value = 1

local hitlogenable = Menu.Switch("Misc", "Enable Hitlog&Miss Log", false)
local aaindicator = Menu.Switch("Misc", "Enable Arrow Indicator", false)
local aaindicatortype = Menu.Combo("Misc", "[Arrow] Indicator Type", {"1", "2", "3"}, 0)
local color1 = Menu.ColorEdit("Misc", "[Arrow] Active Color",Color.new(126, 70, 245, 255), "Change The Active Arrow Color")
local keybinds = Menu.Switch("Misc", "Enable Keybinds", false)
local keybinds_x = Menu.SliderInt("Misc", "[Keybinds] X-Positon", 0, 0, screen_size.x)
local keybinds_y = Menu.SliderInt("Misc", "[Keybinds] Y-Positon", 0, 0, screen_size.y)
local Watermark = Menu.Switch("Misc", "Enable Watermark", false)
local autostrafe = Menu.FindVar("Miscellaneous","Main","Movement","Auto Strafe")
local betterjumpscount = Menu.Switch("Misc", "Better Jumpscount", false)

--menu
function guanbifl()
    fakelagcondition:SetVisible(false)
    stand_on_shot_lag:SetVisible(false)
    moving_on_shot_lag:SetVisible(false)
    slow_on_shot_lag:SetVisible(false)
    air_on_shot_lag:SetVisible(false)
    standlagoption:SetVisible(false)
    standjitterlimit:SetVisible(false)
    standlag1:SetVisible(false)
    standlag2:SetVisible(false)
    standrandomlimit:SetVisible(false)
    movinglagoption:SetVisible(false)
    movejitterlimit:SetVisible(false)
    movelag1:SetVisible(false)
    movelag2:SetVisible(false)
    moverandomlimit:SetVisible(false)
    slowlagoption:SetVisible(false)
    slowjitterlimit:SetVisible(false)
    slowlag1:SetVisible(false)
    slowlag2:SetVisible(false)
    slowrandomlimit:SetVisible(false)
    airlagoption:SetVisible(false)
    airjitterlimit:SetVisible(false)
    airlag1:SetVisible(false)
    airlag2:SetVisible(false)
    airrandomlimit:SetVisible(false)
end


function fakelagmenu()
    local fakelagenable_value = fakelagenable:Get()
    local fakelagcondition_value = fakelagcondition:Get()
    local standlagoption_value = standlagoption:Get()
    local movinglagoption_value = movinglagoption:Get()
    local slowlagoption_value = slowlagoption:Get()
    local airlagoption_value = airlagoption:Get()
    guanbifl()
    if fakelagenable_value == true then
        fakelagcondition:SetVisible(true)
        if fakelagcondition_value == 0  then
            stand_on_shot_lag:SetVisible(true)
            standlagoption:SetVisible(true)
            if standlagoption_value == 0 then
                standjitterlimit:SetVisible(true)
            elseif standlagoption_value == 1 then
                standlag1:SetVisible(true)
                standlag2:SetVisible(true)
            elseif standlagoption_value == 2 then
                standrandomlimit:SetVisible(true)
            end
        elseif fakelagcondition_value == 1 then
            movinglagoption:SetVisible(true)
            moving_on_shot_lag:SetVisible(true)
            if movinglagoption_value == 0 then
                movejitterlimit:SetVisible(true)
            elseif movinglagoption_value == 1 then
                movelag1:SetVisible(true)
                movelag2:SetVisible(true)
            elseif movinglagoption_value == 2 then
                moverandomlimit:SetVisible(true)
            end
        elseif fakelagcondition_value == 2 then
            slow_on_shot_lag:SetVisible(true)
            slowlagoption:SetVisible(true)
            if slowlagoption_value == 0 then
                slowjitterlimit:SetVisible(true)
            elseif slowlagoption_value == 1 then
                slowlag1:SetVisible(true)
                slowlag2:SetVisible(true)
            elseif slowlagoption_value == 2 then
                slowrandomlimit:SetVisible(true)
            end
        elseif fakelagcondition_value == 3 then
            air_on_shot_lag:SetVisible(true)
            airlagoption:SetVisible(true)
            if airlagoption_value == 0 then
                airjitterlimit:SetVisible(true)
            elseif airlagoption_value == 1 then
                airlag1:SetVisible(true)
                airlag2:SetVisible(true)
            elseif airlagoption_value == 2 then
                airrandomlimit:SetVisible(true)
            end
        end
    end
end
local value1 = 1
function standfl()
    local fakelagenable_value = fakelagenable:Get()
    local standlagoption_value = standlagoption:Get()
    local standjitterlimit_value = standjitterlimit:Get()
    
    if fakelagenable_value == true then
        fakelagrandomize:Set(0)
        if standlagoption_value == 0 then
            for i = 1 , standjitterlimit_value ,1 do
                if i == standjitterlimit_value then
                    i = 1
                end
                fakelagvalue:Set(i)
            end
        elseif standlagoption_value == 1 then
            local standflswitch = Utils.RandomInt(0, 1)
            if standflswitch == 0 then
                    fakelagvalue:Set(standlag1:Get())
            else
                    fakelagvalue:Set(standlag2:Get())
            end
        elseif standlagoption_value == 2 then
            local standflvalue2 = Utils.RandomInt(1, 14)
            fakelagvalue:Set(standflvalue2)
        end
    end
end

local value2 = 1
function movingfl()
    local fakelagenable_value = fakelagenable:Get()
    local movelagoption_value = movinglagoption:Get()
    local movejitterlimit_value = movejitterlimit:Get()
    
    if fakelagenable_value == true then
        fakelagrandomize:Set(0)
        if movelagoption_value == 0 then
            for i = 1 , movejitterlimit_value ,1 do
                if i == movejitterlimit_value then
                    i = 1
                end
                fakelagvalue:Set(i)
            end
        elseif movelagoption_value == 1 then
            local moveflswitch = Utils.RandomInt(0, 1)
            if moveflswitch == 0 then
                    fakelagvalue:Set(movelag1:Get())
            else
                    fakelagvalue:Set(movelag2:Get())
            end
        elseif movelagoption_value == 2 then
            local moveflvalue2 = Utils.RandomInt(1, 14)
            fakelagvalue:Set(moveflvalue2)
        end
    end
end

local value3 = 1
function slowwalkfl()
    local fakelagenable_value = fakelagenable:Get()
    local slowlagoption_value = slowlagoption:Get()
    local slowjitterlimit_value = slowjitterlimit:Get()
    
    if fakelagenable_value == true then
        fakelagrandomize:Set(0)
        if slowlagoption_value == 0 then
            for i = 1 , slowjitterlimit_value ,1 do
                if i == slowjitterlimit_value then
                    i = 1
                end
                fakelagvalue:Set(i)
            end
        elseif slowlagoption_value == 1 then
            local slowflswitch = Utils.RandomInt(0, 1)
            if slowflswitch == 0 then
                    fakelagvalue:Set(slowlag1:Get())
            else
                    fakelagvalue:Set(slowlag2:Get())
            end
        elseif slowlagoption_value == 2 then
            local slowflvalue2 = Utils.RandomInt(1, 14)
            fakelagvalue:Set(slowflvalue2)
        end
    end
end

local value4 = 1
function airfl()
    local fakelagenable_value = fakelagenable:Get()
    local airlagoption_value = airlagoption:Get()
    local airjitterlimit_value = airjitterlimit:Get()
    
    if fakelagenable_value == true then
        fakelagrandomize:Set(0)
        if airlagoption_value == 0 then
            for i = 1 , airjitterlimit_value ,1 do
                if i == airjitterlimit_value then
                    i = 1
                end
                fakelagvalue:Set(i)
            end
        elseif airlagoption_value == 1 then
            local airflswitch = Utils.RandomInt(0, 1)
            if airflswitch == 0 then
                    fakelagvalue:Set(airlag1:Get())
            else
                    fakelagvalue:Set(airlag2:Get())
            end
        elseif airlagoption_value == 2 then
            local airflvalue2 = Utils.RandomInt(1, 14)
            fakelagvalue:Set(airflvalue2)
        end
    end
end


function guanbimenu0()
    standyawaddmenu:SetVisible(false)
    standyawmodimenu:SetVisible(false)
    standyawoffset:SetVisible(false)
    standyawjitter:SetVisible(false)
    standleft:SetVisible(false)
    standleftcustom1:SetVisible(false)
    standleftcustom2:SetVisible(false)
    standleftdelay:SetVisible(false)
    standright:SetVisible(false)
    standrightcustom1:SetVisible(false)
    standrightcustom2:SetVisible(false)
    standrightdelay:SetVisible(false)
    standfakeoption:SetVisible(false)
    standonshot:SetVisible(false)
    standfree:SetVisible(false)
end

function guanbimenu1()
    moveyawaddmenu:SetVisible(false)
    moveyawmodimenu:SetVisible(false)
    moveyawoffset:SetVisible(false)
    moveyawjitter:SetVisible(false)
    moveleft:SetVisible(false)
    moveleftcustom1:SetVisible(false)
    moveleftcustom2:SetVisible(false)
    moveleftdelay:SetVisible(false)
    moveright:SetVisible(false)
    moverightcustom1:SetVisible(false)
    moverightcustom2:SetVisible(false)
    moverightdelay:SetVisible(false)
    movefakeoption:SetVisible(false)
    moveonshot:SetVisible(false)
    movefree:SetVisible(false)
end

function guanbimenu2()
    slowyawaddmenu:SetVisible(false)
    slowyawmodimenu:SetVisible(false)
    slowyawoffset:SetVisible(false)
    slowyawjitter:SetVisible(false)
    slowleft:SetVisible(false)
    slowleftcustom1:SetVisible(false)
    slowleftcustom2:SetVisible(false)
    slowleftdelay:SetVisible(false)
    slowright:SetVisible(false)
    slowrightcustom1:SetVisible(false)
    slowrightcustom2:SetVisible(false)
    slowrightdelay:SetVisible(false)
    slowfakeoption:SetVisible(false)
    slowonshot:SetVisible(false)
    slowfree:SetVisible(false)
end

function guanbimenu3()
    airyawaddmenu:SetVisible(false)
    airyawmodimenu:SetVisible(false)
    airyawoffset:SetVisible(false)
    airyawjitter:SetVisible(false)
    airleft:SetVisible(false)
    airleftcustom1:SetVisible(false)
    airleftcustom2:SetVisible(false)
    airleftdelay:SetVisible(false)
    airright:SetVisible(false)
    airrightcustom1:SetVisible(false)
    airrightcustom2:SetVisible(false)
    airrightdelay:SetVisible(false)
    airfakeoption:SetVisible(false)
    aironshot:SetVisible(false)
    airfree:SetVisible(false)
end

function guanbiall()
    guanbifl()
    guanbimenu0()
    guanbimenu1()
    guanbimenu2()
    guanbimenu3()
end

guanbiall()

function standmenu()
    local aacondition_value = aacondition:Get()
    local standyawmodimenu_value = standyawmodimenu:Get()
    local standleft_value = standleft:Get()
    local standright_value = standright:Get()
    if aacondition_value == 0 then
        standyawaddmenu:SetVisible(true)
        standyawmodimenu:SetVisible(true)
        standyawoffset:SetVisible(true)
        standyawjitter:SetVisible(true)
        standleft:SetVisible(true)
        standleftcustom1:SetVisible(true)
        standleftcustom2:SetVisible(true)
        standleftdelay:SetVisible(true)
        standright:SetVisible(true)
        standrightcustom1:SetVisible(true)
        standrightcustom2:SetVisible(true)
        standrightdelay:SetVisible(true)
        standfakeoption:SetVisible(true)
        standonshot:SetVisible(true)
        standfree:SetVisible(true)
        if standyawmodimenu_value == 0 then
            standyawoffset:SetVisible(false)
            standyawjitter:SetVisible(false)
        elseif standyawmodimenu_value == 1 then
            standyawoffset:SetVisible(false)
            standyawjitter:SetVisible(true)
        elseif standyawmodimenu_value == 2 then
            standyawoffset:SetVisible(true)
            standyawjitter:SetVisible(false)
        end
        if standleft_value == 2 then
            standleftcustom1:SetVisible(true)
            standleftcustom2:SetVisible(true)
        else
            standleftcustom1:SetVisible(false)
            standleftcustom2:SetVisible(false)
        end
        if standright_value == 2 then
            standrightcustom1:SetVisible(true)
            standrightcustom2:SetVisible(true)
        else
            standrightcustom1:SetVisible(false)
            standrightcustom2:SetVisible(false)
        end
    else
        guanbimenu0()
    end
end

function movemenu()
    local aacondition_value = aacondition:Get()
    local moveyawmodimenu_value = moveyawmodimenu:Get()
    local moveleft_value = moveleft:Get()
    local moveright_value = moveright:Get()
    if aacondition_value == 1 then
        moveyawaddmenu:SetVisible(true)
        moveyawmodimenu:SetVisible(true)
        moveyawoffset:SetVisible(true)
        moveyawjitter:SetVisible(true)
        moveleft:SetVisible(true)
        moveleftcustom1:SetVisible(true)
        moveleftcustom2:SetVisible(true)
        moveleftdelay:SetVisible(true)
        moveright:SetVisible(true)
        moverightcustom1:SetVisible(true)
        moverightcustom2:SetVisible(true)
        moverightdelay:SetVisible(true)
        movefakeoption:SetVisible(true)
        moveonshot:SetVisible(true)
        movefree:SetVisible(true)
        if moveyawmodimenu_value == 0 then
            moveyawoffset:SetVisible(false)
            moveyawjitter:SetVisible(false)
        elseif moveyawmodimenu_value == 1 then
            moveyawoffset:SetVisible(false)
            moveyawjitter:SetVisible(true)
        elseif moveyawmodimenu_value == 2 then
            moveyawoffset:SetVisible(true)
            moveyawjitter:SetVisible(false)
        end
        if moveleft_value == 2 then
            moveleftcustom1:SetVisible(true)
            moveleftcustom2:SetVisible(true)
        else
            moveleftcustom1:SetVisible(false)
            moveleftcustom2:SetVisible(false)
        end
        if moveright_value == 2 then
            moverightcustom1:SetVisible(true)
            moverightcustom2:SetVisible(true)
        else
            moverightcustom1:SetVisible(false)
            moverightcustom2:SetVisible(false)
        end
    else
        guanbimenu1()
    end
end

function slowwalkmenu()
    local aacondition_value = aacondition:Get()
    local slowyawmodimenu_value = slowyawmodimenu:Get()
    local slowleft_value = slowleft:Get()
    local slowright_value = slowright:Get()
    if aacondition_value == 2 then
        slowyawaddmenu:SetVisible(true)
        slowyawmodimenu:SetVisible(true)
        slowyawoffset:SetVisible(true)
        slowyawjitter:SetVisible(true)
        slowleft:SetVisible(true)
        slowleftcustom1:SetVisible(true)
        slowleftcustom2:SetVisible(true)
        slowleftdelay:SetVisible(true)
        slowright:SetVisible(true)
        slowrightcustom1:SetVisible(true)
        slowrightcustom2:SetVisible(true)
        slowrightdelay:SetVisible(true)
        slowfakeoption:SetVisible(true)
        slowonshot:SetVisible(true)
        slowfree:SetVisible(true)
        if slowyawmodimenu_value == 0 then
            slowyawoffset:SetVisible(false)
            slowyawjitter:SetVisible(false)
        elseif slowyawmodimenu_value == 1 then
            slowyawoffset:SetVisible(false)
            slowyawjitter:SetVisible(true)
        elseif slowyawmodimenu_value == 2 then
            slowyawoffset:SetVisible(true)
            slowyawjitter:SetVisible(false)
        end
        if slowleft_value == 2 then
            slowleftcustom1:SetVisible(true)
            slowleftcustom2:SetVisible(true)
        else
            slowleftcustom1:SetVisible(false)
            slowleftcustom2:SetVisible(false)
        end
        if slowright_value == 2 then
            slowrightcustom1:SetVisible(true)
            slowrightcustom2:SetVisible(true)
        else
            slowrightcustom1:SetVisible(false)
            slowrightcustom2:SetVisible(false)
        end
    else
        guanbimenu2()
    end
end

function inairmenu()
    local aacondition_value = aacondition:Get()
    local airyawmodimenu_value = airyawmodimenu:Get()
    local airleft_value = airleft:Get()
    local airright_value = airright:Get()
    if aacondition_value == 3 then
        airyawaddmenu:SetVisible(true)
        airyawmodimenu:SetVisible(true)
        airyawoffset:SetVisible(true)
        airyawjitter:SetVisible(true)
        airleft:SetVisible(true)
        airleftcustom1:SetVisible(true)
        airleftcustom2:SetVisible(true)
        airleftdelay:SetVisible(true)
        airright:SetVisible(true)
        airrightcustom1:SetVisible(true)
        airrightcustom2:SetVisible(true)
        airrightdelay:SetVisible(true)
        airfakeoption:SetVisible(true)
        aironshot:SetVisible(true)
        airfree:SetVisible(true)
        if airyawmodimenu_value == 0 then
            airyawoffset:SetVisible(false)
            airyawjitter:SetVisible(false)
        elseif airyawmodimenu_value == 1 then
            airyawoffset:SetVisible(false)
            airyawjitter:SetVisible(true)
        elseif airyawmodimenu_value == 2 then
            airyawoffset:SetVisible(true)
            airyawjitter:SetVisible(false)
        end
        if airleft_value == 2 then
            airleftcustom1:SetVisible(true)
            airleftcustom2:SetVisible(true)
        else
            airleftcustom1:SetVisible(false)
            airleftcustom2:SetVisible(false)
        end
        if airright_value == 2 then
            airrightcustom1:SetVisible(true)
            airrightcustom2:SetVisible(true)
        else
            airrightcustom1:SetVisible(false)
            airrightcustom2:SetVisible(false)
        end
    else
        guanbimenu3()
    end
end


function menu()
    fakelagmenu()
    standmenu()
    movemenu()
    slowwalkmenu()
    inairmenu()
end

function legitaa()
    local true_or_false = legitaa_switch:Get()
    local listn = legityawmodimenu:Get()
    local yawnow = legityawaddmenu:Get()
    local jittervalue = legityawjitter:Get()
    local offsetvalue = legityawoffset:Get()
    if true_or_false == true then
        legitpitch:Set(0)
        if listn == 1 then
            local rnd = Utils.RandomInt(0, 1)
            if rnd == 0 then
                AntiAim.OverrideYawOffset(yawnow)
            else
                local rndyaw = Utils.RandomInt(yawnow-jittervalue, yawnow+jittervalue)
                AntiAim.OverrideYawOffset(rndyaw)
            end
        elseif listn == 2 then
            local rnd2 = Utils.RandomInt(0, 1)
            if rnd2 == 0 then
                AntiAim.OverrideYawOffset(yawnow)
            else
                AntiAim.OverrideYawOffset(offsetvalue)
            end
        elseif listn == 0 then
            AntiAim.OverrideYawOffset(yawnow)
        end
        a = 1
        local Invert = legitinvert:Get()
        if Invert == 1 then
            local rnd_invert = Utils.RandomInt(0, 1)
            if rnd_invert == 0 then
                AntiAim.OverrideInverter(false)
            elseif rnd_invert == 1 then
                AntiAim.OverrideInverter(true)
            end
        end
    elseif a == 1 then
        legitpitch:Set(1)
		a = 0
    end
end


function standaa()
    local in_time = Utils.UnixTime()
    local standyawaddmenu_value = standyawaddmenu:Get()
    local standyawmodimenu_value = standyawmodimenu:Get()
    local standyawoffset_value = standyawoffset:Get()
    local standyawjitter_value = standyawjitter:Get()
    local standleft_value = standleft:Get()
    local standleftcustom1_value = standleftcustom1:Get()
    local standleftcustom2_value = standleftcustom2:Get()
    local standleftdelay_vlaue = standleftdelay:Get()
    local standleftdelay_vlaue_time = standleftdelay_vlaue*1000
    local standright_value = standright:Get()
    local standrightcustom1_value = standrightcustom1:Get()
    local standrightcustom2_value = standrightcustom2:Get()
    local standrightdelay_value = standrightdelay:Get()
    local standrightdelay_vlaue_time = standrightdelay_value*1000
    local standfakeoption_value = standfakeoption:Get()
    local standonshot_value = standonshot:Get()
    local standfree_value = standfree:Get()
    local stand_inverter_state = AntiAim.GetInverterState()
    if standyawmodimenu_value == 0 then
        AntiAim.OverrideYawOffset(standyawaddmenu_value)
    elseif standyawmodimenu_value == 1 then
        local rnd_standyaw = Utils.RandomInt(0, 1)
        if rnd_standyaw == 0 then
            AntiAim.OverrideYawOffset(standyawaddmenu_value)
        elseif rnd_standyaw == 1 then
            local rnd_standyawjitter = Utils.RandomInt(standyawaddmenu_value-standyawjitter_value, standyawaddmenu_value+standyawjitter_value)
            AntiAim.OverrideYawOffset(rnd_standyawjitter)
        end
    elseif standyawmodimenu_value == 2 then
        local rnd2_standyaw = Utils.RandomInt(0, 1)
        if rnd2_standyaw == 0 then
            AntiAim.OverrideYawOffset(standyawaddmenu_value)
        elseif rnd2_standyaw == 1 then
            AntiAim.OverrideYawOffset(standyawoffset_value)
        end
    end

    if in_time > standlefttime + standleftdelay_vlaue_time then
        standlefttime = Utils.UnixTime()
        if standleft_value == 0 then
            stand_left_degree = Utils.RandomInt(0, 15)
        elseif standleft_value == 1 then
            stand_left_degree = Utils.RandomInt(15, 40)
        elseif standleft_value == 2 then
            if standleftcustom1_value >= standleftcustom2_value then
                stand_left_degree = Utils.RandomInt(standleftcustom2_value,standleftcustom1_value)
            elseif standleftcustom1_value <= standleftcustom2_value then
                stand_left_degree = Utils.RandomInt(standleftcustom1_value,standleftcustom2_value)
            end
        end
    end

    if stand_inverter_state == true then
        AntiAim.OverrideLimit(stand_left_degree)
    end

    if in_time > standrighttime + standrightdelay_vlaue_time then
        standrighttime = Utils.UnixTime()
        if standright_value == 0 then
            stand_right_degree = Utils.RandomInt(0, 15)
        elseif standright_value == 1 then
            stand_right_degree = Utils.RandomInt(15, 40)
        elseif standright_value == 2 then
            if standrightcustom1_value >= standrightcustom2_value then
                stand_right_degree = Utils.RandomInt(standrightcustom2_value,standrightcustom1_value)
            elseif standrightcustom1_value <= standrightcustom2_value then
                stand_right_degree = Utils.RandomInt(standrightcustom1_value,standrightcustom2_value)
            end
        end
    end

    if stand_inverter_state == false then
        AntiAim.OverrideLimit(stand_right_degree)
    end

    fakeoption:Set(standfakeoption_value)

    if standonshot_value == 0 then
        AntiAim.OverrideDesyncOnShot(1)
    elseif standonshot_value == 1 then
        AntiAim.OverrideDesyncOnShot(2)
    elseif standonshot_value == 2 then
        local standonshotaa = Utils.RandomInt(0, 4)
        AntiAim.OverrideDesyncOnShot(standonshotaa)
    elseif standonshot_value == 3 then
        AntiAim.OverrideDesyncOnShot(4)
    elseif standonshot_value == 4 then
        desynconshot:Set(2)
    elseif standonshot_value == 5 then
        desynconshot:Set(3)
    end

    if standfree_value == 0 then
        freestandingdesync:Set(0)
    elseif standfree_value == 1 then
        freestandingdesync:Set(1)
    elseif standfree_value == 2 then
        freestandingdesync:Set(2)
    end
end

function movingaa()
    local move_time = Utils.UnixTime()
    local moveyawaddmenu_value = moveyawaddmenu:Get()
    local moveyawmodimenu_value = moveyawmodimenu:Get()
    local moveyawoffset_value = moveyawoffset:Get()
    local moveyawjitter_value = moveyawjitter:Get()
    local moveleft_value = moveleft:Get()
    local moveleftcustom1_value = moveleftcustom1:Get()
    local moveleftcustom2_value = moveleftcustom2:Get()
    local moveleftdelay_value = moveleftdelay:Get()
    local moveleftdelay_value_time = moveleftdelay_value*1000
    local moveright_value = moveright:Get()
    local moverightcustom1_value = moverightcustom1:Get()
    local moverightcustom2_value = moverightcustom2:Get()
    local moverightdelay_value = moverightdelay:Get()
    local moverightdelay_value_time = moverightdelay_value*1000
    local movefakeoption_value = movefakeoption:Get()
    local moveonshot_value = moveonshot:Get()
    local movefree_value = movefree:Get()
    local move_inverter_state = AntiAim.GetInverterState()
    if moveyawmodimenu_value == 0 then
        AntiAim.OverrideYawOffset(moveyawaddmenu_value)
    elseif moveyawmodimenu_value == 1 then
        local rnd_moveyaw = Utils.RandomInt(0, 1)
        if rnd_moveyaw == 0 then
                AntiAim.OverrideYawOffset(moveyawaddmenu_value)
        elseif rnd_moveyaw == 1 then
            local rnd_moveyawjitter = Utils.RandomInt(moveyawaddmenu_value-moveyawjitter_value, moveyawaddmenu_value+moveyawjitter_value)
            AntiAim.OverrideYawOffset(rnd_moveyawjitter)
        end
    elseif moveyawmodimenu_value == 2 then
        local rnd2_moveyaw = Utils.RandomInt(0, 1)
        if rnd2_moveyaw == 0 then
            AntiAim.OverrideYawOffset(moveyawaddmenu_value)
        elseif rnd2_moveyaw == 1 then
            AntiAim.OverrideYawOffset(moveyawoffset_value)
        end
    end

        if move_time > movelefttime + moveleftdelay_value_time then
            movelefttime = Utils.UnixTime()
                if moveleft_value == 0 then
                    ove_left_degree = Utils.RandomInt(0, 15)
                elseif moveleft_value == 1 then
                    move_left_degree = Utils.RandomInt(15, 40)
                elseif moveleft_value == 2 then
                    if moveleftcustom1_value >= moveleftcustom2_value then
                        move_left_degree = Utils.RandomInt(moveleftcustom2_value,moveleftcustom1_value)
                    elseif moveleftcustom1_value <= moveleftcustom2_value then
                        move_left_degree = Utils.RandomInt(moveleftcustom1_value,moveleftcustom2_value)
                    end
                end
        end
        
        if move_inverter_state == true then
            AntiAim.OverrideLimit(move_left_degree)
        end

        if move_time > moverighttime + moverightdelay_value_time then
            moverighttime = Utils.UnixTime()
                if moveright_value == 0 then
                    move_right_degree = Utils.RandomInt(0, 15)
                elseif moveright_value == 1 then
                    move_right_degree = Utils.RandomInt(15, 40)
                elseif moveright_value == 2 then
                    if moverightcustom1_value >= moverightcustom2_value then
                        move_right_degree = Utils.RandomInt(moverightcustom2_value,moverightcustom1_value)
                    elseif moverightcustom1_value <= moverightcustom2_value then
                        move_right_degree = Utils.RandomInt(moverightcustom1_value,moverightcustom2_value)
                    end
                end
        end
        
        if move_inverter_state == false then
            AntiAim.OverrideLimit(move_right_degree)
        end

        fakeoption:Set(movefakeoption_value)
    
        if moveonshot_value == 0 then
            AntiAim.OverrideDesyncOnShot(1)
        elseif moveonshot_value == 1 then
            AntiAim.OverrideDesyncOnShot(2)
        elseif moveonshot_value == 2 then
            local moveonshotaa = Utils.RandomInt(0, 4)
            AntiAim.OverrideDesyncOnShot(moveonshotaa)
        elseif moveonshot_value == 3 then
            AntiAim.OverrideDesyncOnShot(4)
        elseif moveonshot_value == 4 then
            desynconshot:Set(2)
        elseif moveonshot_value == 5 then
            desynconshot:Set(3)
        end
    
        if movefree_value == 0 then
            freestandingdesync:Set(0)
        elseif movefree_value == 1 then
            freestandingdesync:Set(1)
        elseif movefree_value == 2 then
            freestandingdesync:Set(2)
        end
end

function slowaa()
    local slow_time = Utils.UnixTime()
    local slowyawaddmenu_value = slowyawaddmenu:Get()
    local slowyawmodimenu_value = slowyawmodimenu:Get()
    local slowyawoffset_value = slowyawoffset:Get()
    local slowyawjitter_value = slowyawjitter:Get()
    local slowleft_value = slowleft:Get()
    local slowleftcustom1_value = slowleftcustom1:Get()
    local slowleftcustom2_value = slowleftcustom2:Get()
    local slowleftdelay_value = slowleftdelay:Get()
    local slowleftdelay_value_time = slowleftdelay_value*1000
    local slowright_value = slowright:Get()
    local slowrightcustom1_value = slowrightcustom1:Get()
    local slowrightcustom2_value = slowrightcustom2:Get()
    local slowrightdelay_value = slowrightdelay:Get()
    local slowrightdelay_value_time = slowrightdelay_value*1000
    local slowfakeoption_value = slowfakeoption:Get()
    local slowonshot_value = slowonshot:Get()
    local slowfree_value = slowfree:Get()
    local slow_inverter_state = AntiAim.GetInverterState()
        if slowyawmodimenu_value == 0 then
            AntiAim.OverrideYawOffset(slowyawaddmenu_value)
        elseif slowyawmodimenu_value == 1 then
            local rnd_slowyaw = Utils.RandomInt(0, 1)
            if rnd_slowyaw == 0 then
                AntiAim.OverrideYawOffset(slowyawaddmenu_value)
            elseif rnd_slowyaw == 1 then
                local rnd_slowyawjitter = Utils.RandomInt(slowyawaddmenu_value-slowyawjitter_value, slowyawaddmenu_value+slowyawjitter_value)
                AntiAim.OverrideYawOffset(rnd_slowyawjitter)
            end
        elseif slowyawmodimenu_value == 2 then
            local rnd2_slowyaw = Utils.RandomInt(0, 1)
            if rnd2_slowyaw == 0 then
                AntiAim.OverrideYawOffset(slowyawaddmenu_value)
            elseif rnd2_slowyaw == 1 then
                AntiAim.OverrideYawOffset(slowyawoffset_value)
            end
        end

        if slow_time > slowlefttime + slowleftdelay_value_time then
            slowlefttime = Utils.UnixTime()
                if slowleft_value == 0 then
                    slow_left_degree = Utils.RandomInt(0, 15)
                elseif slowleft_value == 1 then
                    slow_left_degree = Utils.RandomInt(15, 40)
                elseif slowleft_value == 2 then
                    if slowleftcustom1_value >= slowleftcustom2_value then
                        slow_left_degree = Utils.RandomInt(slowleftcustom2_value,slowleftcustom1_value)
                    elseif slowleftcustom1_value <= slowleftcustom2_value then
                        slow_left_degree = Utils.RandomInt(slowleftcustom1_value,slowleftcustom2_value)
                    end
                end
        end
        
        if slow_inverter_state == true then
            AntiAim.OverrideLimit(slow_left_degree)
        end

        if slow_time > slowrighttime + slowrightdelay_value_time then
            slowrighttime = Utils.UnixTime()
                if slowright_value == 0 then
                    slow_right_degree = Utils.RandomInt(0, 15)
                elseif slowright_value == 1 then
                    slow_right_degree = Utils.RandomInt(15, 40)
                elseif slowright_value == 2 then
                    if slowrightcustom1_value >= slowrightcustom2_value then
                        slow_right_degree = Utils.RandomInt(slowrightcustom2_value,slowrightcustom1_value)
                    elseif slowrightcustom1_value <= slowrightcustom2_value then
                        slow_right_degree = Utils.RandomInt(slowrightcustom1_value,slowrightcustom2_value)
                    end
                end
        end
        
        if slow_inverter_state == false then
            AntiAim.OverrideLimit(slow_right_degree)
        end

        fakeoption:Set(slowfakeoption_value)
    
        if slowonshot_value == 0 then
            AntiAim.OverrideDesyncOnShot(1)
        elseif slowonshot_value == 1 then
            AntiAim.OverrideDesyncOnShot(2)
        elseif slowonshot_value == 2 then
            local slowonshotaa = Utils.RandomInt(0, 4)
            AntiAim.OverrideDesyncOnShot(slowonshotaa)
        elseif slowonshot_value == 3 then
            AntiAim.OverrideDesyncOnShot(4)
        elseif slowonshot_value == 4 then
            desynconshot:Set(2)
        elseif slowonshot_value == 5 then
            desynconshot:Set(3)
        end
    
        if slowfree_value == 0 then
            freestandingdesync:Set(0)
        elseif slowfree_value == 1 then
            freestandingdesync:Set(1)
        elseif slowfree_value == 2 then
            freestandingdesync:Set(2)
        end
end

function airaa()
    local air_time = Utils.UnixTime()
    local airyawaddmenu_value = airyawaddmenu:Get()
    local airyawmodimenu_value = airyawmodimenu:Get()
    local airyawoffset_value = airyawoffset:Get()
    local airyawjitter_value = airyawjitter:Get()
    local airleft_value = airleft:Get()
    local airleftcustom1_value = airleftcustom1:Get()
    local airleftcustom2_value = airleftcustom2:Get()
    local airleftdelay_value = airleftdelay:Get()
    local airleftdelay_value_time = airleftdelay_value*1000
    local airright_value = airright:Get()
    local airrightcustom1_value = airrightcustom1:Get()
    local airrightcustom2_value = airrightcustom2:Get()
    local airrightdelay_value = airrightdelay:Get()
    local airrightdelay_value_time = airrightdelay_value*1000
    local airfakeoption_value = airfakeoption:Get()
    local aironshot_value = aironshot:Get()
    local airfree_value = airfree:Get()
    local air_inverter_state = AntiAim.GetInverterState()
        if airyawmodimenu_value == 0 then
            AntiAim.OverrideYawOffset(airyawaddmenu_value)
        elseif airyawmodimenu_value == 1 then
            local rnd_airyaw = Utils.RandomInt(0, 1)
            if rnd_airyaw == 0 then
                AntiAim.OverrideYawOffset(airyawaddmenu_value)
            elseif rnd_airyaw == 1 then
                local rnd_airyawjitter = Utils.RandomInt(airyawaddmenu_value-airyawjitter_value, airyawaddmenu_value+airyawjitter_value)
                AntiAim.OverrideYawOffset(rnd_airyawjitter)
            end
        elseif airyawmodimenu_value == 2 then
            local rnd2_airyaw = Utils.RandomInt(0, 1)
            if rnd2_airyaw == 0 then
                AntiAim.OverrideYawOffset(airyawaddmenu_value)
            elseif rnd2_airyaw == 1 then
                AntiAim.OverrideYawOffset(airyawoffset_value)
            end
        end

        if air_time > airlefttime + airleftdelay_value_time then
            airlefttime = Utils.UnixTime()
                if airleft_value == 0 then
                    air_left_degree = Utils.RandomInt(0, 15)
                elseif airleft_value == 1 then
                    air_left_degree = Utils.RandomInt(15, 40)
                elseif airleft_value == 2 then
                    if airleftcustom1_value >= airleftcustom2_value then
                        air_left_degree = Utils.RandomInt(airleftcustom2_value,airleftcustom1_value)
                    elseif airleftcustom1_value <= airleftcustom2_value then
                        air_left_degree = Utils.RandomInt(airleftcustom1_value,airleftcustom2_value)
                    end
                end
        end
        
        if  air_inverter_state == true  then
            AntiAim.OverrideLimit(air_left_degree)
        end

        if air_time > airrighttime + airrightdelay_value_time then
            airrighttime = Utils.UnixTime()
                if airright_value == 0 then
                    air_right_degree = Utils.RandomInt(0, 15)
                elseif airright_value == 1 then
                    air_right_degree = Utils.RandomInt(15, 40)
                elseif airright_value == 2 then
                    if airrightcustom1_value >= airrightcustom2_value then
                        air_right_degree = Utils.RandomInt(airrightcustom2_value,airrightcustom1_value)
                    elseif airrightcustom1_value <= airrightcustom2_value then
                        air_right_degree = Utils.RandomInt(airrightcustom1_value,airrightcustom2_value)
                    end
                end
        end
    
        if air_inverter_state == false then
            AntiAim.OverrideLimit(air_right_degree)
        end

        fakeoption:Set(airfakeoption_value)
    
        if aironshot_value == 0 then
            AntiAim.OverrideDesyncOnShot(1)
        elseif aironshot_value == 1 then
            AntiAim.OverrideDesyncOnShot(2)
        elseif aironshot_value == 2 then
            local aironshotaa = Utils.RandomInt(0, 4)
            AntiAim.OverrideDesyncOnShot(aironshotaa)
        elseif aironshot_value == 3 then
            AntiAim.OverrideDesyncOnShot(4)
        elseif aironshot_value == 4 then
            desynconshot:Set(2)
        elseif aironshot_value == 5 then
            desynconshot:Set(3)
        end
    
        if airfree_value == 0 then
            freestandingdesync:Set(0)
        elseif airfree_value == 1 then
            freestandingdesync:Set(1)
        elseif airfree_value == 2 then
            freestandingdesync:Set(2)
        end
end


function aa()
    menu()
    local betterjumpscount_value = betterjumpscount:Get()
    local is_w_pressed = Cheat.IsKeyDown(0x57)
    local is_a_pressed = Cheat.IsKeyDown(0x41)
    local is_s_pressed = Cheat.IsKeyDown(0x53)
    local is_d_pressed = Cheat.IsKeyDown(0x44)
    local is_shift_pressed = Cheat.IsKeyDown(0x10)
    local is_space_pressed = Cheat.IsKeyDown(0x20)
    local true_or_false = legitaa_switch:Get()
    if is_w_pressed == false and is_a_pressed == false and is_s_pressed == false and is_d_pressed == false and true_or_false == false and is_space_pressed == false and  is_shift_pressed == false then
        standaa()
        standfl()
        on_shot_lag_value = stand_on_shot_lag:Get()
    end
    if is_w_pressed == true or is_a_pressed == true or is_s_pressed == true or is_d_pressed == true and true_or_false == false and is_shift_pressed == false and  is_shift_pressed == false then
        movingaa()
        movingfl()
        on_shot_lag_value = moving_on_shot_lag:Get()
    end
    if is_shift_pressed == true and true_or_false == false and is_space_pressed == false then
        slowaa()
        slowwalkfl()
        on_shot_lag_value = slow_on_shot_lag:Get()
    end
    if is_space_pressed == true and true_or_false == false then
        airaa()
        airfl()
        on_shot_lag_value = air_on_shot_lag:Get()
    end
    if is_space_pressed == true and true_or_false == false and is_a_pressed == false and is_d_pressed == false and is_w_pressed == false and is_s_pressed == false then
        if betterjumpscount_value == true then
            autostrafe:Set(false)
        end
    else
        autostrafe:Set(true)
    end
    legitaa()
end

--hitlog

local hitgroups = {
	[0] = "head",
    [1] = "neck",
    [2] = "pelvis",
    [3] = "stomach",
    [4] = "lower chest",
    [5] = "chest",
    [6] = "upper chest",
    [7] = "right thigh",
    [8] = "left thigh",
    [9] = "right calf",
    [10] = "left calf",
    [11] = "right foot",
    [12] = "left foot",
    [13] = "right hand",
    [14] = "left hand",
    [15] = "right upper arm",
    [16] = "right forearm",
    [17] = "left upper arm",
    [18] = "left forear"
}

--hitlog
Cheat.RegisterCallback("registered_shot",function(shot)
    local fakelagenable_value = fakelagenable:Get()
    if antibrute_switch == true then
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
        FakeLag.ForceSend()
    end
    local Invert = legitinvert:Get()
    local inverter_state = AntiAim.GetInverterState()
    local true_or_false = legitaa_switch:Get()
    if true_or_false == true then
        if Invert == 0 then
            if inverter_state == false then
                AntiAim.OverrideInverter(true)
            else
                AntiAim.OverrideInverter(false)
            end
        end
    end
    if  hitlogenable:Get() == true then
        local target = EntityList.GetPlayer(shot.target_index)
        local name = target:GetName()
        if shot.reason == 1 then
            print("[Forbid] Missed ["..name.."] in the ["..hitgroups[shot.hitgroup].."] due to [ resolver ]")
        elseif shot.reason == 2 then
            print("[Forbid] Missed ["..name.."] in the ["..hitgroups[shot.hitgroup].."] due to 銆� spread 銆�")
        elseif shot.reason == 3 then
            print("[Forbid] Missed ["..name.."] in the ["..hitgroups[shot.hitgroup].."] due to 銆� occlusion 銆�")
        elseif shot.reason == 4 then
            print("[Forbid] Missed ["..name.."] in the ["..hitgroups[shot.hitgroup].."] due to 銆� prediction error 銆�")
        elseif shot.reason == 0 then
            print(">>>[Forbid] Hit ["..name.."] in the ["..hitgroups[shot.hitgroup].."] for damage 銆�"..shot.damage.."銆�")
        end
    end
    if fakelagenable_value == true then
        fakelagvalue:Set(on_shot_lag_value)
    end
end)

--Double Tap
local enable_dt_extend = Menu.Switch("Exploits", "Enable Double-Tap Extend", false)
local dt_mode = Menu.Combo("Exploits", "Double-Tap Mode", {"Custom", "Ideal","Link"}, 0)
local dtticks = Menu.SliderInt("Exploits", "Double-Tap Ticks", 1, 0, 25)
local instan_recharge = Menu.Switch("Exploits","Instan Recharge", false)

function doubletap()
    local tof = enable_dt_extend:Get()
    local tof2 = instan_recharge:Get()
	if tof == true then
        if dt_mode:Get() == 0 then
            dtticks:SetVisible(true)
            local ticks = dtticks:Get()
            Exploits.OverrideDoubleTapSpeed(ticks)
        else
            Exploits.OverrideDoubleTapSpeed(22)
            dtticks:SetVisible(false)
        end
    else
        Exploits.OverrideDoubleTapSpeed(13)
    end
	local listn = legityawmodimenu:Get()
	if listn == 0 then
        legityawjitter:SetVisible(false)
        legityawoffset:SetVisible(false)
    elseif listn == 1 then
        legityawjitter:SetVisible(true)
        legityawoffset:SetVisible(false)
    elseif listn == 2 then
        legityawjitter:SetVisible(false)
        legityawoffset:SetVisible(true)
    end
    
    if tof2 == true then
        Exploits.ForceCharge()
    end
end


function keybidnsindicator()
    local entity = EntityList.GetClientEntity(EngineClient.GetLocalPlayer())
    if entity == nil then return end
    local player = entity:GetPlayer()
    local weapon = player:GetActiveWeapon()
    if weapon == nil then return end
    if  EngineClient.IsConnected() == false then return end
    local keybinds_enable = keybinds:Get()
    if keybinds_enable == true then
        keybinds_x:SetVisible(true)
        keybinds_y:SetVisible(true)
        local xpo = keybinds_x:Get()
        local ypo = keybinds_y:Get()
        local binds = Cheat.GetBinds()
        Render.GradientBoxFilled(Vector2.new(xpo, ypo-2), Vector2.new(xpo+145/3, ypo), Color.RGBA(65,105,225, 255), Color.RGBA(255,105,180, 255), Color.RGBA(65,105,225, 255), Color.RGBA(255,105,180, 255))
        Render.GradientBoxFilled(Vector2.new(xpo+145/3, ypo-2), Vector2.new(xpo+(154/3)*2, ypo), Color.RGBA(	255,105,180, 255), Color.RGBA(255,255,240,255), Color.RGBA(	255,105,180, 255), Color.RGBA(255,255,240, 255))
        Render.GradientBoxFilled(Vector2.new(xpo+(154/3)*2, ypo-2), Vector2.new(xpo+145, ypo), Color.RGBA(255,255,240, 255), Color.RGBA(255,255,0, 255), Color.RGBA(255,255,240, 255), Color.RGBA(255,255,0, 255))
        Render.Blur(Vector2.new(xpo, ypo), Vector2.new(xpo+145, ypo+20))
        Render.Text("Keybinds", Vector2.new(xpo+50, ypo+5), Color.new(1.0, 1.0, 1.0, 1.0), 12)
        for i = 1, #binds do
            local name = binds[i]:GetName()
            local mode = binds[i]:GetMode()
            local hold = "[Hold]"
            local toggle = "[Toggle]"
            local holdlen = #hold
            local togglelen = #toggle
            Render.Text(name, Vector2.new(xpo+5, ypo+5+18*i), Color.new(1.0, 1.0, 1.0, 1.0), 12)
            if mode == 1 then
                Render.Text("[Hold]", Vector2.new(xpo+145-holdlen-25, ypo+5+18*i), Color.new(1.0, 1.0, 1.0, 1.0), 12)
            elseif mode == 0 then
                Render.Text("[Toggle]", Vector2.new(xpo+145-togglelen-36, ypo+5+18*i), Color.new(1.0, 1.0, 1.0, 1.0), 12)
            end
        end
    else
        keybinds_x:SetVisible(false)
        keybinds_y:SetVisible(false)
    end
end

local screen_size_middle = Vector2.new(screen_size.x / 2 + 20, screen_size.y / 2 - 11);
local screen_size_middle2 = Vector2.new(screen_size.x / 2 - 49, screen_size.y / 2 - 11);
local color_inactive = Color.new(205,205,205,255)


function aainvertindicator()
    if aaindicator:Get() == true then
        aaindicatortype:SetVisible(true)
        color1:SetVisible(true)
        local local_player_index    = EngineClient.GetLocalPlayer()                   -- Get our local player index
        local local_player          = EntityList.GetClientEntity(local_player_index)  -- Get the entity object for our local player
        if not local_player then
                return -- No real point rendering keybinds if the local player is invalid
        end
        
        local entity = EntityList.GetClientEntity(EngineClient.GetLocalPlayer())
        if entity == nil then return end
        local player = entity:GetPlayer()
        local weapon = player:GetActiveWeapon()
        if weapon == nil then return end
        local binds = Cheat.GetBinds()
        local inverted = AntiAim.GetInverterState()

        if aaindicatortype:Get() == 0 then
            if inverted then
                Render.Text(">>>", screen_size_middle, color1:GetColor(), 22, false)
                Render.Text("<<<", screen_size_middle2, color_inactive, 22, false)
            else
                Render.Text(">>>", screen_size_middle, color_inactive, 22, false)
                Render.Text("<<<", screen_size_middle2, color1:GetColor(), 22, false)
            end
        elseif aaindicatortype:Get() == 1 then
            if inverted then
                Render.PolyFilled(Color.new(0,0,0,0.6), Vector2.new(screen_size.x / 2 - 55 , screen_size.y /2), Vector2.new(screen_size.x / 2 - 40 , screen_size.y /2 -10), Vector2.new(screen_size.x / 2 - 40 , screen_size.y /2 +10))
                Render.PolyFilled(Color.new(0,0,0,0.6), Vector2.new(screen_size.x / 2 + 55 , screen_size.y /2), Vector2.new(screen_size.x / 2 + 40 , screen_size.y /2 -10), Vector2.new(screen_size.x / 2 + 40 , screen_size.y /2 +10))
                Render.BoxFilled(Vector2.new(screen_size.x / 2 - 38 , screen_size.y /2 - 10), Vector2.new(screen_size.x / 2 - 36 , screen_size.y /2 + 10), Color.new(0,0,0,0.4))
                Render.BoxFilled(Vector2.new(screen_size.x / 2 + 38 , screen_size.y /2 - 10), Vector2.new(screen_size.x / 2 + 36 , screen_size.y /2 + 10),color1:GetColor())
            else
                Render.PolyFilled(Color.new(0,0,0,0.6), Vector2.new(screen_size.x / 2 - 55 , screen_size.y /2), Vector2.new(screen_size.x / 2 - 40 , screen_size.y /2 -10), Vector2.new(screen_size.x / 2 - 40 , screen_size.y /2 +10))
                Render.PolyFilled(Color.new(0,0,0,0.6), Vector2.new(screen_size.x / 2 + 55 , screen_size.y /2), Vector2.new(screen_size.x / 2 + 40 , screen_size.y /2 -10), Vector2.new(screen_size.x / 2 + 40 , screen_size.y /2 +10))
                Render.BoxFilled(Vector2.new(screen_size.x / 2 - 38 , screen_size.y /2 - 10), Vector2.new(screen_size.x / 2 - 36 , screen_size.y /2 + 10), color1:GetColor())
                Render.BoxFilled(Vector2.new(screen_size.x / 2 + 38 , screen_size.y /2 - 10), Vector2.new(screen_size.x / 2 + 36 , screen_size.y /2 + 10),Color.new(0,0,0,0.4))
            end
        elseif aaindicatortype:Get() == 2 then
            if inverted then
                Render.Text("For", Vector2.new((screen_size.x / 2)- 20, screen_size.y /2+12), Color.new(1.0, 1.0, 1.0, 1.0), 14,true)
                Render.Text("bid", Vector2.new(screen_size.x / 2+1, screen_size.y /2+12), color1:GetColor(), 14,true)
                Render.Text("掳", Vector2.new(screen_size.x / 2+21, screen_size.y /2+12), Color.new(1.0, 1.0, 1.0, 1.0), 14,true)
            else
                Render.Text("For", Vector2.new((screen_size.x / 2)- 20, screen_size.y /2+12), color1:GetColor(), 14,true)
                Render.Text("bid", Vector2.new(screen_size.x / 2+1, screen_size.y /2+12), Color.new(1.0, 1.0, 1.0, 1.0), 14,true)
                Render.Text("掳", Vector2.new(screen_size.x / 2+21, screen_size.y /2+12), Color.new(1.0, 1.0, 1.0, 1.0), 14,true)
            end
        end
    else
        aaindicatortype:SetVisible(false)
        color1:SetVisible(false)
    end
end
function watermarkindicator()
    local Watermark_enable = Watermark:Get()
    local GetNetChannelInfo = EngineClient.GetNetChannelInfo()
    if GetNetChannelInfo == nil then return end
    local server_ip = GetNetChannelInfo:GetAddress()
    if Watermark_enable == true then
        Render.Blur(Vector2.new(screen_size.x - 300,10), Vector2.new(screen_size.x-10, 35))
        Render.GradientBoxFilled(Vector2.new(screen_size.x - 300,8), Vector2.new(screen_size.x-290/3, 10), Color.RGBA(65,105,225, 255), Color.RGBA(255,105,180, 255), Color.RGBA(65,105,225, 255), Color.RGBA(255,105,180, 255))
        Render.GradientBoxFilled(Vector2.new(screen_size.x - 300+ 290/3,8), Vector2.new(screen_size.x - 300 + (290/3)*2,10), Color.RGBA(	255,105,180, 255), Color.RGBA(255,255,240,255), Color.RGBA(	255,105,180, 255), Color.RGBA(255,255,240, 255))
        Render.GradientBoxFilled(Vector2.new(screen_size.x - 300 + (290/3)*2,8), Vector2.new(screen_size.x - 300 + (290/3)*3, 10), Color.RGBA(255,255,240, 255), Color.RGBA(255,255,0, 255), Color.RGBA(255,255,240, 255), Color.RGBA(255,255,0, 255))
        Render.Text("Forbid.yaw  | ", Vector2.new(screen_size.x -290, 15), Color.new(1.0, 1.0, 1.0, 1.0), 14,true)
        Render.Text("Version: 1.01  | ", Vector2.new(screen_size.x -210, 15), Color.new(1.0, 1.0, 1.0, 1.0), 14,true)
        Render.Text(tostring(server_ip), Vector2.new(screen_size.x -123, 15), Color.new(1.0, 1.0, 1.0, 1.0), 14,true)
    end
end

--Indicator
local indicator_switch = Menu.Switch("Exploits","DT Indicator", false)
local coloredit = Menu.ColorEdit("Exploits", "DT Indicator Color", Color.new(1.0, 1.0, 1.0, 1.0))
local screen_size = EngineClient.GetScreenSize()
local x = Menu.SliderInt("Exploits", "X-Positon", 0, 0, screen_size.x)
local y = Menu.SliderInt("Exploits", "Y-Positon", 0, 0, screen_size.y)

function dtindicator()
    if indicator_switch:Get() == true then
        coloredit:SetVisible(true)
        x:SetVisible(true)
        y:SetVisible(true)
        local chrg = Exploits.GetCharge()
        local length = 54*chrg
        local xpos = x:Get()
        local ypos =y:Get()
        local color = coloredit:Get()
        local entity = EntityList.GetClientEntity(EngineClient.GetLocalPlayer())
        if  EngineClient.IsConnected() == false then return end
        local player = entity:GetPlayer()
        local weapon = player:GetActiveWeapon()
        if weapon == nil then return end
        local weap = weapon:GetWeaponID()
        Render.GradientBoxFilled(Vector2.new(xpos, ypos+3), Vector2.new(xpos+40, ypos), Color.RGBA(65,105,225, 255), Color.RGBA(255,105,180, 255), Color.RGBA(65,105,225, 255), Color.RGBA(255,105,180, 255))
        Render.GradientBoxFilled(Vector2.new(xpos+40, ypos+3), Vector2.new(xpos+80, ypos), Color.RGBA(	255,105,180, 255), Color.RGBA(255,255,240,255), Color.RGBA(	255,105,180, 255), Color.RGBA(255,255,240, 255))
        Render.GradientBoxFilled(Vector2.new(xpos+80, ypos+3), Vector2.new(xpos+120, ypos), Color.RGBA(255,255,240, 255), Color.RGBA(255,255,0, 255), Color.RGBA(255,255,240, 255), Color.RGBA(255,255,0, 255))
        Render.Blur(Vector2.new(xpos, ypos+3), Vector2.new(xpos+120, ypos+20))
        Render.Text("Forbid |", Vector2.new(xpos+3, ypos+6), Color.new(1.0, 1.0, 1.0, 1.0), 10)
        Render.Text("DT : ", Vector2.new(xpos+40, ypos+6), Color.new(1.0, 1.0, 1.0, 1.0), 10)
        Render.BoxFilled(Vector2.new(xpos+60, ypos+8), Vector2.new(xpos+60+length, ypos+15), color)
        Render.WeaponIcon(weap, Vector2.new(xpos+3, ypos+25), Color.new(1.0, 1.0, 1.0), 16)
    else
        coloredit:SetVisible(false)
        x:SetVisible(false)
        y:SetVisible(false)
    end
end

-- @region: engine stuff
local _set_clantag = ffi.cast('int(__fastcall*)(const char*, const char*)', Utils.PatternScan('engine.dll', '53 56 57 8B DA 8B F9 FF 15'))
local _last_clantag = nil
local set_clantag = function(v)
  if v == _last_clantag then return end
  _set_clantag(v, v)
  _last_clantag = v
end


local clantag_animation = function()
    if not EngineClient.IsConnected() then return end

    local netchann_info = EngineClient.GetNetChannelInfo()
    if netchann_info == nil then return end


    set_clantag("Forbid,yaw")
end


Cheat.RegisterCallback("draw", clantag_animation)

function clantag()
    if not EngineClient.IsConnected() then return end    
    local netchann_info = EngineClient.GetNetChannelInfo()    
    if netchann_info == nil then return end
    set_clantag("Forbid.yaw")
end


function indicator()
    dtindicator()
    keybidnsindicator()
    aainvertindicator()
    watermarkindicator()
    clantag()
end


--extended viewmoedl
local fov1 = Menu.FindVar("Visuals", "View", "Viewmodel", "FOV")
local x1 = Menu.FindVar("Visuals", "View", "Viewmodel", "X")
local y1 = Menu.FindVar("Visuals", "View", "Viewmodel", "Y")
local z1 = Menu.FindVar("Visuals", "View", "Viewmodel", "Z")
local roll = Menu.FindVar("Visuals", "View", "Viewmodel", "Roll")
local FOV1 = Menu.SliderInt("Viewmodel", "FOV", 0, -50, 100, "Tooltip")
local X = Menu.SliderInt("Viewmodel", "X", 0, -100, 100, "Tooltip")
local Y = Menu.SliderInt("Viewmodel", "Y", 0, -100, 100, "Tooltip")
local Z = Menu.SliderInt("Viewmodel", "Z", 0, -100, 100, "Tooltip")
local ROLL = Menu.SliderInt("Viewmodel", "ROLL", 0, -100, 100, "Tooltip")

function viewmodel()
    FOV1value = FOV1:Get()
    Xvalue = X:Get()
    Yvalue = Y:Get()
    Zvalue = Z:Get()
    ROLLvalue = ROLL:Get()
    fov1:Set(FOV1value)
    x1:Set(Xvalue)
    y1:Set(Yvalue)
    z1:Set(Zvalue)
    roll:Set(ROLLvalue)
end


--Fov
local party = Menu.Switch("Misc", "Enable Zeus Party", false)
local oneandthirdfov = Menu.Switch("Misc", "Enable First&Third Person Fov", false)
local ffov = Menu.SliderInt("Misc", "First Person Fov", 45, 0, 160)
local tfov = Menu.SliderInt("Misc", "Third Person Fov", 45, 0, 160)
local fovnow = Menu.FindVar("Visuals","View","Camera","FOV")
function fov()
    local tof2 = oneandthirdfov:Get()
    local firstfov = ffov:Get()
    local thirdfov = tfov:Get()
    local binds = Cheat.GetBinds()
    if tof2 == true then
        thirdperson = 0
        ffov:SetVisible(true)
        tfov:SetVisible(true)
        for i = 1, #binds do
            if binds[i]:GetName() == "Enable Thirdperson" then
            thirdperson = 1
            end
        end
        if thirdperson == 1 then
            fovnow:Set(thirdfov)
        else
            fovnow:Set(firstfov)
        end
    else
        ffov:SetVisible(false)
        tfov:SetVisible(false)
    end
end

function zeus()
    local enablezeus = party:Get()
    local cvar = CVar.FindVar("sv_party_mode")
    if enablezeus == true then
        local var = cvar:SetInt(1)
    else
        local var2 = cvar:SetInt(0)
    end
end

function misc()
    viewmodel()
    fov()
	doubletap()
    zeus()
end



--RegisterCallback
Cheat.RegisterCallback("pre_prediction",aa)
Cheat.RegisterCallback("draw", indicator)
Cheat.RegisterCallback("prediction", misc)
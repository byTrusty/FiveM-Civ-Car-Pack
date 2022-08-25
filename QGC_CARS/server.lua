-- Sets server list convar
SetConvarServerInfo('tags', 'QGC_CARS')
-- Setup for the version check
updatePath = "/byTrusty/FiveM-Civ-Car-Pack" -- your git user/repo path
-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "QGC_CARS" then
        print("-----------------------------------------------------")
        print("Please Dont Change the resource name to avoid errors.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'QGC_CARS' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("    _/    _/ _/_/_/  ║                   Hey there! Yeah you, thanks for using my car pack!")
                print("   _/  _/   _/    _/ ║")
                print("  _/_/     _/    _/  ║ Got stuck? or have a question? sucks to be you.")
                print(" _/  _/   _/    _/   ║")
                print("_/    _/ _/_/_/      ║                       Uh Oh! Looks like QGC_CARS is outdated")
                print("                     ║ should be: "..responseText..",currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("    _/    _/ _/_/_/  ║                   Hey there! Yeah you, thanks for using my car pack!")
                print("   _/  _/   _/    _/ ║")
                print("  _/_/     _/    _/  ║ Got stuck? or have a question? sucks to be you.")
                print(" _/  _/   _/    _/   ║")
                print("_/    _/ _/_/_/      ║                Uh Oh! You somehow skipped a few versions of QGC_CARS")
                print("                     ║  or the git went offline, if it's still online i advise you to update (or downgrade?)")
            else
                print("    _/    _/ _/_/_/  ║                   Hey there! Yeah you, thanks for using my car pack!")
                print("   _/  _/   _/    _/ ║")
                print("  _/_/     _/    _/  ║ Got stuck? or have a question? sucks to be you.")
                print(" _/  _/   _/    _/   ║")
                print("_/    _/ _/_/_/      ║                   It looks like QGC_CARS is up to date, have fun!")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/QGC_CARS/version", checkVersion, "GET")
end)


function HUDAssaultCorner:_get_assault_strings()
    local hud_assault_assault = "hud_assault_assault"
    local hud_phalanx = "hud_assault_vip"
    --kill me
	local level = managers.crime_spree:is_active() and managers.crime_spree:server_spree_level()
	local wave = managers.skirmish:is_skirmish() and managers.skirmish:current_wave_number()
	--crime spree
	if level then
		--HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA
		if level >= 1500 then
			hud_assault_assault = "cn_crime_spree_4"
			return {
				hud_assault_assault,
				hud_assault_assault
			}
		--I'M COMING FOR YOU
		elseif level >= 1250 then
			hud_assault_assault = "cn_crime_spree_3"
			hud_phalanx = "cn_crime_spree_3"
		--I SEE YOU
		elseif level >= 1000 then
			hud_assault_assault = "cn_crime_spree_2"
			hud_phalanx = "cn_crime_spree_2"
		end
	--skirmish
	elseif wave then
		if wave == 9 then
			hud_assault_assault = "cn_crime_spree_4"
			return {
				hud_assault_assault,
				hud_assault_assault
			}
		elseif wave == 8 then
			hud_assault_assault = "cn_crime_spree_3"
			hud_phalanx = "cn_crime_spree_3"
		elseif wave == 7 then
			hud_assault_assault = "cn_crime_spree_2"
			hud_phalanx = "cn_crime_spree_2"
		end
	end

	if self._assault_mode == "normal" then
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")

			return {
				hud_assault_assault,
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				hud_assault_assault,
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				hud_assault_assault,
				"hud_assault_end_line",
				hud_assault_assault,
				"hud_assault_end_line",
				hud_assault_assault,
				"hud_assault_end_line"
			}
		end
	end

	if self._assault_mode == "phalanx" then
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")

			return {
				hud_phalanx,
				"hud_assault_padlock",
				ids_risk,
				"hud_assault_padlock",
				hud_phalanx,
				"hud_assault_padlock",
				ids_risk,
				"hud_assault_padlock"
			}
		else
			return {
				hud_phalanx,
				"hud_assault_padlock",
				hud_phalanx,
				"hud_assault_padlock",
				hud_phalanx,
				"hud_assault_padlock"
			}
		end
	end
end
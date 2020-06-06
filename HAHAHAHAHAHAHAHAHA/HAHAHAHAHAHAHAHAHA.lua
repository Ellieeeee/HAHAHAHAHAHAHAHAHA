function HUDBlackScreen:_set_job_data_crime_spree()
    --thankfully no check required here for cs being active
    local level = managers.crime_spree:server_spree_level()
    local crime_spree_text = "cn_crime_spree"

    --HAHAHAHA
    if level >= 1400 then
        crime_spree_text = "cn_crime_spree_4"
        --HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA
        if level >= 1500 then
            local job_panel = self._blackscreen_panel:panel({
                y = 0,
                name = "job_panel",
                halign = "scale",
                visible = true,
                layer = 3,
                valign = "scale"
            })
            local job_text = job_panel:text({
                vertical = "top",
                align = "center",
                text = managers.localization:to_upper_text(crime_spree_text),
                font = tweak_data.menu.pd2_large_font,
                font_size = tweak_data.menu.pd2_large_font_size,
                color = Color(1, 0, 0),
                wrap = true,
                word_wrap = true
            })
        
            job_text:set_bottom(job_panel:h())
            job_text:set_center_x(job_panel:center_x())
            return
        end
    --I'M COMING FOR YOU
    elseif level >= 1250 then
        crime_spree_text = "cn_crime_spree_3"
    --I SEE YOU
    elseif level >= 1000 then
        crime_spree_text = "cn_crime_spree_2"
    end

    --unchanged from here on out
    --default shit, only change if highest
	local job_panel = self._blackscreen_panel:panel({
		y = 0,
		name = "job_panel",
		halign = "grow",
		visible = true,
		layer = 1,
		valign = "grow"
	})
	local job_text = job_panel:text({
		vertical = "bottom",
		align = "center",
		text = managers.localization:to_upper_text(crime_spree_text),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		color = tweak_data.screen_colors.crime_spree_risk
    })
	job_text:set_bottom(job_panel:h() * 0.5)
	job_text:set_center_x(job_panel:center_x())

	local risk_text = job_panel:text({
		vertical = "top",
		align = "center",
		text = managers.localization:to_upper_text("menu_cs_level", {
			level = managers.experience:cash_string(managers.crime_spree:server_spree_level(), "")
		}),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		color = tweak_data.screen_colors.crime_spree_risk
	})

	risk_text:set_top(job_panel:h() * 0.5)
	risk_text:set_center_x(job_panel:center_x())
end
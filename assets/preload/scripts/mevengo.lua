function onCreate()
runTimer('startText', 0.1);
end 
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		makeLuaSprite('blackscreen', 'blackscreen', 0, 0)
		setObjectCamera('blackscreen', 'hud')
		addLuaSprite('blackscreen', false)
		makeLuaSprite('circle', 'Circle', 777, 0)
		scaleObject('blackscreen', 35, 35)
		setObjectCamera('circle', 'game')
		addLuaSprite('circle', true)
		makeLuaSprite('text', 'TextAct1', -1200, 0)
		setObjectCamera('text', 'game')
		addLuaSprite('text', true)
		runTimer('appear', 0.6, 1)
		runTimer('fadeout', 1.9, 1)
		doTweenX('circletween', 'circle', 0, 1.5, 'elasticInOut')
		doTweenX('texttween', 'text', 0, 1.5, 'elasticInOut')
	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'elasticInOut')
		function onTweenCompleted(tag)
			if tag == 'blackfade' then
				doTweenAlpha('circlefade', 'circle', 0, 1, 'elasticInOut')
				doTweenAlpha('textfade', 'text', 0, 1, 'elasticInOut')
			end
		end
	end
end
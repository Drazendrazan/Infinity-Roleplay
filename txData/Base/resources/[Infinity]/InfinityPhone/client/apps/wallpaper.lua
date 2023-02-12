RegisterNUICallback( 'SaveWallpaper', function( data, cb )
	TriggerServerEvent('InfinityPhone:server:SaveWallpaper', 'SaveWallpaper', data.wallpaper)
end)
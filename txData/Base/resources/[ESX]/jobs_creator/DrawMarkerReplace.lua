_DrawMarker = DrawMarker
function DrawMarker(type, coords, ...)
    _DrawMarker(type, coords.x, coords.y, coords.z-0.95, ...)
end
  local screenW, screenH = guiGetScreenSize()
function CrearVentana()

 

 
   ventanaw = guiCreateWindow((screenW - 236) / 2, (screenH - 316) / 2, 236, 316, "Inventario Armas", false)
     guiWindowSetSizable(ventanaw, false)

    cerrarboton = guiCreateButton(191, 277, 35, 29, "X", false, ventanaw)
     guiSetProperty(cerrarboton, "NormalTextColour", "FFFC0214")
     lista = guiCreateGridList(9, 26, 207, 251, false, ventanaw)
     Columna =  guiGridListAddColumn(lista, "Arma", 0.5)
     LaMunicion = guiGridListAddColumn(lista, "Municion", 0.5)
     showCursor(true)

addEventHandler("onClientGUIClick",cerrarboton,toggleTest,false)
end

  
function toggleTest() 

    if ventanaw then
      destroyElement(ventanaw)
      showCursor(false)
      ventanaw = nil

    else
    CrearVentana()


     for slot = 0, 12 do 
            local weapon = getPedWeapon ( localPlayer, slot ) 
            if ( weapon > 0 ) then 
                local ammo = getPedTotalAmmo ( localPlayer, slot ) 
                if ( ammo > 0 ) then 
                  local armas = getWeaponNameFromID(weapon)
                  local nameJugador = getPlayerName(localPlayer)
                 
        row =  guiGridListAddRow ( lista)
      Grace =  guiGridListSetItemText ( lista, row, Columna, armas, false, false )
      Gratis =  guiGridListSetItemText ( lista, row, LaMunicion, ammo, false, false )


        end
    end
   end
  end
end


bindKey("i", "down", toggleTest) 



function MostrarPanel(user,name)
    CrearVentana(user)
end
addEvent("onPanel",true)
addEventHandler("onPanel",root,MostrarPanel)










local x,y,z = 2112.33203125, -1212.9495849609, 23.36505355835
 
addEventHandler("onClientRender",getRootElement(),
function()
    local px,py,pz = getElementPosition(localPlayer)
    local distance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
    if distance <= 6 then
        local sx,sy = getScreenFromWorldPosition ( x, y, z+0.95, 0.06 )
        if not sx then return end
       
      --  dxDrawText ( "/r", sx, sy - 5, sx, sy - 5, tocolor(255,255,255,255), math.min ( 0.4*(50/distance)*1.4,4), "default-bold", "center", "bottom", false, false, false )

        dxDrawText("Ropa", sx - 1, sy - 1, sx - 1, sy - 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Ropa", sx + 1, sy - 1, sx + 1, sy - 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Ropa", sx - 1, sy + 1, sx - 1, sy + 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Ropa", sx + 1, sy + 1, sx + 1, sy + 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Ropa", sx, sy, sx, sy, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    end
end
)



function Ocultar()
	setElementAlpha (localPlayer, 0 )
	setCameraMatrix (2117.2172851562, -1214.4173583984, 24.391599655151, 2117.2294921875, -1213.4193115234,24.452808380127)
	ped = createPed(0,2117.1745605469, -1212.0008544922,23.963663101196)
	       setElementRotation(ped,0,0,190)


				ventanaSkin = guiCreateWindow(469, 612, 343, 98, "", false)
				guiWindowSetSizable(ventanaSkin, false)
				guiSetAlpha(ventanaSkin, 0.8)

				labelID = guiCreateLabel(0.05, 0.22, 0.21, 0.16, "ID de Skin:", true, ventanaSkin)
				buttonIR = guiCreateButton(0.34, 0.53, 0.10, 0.22, "Ir", true, ventanaSkin)
				guiSetProperty(buttonIR, "NormalTextColour", "FFAAAAAA")
				--local SkinObtener = getElementModel(localPlayer)
				editSkin = guiCreateEdit(0.04, 0.49, 0.21, 0.22, "0", true, ventanaSkin)
				buttonComprar = guiCreateButton(0.54, 0.51, 0.22, 0.24, "Comprar", true, ventanaSkin)
				guiSetProperty(buttonComprar, "NormalTextColour", "FFAAAAAA")
                
				 
				botonDestruirTodo = guiCreateButton(0.90, 0.69, 0.07, 0.20, "X", true, ventanaSkin)
				guiSetProperty(botonDestruirTodo, "NormalTextColour", "FFAAAAAA")
				showCursor(true)

				addEventHandler("onClientGUIClick",botonDestruirTodo,RomperVentana,false)

				addEventHandler("onClientGUIClick",buttonIR,
				 function ()
				 IDSkin = tonumber(guiGetText(editSkin))
			       if IDSkin then
							setElementModel(ped,IDSkin)
							print(ped,IDSkin)
						else
					 		outputChatBox("No encuentro esa skin.",255,0,0,true)
					 	end
					  end,false)


				addEventHandler("onClientGUIClick",buttonComprar,
				 function ()
			          if IDSkin then
							triggerServerEvent("Cambiar:Skin",localPlayer,IDSkin)
						else
							outputChatBox("¡Debes de colocar una skin!",255,0,0,true)
						end
					end,false)

end

addEvent("Skin:Client",true)
addEventHandler("Skin:Client",localPlayer,Ocultar)





function RomperVentana( )
	setElementData(source,"comprar",false)
	showCursor(false)
	guiSetVisible(ventanaSkin,false)
	setCameraTarget(localPlayer)
	
	destroyElement(ped)

	
		setElementAlpha (localPlayer, 255 )

end
addEvent("Cerrar:Ventana",true)
addEventHandler("Cerrar:Ventana",localPlayer,RomperVentana)


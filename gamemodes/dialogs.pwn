#include <a_samp>
#include <Pawn.CMD>
#include <cef>
#include <sscanf2>

main(){}


forward CefDialogs(player_id);
forward OnCefDialogResponse(player_id, const button_click[]);
new browser;

public OnGameModeInit()
{
	cef_subscribe("dialog:on", "CefDialogs");
	cef_subscribe("dialog:off", "CefDialogsClosed");
	
	//dialogs buttons
    cef_subscribe("dialog:button", "OnCefDialogResponse");
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}


public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
    ShowPlayerDialogCEF(playerid, 1, "http://royzenvo.beget.tech/dialogs/", "Тестовый диалог", "Статистика игрока","Кнопка 2", "Кнопка 3", "Кнопка 4", "Кнопка 5", "Кнопка 6");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}
public CefDialogs(player_id)
{
	new names[90], button1[60], button2[60], button3[60], button4[60], button5[60], button6[60];
	GetPVarString(player_id, "name", names, sizeof(names));
	SendClientMessage(player_id, -1, names);
	GetPVarString(player_id, "button1", button1, sizeof(button1));
	GetPVarString(player_id, "button2", button2, sizeof(button2));
	GetPVarString(player_id, "button3", button3, sizeof(button3));
	GetPVarString(player_id, "button4", button4, sizeof(button4));
	GetPVarString(player_id, "button5", button5, sizeof(button5));
	GetPVarString(player_id, "button6", button6, sizeof(button6));
	cef_emit_event(player_id, "dialog:all", CEFSTR("Тестовый диалог"),
	CEFSTR(button1),
	CEFSTR(button2),
	CEFSTR(button3),
	CEFSTR(button4),
	CEFSTR(button5),
	CEFSTR(button6));
}
forward CefDialogsClosed(player_id);
public CefDialogsClosed(player_id)
{
	cef_hide_browser(player_id, browser, true);
	cef_focus_browser(player_id, browser, false);
}
public OnCefDialogResponse(player_id, const button_click[])
{
  	new resp;

  	sscanf(button_click, "i", resp);

	if(resp == 0)
	{
	    SendClientMessage(player_id, -1, "Вы нажали на кнопку 0");
	}
	if(resp == 1)
	{
	    SendClientMessage(player_id, -1, "Вы нажали на кнопку 1");
	}
	if(resp == 2)
	{
	    SendClientMessage(player_id, -1, "Вы нажали на кнопку 2");
	}
	if(resp == 3)
	{
	    SendClientMessage(player_id, -1, "Вы нажали на кнопку 3");
	}
	if(resp == 4)
	{
	    SendClientMessage(player_id, -1, "Вы нажали на кнопку 4");
	}
	if(resp == 5)
	{
	    SendClientMessage(player_id, -1, "Вы нажали на кнопку 5");
	}
}
stock ShowPlayerDialogCEF(player_id, browser_id, url[], name_dialog[], button_server_one[],button_server_two[], button_server_three[], button_left_one[], button_left_two[], button_left_three[])
{
	SetPVarString(player_id, "name", name_dialog);
	SetPVarString(player_id, "button1", button_server_one);
	SetPVarString(player_id, "button2", button_server_two);
	SetPVarString(player_id, "button3", button_server_three);
	SetPVarString(player_id, "button4", button_left_one);
	SetPVarString(player_id, "button5", button_left_two);
	SetPVarString(player_id, "button6", button_left_three);
	browser = browser_id;
	//create browser + event callback
	cef_create_browser(player_id, browser_id, url, false, true);
	/*cef_emit_event(player_id, "dialog:button_server_one", CEFSTR(button_server_one));
	cef_emit_event(player_id, "dialog:button_server_two", CEFSTR(button_server_two));
	cef_emit_event(player_id, "dialog:button_server_three", CEFSTR(button_server_three));
	cef_emit_event(player_id, "dialog:button_left_one", CEFSTR(button_left_one));
	cef_emit_event(player_id, "dialog:button_left_two", CEFSTR(button_left_two));
	cef_emit_event(player_id, "dialog:button_left_three", CEFSTR(button_left_three));
	cef_emit_event(player_id, "dialog:name", CEFSTR(name));*/
	return true;
}

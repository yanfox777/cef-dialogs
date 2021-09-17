#include <a_samp>
#include <Pawn.CMD>
#include <cef>
#include <sscanf2>

main(){}


forward CefDialogs(player_id);
forward OnCefDialogResponseList(player_id, const button_click[]);
forward OnCefDialogResponseInput(player_id, const button_click[]);
forward CefDialogsInput(player_id);
forward CefDialogsMsg(player_id);
forward OnCefDialogResponseMsg(player_id, const button_click[]);
new browser;
enum info_player
{
	dialog_id_online, //диалог в котором сейчас игрок.

}
new inf[MAX_PLAYERS][info_player];
enum dialog_params
{
	dialog_name[60],
	dialog_text[240],
	dialog_button1[60],
	dialog_button2[60],
	dialog_button3[60],
	dialog_button4[60],
	dialog_button5[60],
	dialog_button6[60],
	dialog_button7[60],
	dialog_button8[60],
	dialog_button9[60],
	dialog_button10[60],
	dialog_button11[60],
}
new dialog[MAX_PLAYERS][dialog_params];
public OnGameModeInit()
{
	cef_subscribe("dialog:on", "CefDialogs");
	cef_subscribe("dialog:off", "CefDialogsClosed");
	
	cef_subscribe("msg:on", "CefDialogsMsg");
	cef_subscribe("msg:response", "OnCefDialogResponseMsg");
	cef_subscribe("input:on", "CefDialogsInput");
	cef_subscribe("input:response", "OnCefDialogResponseInput");
	//dialogs buttons
    cef_subscribe("dialog:button", "OnCefDialogResponseList");
	SetGameModeText("dialogs news");
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
    DestroyDialogs(playerid, 1);
	return 1;
}

public OnPlayerSpawn(playerid)
{
    //ShowPlayerDialogCEF(playerid, 1,1, "http://royzenvo.beget.tech/dialogs/", "Тестовый диалог", "Статистика игрока","Настройки", "Донат",
	//"Репорт", "Лист наказаний", "кнопка 6", "кнопка 7", "кнопка 8", "кнопка 9", "кнопка 10", "кнопка 11");
	//ShowPlayerDialogCEFI(playerid, 0, 2, "http://royzenvo.beget.tech/dialogs/input/", "Всем привет дорогие мошенники. С вами гриша!", ">>", "Закрыть");
	ShowPlayerDialogCEFM(playerid, 2, 3, "http://royzenvo.beget.tech/dialogs/msg/", "Тестовый заголовок", "Важная информация что аккаунт удален", ">>", "Закрыть");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}
public CefDialogs(player_id)
{
	SendClientMessage(player_id, -1, dialog[dialog_name]);
	//одним сообщением не отправляется , пришлось разделить. ( разницы не меняет )
	cef_emit_event(player_id, "dialog:button_server_one", CEFSTR(dialog[player_id][dialog_button1]));
	cef_emit_event(player_id, "dialog:button_server_two", CEFSTR(dialog[player_id][dialog_button2]));
	cef_emit_event(player_id, "dialog:button_server_three", CEFSTR(dialog[player_id][dialog_button3]));
	cef_emit_event(player_id, "dialog:button_server_four", CEFSTR(dialog[player_id][dialog_button4]));
	cef_emit_event(player_id, "dialog:button_server_five", CEFSTR(dialog[player_id][dialog_button5]));
	cef_emit_event(player_id, "dialog:button_server_six", CEFSTR(dialog[player_id][dialog_button6]));
	cef_emit_event(player_id, "dialog:button_server_seven", CEFSTR(dialog[player_id][dialog_button7]));
	cef_emit_event(player_id, "dialog:button_server_eight", CEFSTR(dialog[player_id][dialog_button8]));
	cef_emit_event(player_id, "dialog:button_server_nine", CEFSTR(dialog[player_id][dialog_button9]));
	cef_emit_event(player_id, "dialog:button_server_eleven", CEFSTR(dialog[player_id][dialog_button10]));
	cef_emit_event(player_id, "dialog:button_server_twelve", CEFSTR(dialog[player_id][dialog_button11]));
	cef_emit_event(player_id, "dialog:name", CEFSTR(dialog[dialog_name]));
}
forward CefDialogsClosed(player_id);
public CefDialogsClosed(player_id)
{
	cef_hide_browser(player_id, browser, true);
	cef_focus_browser(player_id, browser, false);
	cef_destroy_browser(player_id, browser);
}
public OnCefDialogResponseInput(player_id, const button_click[])
{
	new resp,str[156];
	sscanf(button_click, "is[156]", resp, str);
	if(inf[player_id][dialog_id_online] == 0)
	{
		switch(resp)
		{
		    case 0:
		    {
		    	SendClientMessage(player_id, -1, str);
		    	SendClientMessage(player_id, -1, "Вы нажали на кнопку 0");
		    }
		    case 1:
		    {
		    	SendClientMessage(player_id, -1, "Вы нажали на кнопку 1 . Данная кнопка предусмотрена для закрытия.");
		    }
		}
	}
}
public CefDialogsInput(player_id)
{
	cef_emit_event(player_id, "input:info", CEFSTR(dialog[player_id][dialog_name]),CEFSTR(dialog[player_id][dialog_button1]), CEFSTR(dialog[player_id][dialog_button2]));
}
public OnCefDialogResponseList(player_id, const button_click[])
{
  	new resp;

  	sscanf(button_click, "i", resp);

	//принимаем нажатие и обрабатываем их ( всего 8 кнопок , начало идет с 0 )
	if(	inf[player_id][dialog_id_online] == 1)
	{
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
		if(resp == 6)
		{
		    SendClientMessage(player_id, -1, "Вы нажали на кнопку 6");
		}
		if(resp == 7)
		{
		    SendClientMessage(player_id, -1, "Вы нажали на кнопку 7");
		}
		if(resp == 8)
		{
		    SendClientMessage(player_id, -1, "Вы нажали на кнопку 8");
		}
		if(resp == 9)
		{
		    SendClientMessage(player_id, -1, "Вы нажали на кнопку 9");
		}
	}
}
public CefDialogsMsg(player_id)
{
	cef_emit_event(player_id, "msg:info", CEFSTR(dialog[player_id][dialog_name]),CEFSTR(dialog[player_id][dialog_text]), CEFSTR(dialog[player_id][dialog_button1]), CEFSTR(dialog[player_id][dialog_button2]));
}
public OnCefDialogResponseMsg(player_id, const button_click[])
{
  	new resp;

  	sscanf(button_click, "i", resp);

	//принимаем нажатие и обрабатываем их ( всего 8 кнопок , начало идет с 0 )
	if(	inf[player_id][dialog_id_online] == 2)
	{
	    switch(resp)
	    {
	        case 0:
	        {
		    	SendClientMessage(player_id, -1, "Вы нажали на кнопку 0");
	        }
	        case 1:
	        {
		    	SendClientMessage(player_id, -1, "Вы нажали на кнопку 1");
	        }
	    }
	
	}
}
stock ShowPlayerDialogCEFM(player_id, id_dialog, browser_id, url[], head_info[], text_info[], button1[], button2[])
{
	strins(dialog[player_id][dialog_name], head_info, 0);
	strins(dialog[player_id][dialog_text], text_info, 0);
	strins(dialog[player_id][dialog_button1], button1, 0);
	strins(dialog[player_id][dialog_button2], button2, 0);
	inf[player_id][dialog_id_online] = id_dialog;
	cef_create_browser(player_id, browser_id, url, false, true);
}
stock ShowPlayerDialogCEFI(player_id, id_dialog, browser_id, url[], text_info[], button1[], button2[])
{
	strins(dialog[player_id][dialog_name], text_info, 0);
	strins(dialog[player_id][dialog_button1], button1, 0);
	strins(dialog[player_id][dialog_button2], button2, 0);
	inf[player_id][dialog_id_online] = id_dialog;
	cef_create_browser(player_id, browser_id, url, false, true);
}
stock DestroyDialogs(player_id, browser_id)
{
	strins(dialog[player_id][dialog_name], "", 0);
	strins(dialog[player_id][dialog_button1], "", 0);
	strins(dialog[player_id][dialog_button2], "", 0);
	strins(dialog[player_id][dialog_button3], "", 0);
	strins(dialog[player_id][dialog_button4], "", 0);
	strins(dialog[player_id][dialog_button5], "", 0);
	strins(dialog[player_id][dialog_button6], "", 0);
	strins(dialog[player_id][dialog_button7], "", 0);
	strins(dialog[player_id][dialog_button8], "", 0);
	strins(dialog[player_id][dialog_button9], "", 0);
	strins(dialog[player_id][dialog_button10], "", 0);
	strins(dialog[player_id][dialog_button11], "", 0);
	cef_destroy_browser(player_id, browser_id);
}
stock ShowPlayerDialogCEF(player_id, id_dialog, browser_id, url[], name_dialog[], button_server_one[],button_server_two[], button_server_three[],
button_server_four[], button_server_five[],button_server_six[],button_server_seven[],button_server_eight[],
button_server_nine[], button_server_eleven[], button_server_twelve[])
{
	strins(dialog[player_id][dialog_name], name_dialog, 0);
	strins(dialog[player_id][dialog_button1], button_server_one, 0);
	strins(dialog[player_id][dialog_button2], button_server_two, 0);
	strins(dialog[player_id][dialog_button3], button_server_three, 0);
	strins(dialog[player_id][dialog_button4], button_server_four, 0);
	strins(dialog[player_id][dialog_button5], button_server_five, 0);
	strins(dialog[player_id][dialog_button6], button_server_six, 0);
	strins(dialog[player_id][dialog_button7], button_server_seven, 0);
	strins(dialog[player_id][dialog_button8], button_server_eight, 0);
	strins(dialog[player_id][dialog_button9], button_server_nine, 0);
	strins(dialog[player_id][dialog_button10], button_server_eleven, 0);
	strins(dialog[player_id][dialog_button11], button_server_twelve, 0);
	browser = browser_id;
	inf[player_id][dialog_id_online] = id_dialog;
	cef_create_browser(player_id, browser_id, url, false, true);
	return true;
}

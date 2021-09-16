const DIALOG_PAKET_TRUE  = 1;
const DIALOG_PAKET_FALSE = 0;

let button_server_1 = document.querySelector('.text_server1');
let button_server_2 = document.querySelector('.text_server2');
let button_server_3 = document.querySelector('.text_server3');
let button_left_1 = document.querySelector('.text_left1');
let button_left_2 = document.querySelector('.text_left2');
let button_left_3 = document.querySelector('.text_left3');
let name_dialog = document.querySelector('.names_dialogs');

cef.emit('dialog:on');

cef.on('dialog:all', (name, button_server_one, button_server_two, button_server_three, button_left_one, button_left_two, button_left_three)  => {
    name_dialog.InnerHTML = name;
    button_server_1.innerHTML = button_server_one;
    button_server_2.innerHTML = button_server_two;
    button_server_3.innerHTML = button_server_three;

});
//Функция нажатия кнопочек )  
/*
                Передаем игру значения нажатых кнопок  .
                Начинать нужно с 0 т.к в коде в pawn начато с 0.
                После передачи в паблике в игре OnCefDialogResponse там будут обрабатываться запросы.

                Стили диалогов:
                DIALOG_STYLE_MENU - меню с 3  кнопками по середине и с 3 по бокам.
                DIALOG_STYLE_MENU_INPUT - диалог для ввода текста ( не реализован )
                DIALOG_STYLE_MENU_LIST - диалог с выбором ( не реализован )
                DIALOG_STYLE_MENU_MSG - диалог для текстов ( не реализован )

*/
function ButtonClick(event)
{
    if(event == 0)
    {
            cef.emit('dialog:button', 0);
    }
    if(event == 1)
    {
            cef.emit('dialog:button', 1);
    }
    if(event == 2)
    {
            cef.emit('dialog:button', 2);
    }
    if(event == 3)
    {
            cef.emit('dialog:button', 3);
    }
    if(event == 4)
    {
            cef.emit('dialog:button', 4);
    }
    if(event == 5)
    {
            cef.emit('dialog:button', 5);
    }
}

function ButtonExit(event)
{
        cef.hide(true);
        cef.set_focus(false);
}
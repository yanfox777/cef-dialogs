



const DIALOG_PAKET_TRUE  = 1;
const DIALOG_PAKET_FALSE = 0;


let button_server = document.getElementById('text_1');
let button_server_1 = document.getElementById('text_2');
let button_server_2 = document.getElementById('text_3');
let button_server_3 = document.getElementById('text_4');
let button_server_4 = document.getElementById('text_5');
let button_server_5 = document.getElementById('text_6');
let button_server_6 = document.getElementById('text_7');
let button_server_7 = document.getElementById('text_8');
let button_server_8  = document.getElementById('text_9');
let button_server_9 = document.getElementById('text_10');
let button_server_10  = document.getElementById('text_11');

let button_left_1 = document.querySelector('.text_left1');
let button_left_2 = document.querySelector('.text_left2');
let button_left_3 = document.querySelector('.text_left3');


let name_dialog =  document.getElementById('name_sys');

cef.emit('dialog:on');

cef.on('dialog:all', (
        names_server,
        button_server_one, 
        button_server_two, 
        button_server_three, 
        button_server_four,
        button_server_five,
        button_server_six,  
        button_server_seven,
        button_server_eight, 
        button_server_nine)  => 
        {
                                name_dialog.InnerHTML = names_server;
                                button_server.innerHTML = button_server_one;
                                button_server_1.innerHTML = button_server_two;
                                button_server_2.innerHTML = button_server_three;
                                button_server_3.innerHTML = button_server_four;
                                button_server_4.innerHTML = button_server_five;
                                button_server_5.innerHTML = button_server_six;
                                button_server_6.innerHTML = button_server_seven;
                                button_server_7.innerHTML = button_server_eight;
                                button_server_8.innerHTML = button_server_nine;
});
cef.on('dialog:name',  (name_d) => {
                name_dialog.innerHTML = name_d;
});
cef.on('dialog:button_server_one', (response) => {
        button_server.innerHTML = response;                
});
cef.on('dialog:button_server_two', (response) => {
        button_server_1.innerHTML = response;                
});
cef.on('dialog:button_server_three', (response) => {
        button_server_2.innerHTML = response;                
});
cef.on('dialog:button_server_four', (response) => {
        button_server_3.innerHTML = response;                
});
cef.on('dialog:button_server_five', (response) => {
        button_server_4.innerHTML = response;                
});
cef.on('dialog:button_server_six', (response) => {
        button_server_5.innerHTML = response;                
});
cef.on('dialog:button_server_seven', (response) => {
        button_server_6.innerHTML = response;                
});
cef.on('dialog:button_server_eight', (response) => {
        button_server_7.innerHTML = response;                
});
cef.on('dialog:button_server_nine', (response) => {
        button_server_8.innerHTML = response;                
});
cef.on('dialog:button_server_eleven', (response) => {
        button_server_9.innerHTML = response;                
});
cef.on('dialog:button_server_twelve', (response) => {
        button_server_10.innerHTML = response;                
});
//Функция нажатия кнопочек )  
/*
                Передаем игру значения нажатых кнопок  .
                Начинать нужно с 0 т.к в коде в pawn начато с 0.
                После передачи в паблике в игре OnCefDialogResponse там будут обрабатываться запросы.

                Стили диалогов:
                DIALOG_STYLE_MENU - меню с 8  кнопками по середине и с 3 по бокам.
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
    if(event == 6)
    {
            cef.emit('dialog:button', 6);
    }
    if(event == 7)
    {
            cef.emit('dialog:button', 7);
    }
}

function ButtonExit()
{
        cef.hide(true);
        cef.set_focus(false);
}

let id_head = document.getElementById('head_msg');
let id_msg   = document.getElementById('text_msg');
let btn1 =  document.getElementById('btn1');
let btn2 =  document.getElementById('btn2');


cef.emit('msg:on');
cef.on('msg:info', (title, str, button1, button2) => {
            id_head.innerHTML    =   title;
            id_msg.innerHTML      =   str;
            btn1.innerHTML            =    button1;
            btn2.innerHTML           =    button2;
            
});
function ExitButton()
{
        cef.hide(true);
        cef.set_focus(false);
        return 1;
}

function SelectButtonClick(event)
{
        if(event == 0)
        {
            cef.emit('msg:response', 0);
        }else if(event == 1)
        {
            cef.emit('msg:response', 1);
        }
}
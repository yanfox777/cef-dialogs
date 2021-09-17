let  input_text   = document.getElementById('text_input');
let text_position = document.getElementById('text_info');
let btn_text_1 = document.getElementById('btn_1');
let btn_text_2 = document.getElementById('btn_2');


cef.emit('input:on');

cef.on('input:info', (text_info, button1, button2) =>{
            text_position.innerHTML         =           text_info;
            btn_text_1.innerHTML                =           button1;
            btn_text_2.innerHTML                =           button2;           
});
function SelectClickButton(event)
{
    if(event == 0)
    {    
            let text = input_text.value;
            //предусмотрена для скриптов 
            cef.emit('input:response', 0, text);
            //cef.emit('input:value', input_text.value);
    }
    if(event == 1)
    {
            //Предусмотрена для закрытия, а не как для скриптов 
            cef.emit('input:response', 1, text);
           // cef.emit('input:value', input_text.value);
    }
}
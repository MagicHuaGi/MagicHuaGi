text()

function text()

dim a

a=InputBox("即将开始刷频，请输入密码")

if a="577585"then

Msgbox"即将开始刷频",0,"输入成功"

else

Msgbox"密码错误",0,"再来一次"

text()

end if

end function

dim j

do while j<1

Select Case msgbox("确定吗？",68,"请郑重的回答我")

Case 6 j=1

Case 7 msgbox("你可以通过任务管理器关闭。")

end Select

loop

msgbox("即将开始。")

Set WshShell= WScript.CreateObject("WScript.Shell")

WshShell.AppActivate " "

for i=1 to 500

WScript.Sleep 500

WshShell.SendKeys "^v"

WshShell.SendKeys i

WshShell.SendKeys "%s"

Next
text()

function text()

dim a

a=InputBox("������ʼˢƵ������������")

if a="577585"then

Msgbox"������ʼˢƵ",0,"����ɹ�"

else

Msgbox"�������",0,"����һ��"

text()

end if

end function

dim j

do while j<1

Select Case msgbox("ȷ����",68,"��֣�صĻش���")

Case 6 j=1

Case 7 msgbox("�����ͨ������������رա�")

end Select

loop

msgbox("������ʼ��")

Set WshShell= WScript.CreateObject("WScript.Shell")

WshShell.AppActivate " "

for i=1 to 500

WScript.Sleep 500

WshShell.SendKeys "^v"

WshShell.SendKeys i

WshShell.SendKeys "%s"

Next
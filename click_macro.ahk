SetTimer Click, 100
F8::Toggle := !Toggle
MyCount = 0
Click:
    If (!Toggle)
        Return
    Click
    Send a
    MyCount +=1
    If (MyCount >9)
        Return
return
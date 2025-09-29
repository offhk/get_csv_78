f1::

loop, 11
    {
    allSelection%A_Index% := []
    }
; allSelection1 := [33,44]
; allSelection1 := []
; allSelection2 := []


url_78csv := "https://docs.google.com/spreadsheets/d/e/2PACX-1vQUzYHuycnwsFix3k4v76cPIiNJQhlBvTVqj7LoHhsiq44KsEl4X4AQCEBxOGn2ibMp31D0fVLyjSDH/pub?gid=1272286978&single=true&output=csv"

csv78List := URLDownloadToVar(url_78csv)


Loop, 99
    {    
    RegExMatch(csv78List, "s)iz\d+\,(\d+)\,(\d+)\,(\d+)\,(\d+)\,(\d+)", data)
    if (data != "")
        {
        ; msgbox,,,  %data% `n`n  %data1%  %data2% `n`n `n`n %csv78List%, .1
        ; msgbox,,, %data%, .02
        StringReplace, csv78List, csv78List, %data%
        allSelection%data1%.Push(data2)
        }
    else
        {
        msgbox,,, end of line, 0.5
        break
        }

    }


    for k, v in allSelection1
    {
    msgbox,,, % v 
    }


    for k, v in allSelection2        
    {
    msgbox,,, % v 
    }

    for k, v in allSelection3        
    {
    msgbox,,, % v 
    }
; msgbox,,, % allSelection1[1]
; msgbox,,, % allSelection1[2]
; msgbox,,, % allSelection1[3]
; ; FileAppend, %hseCodeList%, %A_ScriptDir%\tcp_test.txt

return




;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

URLDownloadToVar(url){
	obj:=ComObjCreate("WinHttp.WinHttpRequest.5.1"),obj.Open("GET",url),obj.Send()
	return obj.status=200?obj.ResponseText:""
}

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


alt & esc:: reload
f1::

url_78csv := "https://docs.google.com/spreadsheets/d/e/2PACX-1vQUzYHuycnwsFix3k4v76cPIiNJQhlBvTVqj7LoHhsiq44KsEl4X4AQCEBxOGn2ibMp31D0fVLyjSDH/pub?gid=1272286978&single=true&output=csv"

; whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
; whr.Open("GET", url_78csv, true)
; whr.Send()
; whr.WaitForResponse()
; csv78List := ""
; csv78List := whr.ResponseText

; MsgBox, , , %csv78List%
    csv78List := URLDownloadToVar(url_78csv)

; MsgBox,,, %csv78List%, 1


Loop, 99
    {    
    RegExMatch(csv78List, "s)iz\d+\,(\d+)\,(\d+)\,(\d+)\,(\d+)\,(\d+)", data)
    ; if (data1 < 12)
        ; {
        msgbox,,,  %data% `n`n  %data1%  %data2% `n`n `n`n %csv78List%, .5
        StringReplace, csv78List, csv78List, %data%
        ; }
    ; elseif (data1 > 12)
    ;     {
    ;     msgbox,,,  end of selection `n %data1%
    ;     exitApp
    ;     }
    }

; Loop
; {
;     FileReadLine, line,  %csv78List%, %A_Index%
;     if ErrorLevel
;         break
;     MsgBox, 4, , Line #%A_Index% is "%line%".  Continue?
;     IfMsgBox, No
;         return
; }
; MsgBox, The end of the file has been reached or there was a problem.
; return


















; Loop, read, %csv78List%
; {
; MsgBox,,, this %A_LoopReadLine%
;     ; Loop, parse, A_LoopReadLine, `,
;     ; {
;     ;     MsgBox, Field number %A_Index% is %A_LoopField%.
;     ; }
; }

; ; RegExMatch(csv78List, "s)\\n(" rcloop ")\\t(" hsenum ")\\t([0])\\t([^0]\d+)\\t(" prc ")\\t(0)/(60)", pp_tkt)

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


FileDelete, %A_ScriptDir%\selection_all.txt

f1::

url_78csv := "https://docs.google.com/spreadsheets/d/e/2PACX-1vQUzYHuycnwsFix3k4v76cPIiNJQhlBvTVqj7LoHhsiq44KsEl4X4AQCEBxOGn2ibMp31D0fVLyjSDH/pub?gid=1272286978&single=true&output=csv"

csv78List := URLDownloadToVar(url_78csv)

;-------------------------------------------------------------------------------------------------------------------------------------------------


loop, 11
    {
    allSelection%A_Index% := []
    }


Loop, 99
    {    
    RegExMatch(csv78List, "s)iz\d+\,(\d+)\,(\d+)\,(\d+)\,(\d+)\,(\d+)", data)
    if (data != "")
        {
        StringReplace, csv78List, csv78List, %data%
        allSelection%data1%.Push(data2)        
        }
    else
        {
        msgbox,,, end of line, 0.5
        break
        }

    }


loop, 11
{
; Store sorted result in data1, data2, etc.
data%A_Index% := InsertionSort(allSelection%A_Index%)

currentData := data%A_Index%

sorted := ""
for k, v in currentData
    {
    ; msgbox,,, % v 
    sorted .= v ","
    }

; , - match a comma
; $ - at the end of the string
sorted_modify := ""
sorted_modify := RegExReplace(sorted, ",$", "*")

rc_ := ""
rc_ .= "rc" . A_Index
; msgbox, % sorted
FileAppend, % rc_ " : " sorted_modify "`n", %A_ScriptDir%\selection_all.txt

}

return

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


InsertionSort(arr) {
    ; Make a copy of the array to avoid modifying original
    sorted := []
    for i, val in arr
        sorted.Push(val)
    
    ; Insertion sort algorithm
    for i, val in sorted {
        if (i = 1)
            continue
        j := i - 1
        while (j >= 1 && sorted[j] > val) {
            sorted[j+1] := sorted[j]
            j--
        }
        sorted[j+1] := val
    }
    return sorted
}

; InsertionSort(ar)
; {
; 	For i, v in ar
; 		list .=	v ","
; 	list :=	Trim(list,",")
; 	Sort, list, N D`,
; 	out :=	[]
; 	Loop, parse, list, `,
; 		out.Push(A_LoopField)
; 	Return	out
; }

;=================================================================================================================================================

URLDownloadToVar(url){
	obj:=ComObjCreate("WinHttp.WinHttpRequest.5.1"),obj.Open("GET",url),obj.Send()
	return obj.status=200?obj.ResponseText:""
}

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


alt & esc:: reload
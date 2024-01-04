;By Sangwoo. 2015.


pro ana_all_new

	;path = DIALOG_PICKFILE(TITLE='Select Working Directory', /DIRECTORY)
	path = 'D:\Jingzhou\070923\'

	filelist = FILE_SEARCH(path, '*.pma', COUNT=file_number, /EXPAND_ENVIRONMENT)

	xdisplayFile, '', TEXT=(STRING(file_number)+ " files are found."), RETURN_ID=display_ID, WTEXT=text_ID


	for j = 0, file_number - 1 do begin

    	filelist(j) = strmid(filelist(j), 0, strlen(filelist(j)) - 4)

		if FILE_TEST(filelist(j) + ".pks") eq 0 then begin								; .pks file doesn't exist.
        	WIDGET_CONTROL, text_ID, SET_VALUE=("Working on (" + STRING(j) + ") : " + filelist(j) + ".pma"), /APPEND
			p_nxgn1_ffp, filelist(j)		; .pks file generator
			;p_nxgn1_ffp_brief, filelist(j)

		endif

		if FILE_TEST(filelist(j) + ".traces") eq 0 then begin							; .traces file doesn't exist.
        	p_nxgn1_ap, filelist(j)			; .traces file generator
        endif

       	if FILE_TEST(filelist(j) + ".movies") eq 0 then begin							; .movies file doesn't exist.
        	;smb_peakmovie_maker, filelist(j)			; .movies file generator
        endif

	endfor

	WIDGET_CONTROL, text_ID, SET_VALUE="Done. End of ana_all. Byebye.", /APPEND

end

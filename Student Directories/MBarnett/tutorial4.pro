;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!

pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
     ;the above function just reads in
     ;strings from the text file clues.txt
     ;we'll learn more about this next week
     
     ;please avoid simply printing clues to
     ;get an idea of what the strings 
     ;look like. The idea is to work with the
     ;functions within idl.

     ;FOLLOW THE FOLLOWING INSTRUCTIONS AND CONCATENATE THE RESULTS OF EACH INTO AN ARRAY
     
     ;1. extract the first letter of the first string in clues and make it
     ;   lowercase (use strlowcase)
 
     start = strlowcase(strmid(clues[0],0,1)) ;this should have taken the first letter from the
;first word of the first string and make it lowercase!

     ;2. find the string containing the substring 'og' and extract it from that string
    
     find_og = strpos(clues, 'og', 0) ;tells me which position og is in
    for i=0, n_elements(find_og)-1 do begin
       if find_og[i] GT -1 then begin
         start +=  strmid(clues[i], find_og[i], 2) ;extracts og from its position in the clues string, links it to starting first letter
    endif

    endfor


       
     ;3. add in an '_'
    
    start += '_' ;adds an _ to my pre-existing string, creating a bigger string
    

     ;4. find the string containing 'ate' and extract 3 letters from the p on
    
    find_ate = where(strpos(clues, 'ate', 0) GE 0) ;finds position of ate in the big string

    wheresp = strpos(clues(find_ate), 'p') ;finds position of p in the string that ate is in (I hope)
   start += strmid(clues(find_ate), wheresp, 3) ;uses position of p to start at that position and then take the next 3 letters of the string that contains ate and add it to big string

    print, start

    
    
    
     ;5. find the string containing 'x' and extract the first two letters
    
    find_x = where(strpos(clues, 'x', 0) GE 0) ;finds position of x in string
    start += strmid(clues(find_x), 0, 2) ;uses position of x in string to take first two letters and add it to big string
     ;6. use strjoin to collape your array into a single string
                                ;avoided doing this by adding the
                                ;strings as I went (I thought it was easier)

     ;7. use repstr to replace the second o in your string with ''
     ;   (try using the /reverse_search option in strpos)      
     
     lookingforsecondo = strpos(start, 'o', /reverse_search) ;this finds the position of the second o by searching backwards through the string (I guess there were only two o's?)
     start = strmid(start, 0, lookingforsecondo) + repstr(strmid(start, lookingforsecondo), 'o', '');splits final string into the part before the second o and the part after the second o, then adds them back together once the second o has been changed to ''(didn't want to change 1st o)

     ;8. add in a '.pro'

     start = start + '.pro' ;adds .pro to final string
     ;9. print your string and go find the file  in /home/jzalesky/public_html
     ;   and open it in emacs

     print, start ;prints my string answer

;Lumberjack fantasies have me oggling axes with less prudent intentions. Don't
;judge me for finding an amusing way to incorporate the word axes.

   
end     

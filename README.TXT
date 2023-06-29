T H I N G Y
made by necrosaro
(radimvice@geocities.com)


WHATS NEW
---------
Version 1.01- Yay, Thingy has released version 1 because I doubt I'll be
             releasing any new versions unless I create an entirely new
             program (which isn't completely out of the question).
             And the .01 is because it's the year 2001!
             3 YEARS since the last release! How's that for laziness!
             I really have no idea what's new in this one, random fixes I've
             applied to my personal Thingy over the past three years
             (no innuendo intended!).
            - Pointer-based script dumping. Press the 'P' key.
            - Probably a couple fixes to the DTE insertion support.
            - Random bugfixes and changes, including a little clean-up of the
             (cough cough) "user interface".
Version 0.98- Pointer calculator support (& table file entry)!
             currently it works along with the inserter, not standalone.
            - Inserter changed around a bit, now it will be able to insert
             larger scripts.
Version 0.96- A little addition to the script inserter to support dual tile
             insertion.
            - A few array sizes enlarged, to hopefully support games with
             up to 3000 double hex entries (like kanji).
Version 0.95- Script insertion! i.e. a "reverse" script dumper!
             Now watch out, if you don't know what you're doing this can get
             VERY confusing. but for those of you that do, have fun!
            - A couple other bugs, like the <$00> bug, fixed.
Version 0.9 - Source code released! Don't get too excited..
             I will shake your hand if you can interpret it. In fact, feel
             free to make a C/VB/whatever port of it, i'd like to see it
             run fast.. or use some of its routines in your own
             script dumper-text editor. More power to ya!
            - Command line support! Use:
             "thingy <filename> <tablefile> <table2 [optional]>"
             Create a nice batch file so your fingers don't fall off!
            - Took out the highlighting thing, sorry! You'll notice a slight
             speed increase because of this however.
            - Added lightbar bookmarks!  If you check out the FF2.TBL file
             included in the archive, you'll notice its format. Now, when
             you press 'j' to jump to a location in the rom, you can just
             select one of the bookmarks to go straight there. Same goes for
             script dumping too, you can dump a pre-set location.
            - Fixed editing with double hex byte values, if you had problems
             editing and searching before it should be fixed.
            - Added the option to search for "16-bit" strings, i.e. to search
             for YxExSx just search for YES and set 16-bit searching on with
             the { key in edit mode. It should also be helpful with searching
             for pointers too!!
            - I need to change the script dumping format, probably. Releasing
             the source gives you a bit of freedom, i guess.
            - Added the # command for your TBL files. Just put it on its own
             line (like the > thing) and no more of those nasty <$xx> things
             in your script dumps!

Version 0.8 - Probably a very buggy release, i tried to add too much stuff
             into this one!
            - Now you're able to specify strings on any length on the right
             side of the table files. For example:
             0400=Cecil
            - Also shown in the above example, I added the option to define
             values with two hex bytes (i don't know any better way to
             explain it.) I think that might help with japanese roms as well.
             Other things that might help with script dumps:
            - !xx and @xx commands now specify the " and ø values for jap
             script dumps.
             in alot of games (like Vilgust SNES and Wonderboy2 PCE)
             when the value for "  or ø comes before it, it puts the " or ø
             on top. Also in other games (lots of old NES games) the " or ø
             come after it. For these games put a > on a separate line.
            - In some games certain hex values use the value(s) after
             it for something (i.e. 02xx = goto column xx in FF2).
             Specifying $02=x then automatically displays the <$xx> value of
             x characters after it. So putting in $02=1 would display:
             <$02><$xx> where xx is the hex value of the next 1 char.
            - Added the option to jump to a hex value, just put a "h"
             at the end of the value.
            - If anything is too confusing feel free to ask me, looking at the
             example table files will make it alot easier to understand.

Version 0.7  Added the option to have 2 table files and switch back and forth
             between them. Press TAB in the main screen to switch. This is
             pretty useful if you want a japanese and english table to
             dump japanese text and put in english text, or if some games
             have two fonts..also, a BIG speed increase and when you select
             things to edit/dump, it highlights the text.
             (0.7a doesn't crash, so download again)

Version 0.6  Semi-minor update.  Some bugs were fixed, and i changed a few
             constants around to make it a bit faster.  Made it so that
             you can make the end string (ie /00) something other than 00.
             The sample table file that was made for FF2us was a little
             messed up, fixed (thanks Ballz).
             If anyone makes any other table files for different games
             (english or japanese), feel free to mail em to me and i'll
             include them either on the webpage or in the archive.

Version 0.5  OK i think i'll start numbering my versions so everybody
             doesn't get confused.  Only thing new in this version is the
             addition of the text dumper!  Press "d" at the first and last
             byte that you want to dump.  Very generic and preliminary, i.e.
             it might not make good dumps for ALL japanese games.

Version 0.0  First release, the generic ROM editor with the DTE support!
             Useful for editing those nasty Square games, some other games
             might use it as well, I dunno.


**Some keys you might like to know...

IN THE EDITOR/SEARCHER
-------------
~     automatic DTE on/off. If it's off, the program will ask you every
      time it detects a DTE can be used.
`     Manual HEX.  Press ` then 2 characters to manually input a hex value.
<ESC> Save what you typed in and go back to the regular mode.
F1-10 F1 is the same as typing `01.  Basically, the F1-9=00-09h and F10=00h.
{     Turns 16-bit searching, ie searching for YxExSx, on/off.

IN THE MAIN SCREEN
==================
Space  The first time you press space, it'll appear to do nothing. But
       it actually is.  When you press space a second time, it'll bring you
       into the editor.  Press space to select the beginning/end of what you
       want to edit.  I find this works well when you have to work in a
       limited space.

<TAB>  Switch between table files.

D      Text dumper. First time it'll bring you into a lightbar-ish menu, if
       you want to dump a pre-set location select its name and press ENTER.
       If not, select Manual Dump (which will mark the beginning)
       and select the end of the stuff you want to dump with the D key.
       It will ask you for a filename to output the text to.

I      Text inserter. First time it'll bring you into a lightbar-ish menu,
       if you want to insert text to a file dump (which you probably don't)
       select "insert to file". if you want to insert from a file to the
       ROM, select the insert bookmark entry with the lightbar.

P      Pointer-based script dump. Go to the start of the pointer table,
       press "p", go to the end of the pointer table, press "p" again, and
       go to the start of the script, and press "p" a third time. You get a
       nice, clean, correctly-ordered script that's dumped based on the
       pointers in the pointer table!
       Note: Depending on the way the pointer table is set up, this may
       produce duplicate copies of certain strings if there is more than
       one pointer for them.

J      Jump to a different address in the ROM. It'll bring up a lightbar
       menu. To jump to a preset location select its name and press ENTER.
       If not, select manual address and type in the address.
       (remember you can use the 'h' suffix to specify a hex value)
       To add a preset location to your .tbl file, select Add Address.

S      The Search function brings you into a screen like the Editor, but
       when you press ESC it'll search for the stuff that you typed in.
       To toggle searching for 16-bit values, press {.

R      Resume search, aka search again k.

Q      Hm, i wonder?


BOOKMARKS
<<<<<>>>>>
Bookmarks are helpful when you want to save a ROM address so you can go back
to it later.
To make a bookmark:
move the cursor to the address in the ROM.
Press "j", and select "Add bookmark".
Type the text that will appear on your lightbar for the bookmark.

Done! you can also make bookmarks by directly editing the table file.
the bookmark will look like this:

(80600h)Text Block 1

the number is the address, text is the description.


SCRIPT DUMPING
--oOoOoOoOoO--
To dump some script, you just select it with D keys and select a filename.

if you are thinking of dumping something more than once, i would suggest
making a script dump bookmark.
A script dump bookmark will look like this:

[80600h-8D600h]Dialogue Block 1

the first number is the beginning, the second number is the end, and the text
is what will appear on the lightbar menu when you press "D". pretty simple?
i hope so.


SCRIPT INSERTION
þþþþþþþþþþþþþþþþ
OK...this is a real weird part, but if you do it right you can automatically
"reinsert" a script dump in the form of a text file back into your ROM.

To "insert" script to a file:
Load up the text file, ex. "FF4dump.txt"
Load up your table file, ex. "FF4.tbl"
Press the "i" key to select the area you want to insert.
Type a name for the output file, ex. "ff4.dat"

To "insert" script directly into the ROM:
OK this is a little trickier.
Load up the ROM, ex. "FF4.SMC"
Add an "insert bookmark" line to your .tbl file. Example:
{80600h-FF4dump.txt}Dialogue Block 1
 ^^^^^^                              The address to insert the script to.
        ^^^^^^^^^^^                  The filename to get the script from.
                    ^^^^^^^^^^^^^^^^ Description of the "insert bookmark".

Then just press "i" and select "Dialogue Block 1" and press Enter, and your
script [should] be inserted!


Pointer calculations
ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
in addition to script insertions, you can insert updated pointer tables as
well. first, make your insert bookmark and have that all set up. Next, you
need to add another line in your table file that looks like this:

&CE804h-200h

Thingy includes support for two types of pointers: standard pointers and
relative pointers.

For standard pointers:
The first address is the beginning location of your table file. The second
address is the size of the header (For NES games this is 10h, for SNES games
this is 200h.)

For relative pointers:
Same as standard pointers except make the header size 0.


ABOUT THE .TBL FILES
~~~~~~~~~~~~~~~~~~~~
The TBL files are alot alike the Xlate and Hexpose table files, but not
the same. Hey, thingy tables are standard now. If you don't like it, tough.
You can make as many lines as you want, in this format:

80=0
9A= this
5F=ed
30= t
0400=Cecil

Ah, important part...there are some "special" values that are common in some
games, and some special modifiers to make your script dumps special-like.


*xx        = Newline Value (you can have up to 2 i think)

/xx        = End String Value (you can have up to 2 i think)

$xx=x      = "Linked" values(?)
             Specifying $02=x then automatically displays the <$xx> value of
             x characters after it. So putting in $02=1 would display:
             <$02><$xx> where xx is the hex value of the next 1 char.

!xx        = Dakuten Value

@xx        = Handakuten Value

>          = Tells script dumper to look for Dakuten/Handakuten value AFTER
             the char it modifies, not before.
             i.e. to search for [wa"taleølelk] normally would produce:
             [wa(t")ale(lø)elk].
             If you use the > option in your TBL file, it would produce:
             [w(a")tal(eø)lelk].

#          = Doesn't print ANY <$xx> commands. Make your scripts look clean!
             Taking out the <END>s are easy, just replace them with blank in
             DOS Edit.

Basically, pressing ENTER in the editing part is cool. after you
press enter, it'll skip down a line and display the length of the previous
line. if you're using squished tiles and not real DTE, this number will be
wrong though. But hey, its useful for FF1-2.

If you have any DTE's with the second character as a space, make sure it's
in there, sometimes the nasty DOS edit likes to munch up trailing spaces ;)


ABOUT THE PROGRAM
^^^^^^^^^^^^^^^^^

This program was coded in 100% qbasic! Maybe that's why it's pretty slow.
So be sure you have a lot of time on your hands, or a fast processor to use
it, especially the search functions.
hm, if it's possible i might be able to add
a VERY general pointer generator routine one of these days...



If you need any more help to get it to work or if you have any suggestions,
go ahead and e-mail me at radimvice@geocities.com.

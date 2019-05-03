from tkinter import *
import time

while True:
    root = Tk()
    cp = root.clipboard_get()
    print(cp)
    if len(cp.split('[')) >= 2:
        s = cp.split(', ')
        for i in range(len(s)):
            if ('[' in s[i]):
                s[i] = s[i].split('[')
                s[i][0] = s[i][0].split(' ')
                s[i][1] = s[i][1].split(']')[0]
                s[i][0][-1] = "".join(("<ruby>", s[i][0][-1]))
                s[i][0] = " ".join(s[i][0])
                s[i] =  "<rt>".join((s[i][0], s[i][1]))
                s[i] = s[i] + "</rt></ruby>"


        s = ", ".join(s)
        if (s[-1] != ">"):
            s = s + "</rt></ruby>"
        root.clipboard_clear()
        root.clipboard_append(s)
    root.withdraw()
    input("Press Enter to continue...")
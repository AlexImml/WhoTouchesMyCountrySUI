# WhoTouchesMyCountrySUI

Instructions :
צרו אפליקציה עם מסך התחלתי אשר מציג טבלה של כל מדינות העולם. כל שורה בטבלה מציגה את שם המדינה המקורי (nativeName) ואת שם המדינה באנגלית עם אופציה לסדר בסדר עולה או יורד לפי השם באנגלית ואופציה לסדר בסדר עולה או יורד לפי גודל המדינה (area) .

כאשר המשתמש בוחר במדינה מהטבלה, האפליקציה מציגה מסך נוסף ובו רשימת המדינות הגובלות במדינה שנבחרה (גם בתצוגה של שם מקורי ושם באנגלית).

תוכל להשתמש ב https://restcountries.eu על מנת לקבל את כל המידע הנחוץ.





I wanted to try SwiftUI for this project, and with the simple Instructions I made some basic UI, nothing fancy.


A few notes: 
I used mvvm with combine framwork as well, I broke the body var to private parts to make it more readable, the networking is something I wrote, and I copy it around. 

Not sure about the picker for sorting options, I didnt want to put 2  buttons in navigation or elsewere because its have 0 scalability ( if more sorting options are added) 
but it simple and does the job.


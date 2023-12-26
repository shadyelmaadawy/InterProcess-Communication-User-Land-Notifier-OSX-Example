# InterProcess-Communication | User-Land Notifier, OSX Example

**Good afternoon**, According to **Cairo local time**, 

Have you heard about a concept called InterProcess-communication before? Or have you had a great opportunity to develop sprawling software?
if yes, you don't need to continue, if not, come here, I will give you some useful knowledge.

## Lighting The-Darkness In our brains:

What is that?
Before answering this question, let me ask you

When you install Facebook and sign in for the first time, you will notice that if you open Messenger you will find your account there, how?

Some people will say, It's Facebook magic, they have their ways

Some people will "Think", and will say, they are just doing some I/O In a textfile in local storage or cache or something then access it,
Okay, it's a workaround but it's super dirty, متشغلش دماغك تاني.

Anyway, It's Operation System magic..

Inter-process communication is a wide way to share data between executables that are loaded in the different memory addresses, they have more than one way, for example:

1 - Shared Memory

2 - Sockets ( yeah you can use sockets )

3 - Named Pipes ( What I have shared today ) 

And not limited to OSX, you can find it In Windows/Android/IOS/Linux, In any operating system.

## Why we will use it:

Any reputable company has more than one product, that is common, but in Egypt, I have seen the dirtiest ways to develop software in my life,

You can use it at anything, sharing some useful Information as facebook, even if you want to make another type of notification center, it's okay, I saw people use it in the same app.

#### Note:
* Receiver should be executed before sender ( think about it as a server )
* Code needs more improvements, such as receiving more than client.. etc, so do not take it seriously ( even the used architecture pattern, I am not in production mode  )

## PoC:

![](https://raw.githubusercontent.com/shadyelmaadawy/InterProcess-Communication-User-Land-Notifier-OSX-Example/master/PoC/PoC.gif)

## To Infinity and beyond!

Unfortunately talking about ultra-advanced topics such as ring-zero... etc with all modesty will be a waste of my time, you will not understand.., people do not know how much Integer size is in memory.

learn more (for yourself) and enhance your knowledge (for yourself) then ask for such things, and you will take it.. you have my word : )

## Credits
### Copyright (©) 2023, Shady K. Maadawy, All rights reserved. 
 [@shadudiix](https://github.com/shadyelmaadawy) 🐋

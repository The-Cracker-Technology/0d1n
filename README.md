# 0d1n
---

0d1n is a tool for automating customized attacks against web applications.
This tool is very faster because uses thread pool and C language.

![Alt text](https://github.com/CoolerVoid/0d1n/blob/master/doc/images/overview1.png)
![Alt text](https://github.com/CoolerVoid/0d1n/blob/master/doc/images/tables.png)
![Alt text](https://github.com/CoolerVoid/0d1n/blob/master/doc/images/datatables.png)
0d1n is a tool for automating customized attacks against web applications.
Video demo: https://www.youtube.com/watch?v=1L22mbbVge0



Tool functions: 
---

 * Brute force login and passwords in auth forms

 * Directory disclosure ( use PATH list to brute, and find HTTP status code )

 * Test to find SQL Injection and XSS vulnerabilities 

 * Test to find SSRF

 * Test to find COmmand injection

 * Options to load ANTI-CSRF token each request

 * Options to use random proxy per request

 * other functions...

To run and install follow this steps:
---

require libcurl-dev or libcurl-devel(on rpm linux based)

$ git clone https://github.com/CoolerVoid/0d1n/

 
You need libcurl to run, look the following to install::

```  
$ sudo apt-get install libcurl-dev
or try libcurl4-dev... libcurl*

if rpm distro

$ sudo yum install libcurl-devel
```

To install follow this cmd:
```
$ cd 0d1n

$ make; sudo make install USER=name_your_user; 

$ cd 0d1n_viewer; make; sudo make install USER=name_your_user; 
```

Up the view server to look the reports online:

```
$ sudo 0d1n_view 

```

Now in other console you can run the tool:
```

$ 0d1n

```


to uninstall follow this steps:
---


```
$ cd 0d1n; sudo make uninstall

$ cd 0d1n_view; sudo make uninstall

```

Attack examples:
---

Brute force to find directory
```
$ 0d1n --host http://127.0.0.1/^ --payloads /opt/0d1n/payloads/dir_brute.txt --threads 500 --timeout 3 --log bartsimpsom4 --save_response
```
Note: You can change value of threads, if you have a good machine, you can try 800, 1200... each machine have a different context.


For SQL injection attack
```
$ 0d1n --host 'http://site.com/view/1^/product/^/' --payloads /opt/0d1n/payloads/sqli_list.txt --find_string_list /opt/0d1n/payloads/sqli_str2find_list.txt --log log1337 --tamper randcase --threads 800 --timeout 3 --save_response\n"
```
Note: Tamper is resource to try bypass the web application firewall


To brute force auth system
```
0d1n --host 'http://site.com/auth.py' --post 'user=admin&password=^' --payloads /opt/0d1n/payloads/wordlist.txt --log log007 --threads 500 --timeout 3\n"
```
Note: if have csrf token, you can use argv to get this token each request and brute...


Search SQLi in hard mode in login system with csrf token:
```
0d1n  --host "http://127.0.0.1/vulnerabilities/sqli/index.php?id=^" --payloads /opt/0d1n/payloads/sqli.txt --find_string_list /opt/0d1n/payloads/find_responses.txt --token_name user_token --log logtest_fibonaci49 --cookie_jar /home/user_name/cookies.txt --save_response --tamper randcase --threads 100
```
Note: Load cookies jar form browser and save in cookies.txt to load.



Notes External libs
---

* To gain extreme performance 0d1n uses thread pool of posix threads, you can study this small library: 
https://github.com/Pithikos/C-Thread-Pool

* The 0d1n uses OpenBSD/NetBSD functions to work with strings some thing like strlcat() and strlcpy() to prevent buffer overflow.



Project Overview on cloc
---

```
cooler@gentoo:~/codes$ cloc 0d1n/
     937 text files.
     532 unique files.                                          
     451 files ignored.

-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
JavaScript                     361           9951          15621          52178
C                               51           4986           4967          26642
C/C++ Header                    30           1184           2858           4295
CSS                             10            434            369           2142
HTML                             7             59              0           1616
TeX                              2             52              4            206
Markdown                         3             81              0            137
make                             4             36              9            130
Bourne Shell                     2              0              0              4
-------------------------------------------------------------------------------
SUM:                           487          16835          23846          91213
-------------------------------------------------------------------------------

```


Read the docs, and help menu when you execute "0d1n" binary...

Do you have any doubt about 0d1n? please create a issue in this repository, i can help you...



## To study  old versions look this following:

http://sourceforge.net/projects/odin-security-tool/files/?source=navbar

                             

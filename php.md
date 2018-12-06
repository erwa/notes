### Run on Mac

Generally pre-installed.

```
# run from project folder
sudo php -S localhost:80
```

https://medium.com/@romaninsh/install-php-7-2-on-macos-high-sierra-with-homebrew-bdc4d1b04ea6


### Set encoding to UTF-8

See http://stackoverflow.com/questions/4279282/set-http-header-to-utf-8-using-php. Call this function before any output has been sent to the client:

```
header('Content-Type: text/html; charset=utf-8');
```


### Print human-readable info about a variable

See http://php.net/manual/en/function.print-r.php.

```
print_r(date_parse("2006-12-12 10:00:00.5"));
```
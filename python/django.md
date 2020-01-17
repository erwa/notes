### Run tests in one module

```
python manage.py test my_module
```

https://docs.djangoproject.com/en/3.0/topics/testing/overview/#running-tests


### Turn off escaping

```
{{ data|safe }}
```

https://docs.djangoproject.com/en/1.7/topics/templates/#how-to-turn-it-off


### Print all settings

```
python manage.py diffsettings
```

https://stackoverflow.com/questions/6369697/how-do-i-print-out-the-contents-of-my-settings-in-a-django-shell


### One-time start-up code

Put in `urls.py`. Can use this for development debugging, too.

```
from django.confs.urls.defaults import *
from my_app import one_time_startup

urlpatterns = ...

one_time_startup()
```

https://stackoverflow.com/questions/6791911/execute-code-when-django-starts-once-only


### URLs with captured components

```
# the second part of the URL is captured in a keyword argument "pk"
url(r'^boards/(?P<pk>\d+)/$', views.board_topics, name='board_topics')
```

https://www.regular-expressions.info/refext.html
https://stackoverflow.com/questions/7988942/what-does-this-django-regex-mean-p
https://simpleisbetterthancomplex.com/series/2017/09/18/a-complete-beginners-guide-to-django-part-3.html#advanced-urls
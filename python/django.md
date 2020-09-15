### Related objects

a -> b
b.a_set

https://docs.djangoproject.com/en/1.10/topics/db/queries/#related-objects


### Get object by id

```
obj = Class.objects.get(pk=this_object_id)
```

https://stackoverflow.com/questions/4300365/django-database-query-how-to-get-object-by-id


### Set minimum value on IntegerField

```
from django.core.validators import MinValueValidator

class MyModel(models.Model):
    num = models.PositiveIntegerField(validators=[MinValueValidator(1)])
```

https://stackoverflow.com/questions/27632140/set-django-set-integer-field-minimum-to-1/27632207


### Complex if expressions in templates

Need to use nested ifs for different precedence order.

https://docs.djangoproject.com/en/dev/ref/templates/builtins/?from=olddocs#complex-expressions


### Hidden form fields

```
class CategoryForm(forms.ModelForm):
    name = forms.CharField(max_length=128, help_text="Please enter the category name.")
    views = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
    likes = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
```

```
{% csrf_token %}
{% for hidden in form.hidden_fields %}
    {{ hidden }}
{% endfor %}

{% for field in form.visible_fields %}
    {{ field.errors }}
    {{ field.help_text }}
    {{ field }}
{% endfor %}
```

https://stackoverflow.com/questions/33682566/hidden-fields-in-django-template


### Customize foreign key display text in admin

```
# method 1: override __str__
class Person(models.Model):
    first_name = models.TextField()
    last_name = models.TextField()

    def __str__(self):
        return '%s %s' % (self.first_name, self.last_name)
```

```
# method 2: override get_form
class InvoiceAdmin(admin.ModelAdmin):
    list_display = ['person', 'id']

    def get_form(self, request, obj=None, **kwargs):
        form = super(InvoiceAdmin, self).get_form(request, obj, **kwargs)
        form.base_fields['person'].label_from_instance = lambda obj: "{} {}".format(obj.id, obj.first_name)
        return form


admin.site.register(Invoice, InvoiceAdmin)
```

https://stackoverflow.com/a/51386185/1128392


### Assert test fails / verify test throws exception

```
def mytest(self):
    with self.assertRaises(FooException):
        thing = Thing(name='1234')
```

https://stackoverflow.com/questions/4218161/how-to-write-django-test-meant-to-fail


### Run tests in one module

```
# './manage.py test' should discover tests automatically as long as the chain of
# modules has __init__.py files in them
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

```
# myapp/apps.py
from django.apps import AppConfig
class MyAppConfig(AppConfig):
    name = 'myapp'
    verbose_name = "My Application"
    def ready(self):
        pass # startup code here

# myapp/__init__.py
default_app_config = 'myapp.apps.MyAppConfig'
```

https://docs.djangoproject.com/en/3.1/ref/applications/#django.apps.AppConfig.ready
https://stackoverflow.com/questions/6791911/execute-code-when-django-starts-once-only


### URLs with captured components

```
# the second part of the URL is captured in a keyword argument "pk"
url(r'^boards/(?P<pk>\d+)/$', views.board_topics, name='board_topics')
```

https://www.regular-expressions.info/refext.html
https://stackoverflow.com/questions/7988942/what-does-this-django-regex-mean-p
https://simpleisbetterthancomplex.com/series/2017/09/18/a-complete-beginners-guide-to-django-part-3.html#advanced-urls
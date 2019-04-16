from django.conf.urls import include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = ('',
    url(r'^$', 'simplemoc_windows.core.views.home', name='home'),
    url(r'^admin/', include(admin.site.urls)),
)

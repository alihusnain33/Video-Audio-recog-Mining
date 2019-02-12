"""visually URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from rest_framework import routers

from media_manager import views

# from media_manager.admin import admin_site
from media_manager import api_views

router = routers.DefaultRouter()

router.register(r'candidate', api_views.CandidateViewSet)
router.register(r'questions', api_views.QuestionViewSet)

# router.register('candidate/profile', api_views.ProfileViewSet, base_name='profile')


urlpatterns = [
    url(r'^$', views.candidates, name='index'),
    url(r'^candidates$', views.candidates, name='candidates'),
    url(r'^candidates/(\d+)/$', views.candidate, name='candidate'),
    url(r'^candidates/(\d+)/profile/(\d+)/$', views.profile, name='profile'),

    url(r'^admin/', admin.site.urls),
    # url(r'^api/', include('api.urls', namespace='api')),
    url(r'^api/', include(router.urls)),
    url(r'^api/', include('rest_framework.urls', namespace='rest_framework')),
]

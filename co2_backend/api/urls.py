from django.contrib import admin
from django.urls import path

from .views import *

urlpatterns = [
    path("test1/", TestView.as_view()),
]

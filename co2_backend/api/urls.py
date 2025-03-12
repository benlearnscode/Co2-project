from django.contrib import admin
from django.urls import path
from . import views

from .views import *

urlpatterns = [

    path('foodwaste/',views.foodwaste,name='foodwaste'),
    # path('foodwastepost/',views.FGPost().as_view(),name='foodwastepost'),
    path('electricity/',views.electricity,name='electricity')                                                                  

    # path('electricity/',views)











    # path("test1/", TestView.as_view()),
    # path("getblocks/", BlocksView.as_view()),
    # path('foodwaste/',Foodwaste.as_view()),
    # path('foodwaste/create/',views.Foodwastesaver),
    # path('electricityconsumption',Electricityconsumption.as_view())

    # path('foodwaste/<int:pk>/',Foodwaste.as_view())
   
]

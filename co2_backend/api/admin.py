from django.contrib import admin

# Register your models here.
from .models import  Electricityconsumption
from .models import FoodWaste

admin.site.register(FoodWaste)
admin.site.register(Electricityconsumption)
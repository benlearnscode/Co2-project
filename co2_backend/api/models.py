from django.db import models
from django.utils import timezone
from django.utils.text import slugify
# Create your models here.
# class Blocks(models.Model):
#     block_name = models.CharField(max_length = 100)
#     electricity = models.IntegerField()
#     date = models.DateField()

class FoodWaste(models.Model):
    
    tonsofwaste=models.IntegerField()
    date = models.DateTimeField(auto_now=True)
    # slug=models.SlugField(blank=True,null=True)
    methodofwaste = models.CharField(max_length=50)

    def __str__ (self):
        return str(self.tonsofwaste)

    # class Meta:
    #     ordering =['-updated',]
    # class Meta:
    #     ordering=('-published',)


    # def save(self,*args,**kwargs):
    #     if self.slug is None:
    #          self.slug=slugify(self.title)
       
    #     super().save(*args,**kwargs)


class Electricityconsumption(models.Model):
    wattofelectricity=models.IntegerField()
    data =models.DateTimeField(auto_now=True)
    blockname = models.CharField(max_length=25)
    months = models.IntegerField(default=timezone.now().month)
    # slug=models.SlugField(blank=True,null=True)

    # def __str__(self):
    #     return self.wattofelectricity+' '+self.blockname

    # def save(self,*args,**kwargs):
    #     if self.slug is None:
    #          self.slug=slugify(self.title)
       
        # super().save(*args,**kwargs)
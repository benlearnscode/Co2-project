from django.db import models

# Create your models here.
class Blocks(models.Model):
    block_name = models.CharField(max_length = 100)
    
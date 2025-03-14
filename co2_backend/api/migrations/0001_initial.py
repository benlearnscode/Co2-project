# Generated by Django 5.0.3 on 2024-05-02 16:34

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Electricityconsumption',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('wattofelectricity', models.IntegerField()),
                ('data', models.DateTimeField(auto_now=True)),
                ('blockname', models.CharField(max_length=25)),
                ('months', models.IntegerField(default=5)),
            ],
        ),
        migrations.CreateModel(
            name='FoodWaste',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tonsofwaste', models.IntegerField()),
                ('date', models.DateTimeField(auto_now=True)),
                ('methodofwaste', models.CharField(max_length=50)),
            ],
        ),
    ]

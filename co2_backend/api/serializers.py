from rest_framework.serializers import ModelSerializer
from .models import FoodWaste
from .models import Electricityconsumption

class FoodWasteSerializer(ModelSerializer):
    class Meta:
        model =FoodWaste
        fields ='__all__'
class electricityconsumptionserializer(ModelSerializer):
    class Meta:
        model =Electricityconsumption
        fields='__all__'
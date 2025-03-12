from django.shortcuts import render
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.views import APIView
# from rest_framework import generics

from .serializers import FoodWasteSerializer
from .serializers import electricityconsumptionserializer
from .models import FoodWaste
from .models import Electricityconsumption
# Create your views here.

@api_view(['GET','PUT','POST'])
def foodwaste(request):

    # try:
    #     foodwaste=FoodWaste.objects.get(tonsofwaste=tonsofwaste)
    # except foodwaste.DoesNotExist:
    #     return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        # serializer = FoodWasteSerializer(foodwaste)
        FoodWastes =FoodWaste.objects.all()
        # return Response(serializer.data)
        serializer = FoodWasteSerializer(FoodWastes,many=True)
        return Response(serializer.data)
    elif request.method == 'PUT':
        serializer = FoodWasteSerializer(foodwaste,data=request.data)
        data={}
        if serializer.is_valid():
            serializer.save()
            data['success']="update successfull"
            return Response(data=data)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
    elif request.method =='POST':
        serializer=FoodWasteSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# class FGPost(APIView):
    def post(request):
        serializer=FoodWasteSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def foodwaste_delete(request,tonsofwaste):

    try:
        foodwaste=FoodWaste.objects.get(tonsofwaste=tonsofwaste)
    except foodwaste.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodWasteSerializer(foodwaste)
        return Response(serializer.data)



@api_view(['GET','POST'])
def electricity(request):

    if request.method == 'GET':
        Electricityconsumption = Electricityconsumption.objects.all()
        serializer = electricityconsumptionserializer(Electricityconsumption,many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer=electricityconsumptionserializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            






























# blocks=["St.pauls","admmin block","mess"]

# class TestView(APIView):
#     def get(self, request):
#         d = [
#         {"Name": "Electricity", "percentage": 10, "route" : "loginPage"},
#         {"Name": "Food", "percentage": 20, "route" : "loginPage"},
#         {"Name": "Transport", "percentage": 70, "route" : "loginPage"}
#         ]
#         return Response(d)
#     def post(self, request):
#         # print(request.data)
#         return Response(request.data)

# @api_view(['GET'])
# def getFoodwaste(request):
   

# class Foodwaste(APIView):
#     def get(self,request):
#          FoodWastes =FoodWaste.objects.all()
#          serializer = FoodWasteSerializer(FoodWastes,many=True)
#          return Response(serializer.data)

    # def post(self,request):
    #     data=request.data
    #     waste=FoodWaste.objects.create(
    #         tonsofwaste=data['tonsofwaste']
    #     )
    #     serializer = FoodWasteSerializer(waste,many=False)
    #     return Response(serializer.data)

# @api_view(['POST'])
# def Foodwastesaver(request):
#     data =request.data

#     waste=FoodWaste.objects.create(
#         tonsofwaste=data['tonsofwaste']
#     )
#     serializer = FoodWasteSerializer(waste,many=False)
#     return Response(serializer.data)




# class BlocksView(APIView):
#     def get(self,request):
#         return Response(blocks)

# class Electricityconsumption(APIView):
#     def Electricityconsumption(request):
#         all_consumption = Electricityconsumption.objects.all
#         return Response(all_consumption)






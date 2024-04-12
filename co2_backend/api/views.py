from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView

# Create your views here.

class TestView(APIView):
    def get(self, request):
        d = [
        {"Name": "Electricity", "percentage": 10, "route" : "loginPage"},
        {"Name": "Food", "percentage": 20, "route" : "loginPage"},
        {"Name": "Transport", "percentage": 70, "route" : "loginPage"}
        ]
        return Response(d)
    def post(self, request):
        # print(request.data)
        return Response(request.data)


class BlockVuiew(APIView):
    def get(self, request):
        d = {
            "pauls" : {
                "day" : 2,
                "k2" : 100,

            }
        }
        return Response(d)

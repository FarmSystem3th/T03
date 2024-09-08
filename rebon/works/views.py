import xml.etree.ElementTree as ET
from rest_framework.views import APIView
from rest_framework.response import Response
from urllib.request import urlopen

class WorkListView(APIView):

    def get(self, request):
        recrt_title_query = request.query_params.get('recrtTitle', None)

        url = "http://apis.data.go.kr/B552474/SenuriService/getJobList?ServiceKey=pXFmS50aPfKUlYjsdr9%2Flv3qzXHHI6vphqfxKoa2uyTnmaMuPFrVX94VJgKRCvvVVwmtKtPI%2BhtnyMEk1VgXRg%3D%3D&numOfRows=20&pageNo=1"
        response = urlopen(url)
        xml_data = response.read()

        parsing = ET.fromstring(xml_data)

        items = parsing.find('.//items')
        required_data = []

        for item in items.findall('item'):
            recrt_title = item.find('recrtTitle').text
            deadline = item.find('deadline').text
            fr_dd = item.find('frDd').text
            to_dd = item.find('toDd').text

            if recrt_title_query is None or recrt_title_query.lower() in recrt_title.lower():
                required_data.append({
                    'recrtTitle': recrt_title,
                    'frDd': fr_dd,
                    'toDd': to_dd,
                    'deadline': deadline,
                })

        return Response(required_data)
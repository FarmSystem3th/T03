import xml.etree.ElementTree as ET
from rest_framework.views import APIView
from rest_framework.response import Response
from urllib.request import urlopen

class StudyListView(APIView):

    def get(self, request):
        url = "http://openapi.seoul.go.kr:8088/4d736965656d696e3836714f616358/xml/OfflineCourse/1/100"
        response = urlopen(url)
        xml_data = response.read()

        parsing = ET.fromstring(xml_data)

        required_data = []
        for row in parsing.findall('.//row'):
            course_nm = row.find('COURSE_NM').text
            course_request_str_dt = row.find('COURSE_REQUEST_STR_DT').text
            course_request_end_dt = row.find('COURSE_REQUEST_END_DT').text
            course_str_dt = row.find('COURSE_STR_DT').text
            course_end_dt = row.find('COURSE_END_DT').text
            course_apply_url = row.find('COURSE_APPLY_URL').text

            required_data.append({
                'course_nm': course_nm,
                'course_request_str_dt': course_request_str_dt,
                'course_request_end_dt': course_request_end_dt,
                'course_str_dt': course_str_dt,
                'course_end_dt': course_end_dt,
                'course_apply_url': course_apply_url
            })

        return Response(required_data)
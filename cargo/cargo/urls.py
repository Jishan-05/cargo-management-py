"""
URL configuration for cargo project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from system.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    
    # HOME URL
    path('dsbrd/',dsbrd),
    path('about/',about),
    path('company/',company),
    path('contact/',contact),
    path('',index),
    path('service/',service),
    path('shop/',shop),

    #ADMIN SIDE URL 
    path('login/', login_view,name='login'),
    # path('register/', register_view),
    path('admin_dashboard/', admin_dashboard),
    path('adminprofile/',admin_profile),
    path('adminedit/',admin_edit_profile),
    path('acp/',acpassword),

    # user 
    path('userlist/',list_users),
    
    # emp
    path('emplist/',employee_list),
    path('createemp/',create_employee),
    path('updateemp/<int:id>/',update_employee),
    path('deleteemp/<int:id>/',delete_employee),

    # admin
    path('adminlist/',admin_list),

    # customer
    path('customerlist/',customer_list),

    # country
    path('countrylist/',country_list, name='countrylist'),
    path('createcountry/',create_country),
    path('deletecountry/<int:id>/',delete_country),
    path('updatecountry/<int:id>/',update_country, name='updatecountry'),

    # state
    path('statelist/',state_list,name='statelist'),
    path('createstate/',create_state),
    path('updatestate/<int:id>/',update_state ,name='updatestate'),
    path('deletestate/<int:id>/',delete_state),

    # city
    path('citylist/',city_list,name='citylist'),   
    path('createcity/',create_city) ,
    path('updatecity/<int:id>/',update_city,name='updatecity'),
    path('deletecity/<int:id>/',delete_city),

    # parcelstatus
    path('parcelstatuslist/',parcelstatus_list,name='parcelstatuslist'),
    path('createparcelstatus/',create_parcelstatus),
    path('updateparcelstatus/<int:id>/',update_parcelstatus),
    path('deleteparcelstatus/<int:id>/',delete_parcelstatus),
    
    # pricing
    path('pricinglist/',pricing_list,name='pricinglist'),
    path('createpricing/',create_pricing),
    path('updatepricing/<int:id>/',update_pricing,name='updatepricing'),
    path('deletepricing/<int:id>/',delete_pricing),

    # deliveryroute 
    path('deliveryroutelist/',deliveryroute_list,name='deliveryroutelist'),
    path('createdeliveryroute/',create_deliveryroute),
    path('updatedeliveryroute/<int:id>/',update_deliveryroute,name='updatedeliveryroute'),
    path('deletedeliveryroute/<int:id>/',delete_deliveryroute),

    # booking
    path('bookinglist/',booking_list,name='bookinglist'),

    # parcel
    path('parcellist/',parcel_list),

    # feedback
    path('feedbacklist/',feedback_list, name='feedbacklist'),
    path('updatefeedback/<int:id>/',update_feedback, name='updatefeedback'),
    path('deletefeedback/<int:id>/',delete_feedback),


    # EMPLOYEE  SIDE URL
    path('emplogin/',emplogin,name='emplogin'),
    path('empregister/',empregister),
    path('employee_dashboard/',employee_dashboard ),
    path('empprofile/',employee_profile),
    path('empedit/',emp_edit_profile),
    path('ecp/',ecpassword),

    # CUSTOMER SIDE URL
    path('custlogin/',custlogin, name='custlogin'),
    path('custregister/',custregister),
    path('custprofile/', customer_profile),
    path('custedit/',cust_edit_profile),
    path('ccp/', ccpassword),
    path('book/', booking_view, name='booking'),
    path('myorders/<str:username>/', my_orders),
    
    path('feedback/', dofeedback, name='feedback'),

    path('signout/',logoutview,name='signout'),
    path('logoutuser/',logoutuser,name='logoutuser'),

    path('booking-payment/',bookingPaymentView, name="bookingpayment"),

    path('update-payment/',bookingPaymentView, name="updatePayment"),

    path('accept-payment/<int:id>/',acceptPaymentView,name='acceptPayment'),
    
    path('my-bookings/',my_BookingView, name="myBookings"),
    # path('accept-payment/',acceptPaymentView, name="acceptPayment")

    path('booking-detail/<int:id>/',bookingDetailView, name='booking-detail'),

    # path('add-admin-booking',addAdminBookingView, name="addadminbooking"),
    path('add-admin-booking/',addAdminBookingView, name="add-admin-booking"),
    
    path('update-admin-booking/<int:id>/',updatebooking,name='update-admin-booking'),

    path('invoice/<int:id>/',invoice)

]

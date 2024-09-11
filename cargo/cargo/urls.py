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
    path('about/',about),
    path('company/',company),
    path('contact/',contact),
    path('',index),
    path('service/',service),
    path('shop/',shop),

    #ADMIN SIDE URL 
    path('admin-login/', admin_login_view,name='admin-login'),
    # path('register/', register_view),
    path('admin-dashboard', admin_dashboard_view),
    path('admin-profile/',admin_profile),
    path('admin-profile-edit/',admin_edit_profile),
    path('admin-change-password/',admin_change_password),

    # user 
    path('user-list/',user_list),
    
    # emp
    path('employee-list/',employee_list),
    path('create-employee/',create_employee),
    path('update-employee/<int:id>/',update_employee),
    path('delete-employee/<int:id>/',delete_employee),

    # admin
    path('admin-list/',admin_list),

    # customer
    path('customer-list/',customer_list),

    # country
    path('country-list/',country_list, name='country-list'),
    path('create-country/',create_country),
    path('delete-country/<int:id>/',delete_country),
    path('update-country/<int:id>/',update_country, name='update-country'),

    # state
    path('state-list/',state_list,name='state-list'),
    path('create-state/',create_state),
    path('update-state/<int:id>/',update_state ,name='update-state'),
    path('delete-state/<int:id>/',delete_state),

    # city
    path('city-list/',city_list,name='city-list'),   
    path('create-city/',create_city) ,
    path('update-city/<int:id>/',update_city,name='update-city'),
    path('delete-city/<int:id>/',delete_city),

    # parcelstatus
    path('parcel-status-list/',parcelstatus_list,name='parcel-status-list'),
    path('create-parcel-status/',create_parcelstatus),
    path('update-parcel-status/<int:id>/',update_parcelstatus),
    path('delete-parcel-status/<int:id>/',delete_parcelstatus),
    
    # pricing
    path('pricing-list/',pricing_list,name='pricing-list'),
    path('create-pricing/',create_pricing),
    path('update-pricing/<int:id>/',update_pricing,name='update-pricing'),
    path('delete-pricing/<int:id>/',delete_pricing),

    # deliveryroute 
    path('delivery-route-list/',deliveryroute_list,name='delivery-route-list'),
    path('create-delivery-route/',create_deliveryroute),
    path('update-delivery-route/<int:id>/',update_deliveryroute,name='update-delivery-route'),
    path('delete-delivery-route/<int:id>/',delete_deliveryroute),

    # booking
    path('booking-list/',booking_list,name='booking-list'),

    # parcel
    path('parcel-list/',parcel_list),

    # feedback
    path('feedback-list/',feedback_list, name='feedback-list'),
    path('update-feedback/<int:id>/',update_feedback, name='update-feedback'),
    path('delete-feedback/<int:id>/',delete_feedback),


    # EMPLOYEE  SIDE URL
    path('employee-login/',emplogin,name='employee-login'),
    path('employee-register/',empregister),
    path('employee-dashboard/',employee_dashboard ),
    path('employee-profile/',employee_profile),
    path('employee-profile-edit/',emp_edit_profile),
    path('employee-change-password/',ecpassword),

    # CUSTOMER SIDE URL
    path('customer-login/',custlogin, name='customer-login'),
    path('customer-register/',custregister),
    path('customer-profile/', customer_profile),
    path('customer-profile-edit/',cust_edit_profile),
    path('customer-change-password/', ccpassword),
    path('customer-booking/', customer_booking_view, name='customer-booking'),
    
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

    path('invoice/<int:id>/',invoice),

    path('booking-estimate/',customerEstimateView,name='booking-estimate')

]

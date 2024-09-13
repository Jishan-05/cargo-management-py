from django.shortcuts import get_object_or_404, render, redirect
from django.contrib import messages
from .models import *
from decimal import Decimal, ROUND_HALF_UP
from django.utils import timezone
from django.contrib.auth.hashers import check_password, make_password
from django.shortcuts import render, redirect
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
import uuid
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseRedirect
from django.urls import reverse

#  home page 
def dsbrd(request):
    return render(request,'admin/dsbrd.html')

def about(request):
    return render(request,"home/about.html")

def company(request):
    return render(request, "home/company.html")

# def contact(request):
#     return render(request,"home/contact.html")

def index(request):
    user_id = request.session.get('user_id')
    isUserLoggedIn = user_id != None

    username=''
    if isUserLoggedIn == True:
        userDetail = User.objects.get(pk=user_id)
        username = userDetail.username
    return render(request, "home/index.html", {'isUserLoggedIn': isUserLoggedIn,'username':username})

def service(request):
    return render(request,"home/service.html")

def shop(request):
    return render(request, "home/shop.html")
#  End home page

# Admin side starts 
# admin 
def admin_login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        if not username :
            messages.error(request, 'username is required.')
            # return render(request, 'user/admin-login.html')
            return redirect('admin-login')
        elif not password :
            messages.error(request, 'password is required.')
            # return render(request, 'user/admin-login.html')
            return redirect('admin-login')

        try:
            user = User.objects.get(username=username)
            if user.password == password:  
                request.session['user_id'] = user.id  
                if user.role == 'Admin':
                    return redirect('/admin-dashboard')
                elif user.role == 'Employee':
                    return redirect('/employee-dashboard/')
                elif user.role == 'Customer':
                    return redirect('/customer_profile/')
                else:
                    messages.error(request, 'Invalid user role.')
                    return redirect('admin-login')
            else:
                messages.error(request, 'Invalid credentials.')
                return redirect('admin-login')
        except User.DoesNotExist:
            messages.error(request, 'User does not exist.')
            return redirect('admin-login')

    return render(request, 'user/admin-login.html')

def register_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        email = request.POST.get('email')
        role = request.POST.get('role')

        if not username and not password and not email and not role:
            messages.error(request, 'All fields are required')
            return render(request, 'user/register.html')
        
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Invalid email format.')
            return render(request, 'user/register.html')
        
        if len(username) < 5:
            messages.error(request, 'Username must be at least 5 characters long.')
            return render(request, 'user/register.html')
        if len(password) < 8:
            messages.error(request, 'Password must be at least 8 characters long.')
            return render(request, 'user/register.html')


        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists')
            return render(request, 'user/register.html')

        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email already exists')
            return render(request, 'user/register.html')

        User.objects.create(username=username, password=password, email=email, role=role)
        messages.success(request, 'Registration successful. Please log in.')
        return redirect('/admin-login/')

    return render(request, 'user/register.html')

def admin_change_password(request):
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        confirm_password = request.POST.get('confirm_password')
        user_id = request.session.get('user_id')

        if not old_password or not new_password or not confirm_password:
            messages.error(request, 'All fields are required.')
            return render(request, 'user/admin_change_password.html')

        if new_password != confirm_password:
            messages.error(request, 'New passwords do not match.')
            return render(request, 'user/admin_change_password.html')

        user = User.objects.get(pk=user_id)
        if check_password(old_password, user.password):
            user.password = new_password
            user.save()
            update_session_auth_hash(request, user)  # Keeps the user logged in after password change
            messages.success(request, 'Password changed successfully.')
            return redirect('/admin-dashboard')
        else:
            messages.error(request, 'Old password is incorrect.')

    return render(request, 'user/admin_change_password.html')

def admin_dashboard_view(request):
    user_id = request.session.get('user_id')
    isUserLoggedIn =user_id != None
     
    if user_id:
        try:
            user = User.objects.get(id=user_id)
            if user.role == 'Admin':
                try:
                    admin = Admin.objects.get(user=user)

                    totalBooking = Booking.objects.all()

                    parcelLists = Parcel.objects.all()

                    bookingCounts = { 'totalBookingCount': totalBooking.__len__(),
                           'pendingPaymentCount': totalBooking.filter(payment_status = 'Pending').__len__(),
                           'deliveredBookingCount': parcelLists.filter(status = 'Delivered').__len__(),
                           'inTransitBookingCount': parcelLists.filter(status = 'In Tansit').__len__()
                           }

                except Admin.DoesNotExist:
                    admin = None
                return render(request, 'user/admin_dashboard.html', {'user': user ,'admin': admin, 'bookingCounts': bookingCounts, 'isUserLoggedIn':isUserLoggedIn})
            else:
                messages.error(request, 'Access denied')
                return redirect('admin-login')
        except User.DoesNotExist:
            messages.error(request, 'User not found.')
            return redirect('/admin-login/')
    return redirect('/admin-login/')

def admin_profile(request):
    user_id = request.session.get('user_id')
    if user_id:
        try:
            user = User.objects.get(id=user_id)
            if user.role == 'Admin':
                try:
                    admin = Admin.objects.get(user=user)
                except Admin.DoesNotExist:
                    admin = None
                return render(request, 'user/admin_profile.html', {'user': user, 'admin': admin})
            else:
                messages.error(request, 'Access denied')
                return redirect('admin-login')
        except User.DoesNotExist:
            messages.error(request, 'User not found.')
            return redirect('admin-login')
    return redirect('admin-login')

def admin_edit_profile(request):
    user_id = request.session.get('user_id')
    if user_id:
        user = get_object_or_404(User, id=user_id)
        
        if user.role == 'Admin':
            if request.method == 'POST':
                new_username = request.POST.get('username')
                first_name = request.POST.get('first_name')
                last_name = request.POST.get('last_name')
                phone_number = request.POST.get('phone_number')
                address = request.POST.get('address')

                # Check if the new username is already taken
                if new_username and new_username != user.username:
                    if User.objects.filter(username=new_username).exists():
                        messages.error(request, 'Username already exists')
                        return render(request, 'user/admin_edit_profile.html', {'user': user, 'admin': admin})

                    user.username = new_username
                if first_name:
                    user.first_name = first_name
                if last_name:
                    user.last_name = last_name

                try:
                    admin = Admin.objects.get(user=user)
                except Admin.DoesNotExist:
                    admin = Admin(user=user)
                
                if phone_number:
                    admin.phone_number = phone_number
                if address:
                    admin.address = address
                
                user.save()
                admin.save()
                messages.success(request, 'Profile updated successfully')
                return redirect('/admin-profile/')

            # Load the existing profile data
            try:
                admin = Admin.objects.get(user=user)
            except Admin.DoesNotExist:
                admin = None

            return render(request, 'user/admin_edit_profile.html', {'user': user, 'admin': admin})
        
        else:
            messages.error(request, 'Access denied')
            return redirect('admin-login')
    return redirect('admin-login')

# users
def user_list(request):
    users = User.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            users = User.objects.filter(username__icontains = cr )
    return render(request, 'admin/users_list.html', {'users': users})

# admin-list
def admin_list(request):
    admins = Admin.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            admins = Admin.objects.filter(user__username__icontains = cr )
    return render(request, 'admin/admin_list.html', {'admins': admins})

# customer-list
def customer_list(request):
    customers = Customer.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            customers = Customer.objects.filter(user__username__icontains = cr )
    return render(request, 'admin/customer_list.html', {'customers': customers})

# employee list
def employee_list(request):
    employees = Employee.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            employees = Employee.objects.filter(user__first_name__icontains = cr )
    return render(request, 'admin/employee_list.html', {'employees': employees})

def create_employee(request):
    if request.method == "POST":
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        phone_number = request.POST.get('phone_number')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        position = request.POST.get('position')
        email = request.POST.get('email')
        address = request.POST.get('address')

        # Validate inputs
        if not username or not first_name or not last_name or not phone_number or not email or not position or not address or not password or not confirm_password:
            messages.error(request, 'All fields are required.')
            return render(request, 'admin/create_employee.html')
        if password != confirm_password:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'admin/create_employee.html')
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Invalid email format.')
            return render(request, 'admin/create_employee.html')
        if len(username) < 5:
            messages.error(request, 'Username must be at least 5 characters long.')
            return render(request, 'admin/create_employee.html')
        if len(password) < 8:
            messages.error(request, 'Password must be at least 8 characters long.')
            return render(request, 'admin/create_employee.html')
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'admin/create_employee.html')
        if User.objects.filter(email=email.lower()).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'admin/create_employee.html')

        user = User.objects.create(
           username=username,
           password=password,
           email=email,
           first_name=first_name,
           last_name=last_name,
           role='Employee',
           date_joined = timezone.now()
        )

        Employee.objects.create(
            user=user,
            phone_number=phone_number,
            position=position,
            address=address
        )
        return redirect('../employee-list/')
    return render(request, 'admin/create_employee.html')

def update_employee(request, id):
    employee = Employee.objects.get(pk=id)

    print(employee.user.email)
    if request.method == "POST":
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        phone_number = request.POST.get('phone_number')
        position = request.POST.get('position')
        email = request.POST.get('email')
        address = request.POST.get('address')

        # Validate inputs
        if not username or not first_name or not last_name or not phone_number or not email or not position or not address:
            messages.error(request, 'All fields are required.')
            return render(request, 'admin/update_employee.html', {'employee': employee})
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Invalid email format.')
            return render(request, 'admin/update_employee.html', {'employee': employee})
        if len(username) < 5:
            messages.error(request, 'Username must be at least 5 characters long.')
            return render(request, 'admin/update_employee.html', {'employee': employee})
        if User.objects.filter(username=username).exclude(pk = employee.user.pk).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'admin/update_employee.html', {'employee': employee})
        if User.objects.filter(email=email.lower()).exclude(pk = employee.user.pk).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'admin/update_employee.html', {'employee': employee})

        user = User.objects.get(pk=employee.user.pk)
        user.username=username
        
        user.email=email
        user.first_name=first_name
        user.last_name=last_name
        user.role='Employee'

        employee.phone_number = phone_number
        employee.position = position
        employee.address = address

        user.save()
        employee.save()

        return redirect('employee-list')
    return render(request, 'admin/update_employee.html', {'employee': employee})

def delete_employee(request, id):
    employee = Employee.objects.get(pk=id)
    if request.method == "POST":
        employee.delete()
        return redirect('employee-list')
    return render(request, 'admin/delete_employee.html', {'employee': employee})

# country list
def country_list(request):
    countries = Country.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            countries = Country.objects.filter(name__icontains = cr )
    return render(request, 'admin/country_list.html', {'countries': countries})

def create_country(request):
    if request.method == "POST":
        name = request.POST.get('name')
        if name:
            if Country.objects.filter(name=name).exists():
                messages.error(request, 'Country already exists')
                return redirect('/create-country/') 
        Country.objects.create(name=name)
        messages.success(request, 'Country created successfully')
        return redirect('country-list')
    return render(request, 'admin/create_country.html')

def update_country(request, id):
    country = get_object_or_404(Country, id=id)
    if request.method == "POST":
        name = request.POST.get('name')
        if name : 
            if name != country.name and Country.objects.filter(name=name).exists():
                messages.error(request, 'Country already exists')
                return redirect('update-country', id=id) 
        country.save()
        messages.success(request, 'Country updated successfully')
        return redirect('country-list')
    return render(request, 'admin/update_country.html', {'country': country})

def delete_country(request, id):
    country = get_object_or_404(Country, id=id)
    if request.method == "POST":
        country.delete()
        messages.success(request, 'Country deleted successfully')
        return redirect('country-list')
    return render(request, 'admin/delete_country.html', {'country': country})

# state-list
def state_list(request):
    states = State.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
           states = State.objects.filter(name__icontains = cr )
    return render(request, 'admin/state_list.html', {'states': states})

def create_state(request):
    if request.method == "POST":
        name = request.POST.get('name')
        country_id = request.POST.get('country')
        country = Country.objects.get(id=country_id)
        if State.objects.filter(name=name, country=country).exists():
            messages.error(request, 'State already exists in this country')
            return redirect('/create-state/')
        State.objects.create(name=name, country=country)
        messages.success(request, 'State created successfully')
        return redirect('state-list')
    countries = Country.objects.all()
    return render(request, 'admin/create_state.html', {'countries': countries})

def update_state(request, id):
    state = get_object_or_404(State, id=id)
    if request.method == "POST":
        state.name = request.POST.get('name')
        country_id = request.POST.get('country')
        state.country = Country.objects.get(id=country_id)
        if State.objects.filter(name=state.name, country=state.country).exclude(id=id).exists():
            messages.error(request, 'State already exists in this country')
            return redirect('update-state', id=id)
        state.save()
        messages.success(request, 'State updated successfully')
        return redirect('state-list')
    
    countries = Country.objects.all()
    return render(request, 'admin/update_state.html', {'state': state, 'countries': countries})

def delete_state(request, id):
    state = get_object_or_404(State, id=id)
    if request.method == "POST":
        state.delete()
        messages.success(request, 'State deleted successfully')
        return redirect('state-list')
    return render(request, 'admin/delete_state.html', {'state': state})

# city-list
def city_list(request):
    cities = City.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
           cities = City.objects.filter(name__icontains = cr )
    return render(request, 'admin/city_list.html', {'cities': cities})

def create_city(request):
    if request.method == "POST":
        name = request.POST.get('name')
        state_id = request.POST.get('state')
        address = request.POST.get('address')
        state = get_object_or_404(State, id=state_id)

        if City.objects.filter(name=name, state=state).exists():
            messages.error(request, 'City already exists in this state')
            return redirect('/create-city/')
        City.objects.create(name=name, state=state, address = address)
        messages.success(request, 'City created successfully')
        return redirect('city-list')
    
    states = State.objects.all()
    return render(request, 'admin/create_city.html', {'states': states})

def update_city(request, id):
    city = get_object_or_404(City, id=id)
    if request.method == "POST":
        city.name = request.POST.get('name')
        state_id = request.POST.get('state')
        address = request.POST.get('address')
        city.state = get_object_or_404(State, id=state_id)

        if City.objects.exclude(pk=id).filter(name=city.name, state=city.state).exists():
            messages.error(request, 'City already exists in this state')
            return redirect('update-city', id=id)
        city.address = address
        city.save()
        messages.success(request, 'City updated successfully')
        return redirect('city-list')
    
    states = State.objects.all()
    print(city.address)
    return render(request, 'admin/update_city.html', {'city': city, 'states': states})

def delete_city(request, id):
    city = get_object_or_404(City, id=id)
    if request.method == "POST":
        city.delete()
        messages.success(request, 'City deleted successfully')
        return redirect('city-list')
    return render(request, 'admin/delete_city.html', {'city': city})

# parcelstatus list
def parcelstatus_list(request):
    parcelstatuses = Parcelstatus.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
           parcelstatuses = Parcelstatus.objects.filter(status__icontains = cr )
    return render(request, 'admin/parcelstatus_list.html', {'parcelstatuses': parcelstatuses})

def create_parcelstatus(request):
    if request.method == "POST":
        parcel_type = request.POST.get('parcel')
        status = request.POST.get('status')
        updated_by_user_id = request.POST.get('updated_by_user')
        updated_at = request.POST.get('updated_at')

        parcel = get_object_or_404(Parcel, id=parcel_type)
        updated_by_user = get_object_or_404(User, id=updated_by_user_id)
        
        Parcelstatus.objects.create(
            parcel=parcel,
            status=status,
            updated_by_employee=updated_by_user,
            updated_at=updated_at
        )
        messages.success(request, 'Parcel status created successfully')
        return redirect('parcel-status-list')
    
    parcels = Parcel.objects.all()
    users = User.objects.all()
    return render(request, 'admin/create_parcelstatus.html', {'parcels': parcels, 'users': users})

def update_parcelstatus(request, id):
    parcelstatus = get_object_or_404(Parcelstatus, id=id)
    if request.method == "POST":
        parcelstatus.parcel = get_object_or_404(Parcel, id=request.POST.get('parcel'))
        parcelstatus.status = request.POST.get('status')
        parcelstatus.updated_by_user = get_object_or_404(User, id=request.POST.get('updated_by_user'))
        parcelstatus.updated_at = request.POST.get('updated_at')
        parcelstatus.save()
        messages.success(request, 'Parcel status updated successfully')

        return redirect('parcel-status-list')

    parcels = Parcel.objects.all()
    users = User.objects.all()
    return render(request, 'admin/update_parcelstatus.html', {'parcelstatus': parcelstatus, 'parcels': parcels, 'users': users})

def delete_parcelstatus(request, id):
    parcelstatus = get_object_or_404(Parcelstatus, id=id)
    if request.method == "POST":
        parcelstatus.delete()
        messages.success(request, 'Parcel status deleted successfully')
        return redirect('parcel-status-list')
    return render(request, 'admin/delete_parcelstatus.html', {'parcelstatus': parcelstatus})

# pricing list
def pricing_list(request):
    pricings = Pricing.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
           pricings = Pricing.objects.filter(base_price__icontains = cr )
    return render(request, 'admin/pricing_list.html', {'pricings': pricings})

def create_pricing(request):
    if request.method == "POST":
        base_price = request.POST.get('base_price')
        price_per_km = request.POST.get('price_per_km')
        price_per_kg = request.POST.get('price_per_kg')
        created_at = timezone.now()
        updated_at = timezone.now()

        if Pricing.objects.filter(base_price=base_price,price_per_km=price_per_km,price_per_kg=price_per_kg).exists():
            messages.error(request, 'Prices Already Exists ')
            return redirect('/create-pricing/')

        Pricing.objects.create(
            base_price=base_price,
            price_per_km=price_per_km,
            price_per_kg=price_per_kg,
            created_at=created_at,
            updated_at=updated_at
        )
        messages.success(request, 'Prices created successfully.')
        return redirect('pricing-list')
    
    return render(request, 'admin/create_pricing.html')

def update_pricing(request, id):
    pricing = get_object_or_404(Pricing, id=id)
    if request.method == "POST":
        pricing.base_price = request.POST.get('base_price')
        pricing.price_per_km = request.POST.get('price_per_km')
        pricing.price_per_kg = request.POST.get('price_per_kg')
        pricing.updated_at = timezone.now()

        if Pricing.objects.filter(base_price=pricing.base_price,price_per_km=pricing.price_per_km,price_per_kg=pricing.price_per_kg).exclude(id=id).exists():
            messages.error(request, 'Prices Already Exists')
            return redirect('update-pricing', id=id)

        pricing.save()
        messages.success(request, 'Prices updated successfully.')
        return redirect('pricing-list')
    return render(request, 'admin/update_pricing.html', {'pricing': pricing})

def delete_pricing(request, id):
    pricing = get_object_or_404(Pricing, id=id)
    if request.method == "POST":
        pricing.delete()
        messages.success(request, 'Prices deleted successfully.')
        return redirect('pricing-list')
    return render(request, 'admin/delete_pricing.html', {'pricing': pricing})

# deliveryroute list
def deliveryroute_list(request):
    deliveryroutes = Deliveryroute.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
           deliveryroutes = Deliveryroute.objects.filter(distance_km__icontains = cr )
    return render(request, 'admin/deliveryroute_list.html', {'deliveryroutes': deliveryroutes})

def create_deliveryroute(request):
    if request.method == "POST":
        from_city_id = request.POST.get('from_city')
        to_city_id = request.POST.get('to_city')
        distance_km = request.POST.get('distance_km')
        
        from_city = get_object_or_404(City, id=from_city_id)
        to_city = get_object_or_404(City, id=to_city_id)
        
        existing_route = Deliveryroute.objects.filter(from_city=from_city, to_city=to_city).first()
        if existing_route:
            messages.error(request, 'Route already exists')
            return redirect('/create-delivery-route/')
        
        Deliveryroute.objects.create(
            from_city=from_city,
            to_city=to_city,
            distance_km=distance_km
        )
        messages.success(request, 'Delivery route created successfully.')
        return redirect('delivery-route-list')
    
    cities = City.objects.all()
    return render(request, 'admin/create_deliveryroute.html', {'cities': cities})

def update_deliveryroute(request, id):
    deliveryroute = get_object_or_404(Deliveryroute, id=id)
    if request.method == "POST":
        deliveryroute.from_city = get_object_or_404(City, id=request.POST.get('from_city'))
        deliveryroute.to_city = get_object_or_404(City, id=request.POST.get('to_city'))
        deliveryroute.distance_km = request.POST.get('distance_km')

        existing_route = Deliveryroute.objects.filter(from_city=deliveryroute.from_city, to_city=deliveryroute.to_city).first()
        if existing_route:
            messages.error(request, 'Route already exists')
            return redirect('update-delivery-route',id=id)
        
        deliveryroute.save()
        messages.success(request, 'Delivery route updated successfully.')
        return redirect('delivery-route-list')

        
    cities = City.objects.all()
    return render(request, 'admin/update_deliveryroute.html', {'deliveryroute': deliveryroute, 'cities': cities})

def delete_deliveryroute(request, id):
    deliveryroute = get_object_or_404(Deliveryroute, id=id)
    if request.method == "POST":
        deliveryroute.delete()
        messages.success(request, 'Delivery route deleted successfully.')
        return redirect('delivery-route-list')
    return render(request, 'admin/delete_deliveryroute.html', {'deliveryroute': deliveryroute})

# booking list
def booking_list(request):
    bookings = Booking.objects.all().select_related('customer') 
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
           bookings = Booking.objects.filter(customer__user__username__icontains=cr)
    return render(request, 'admin/booking_list.html', {'bookings': bookings})

# parcel list
def parcel_list(request):
    parcels = Parcel.objects.all().select_related('customer')
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
           parcels = Parcel.objects.filter(parcel_type__icontains = cr )
    return render(request, 'admin/parcel_list.html', {'parcels': parcels})


def feedback_list(request):
    feedback_list = Feedback.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            feedback_list = Feedback.objects.filter(feedback_text__icontains = cr )
    return render(request, 'admin/feedback_list.html', {'feedback_list': feedback_list})

def update_feedback(request, id):
    feedback = get_object_or_404(Feedback, id=id)
    if request.method == 'POST':
        feedback_text = request.POST.get('feedback_text')

        if not feedback_text:
            messages.error(request, 'Feedback text is required.')
            return redirect('update-feedback', feedback_id=id)

        feedback.feedback_text = feedback_text
        feedback.save()
        messages.success(request, 'Feedback updated successfully!')
        return redirect('feedback-list')

    return render(request, 'admin/update_feedback.html', {'feedback': feedback})

def delete_feedback(request,id):
    feedback = get_object_or_404(Feedback, id=id)
    if request.method == 'POST':
        feedback.delete()
        messages.success(request, 'Feedback deleted successfully!')
        return redirect('feedback-list')

    return render(request, 'admin/delete_feedback.html', {'feedback': feedback})





# Admin side ends

# Employee side starts

# employee
def empregister(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        phone_number = request.POST.get('phone_number')
        email = request.POST.get('email')
        position = request.POST.get('position')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

        # Validate inputs
        if not username or not first_name or not last_name or not phone_number or not email or not position or not password or not confirm_password:
            messages.error(request, 'All fields are required.')
            return render(request, 'user/empregister.html')
        if password != confirm_password:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'user/empregister.html')
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Invalid email format.')
            return render(request, 'user/empregister.html')
        if len(username) < 5:
            messages.error(request, 'Username must be at least 5 characters long.')
            return render(request, 'user/empregister.html')
        if len(password) < 8:
            messages.error(request, 'Password must be at least 8 characters long.')
            return render(request, 'user/empregister.html')
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'user/empregister.html')
        if User.objects.filter(email=email.lower()).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'user/empregister.html')

        # Create the user
        user = User.objects.create(
            username=username,
            password=password,
            email=email.lower(),
            first_name=first_name,
            last_name=last_name,
            role='Employee',
            date_joined=timezone.now()
        )
        
        # Create the employee profile
        Employee.objects.create(
            user=user,
            phone_number=phone_number,
            position=position
        )

        messages.success(request, 'Registration successful. Please log in.')
        return redirect('/employee-login/')

    return render(request, 'user/empregister.html')

def emplogin(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        if not email:
            messages.error(request, 'Email is required.')
            return render(request, 'user/emplogin.html')
        
        if not password:
            messages.error(request, 'Password is required.')
            return render(request, 'user/emplogin.html')

        try:
            user = User.objects.get(email=email.lower(), role='Employee')
            if user.password == password:  # Directly compare the password
                request.session['user_id'] = user.id 
                return redirect('/employee-dashboard/')  # Redirect to employee profile or dashboard
            else:
                messages.error(request, 'Invalid credentials.')
        except User.DoesNotExist:
            messages.error(request, 'User does not exist or is not an employee.')

    return render(request, 'user/emplogin.html')

def ecpassword(request):
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        confirm_password = request.POST.get('confirm_password')
        user_id = request.session.get('user_id')

        if not old_password or not new_password or not confirm_password:
            messages.error(request, 'All fields are required.')
            return render(request, 'user/emp_change_password.html')

        if new_password != confirm_password:
            messages.error(request, 'New passwords do not match.')
            return render(request, 'user/emp_change_password.html')

        user = User.objects.get(pk=user_id)
        if check_password(old_password, user.password):
            user.password = make_password(new_password)
            user.save()
            update_session_auth_hash(request, user)  # Keeps the user logged in after password change
            messages.success(request, 'Password changed successfully.')
            return redirect('/employee-dashboard/')
        else:
            messages.error(request, 'Old password is incorrect.')

    return render(request, 'user/emp_change_password.html')

def employee_dashboard(request):
    user_id = request.session.get('user_id')
    if user_id:
        try:
            user = User.objects.get(id=user_id)
            if user.role == 'Employee':
                try:
                    employee = Employee.objects.get(user=user)

                    totalBooking = Booking.objects.all()

                    parcelLists = Parcel.objects.all()

                    bookingCounts = { 'totalBookingCount': totalBooking.__len__(),
                           'pendingPaymentCount': totalBooking.filter(payment_status = 'Pending').__len__(),
                           'deliveredBookingCount': parcelLists.filter(status = 'Delivered').__len__(),
                           'inTransitBookingCount': parcelLists.filter(status = 'In Tansit').__len__()
                           }
                except Employee.DoesNotExist:
                    employee = None
                return render(request, 'user/employee_dashboard.html', {'user': user ,'employee' : employee, 'bookingCounts': bookingCounts})
            else:
                messages.error(request, 'Access denied')
                return redirect('/employee-login/')
        except User.DoesNotExist:
            messages.error(request, 'User not found.')
            return redirect('/employee-login/')
    return redirect('/employee-login/')

def employee_profile(request):
    user_id = request.session.get('user_id')
    if user_id:
        try:
            user = User.objects.get(id=user_id)
            try:
                employee = Employee.objects.get(user=user)
            except Employee.DoesNotExist:
                employee = None
            
            return render(request, 'user/employee_profile.html', {'user': user, 'employee': employee})
        except User.DoesNotExist:
            messages.error(request, 'User not found.')
            return redirect('/employee-login/')
    return redirect('/employee-login/')

def emp_edit_profile(request):
    user_id = request.session.get('user_id')
    if user_id:
        user = get_object_or_404(User, id=user_id)
        try:
            employee = Employee.objects.get(user=user)
        except Employee.DoesNotExist:
            employee = None
        
        if request.method == 'POST':
            new_username = request.POST.get('username')
            first_name = request.POST.get('first_name')
            last_name = request.POST.get('last_name')
            phone_number = request.POST.get('phone_number')
            address = request.POST.get('address')
            position = request.POST.get('position')

            # Check if the new username is already taken
            if new_username and new_username != user.username:
                if User.objects.filter(username=new_username).exists():
                    messages.error(request, 'Username already exists')
                    return render(request, 'employee/emp_edit_profile.html', {'user': user, 'employee': employee})

                user.username = new_username
            if first_name:
                user.first_name = first_name
            if last_name:
                user.last_name = last_name

            if employee:
                if phone_number:
                    employee.phone_number = phone_number
                if address:
                    employee.address = address
                if position:
                    employee.position = position
                employee.save()
            else:
                # Create a new Employee record if it doesn't exist
                Employee.objects.create(
                    user=user,
                    phone_number=phone_number,
                    address=address
                )
            
            user.save()
            messages.success(request, 'Profile updated successfully')
            return redirect('/employee-profile/')

        return render(request, 'user/emp_edit_profile.html', {'user': user, 'employee': employee})
    
    return redirect('/employee-login/')


def emp_user_list(request):
    users = User.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            users = User.objects.filter(username__icontains = cr )
    return render(request, 'employee/users_list.html', {'users': users})




# Employee side ends

# Customer side starts

# customer
def custlogin(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        if not email:
            messages.error(request, 'Email is required.')
            return render(request, 'user/admin-login.html')
        
        if not password:
            messages.error(request, 'Password is required.')
            return render(request, 'user/admin-login.html')

        try:
            user = User.objects.get(email=email.lower(), role='Customer')
            if check_password(password, user.password):  # Use check_password to verify hashed password
                request.session['user_id'] = user.id
                return redirect('/customer-profile/')
                # return redirect('/booking/')
            else:
                messages.error(request, 'Invalid credentials.')
        except User.DoesNotExist:
            messages.error(request, 'User does not exist or is not a customer.')

    return render(request, 'user/custlogin.html')

def custregister(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        contact = request.POST.get('contact')
        email = request.POST.get('email')
        address = request.POST.get('address')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        if not username or not first_name or not last_name or not contact or not email or not address or not password or not confirm_password:
            messages.error(request, 'All fields are required.')
            return render(request, 'user/custregister.html')
        if password != confirm_password:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'user/custregister.html')
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Invalid email format.')
            return render(request, 'user/custregister.html')
        if len(username) < 5:
            messages.error(request, 'Username must be at least 5 characters long.')
            return render(request, 'user/register.html')
        if len(password) < 8:
            messages.error(request, 'Password must be at least 8 characters long.')
            return render(request, 'user/register.html')
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'user/custregister.html')
        if User.objects.filter(email=email.lower()).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'user/custregister.html')
        hashed_password = make_password(password)
        user = User.objects.create(
            username=username,
            password=hashed_password,
            email=email.lower(),
            first_name=first_name,
            last_name=last_name,
            role='Customer' ,
            date_joined = timezone.now()

        )
        Customer.objects.create(
            user=user,
            phone_number=contact,
            address=address
        )
        messages.success(request, 'Registration successful. Please log in.')
        return redirect('/customer-login/')
    return render(request, 'user/custregister.html')

def ccpassword(request):
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        confirm_password = request.POST.get('confirm_password')
        user_id = request.session.get('user_id')
        
        if not old_password or not new_password or not confirm_password:
            messages.error(request, 'All fields are required.')
            return render(request, 'user/cust_change_password.html')
        
        if new_password != confirm_password:
            messages.error(request, 'New passwords do not match.')
            return render(request, 'user/cust_change_password.html')
        
        user = User.objects.get(pk=user_id)
        if check_password(old_password, user.password):
            user.password = make_password(new_password)
            user.save()
            update_session_auth_hash(request, user)  # Keeps the user logged in after password change
            messages.success(request, 'Password changed successfully.')
            return redirect('/customer-profile/')
        else:
            messages.error(request, 'Old password is incorrect.')

    return render(request, 'user/cust_change_password.html')

from django.contrib.auth import logout

def logoutview(request):
    return render(request,'user/logout.html')

def logoutuser(request):
    user = request.session.get('user_id')
    if user is not None :
        currentuser = User.objects.get(id = user)
        if currentuser.role=='Customer':
            logout(request)
            return redirect('customer-login')

        elif currentuser.role=='Admin':
            logout(request)
            return redirect('admin-login')

        elif currentuser.role=='Employee':
            logout(request)
            return redirect('employee-login')
        else :
            return render(request, '/')
    else:
        return render(request,'/',{})
    
def customer_profile(request):
    user_id = request.session.get('user_id')
    if user_id:
        try:
            user = User.objects.get(id=user_id)
            try:
                customer = Customer.objects.get(user=user)
            except Customer.DoesNotExist:
                customer = None
            
            return render(request, 'user/customer_profile.html', {'user': user, 'customer': customer})
        except User.DoesNotExist:
            messages.error(request, 'User not found.')
            return redirect('/customer-login/')
    return redirect('/customer-login/')

def cust_edit_profile(request):
    user_id = request.session.get('user_id')
    if user_id:
        user = get_object_or_404(User, id=user_id)
        try:
            customer = Customer.objects.get(user=user)
        except Customer.DoesNotExist:
            customer = None
        
        if request.method == 'POST':
            new_username = request.POST.get('username')
            first_name = request.POST.get('first_name')
            last_name = request.POST.get('last_name')
            phone_number = request.POST.get('phone_number')
            address = request.POST.get('address')

            # Check if the new username is already taken
            if new_username and new_username != user.username:
                if User.objects.filter(username=new_username).exists():
                    messages.error(request, 'Username already exists')
                    return render(request, 'user/cust_edit_profile.html', {'user': user, 'customer': customer})
                
                user.username = new_username
            if first_name:
                user.first_name = first_name
            if last_name:
                user.last_name = last_name

            if customer:
                if phone_number:
                    customer.phone_number = phone_number
                if address:
                    customer.address = address
                customer.save()
            else:
                # Create a new Customer record if it doesn't exist
                Customer.objects.create(
                    user=user,
                    phone_number=phone_number,
                    address=address
                )
            
            user.save()
            messages.success(request, 'Profile updated successfully')
            return redirect('/customer-profile/')

        return render(request, 'user/cust_edit_profile.html', {'user': user, 'customer': customer})
    
    return redirect('/customer-login/')

def my_orders(request, username):
    customer = get_object_or_404(Customer, user__username=username)
    
    bookings = Booking.objects.filter(customer=customer)

    return render(request, 'customer/my_orders.html', {
        'customer': customer,
        'bookings': bookings,
    })

def customer_booking_view(request):
    user_id = request.session.get('user_id')
    if user_id:
        try:
            user = User.objects.get(id=user_id)
            try:
                customer = Customer.objects.get(user=user)
            except Customer.DoesNotExist:
                messages.error(request, 'Customer profile not found.')
                return redirect('customer-login')
        except User.DoesNotExist:
            messages.error(request, 'User not found.')
            return redirect('customer-login')
    else:
        messages.error(request, 'You must be logged in to make a booking.')
        return redirect('customer-login')
    if request.method == 'POST':
        customer_name = request.POST.get('customer_name')
        customer_phone = request.POST.get('customer_phone')
        pick_address_id = request.POST.get('pick_address')
        deliver_address_id = request.POST.get('deliver_address')
        parcel_type = request.POST.get('parcel_type')
        payment_type = request.POST.get('payment_type')
        action = request.POST.get('action')

        if not all([customer_name, customer_phone, pick_address_id, deliver_address_id, parcel_type, payment_type]):
            messages.error(request, "All fields are required.")
            return redirect('customer-booking')

        try:
            pick_city = City.objects.get(id=pick_address_id)
            deliver_city = City.objects.get(id=deliver_address_id)
        except City.DoesNotExist:
            messages.error(request, "Invalid city selected.")
            return redirect('customer-booking')

        if (pick_city == deliver_city):
            messages.error(request,"Pickup address and deliver address should not be same.")
            return redirect("customer-booking")

        try:
            delivery_route = Deliveryroute.objects.get(from_city=pick_city, to_city=deliver_city)
            distance = delivery_route.distance_km
        except Deliveryroute.DoesNotExist:
            messages.error(request, "No delivery route found.")
            return redirect('customer-booking')

        try:
            pricing = Pricing.objects.latest('created_at')
        except Pricing.DoesNotExist:
            messages.error(request, "Pricing details notvailable.")
            return redirect('customer-booking')

        base_price = pricing.base_price or 0
        price_per_km = pricing.price_per_km or 0

        if parcel_type == 'medium':
            price_per_km = price_per_km * 2
        elif parcel_type == 'large':
            price_per_km = price_per_km * 4

        estimated_price = base_price + (price_per_km * distance)

        tracking_id = str(uuid.uuid4())

        # customer, created = Customer.objects.get_or_create(
        #     phone_number=customer_phone,
        #     defaults={'user': None, 'address': None}
        # )
        # if created:
        #     customer.user = None
        #     customer.address = None
        #     customer.save()

        if action == 'estimate':
            messages.info(request, "Estimated price: Rs{:.2f}".format(estimated_price))
            return redirect('customer-booking')
        
        elif action == 'confirm':
            parcel = Parcel.objects.create(
                tracking_id=tracking_id,
                customer=customer,
                parcel_type=parcel_type,
                from_city=pick_city,
                to_city=deliver_city,
                weight=None,
                height=None,
                length=None,
                width=None,
                price=estimated_price,
                status='Pending',
                created_at=timezone.now(),
                updated_at=timezone.now()
            )
            print(customer.pk)
            Booking.objects.create(
                parcel=parcel,
                customer=customer,
                booking_date=None,
                amount_paid=None,
                payment_status='Pending',
                created_at=timezone.now()
            )

            messages.success(request, "Booking confirmed. Your tracking ID is: {} and the estimated price is: Rs{:.2f}".format(tracking_id, estimated_price))
            return redirect('customer-booking')

        elif action == 'cancel':
            messages.info(request, "Booking has been canceled.")
            return redirect('customer-booking')

    cities = City.objects.all()
    return render(request, 'customer/booking.html', {'cities': cities})


def dofeedback(request):
    user_id = request.session.get('user_id')

    if request.method == 'POST':
        feedback_text = request.POST.get('feedback_text')

        userDetail = User.objects.get(id=user_id)
       
        customerDetail = Customer.objects.get(user = userDetail) 
        print(customerDetail.id)
    
        # if not (customer_name and customer_contact and customer_email and feedback_text):
        if not (feedback_text):
            messages.error(request, 'All fields are required.')
            return redirect('feedback')
        
        Feedback.objects.create(
            createdby=customerDetail,
            feedback_text=feedback_text,
            created_at=timezone.now()
        )

        messages.success(request, 'Thank you for your feedback!')
        return redirect('feedback')

    return render(request, 'customer/feedback.html')

# booking 

def bookingPaymentView(request):
    bookings = Booking.objects.filter(payment_status='Pending')
    return render(request,'admin/booking-payment-list.html',{'bookings':bookings})

def acceptPaymentView(request,id):
    booking = get_object_or_404(Booking, id=id)
    if request.method == 'POST':

        booking.booking_date = timezone.now()
        
        bookParcel = Parcel.objects.get(id=booking.parcel.id)
        bookParcel.status = 'Booked'
        bookParcel.updated_at = timezone.now()
        
        booking.amount_paid = bookParcel.price

        user_id = request.session.get('user_id')
        if user_id:
            userrecord = User.objects.get(id=user_id)

            Parcelstatus.objects.create(
                parcel = bookParcel,
                status = 'Payment accepted',
                updated_by_user = userrecord,
                updated_at = timezone.now()
            )

            Parcelstatus.objects.create(
                parcel = bookParcel,
                status = 'Parcel arrived at {}'.format(bookParcel.from_city.name),
                updated_by_user = userrecord,
                updated_at = timezone.now()
            )

        booking.payment_status = "Accepted"

        addInvoice(booking)

        booking.save()
        bookParcel.save()
        print(booking.payment_status)
        messages.success(request, 'Payment accepted!')
        return redirect('bookingpayment')
    return render(request, 'admin/accept_payment.html', {'id': id})

def my_BookingView(request):
    user_id = request.session.get('user_id')

    print(user_id)
    loggedInUser = User.objects.get(id=user_id)
    print(loggedInUser.email)

    loggedInCustomer = Customer.objects.get(user=loggedInUser)
    print(loggedInCustomer.id)
    
    bookings = Booking.objects.filter(customer_id = loggedInCustomer.pk)
    print(bookings)
    return render(request, 'customer/my_bookings.html',{'bookings':bookings})

def bookingDetailView(request,id):
    bookingDetail = Booking.objects.get(id=id)
    
    parcelStatuses = Parcelstatus.objects.filter(parcel__pk = bookingDetail.parcel.pk).order_by('-updated_at')
 
    return render(request,'customer/booking-detail.html',{'booking':bookingDetail, 'parcelStatuses':parcelStatuses})  

def addAdminBookingView(request):
    cities = City.objects.all()
    form = { 'email':'', 'name' :'', 'phone':'', 
              'pick_address':'', 'deliver_address':'',
              'parcel_type':'','payment_type':'cod','action':''}
    if request.method == 'POST':
        customer_email = request.POST.get('customer_email')
        customer_name = request.POST.get('customer_name')
        customer_phone = request.POST.get('customer_phone')
        pick_address_id = request.POST.get('pick_address')
        deliver_address_id = request.POST.get('deliver_address')
        parcel_type = request.POST.get('parcel_type')
        payment_type = request.POST.get('payment_type')
        action = request.POST.get('action')

        form = { 'email':customer_email, 'name' :customer_name, 'phone':customer_phone, 
              'pick_address':pick_address_id, 'deliver_address':deliver_address_id,
              'parcel_type':parcel_type,'payment_type':payment_type,'action':action}

        if customer_email:
            try:
                user = User.objects.get(email=customer_email)
                try:
                    customer = Customer.objects.get(user=user)
                except Customer.DoesNotExist:
                    messages.error(request, 'Customer not found.')
                    return redirect('add-admin-booking',{'cities': cities, 'form':form})
            except User.DoesNotExist:
                messages.error(request, 'User not found.')
                # return render(request,'admin/add-admin-booking.html', {'cities': cities,'form':form})
                return redirect('add-admin-booking',{'cities': cities, 'form':form})
            
        if not all([customer_name, customer_phone, pick_address_id, deliver_address_id, parcel_type, payment_type]):
            messages.error(request, "All fields are required.")
            return redirect('add-admin-booking',{'cities': cities, 'form':form})

        try:
            pick_city = City.objects.get(id=pick_address_id)
            deliver_city = City.objects.get(id=deliver_address_id)
        except City.DoesNotExist:
            messages.error(request, "Invalid city selected.")
            return redirect('add-admin-booking',{'cities': cities, 'form':form})

        if (pick_city == deliver_city):
            messages.error(request,"Pickup address and deliver address should not be same.")
            return redirect("add-admin-booking",{'cities': cities, 'form':form})

        try:
            delivery_route = Deliveryroute.objects.get(from_city=pick_city, to_city=deliver_city)
            distance = delivery_route.distance_km
        except Deliveryroute.DoesNotExist:
            messages.error(request, "No delivery route found.")
            return redirect('add-admin-booking',{'cities': cities, 'form':form})

        try:
            pricing = Pricing.objects.latest('created_at')
        except Pricing.DoesNotExist:
            messages.error(request, "Pricing details notvailable.")
            return redirect('add-admin-booking',{'cities': cities, 'form':form})

        base_price = pricing.base_price or 0
        price_per_km = pricing.price_per_km or 0

        if parcel_type == 'medium':
            price_per_km = price_per_km * 2
        elif parcel_type == 'large':
            price_per_km = price_per_km * 4
        
        estimated_price = base_price + (price_per_km * distance)

        tracking_id = str(uuid.uuid4())

        if action == 'estimate':
            messages.info(request, "Estimated price: Rs{:.2f}".format(estimated_price))

            return redirect('add-admin-booking', {'cities': cities, 'form':form})
        
        elif action == 'confirm':
            parcel = Parcel.objects.create(
                tracking_id=tracking_id,
                customer=customer,
                parcel_type=parcel_type,
                from_city=pick_city,
                to_city=deliver_city,
                weight=None,
                height=None,
                length=None,
                width=None,
                price=estimated_price,
                status = 'Booked',
                created_at=timezone.now(),
                updated_at=timezone.now(),
            )
            
            booking = Booking.objects.create(
                parcel=parcel,
                customer=customer,
                booking_date=timezone.now(),
                amount_paid=estimated_price,
                payment_status = "Accepted",
                created_at=timezone.now()
            )

            user_id = request.session.get('user_id')

            userrecord = User.objects.get(id=user_id)

            Parcelstatus.objects.create(
                parcel = parcel,
                status = 'Payment accepted',
                updated_by_user = userrecord,
                updated_at = timezone.now()
            )

            Parcelstatus.objects.create(
                parcel = parcel,
                status = 'Parcel arrived at {}'.format(parcel.from_city.name),
                updated_by_user = userrecord,
                updated_at = timezone.now()
            )
            addInvoice(booking)
            messages.success(request, "Booking confirmed. Your tracking ID is: {} and the estimated price is: Rs{:.2f}".format(tracking_id, estimated_price))
            return redirect('booking-list')

        elif action == 'cancel':
            messages.info(request, "Booking has been canceled.")
            return redirect('booking-list')

    
    return render(request,'admin/add-admin-booking.html', {'cities': cities,'form':form})

def updatebooking(request,id):
    booking = Booking.objects.get(id = id )
    if request.method == 'POST': 
        action = request.POST.get('action')

        if action == 'In Transit':
            parcel = Parcel.objects.get(pk=booking.parcel.id)

            parcel.status = 'In Transit'
            parcel.updated_at = timezone.now()
            parcel.save()

            user_id = request.session.get('user_id')

            userrecord = User.objects.get(id=user_id)

            Parcelstatus.objects.create(
                parcel = parcel,
                status = 'In Transit',
                updated_by_user = userrecord,
                updated_at = timezone.now()
            )

            booking = Booking.objects.get(id = id )
            print(action)

        elif action == 'Arrived':
            parcel = Parcel.objects.get(pk=booking.parcel.id)

            parcel.status = 'Arrived'
            parcel.updated_at = timezone.now()
            parcel.save()

            user_id = request.session.get('user_id')
            userrecord = User.objects.get(id=user_id)

            Parcelstatus.objects.create(
                parcel = parcel,
                status = 'Parcel arrived at {}'.format(parcel.to_city.name),
                updated_by_user = userrecord,
                updated_at = timezone.now()
            )

            booking = Booking.objects.get(id = id )
            print(action)
        
        elif action == 'Delivered':
            
            parcel = Parcel.objects.get(pk=booking.parcel.id)

            parcel.status = 'Delivered'
            parcel.updated_at = timezone.now()
            parcel.save()

            user_id = request.session.get('user_id')

            userrecord = User.objects.get(id=user_id)

            Parcelstatus.objects.create(
                parcel = parcel,
                status = 'Parcel delivered from {}'.format(parcel.to_city.name),
                updated_by_user = userrecord,
                updated_at = timezone.now()
            )

            booking = Booking.objects.get(id = id )
 
    parcelStatuses = Parcelstatus.objects.filter(parcel__pk = booking.parcel.pk).order_by('-updated_at')

    return render(request, 'admin/update-admin-booking.html',{'booking' : booking, 'parcelStatuses'  : parcelStatuses, 'id':id})


def invoice(request,id):
    booking = Booking.objects.get(id = id)
    parcel = booking.parcel
    customer = booking.customer
    pricing = Pricing.objects.latest('created_at')
    invoice = {
        'booking' : booking,
        'parcel' : parcel,
        'customer' : customer,
        'date' : booking.booking_date,
        'pricing' : pricing
    }

    return render(request, 'customer/invoice.html',invoice)


def customerEstimateView(request):
    cities = City.objects.all()
    form = {'pick_address':'', 'deliver_address':'',
              'parcel_type':'','action':''}
    
    context= { 'form':form,'cities':cities}
    if request.method == 'POST':
        pick_address_id = request.POST.get('pick_address')
        deliver_address_id = request.POST.get('deliver_address')
        parcel_type = request.POST.get('parcel_type')
        action = request.POST.get('action')

        form = { 
              'pick_address':pick_address_id, 'deliver_address':deliver_address_id,
              'parcel_type':parcel_type,'action':action}
            
        if not all([ pick_address_id, deliver_address_id, parcel_type]):
            messages.error(request, "All fields are required.")
            context= { 'form':form,'cities':cities}
            return render(request,'customer/booking-estimate.html',context)

        try:
            pick_city = City.objects.get(id=pick_address_id)
            deliver_city = City.objects.get(id=deliver_address_id)
        except City.DoesNotExist:
            messages.error(request, "Invalid city selected.")
            context= { 'form':form,'cities':cities}
            return render(request,'customer/booking-estimate.html',context)

        if (pick_city == deliver_city):
            messages.error(request,"Pickup address and deliver address should not be same.")
            context= { 'form':form,'cities':cities}
            return render(request,"customer/booking-estimate.html",context)

        try:
            delivery_route = Deliveryroute.objects.get(from_city=pick_city, to_city=deliver_city)
            distance = delivery_route.distance_km
        except Deliveryroute.DoesNotExist:
            messages.error(request, "No delivery route found.")
            context= { 'form':form,'cities':cities}
            return render(request,'customer/booking-estimate.html',context)

        try:
            pricing = Pricing.objects.latest('created_at')
        except Pricing.DoesNotExist:
            messages.error(request, "Pricing details notvailable.")
            context= { 'form':form,'cities':cities}
            return render(request,'customer/booking-estimate.html',context)

        base_price = pricing.base_price or 0
        price_per_km = pricing.price_per_km or 0
        
        if parcel_type == 'medium':
            price_per_km = price_per_km * 2
        elif parcel_type == 'large':
            price_per_km = price_per_km * 4

        estimated_price = base_price + (price_per_km * distance)

        if action == 'estimate':
            messages.info(request, "Estimated price: Rs{:.2f}".format(estimated_price))
            context= { 'form':form,'cities':cities}
            return render(request,'customer/booking-estimate.html', context)
    
    # return render(request,'admin/add-admin-booking.html', {'cities': cities,'form':form})
    return render(request,'customer/booking-estimate.html', context)

def invoice_View(request,id):
    booking = Booking.objects.get(id = id )

    if booking == None:
        return redirect('/')
    invoice = Invoice.objects.get(bookingid=booking)
    print(invoice)
    return render(request, 'invoice.html',{'invoice':invoice})

def addInvoice(booking):
     Invoice.objects.create(
            createdon = timezone.now(),
            customername = str(booking.customer.user.first_name) + str(' ') + str(booking.customer.user.last_name),
            description = str(booking.parcel.from_city.name) + str(' to ') + str(booking.parcel.to_city.name),
            price=booking.parcel.price,
            bookingid = booking
        )
     return booking

from django.db.models import Q

def bookingReportView(request):
    bookings = Booking.objects.all()
    bookings = {
        'bookedBookings':bookings.filter(parcel__status = 'Booked'),
        'inTransitBookings':bookings.filter(parcel__status = 'In Transit'),
        'deliveredBookings':bookings.filter(parcel__status = 'Delivered'),
        'pendingPayments':bookings.filter(payment_status = 'Pending'),
        'arrivedAtDestinationPayments':bookings.filter(parcel__status = 'Arrived'),
    }

    return render(request,'admin/booking-report.html',{'bookings': bookings})    

def customerReportView(request):
    customers = Customer.objects.all()
    return render(request,'admin/customer-report.html',{'customers': customers})    

def contact(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        phonenumber = request.POST.get('phonenumber')
        message = request.POST.get('message')
        Contactus.objects.create(
            name=name,
            email=email,
            phonenumber=phonenumber,
            message=message
        )

    return render(request, 'home/contact.html')

def contactlist(request):
    contact = Contactus.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            contact = Contactus.objects.filter(id__icontains = cr )
    return render(request,'admin/contactlist.html', {'contacts': contact})

def invoice_list(request):
    invoices = Invoice.objects.all()
    if request.method=="GET":
        cr = request.GET.get('searchinput')
        if cr!= None:
            invoices = Invoice.objects.filter(customername__icontains = cr )
    return render(request, 'admin/invoicelist.html', {'invoices': invoices})

def add_Customer_AdminView(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        contact = request.POST.get('contact')
        email = request.POST.get('email')
        address = request.POST.get('address')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        if not username or not first_name or not last_name or not contact or not email or not address or not password or not confirm_password:
            messages.error(request, 'All fields are required.')
            return render(request, 'admin/add-customer.html')
        if password != confirm_password:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'admin/add-customer.html')
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Invalid email format.')
            return render(request, 'admin/add-customer.html')
        if len(username) < 5:
            messages.error(request, 'Username must be at least 5 characters long.')
            return render(request, 'user/register.html')
        if len(password) < 8:
            messages.error(request, 'Password must be at least 8 characters long.')
            return render(request, 'user/register.html')
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'admin/add-customer.html')
        if User.objects.filter(email=email.lower()).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'admin/add-customer.html')
        hashed_password = make_password(password)
        user = User.objects.create(
            username=username,
            password=hashed_password,
            email=email.lower(),
            first_name=first_name,
            last_name=last_name,
            role='Customer' ,
            date_joined = timezone.now()

        )
        Customer.objects.create(
            user=user,
            phone_number=contact,
            address=address
        )
        messages.success(request, 'Customer added successfully')
        return redirect('/customer-list/')
    return render(request, 'admin/add-customer.html')    

def edit_CustomerView(request,id):
    customer = Customer.objects.get(pk=id)

    print(customer.user.email)
    if request.method == "POST":
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        phone_number = request.POST.get('phone_number')
        email = request.POST.get('email')
        address = request.POST.get('address')

        # Validate inputs
        if not username or not first_name or not last_name or not phone_number or not email or not address:
            messages.error(request, 'All fields are required.')
            return render(request, 'admin/update_customer.html', {'customer': customer})
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Invalid email format.')
            return render(request, 'admin/update_customer.html', {'customer': customer})
        if len(username) < 5:
            messages.error(request, 'Username must be at least 5 characters long.')
            return render(request, 'admin/update_customer.html', {'customer': customer})
        if User.objects.filter(username=username).exclude(pk = customer.user.pk).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'admin/update_customer.html', {'customer': customer})
        if User.objects.filter(email=email.lower()).exclude(pk = customer.user.pk).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'admin/update_customer.html', {'customer': customer})

        user = User.objects.get(pk=customer.user.pk)
        user.username=username
        
        user.email=email
        user.first_name=first_name
        user.last_name=last_name
        user.role='Customer'

        customer.phone_number = phone_number
        customer.address = address

        user.save()
        customer.save()

        return redirect('customer-list')
    return render(request, 'admin/update_customer.html', {'customer': customer})
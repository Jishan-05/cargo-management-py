from django.db import models

# Create your models here.



class Admin(models.Model):
    user = models.ForeignKey('User', models.CASCADE, blank=True, null=True)
    phone_number = models.CharField(max_length=20)
    address = models.TextField()

    class Meta:
        managed = False
        db_table = 'admin'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Booking(models.Model):
    parcel = models.ForeignKey('Parcel', models.CASCADE, blank=True, null=True)
    customer = models.ForeignKey('Customer', models.CASCADE, blank=True, null=True)
    booking_date = models.DateTimeField(blank=True, null=True)
    amount_paid = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    payment_status = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'booking'


class City(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(db_column='Address', max_length=1000)  # Field name made lowercase.
    state = models.ForeignKey('State', models.CASCADE, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'city'


class Country(models.Model):
    name = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'country'


class Customer(models.Model):
    user = models.ForeignKey('User', models.CASCADE, blank=True, null=True)
    phone_number = models.CharField(max_length=20, blank=True, null=True)
    address = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customer'


class Deliveryroute(models.Model):
    from_city = models.ForeignKey(City, models.CASCADE, blank=True, null=True)
    to_city = models.ForeignKey(City, models.CASCADE, related_name='deliveryroute_to_city_set', blank=True, null=True)
    distance_km = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'deliveryroute'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Employee(models.Model):
    user = models.ForeignKey('User', models.CASCADE, blank=True, null=True)
    phone_number = models.CharField(max_length=20, blank=True, null=True)
    position = models.CharField(max_length=255, blank=True, null=True)
    address = models.TextField()

    class Meta:
        managed = False
        db_table = 'employee'


class Parcel(models.Model):
    tracking_id = models.CharField(unique=True, max_length=255)
    customer = models.ForeignKey(Customer, models.CASCADE, blank=True, null=True)
    parcel_type = models.CharField(max_length=100)
    from_city = models.ForeignKey(City, models.CASCADE, blank=True, null=True)
    to_city = models.ForeignKey(City, models.CASCADE, related_name='parcel_to_city_set', blank=True, null=True)
    weight = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    height = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    length = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    width = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    status = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'parcel'


class Parcelstatus(models.Model):
    parcel = models.ForeignKey(Parcel, models.CASCADE, blank=True, null=True)
    status = models.CharField(max_length=10)
    updated_by_user = models.ForeignKey('User', models.CASCADE, blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'parcelstatus'


class Pricing(models.Model):
    base_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    price_per_km = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    price_per_kg = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pricing'


class State(models.Model):
    name = models.CharField(max_length=255)
    country = models.ForeignKey(Country, models.CASCADE, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'state'


class User(models.Model):
    username = models.CharField(unique=True, max_length=255)
    password = models.CharField(max_length=255)
    email = models.CharField(unique=True, max_length=255)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    role = models.CharField(max_length=8)
    date_joined = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user'

        

class Feedback(models.Model):
    createdby = models.ForeignKey(Customer, models.CASCADE, db_column='createdby', blank=True, null=True)
    feedback_text = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'feedback'

class Contactus(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=50)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=50)  # Field name made lowercase.
    phonenumber = models.CharField(db_column='PhoneNumber', max_length=15)  # Field name made lowercase.
    message = models.CharField(db_column='Message', max_length=255)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'contactus'

class Invoice(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    createdon = models.DateField(db_column='CreatedOn')  # Field name made lowercase.
    customername = models.CharField(db_column='CustomerName', max_length=255)  # Field name made lowercase.
    description = models.CharField(db_column='Description', max_length=255)  # Field name made lowercase.
    price = models.CharField(db_column='Price', max_length=255)  # Field name made lowercase.
    bookingid = models.ForeignKey(Booking, models.CASCADE, db_column='BookingId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'invoice'
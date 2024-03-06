2023-12-08 23:25:56,071 p=2812 u=gonzales n=ansible | ERROR! We were unable to read either as JSON nor YAML, these are the errors we got from each:
JSON: Expecting value: line 1 column 1 (char 0)

Syntax Error while loading YAML.
  mapping values are not allowed in this context

The error appears to be in '/home/gonzales/HOA15/roles/neutron/tasks/main.yml': line 34, column 20, but may
be elsewhere in the file depending on the exact syntax problem.

The offending line appears to be:

      mysql_host: localhost
       mysql_socket: /run/mysqld/mysqld.sock
                   ^ here

2023-12-08 23:27:18,000 p=2824 u=gonzales n=ansible | ERROR! We were unable to read either as JSON nor YAML, these are the errors we got from each:
JSON: Expecting value: line 1 column 1 (char 0)

Syntax Error while loading YAML.
  mapping values are not allowed in this context

The error appears to be in '/home/gonzales/HOA15/roles/neutron/tasks/main.yml': line 39, column 17, but may
be elsewhere in the file depending on the exact syntax problem.

The offending line appears to be:

       name: neutron
        password: "{{ neutron_db_password }}"
                ^ here
We could be wrong, but this one looks like it might be an issue with
missing quotes. Always quote template expression brackets when they
start a value. For instance:

    with_items:
      - {{ foo }}

Should be written as:

    with_items:
      - "{{ foo }}"

2023-12-08 23:28:26,246 p=2831 u=gonzales n=ansible | ERROR! conflicting action statements: mysql_db, mysql_host

The error appears to be in '/home/gonzales/HOA15/roles/neutron/tasks/main.yml': line 24, column 7, but may
be elsewhere in the file depending on the exact syntax problem.

The offending line appears to be:


    - name: Create Neutron Database
      ^ here

2023-12-08 23:31:30,361 p=2961 u=gonzales n=ansible | PLAY [Install Neutron Service] ********************************************************************************************************
2023-12-08 23:31:30,372 p=2961 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:31:31,317 p=2961 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:31:31,323 p=2961 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:31:35,271 p=2961 u=gonzales n=ansible | The following NEW packages will be installed:
  python3-mysqldb
0 upgraded, 1 newly installed, 0 to remove and 5 not upgraded.
2023-12-08 23:31:35,272 p=2961 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-08 23:31:35,275 p=2961 u=gonzales n=ansible | TASK [Create Neutron Database name=neutron, state=present, login_host=localhost, login_user=root, login_password=211419.!, login_unix_socket=/run/mysqld/mysqld.sock] ***
2023-12-08 23:31:35,645 p=2961 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-08 23:31:35,649 p=2961 u=gonzales n=ansible | TASK [Create Neutron Database User name=neutron, password={{ neutron_db_password }}, host=localhost, priv=neutron.*:ALL, state=present] ***
2023-12-08 23:31:36,061 p=2961 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to connect to database, check login_user and login_password are correct or /root/.my.cnf has the credentials. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:31:36,062 p=2961 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:31:36,062 p=2961 u=gonzales n=ansible | 192.168.56.108             : ok=3    changed=2    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:34:33,526 p=3326 u=gonzales n=ansible | PLAY [Install Neutron Service] ********************************************************************************************************
2023-12-08 23:34:33,533 p=3326 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:34:34,368 p=3326 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:34:34,373 p=3326 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:34:35,244 p=3326 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:34:35,247 p=3326 u=gonzales n=ansible | TASK [Create Neutron Database name=neutron, state=present, login_host=localhost, login_user=root, login_password=211419.!, login_unix_socket=/run/mysqld/mysqld.sock] ***
2023-12-08 23:34:35,592 p=3326 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:34:35,594 p=3326 u=gonzales n=ansible | TASK [Create Neutron Database User name=neutron, password={{ neutron_db_password }}, host=localhost, priv=neutron.*:ALL, state=present] ***
2023-12-08 23:34:35,955 p=3326 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to connect to database, check login_user and login_password are correct or /root/.my.cnf has the credentials. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:34:35,957 p=3326 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:34:35,957 p=3326 u=gonzales n=ansible | 192.168.56.108             : ok=3    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:36:41,877 p=3398 u=gonzales n=ansible | PLAY [Install Neutron Service] ********************************************************************************************************
2023-12-08 23:36:41,883 p=3398 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:36:42,696 p=3398 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:36:42,701 p=3398 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:36:43,573 p=3398 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:36:43,577 p=3398 u=gonzales n=ansible | TASK [Create Neutron Database name=neutron, state=present] ****************************************************************************
2023-12-08 23:36:43,917 p=3398 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to find /root/.my.cnf. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:36:43,918 p=3398 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:36:43,918 p=3398 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:38:20,299 p=3464 u=gonzales n=ansible | PLAY [Install Neutron Service] ********************************************************************************************************
2023-12-08 23:38:20,305 p=3464 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:38:21,135 p=3464 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:38:21,140 p=3464 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:38:22,049 p=3464 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:38:22,052 p=3464 u=gonzales n=ansible | TASK [Create Neutron Database name=neutron, state=present] ****************************************************************************
2023-12-08 23:38:22,404 p=3464 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to find /root/.my.cnf. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:38:22,405 p=3464 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:38:22,405 p=3464 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:39:52,010 p=3513 u=gonzales n=ansible | PLAY [Install Neutron Service] ********************************************************************************************************
2023-12-08 23:39:52,016 p=3513 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:39:52,833 p=3513 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:39:52,839 p=3513 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:39:53,752 p=3513 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:39:53,755 p=3513 u=gonzales n=ansible | TASK [Create Neutron Database name=neutron, state=present, login_user=root, login_password=211419.!, login_host=localhost, login_unix_socket=/run/mysqld/mysqld.sock] ***
2023-12-08 23:39:54,111 p=3513 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:39:54,114 p=3513 u=gonzales n=ansible | TASK [Create Neutron Database User name=neutron, password={{ neutron_db_password }}, host=localhost, priv=neutron.*:ALL, state=present] ***
2023-12-08 23:39:54,473 p=3513 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to connect to database, check login_user and login_password are correct or /root/.my.cnf has the credentials. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:39:54,474 p=3513 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:39:54,474 p=3513 u=gonzales n=ansible | 192.168.56.108             : ok=3    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:42:28,095 p=3567 u=gonzales n=ansible | PLAY [Install Horizon Service] ********************************************************************************************************
2023-12-08 23:42:28,101 p=3567 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:42:28,913 p=3567 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:42:28,918 p=3567 u=gonzales n=ansible | TASK [Install openstack-dashboard package name=openstack-dashboard, state=present] ****************************************************
2023-12-08 23:42:53,036 p=3567 u=gonzales n=ansible | The following additional packages will be installed:
  openstack-dashboard-common python3-asgiref python3-bson python3-bson-ext
  python3-csscompressor python3-django python3-django-appconf
  python3-django-compressor python3-django-debreach python3-django-horizon
  python3-django-openstack-auth python3-django-pyscss python3-gridfs
  python3-heatclient python3-pint python3-pymongo python3-pymongo-ext
  python3-pyscss python3-rcssmin python3-rjsmin
Suggested packages:
  bpython3 geoip-database-contrib gettext ipython3 libgdal20
  libsqlite3-mod-spatialite python-django-doc python3-flup python3-selenium
  python3-sqlite python-django-appconf-doc python3-calmjs
  python-django-debreach-doc python-pymongo-doc
The following NEW packages will be installed:
  openstack-dashboard openstack-dashboard-common python3-asgiref python3-bson
  python3-bson-ext python3-csscompressor python3-django python3-django-appconf
  python3-django-compressor python3-django-debreach python3-django-horizon
  python3-django-openstack-auth python3-django-pyscss python3-gridfs
  python3-heatclient python3-pint python3-pymongo python3-pymongo-ext
  python3-pyscss python3-rcssmin python3-rjsmin
0 upgraded, 21 newly installed, 0 to remove and 5 not upgraded.
2023-12-08 23:42:53,036 p=3567 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-08 23:42:53,042 p=3567 u=gonzales n=ansible | TASK [Configure local_settings.py src=local_settings.py.j2, dest=/etc/openstack-dashboard/local_settings.py] **************************
2023-12-08 23:42:54,275 p=3567 u=gonzales n=ansible | [0;31m--- before: /etc/openstack-dashboard/local_settings.py[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-3567cdbt8r2z/tmp5iwwdalz/local_settings.py.j2[0m
[0;32m[0m[0;36m@@ -1,402 +1,32 @@[0m
[0;36m[0m[0;31m-# -*- coding: utf-8 -*-[0m
[0;31m[0m[0;32m+# /etc/openstack-dashboard/local_settings.py[0m
[0;32m[0m 
[0;31m-# ----------------------------------------------------------------------[0m
[0;31m[0m[0;31m-# NOTE: The default values of the settings are defined in[0m
[0;31m[0m[0;31m-# openstack_dashboard/defaults.py. Previously most available settings[0m
[0;31m[0m[0;31m-# were listed in this example file, but it is no longer true.[0m
[0;31m[0m[0;31m-# For available settings, see openstack_dashboard/defaults.py and[0m
[0;31m[0m[0;31m-# the horizon setting reference found at[0m
[0;31m[0m[0;31m-# https://docs.openstack.org/horizon/latest/configuration/settings.html.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Django related settings and HORIZON_CONFIG still exist here.[0m
[0;31m[0m[0;31m-# Keep in my mind that they will be revisit in upcoming releases.[0m
[0;31m[0m[0;31m-# ----------------------------------------------------------------------[0m
[0;31m[0m[0;32m+# ... (existing configuration)[0m
[0;32m[0m 
[0;31m-import os[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-from django.utils.translation import gettext_lazy as _[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-from horizon.utils import secret_key[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-from openstack_dashboard.settings import HORIZON_CONFIG[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-DEBUG = False[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# This setting controls whether or not compression is enabled. Disabling[0m
[0;31m[0m[0;31m-# compression makes Horizon considerably slower, but makes it much easier[0m
[0;31m[0m[0;31m-# to debug JS and CSS changes[0m
[0;31m[0m[0;31m-#COMPRESS_ENABLED = not DEBUG[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# This setting controls whether compression happens on the fly, or offline[0m
[0;31m[0m[0;31m-# with `python manage.py compress`[0m
[0;31m[0m[0;31m-# See https://django-compressor.readthedocs.io/en/latest/usage/#offline-compression[0m
[0;31m[0m[0;31m-# for more information[0m
[0;31m[0m[0;31m-#COMPRESS_OFFLINE = not DEBUG[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If horizon is running in production (DEBUG is False), set this[0m
[0;31m[0m[0;31m-# with the list of host/domain names that the application can serve.[0m
[0;31m[0m[0;31m-# For more information see:[0m
[0;31m[0m[0;31m-# https://docs.djangoproject.com/en/dev/ref/settings/#allowed-hosts[0m
[0;31m[0m[0;31m-#ALLOWED_HOSTS = ['horizon.example.com', ][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Set SSL proxy settings:[0m
[0;31m[0m[0;31m-# Pass this header from the proxy after terminating the SSL,[0m
[0;31m[0m[0;31m-# and don't forget to strip it from the client's request.[0m
[0;31m[0m[0;31m-# For more information see:[0m
[0;31m[0m[0;31m-# https://docs.djangoproject.com/en/dev/ref/settings/#secure-proxy-ssl-header[0m
[0;31m[0m[0;31m-#SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If Horizon is being served through SSL, then uncomment the following two[0m
[0;31m[0m[0;31m-# settings to better secure the cookies from security exploits[0m
[0;31m[0m[0;31m-#CSRF_COOKIE_SECURE = True[0m
[0;31m[0m[0;31m-#SESSION_COOKIE_SECURE = True[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If provided, a "Report Bug" link will be displayed in the site header[0m
[0;31m[0m[0;31m-# which links to the value of this setting (ideally a URL containing[0m
[0;31m[0m[0;31m-# information on how to report issues).[0m
[0;31m[0m[0;31m-#HORIZON_CONFIG["bug_url"] = "http://bug-report.example.com"[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Show backdrop element outside the modal, do not close the modal[0m
[0;31m[0m[0;31m-# after clicking on backdrop.[0m
[0;31m[0m[0;31m-#HORIZON_CONFIG["modal_backdrop"] = "static"[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Specify a regular expression to validate user passwords.[0m
[0;31m[0m[0;31m-#HORIZON_CONFIG["password_validator"] = {[0m
[0;31m[0m[0;31m-#    "regex": '.*',[0m
[0;31m[0m[0;31m-#    "help_text": _("Your password does not meet the requirements."),[0m
[0;31m[0m[0;31m-#}[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Turn off browser autocompletion for forms including the login form and[0m
[0;31m[0m[0;31m-# the database creation workflow if so desired.[0m
[0;31m[0m[0;31m-#HORIZON_CONFIG["password_autocomplete"] = "off"[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Setting this to True will disable the reveal button for password fields,[0m
[0;31m[0m[0;31m-# including on the login form.[0m
[0;31m[0m[0;31m-#HORIZON_CONFIG["disable_password_reveal"] = False[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-LOCAL_PATH = os.path.dirname(os.path.abspath(__file__))[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Set custom secret key:[0m
[0;31m[0m[0;31m-# You can either set it to a specific value or you can let horizon generate a[0m
[0;31m[0m[0;31m-# default secret key that is unique on this machine, e.i. regardless of the[0m
[0;31m[0m[0;31m-# amount of Python WSGI workers (if used behind Apache+mod_wsgi): However,[0m
[0;31m[0m[0;31m-# there may be situations where you would want to set this explicitly, e.g.[0m
[0;31m[0m[0;31m-# when multiple dashboard instances are distributed on different machines[0m
[0;31m[0m[0;31m-# (usually behind a load-balancer). Either you have to make sure that a session[0m
[0;31m[0m[0;31m-# gets all requests routed to the same dashboard instance or you set the same[0m
[0;31m[0m[0;31m-# SECRET_KEY for all of them.[0m
[0;31m[0m[0;31m-SECRET_KEY = secret_key.generate_or_read_from_file('/var/lib/openstack-dashboard/secret_key')[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# We recommend you use memcached for development; otherwise after every reload[0m
[0;31m[0m[0;31m-# of the django development server, you will have to login again. To use[0m
[0;31m[0m[0;31m-# memcached set CACHES to something like below.[0m
[0;31m[0m[0;31m-# For more information, see[0m
[0;31m[0m[0;31m-# https://docs.djangoproject.com/en/1.11/topics/http/sessions/.[0m
[0;31m[0m[0;32m+OPENSTACK_HOST = "192.168.56.106"[0m
[0;32m[0m[0;32m+ALLOWED_HOSTS = ['*'][0m
[0;32m[0m[0;32m+SESSION_ENGINE = 'django.contrib.sessions.backends.cache'[0m
[0;32m[0m 
 CACHES = {
     'default': {
         'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
[0;31m-        'LOCATION': '127.0.0.1:11211',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;32m+        'LOCATION': '192.168.56.102:11211',[0m
[0;32m[0m[0;32m+    }[0m
[0;32m[0m }
 
[0;31m-#CACHES = {[0m
[0;31m[0m[0;31m-#    'default': {[0m
[0;31m[0m[0;31m-#        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',[0m
[0;31m[0m[0;31m-#    }[0m
[0;31m[0m[0;31m-#}[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If you use ``tox -e runserver`` for developments,then configure[0m
[0;31m[0m[0;31m-# SESSION_ENGINE to django.contrib.sessions.backends.signed_cookies[0m
[0;31m[0m[0;31m-# as shown below:[0m
[0;31m[0m[0;31m-#SESSION_ENGINE = 'django.contrib.sessions.backends.signed_cookies'[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Send email to the console by default[0m
[0;31m[0m[0;31m-EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'[0m
[0;31m[0m[0;31m-# Or send them to /dev/null[0m
[0;31m[0m[0;31m-#EMAIL_BACKEND = 'django.core.mail.backends.dummy.EmailBackend'[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Configure these for your outgoing email host[0m
[0;31m[0m[0;31m-#EMAIL_HOST = 'smtp.my-company.com'[0m
[0;31m[0m[0;31m-#EMAIL_PORT = 25[0m
[0;31m[0m[0;31m-#EMAIL_HOST_USER = 'djangomail'[0m
[0;31m[0m[0;31m-#EMAIL_HOST_PASSWORD = 'top-secret!'[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-OPENSTACK_HOST = "127.0.0.1"[0m
[0;31m[0m[0;31m-OPENSTACK_KEYSTONE_URL = "http://%s/identity/v3" % OPENSTACK_HOST[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The timezone of the server. This should correspond with the timezone[0m
[0;31m[0m[0;31m-# of your entire OpenStack installation, and hopefully be in UTC.[0m
[0;31m[0m[0;31m-TIME_ZONE = "UTC"[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Change this patch to the appropriate list of tuples containing[0m
[0;31m[0m[0;31m-# a key, label and static directory containing two files:[0m
[0;31m[0m[0;31m-# _variables.scss and _styles.scss[0m
[0;31m[0m[0;31m-#AVAILABLE_THEMES = [[0m
[0;31m[0m[0;31m-#    ('default', 'Default', 'themes/default'),[0m
[0;31m[0m[0;31m-#    ('material', 'Material', 'themes/material'),[0m
[0;31m[0m[0;31m-#    ('example', 'Example', 'themes/example'),[0m
[0;31m[0m[0;31m-#][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-LOGGING = {[0m
[0;31m[0m[0;31m-    'version': 1,[0m
[0;31m[0m[0;31m-    # When set to True this will disable all logging except[0m
[0;31m[0m[0;31m-    # for loggers specified in this configuration dictionary. Note that[0m
[0;31m[0m[0;31m-    # if nothing is specified here and disable_existing_loggers is True,[0m
[0;31m[0m[0;31m-    # django.db.backends will still log unless it is disabled explicitly.[0m
[0;31m[0m[0;31m-    'disable_existing_loggers': False,[0m
[0;31m[0m[0;31m-    # If apache2 mod_wsgi is used to deploy OpenStack dashboard[0m
[0;31m[0m[0;31m-    # timestamp is output by mod_wsgi. If WSGI framework you use does not[0m
[0;31m[0m[0;31m-    # output timestamp for logging, add %(asctime)s in the following[0m
[0;31m[0m[0;31m-    # format definitions.[0m
[0;31m[0m[0;31m-    'formatters': {[0m
[0;31m[0m[0;31m-        'console': {[0m
[0;31m[0m[0;31m-            'format': '%(levelname)s %(name)s %(message)s'[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'operation': {[0m
[0;31m[0m[0;31m-            # The format of "%(message)s" is defined by[0m
[0;31m[0m[0;31m-            # OPERATION_LOG_OPTIONS['format'][0m
[0;31m[0m[0;31m-            'format': '%(message)s'[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'handlers': {[0m
[0;31m[0m[0;31m-        'null': {[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'class': 'logging.NullHandler',[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'console': {[0m
[0;31m[0m[0;31m-            # Set the level to "DEBUG" for verbose output logging.[0m
[0;31m[0m[0;31m-            'level': 'DEBUG' if DEBUG else 'INFO',[0m
[0;31m[0m[0;31m-            'class': 'logging.StreamHandler',[0m
[0;31m[0m[0;31m-            'formatter': 'console',[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'operation': {[0m
[0;31m[0m[0;31m-            'level': 'INFO',[0m
[0;31m[0m[0;31m-            'class': 'logging.StreamHandler',[0m
[0;31m[0m[0;31m-            'formatter': 'operation',[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'loggers': {[0m
[0;31m[0m[0;31m-        'horizon': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'horizon.operation_log': {[0m
[0;31m[0m[0;31m-            'handlers': ['operation'],[0m
[0;31m[0m[0;31m-            'level': 'INFO',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'openstack_dashboard': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'novaclient': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'cinderclient': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'keystoneauth': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'keystoneclient': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'glanceclient': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'neutronclient': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'swiftclient': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'oslo_policy': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'openstack_auth': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'django': {[0m
[0;31m[0m[0;31m-            'handlers': ['console'],[0m
[0;31m[0m[0;31m-            'level': 'DEBUG',[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        # Logging from django.db.backends is VERY verbose, send to null[0m
[0;31m[0m[0;31m-        # by default.[0m
[0;31m[0m[0;31m-        'django.db.backends': {[0m
[0;31m[0m[0;31m-            'handlers': ['null'],[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'requests': {[0m
[0;31m[0m[0;31m-            'handlers': ['null'],[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'urllib3': {[0m
[0;31m[0m[0;31m-            'handlers': ['null'],[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'chardet.charsetprober': {[0m
[0;31m[0m[0;31m-            'handlers': ['null'],[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'iso8601': {[0m
[0;31m[0m[0;31m-            'handlers': ['null'],[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-        'scss': {[0m
[0;31m[0m[0;31m-            'handlers': ['null'],[0m
[0;31m[0m[0;31m-            'propagate': False,[0m
[0;31m[0m[0;31m-        },[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;32m+OPENSTACK_KEYSTONE_URL = "http://%s:5000/identity/v3" % OPENSTACK_HOST[0m
[0;32m[0m[0;32m+OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = True[0m
[0;32m[0m[0;32m+OPENSTACK_API_VERSIONS = {[0m
[0;32m[0m[0;32m+    "identity": 3,[0m
[0;32m[0m[0;32m+    "image": 2,[0m
[0;32m[0m[0;32m+    "volume": 3,[0m
[0;32m[0m }
[0;31m-[0m
[0;31m[0m[0;31m-# 'direction' should not be specified for all_tcp/udp/icmp.[0m
[0;31m[0m[0;31m-# It is specified in the form.[0m
[0;31m[0m[0;31m-SECURITY_GROUP_RULES = {[0m
[0;31m[0m[0;31m-    'all_tcp': {[0m
[0;31m[0m[0;31m-        'name': _('All TCP'),[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '1',[0m
[0;31m[0m[0;31m-        'to_port': '65535',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'all_udp': {[0m
[0;31m[0m[0;31m-        'name': _('All UDP'),[0m
[0;31m[0m[0;31m-        'ip_protocol': 'udp',[0m
[0;31m[0m[0;31m-        'from_port': '1',[0m
[0;31m[0m[0;31m-        'to_port': '65535',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'all_icmp': {[0m
[0;31m[0m[0;31m-        'name': _('All ICMP'),[0m
[0;31m[0m[0;31m-        'ip_protocol': 'icmp',[0m
[0;31m[0m[0;31m-        'from_port': '-1',[0m
[0;31m[0m[0;31m-        'to_port': '-1',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'ssh': {[0m
[0;31m[0m[0;31m-        'name': 'SSH',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '22',[0m
[0;31m[0m[0;31m-        'to_port': '22',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'smtp': {[0m
[0;31m[0m[0;31m-        'name': 'SMTP',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '25',[0m
[0;31m[0m[0;31m-        'to_port': '25',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'dns': {[0m
[0;31m[0m[0;31m-        'name': 'DNS',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '53',[0m
[0;31m[0m[0;31m-        'to_port': '53',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'http': {[0m
[0;31m[0m[0;31m-        'name': 'HTTP',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '80',[0m
[0;31m[0m[0;31m-        'to_port': '80',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'pop3': {[0m
[0;31m[0m[0;31m-        'name': 'POP3',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '110',[0m
[0;31m[0m[0;31m-        'to_port': '110',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'imap': {[0m
[0;31m[0m[0;31m-        'name': 'IMAP',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '143',[0m
[0;31m[0m[0;31m-        'to_port': '143',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'ldap': {[0m
[0;31m[0m[0;31m-        'name': 'LDAP',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '389',[0m
[0;31m[0m[0;31m-        'to_port': '389',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'https': {[0m
[0;31m[0m[0;31m-        'name': 'HTTPS',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '443',[0m
[0;31m[0m[0;31m-        'to_port': '443',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'smtps': {[0m
[0;31m[0m[0;31m-        'name': 'SMTPS',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '465',[0m
[0;31m[0m[0;31m-        'to_port': '465',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'imaps': {[0m
[0;31m[0m[0;31m-        'name': 'IMAPS',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '993',[0m
[0;31m[0m[0;31m-        'to_port': '993',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'pop3s': {[0m
[0;31m[0m[0;31m-        'name': 'POP3S',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '995',[0m
[0;31m[0m[0;31m-        'to_port': '995',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'ms_sql': {[0m
[0;31m[0m[0;31m-        'name': 'MS SQL',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '1433',[0m
[0;31m[0m[0;31m-        'to_port': '1433',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'mysql': {[0m
[0;31m[0m[0;31m-        'name': 'MYSQL',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '3306',[0m
[0;31m[0m[0;31m-        'to_port': '3306',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;31m-    'rdp': {[0m
[0;31m[0m[0;31m-        'name': 'RDP',[0m
[0;31m[0m[0;31m-        'ip_protocol': 'tcp',[0m
[0;31m[0m[0;31m-        'from_port': '3389',[0m
[0;31m[0m[0;31m-        'to_port': '3389',[0m
[0;31m[0m[0;31m-    },[0m
[0;31m[0m[0;32m+OPENSTACK_KEYSTONE_DEFAULT_DOMAIN = "Default"[0m
[0;32m[0m[0;32m+OPENSTACK_KEYSTONE_DEFAULT_ROLE = "user"[0m
[0;32m[0m[0;32m+OPENSTACK_NEUTRON_NETWORK = {[0m
[0;32m[0m[0;32m+    'enable_router': False,[0m
[0;32m[0m[0;32m+    'enable_quotas': False,[0m
[0;32m[0m[0;32m+    'enable_ipv6': False,[0m
[0;32m[0m[0;32m+    'enable_distributed_router': False,[0m
[0;32m[0m[0;32m+    'enable_ha_router': False,[0m
[0;32m[0m[0;32m+    'enable_fip_topology_check': False,[0m
[0;32m[0m }
[0;31m-[0m
[0;31m[0m[0;31m-# Help URL can be made available for the client. To provide a help URL, edit the[0m
[0;31m[0m[0;31m-# following attribute to the URL of your choice.[0m
[0;31m[0m[0;31m-#HORIZON_CONFIG["help_url"] = "http://openstack.mycompany.org"[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-###############################################################################[0m
[0;31m[0m[0;31m-# Ubuntu Settings[0m
[0;31m[0m[0;31m-###############################################################################[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The default theme if no cookie is present[0m
[0;31m[0m[0;31m-DEFAULT_THEME = 'ubuntu'[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Default Ubuntu apache configuration uses /horizon as the application root.[0m
[0;31m[0m[0;31m-WEBROOT='/horizon/'[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# By default, validation of the HTTP Host header is disabled.  Production[0m
[0;31m[0m[0;31m-# installations should have this set accordingly.  For more information[0m
[0;31m[0m[0;31m-# see https://docs.djangoproject.com/en/dev/ref/settings/.[0m
[0;31m[0m[0;31m-ALLOWED_HOSTS = '*'[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Compress all assets offline as part of packaging installation[0m
[0;31m[0m[0;31m-COMPRESS_OFFLINE = True[0m
[0;31m[0m

2023-12-08 23:42:54,275 p=3567 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-08 23:42:54,279 p=3567 u=gonzales n=ansible | RUNNING HANDLER [Reload Apache name=apache2, state=reloaded] **************************************************************************
2023-12-08 23:42:54,964 p=3567 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-08 23:42:54,969 p=3567 u=gonzales n=ansible | PLAY [Install Cinder Service] *********************************************************************************************************
2023-12-08 23:42:54,973 p=3567 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:42:55,450 p=3567 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:42:55,455 p=3567 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:42:56,438 p=3567 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:42:56,442 p=3567 u=gonzales n=ansible | TASK [Create Cinder Database name=cinder, state=present] ******************************************************************************
2023-12-08 23:42:56,808 p=3567 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to find /root/.my.cnf. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:42:56,809 p=3567 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:42:56,809 p=3567 u=gonzales n=ansible | 192.168.56.108             : ok=6    changed=3    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:44:08,059 p=3661 u=gonzales n=ansible | PLAY [Install Cinder Service] *********************************************************************************************************
2023-12-08 23:44:08,065 p=3661 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:44:08,869 p=3661 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:44:08,875 p=3661 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:44:09,759 p=3661 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:44:09,762 p=3661 u=gonzales n=ansible | TASK [Create Cinder Database name=cinder, state=present] ******************************************************************************
2023-12-08 23:44:10,104 p=3661 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to find /root/.my.cnf. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:44:10,105 p=3661 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:44:10,105 p=3661 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:50:55,087 p=3909 u=gonzales n=ansible | PLAY [Install Cinder Service] *********************************************************************************************************
2023-12-08 23:50:55,093 p=3909 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:50:55,918 p=3909 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:50:55,923 p=3909 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:50:56,784 p=3909 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:50:56,787 p=3909 u=gonzales n=ansible | TASK [Create Cinder Database name=cinder, state=present] ******************************************************************************
2023-12-08 23:50:57,134 p=3909 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to find /root/.my.cnf. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:50:57,135 p=3909 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:50:57,135 p=3909 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:53:39,150 p=3975 u=gonzales n=ansible | PLAY [Install Cinder Service] *********************************************************************************************************
2023-12-08 23:53:39,157 p=3975 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:53:39,951 p=3975 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:53:39,956 p=3975 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:53:40,861 p=3975 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:53:40,864 p=3975 u=gonzales n=ansible | TASK [Create Cinder Database User name=cinder, password={{ cinder_db_password }}, host=localhost, priv=cinder.*:ALL, state=present] ***
2023-12-08 23:53:41,233 p=3975 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to connect to database, check login_user and login_password are correct or /root/.my.cnf has the credentials. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:53:41,234 p=3975 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:53:41,234 p=3975 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-08 23:54:09,710 p=4018 u=gonzales n=ansible | PLAY [Install Cinder Service] *********************************************************************************************************
2023-12-08 23:54:09,717 p=4018 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-08 23:54:10,320 p=4018 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:54:10,326 p=4018 u=gonzales n=ansible | TASK [Install MySQL Python package name=python3-mysqldb, state=present] ***************************************************************
2023-12-08 23:54:11,220 p=4018 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-08 23:54:11,223 p=4018 u=gonzales n=ansible | TASK [Create Cinder Database User for remote host name=cinder, password={{ cinder_db_password }}, host=%, priv=cinder.*:ALL, state=present] ***
2023-12-08 23:54:11,609 p=4018 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "msg": "unable to connect to database, check login_user and login_password are correct or /root/.my.cnf has the credentials. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}
2023-12-08 23:54:11,610 p=4018 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-08 23:54:11,611 p=4018 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-09 00:15:00,200 p=4481 u=gonzales n=ansible | PLAY [all] ****************************************************************************************************************************
2023-12-09 00:15:00,206 p=4481 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-09 00:15:00,981 p=4481 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:15:03,328 p=4481 u=gonzales n=ansible | fatal: [192.168.56.110]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 192.168.56.110 port 22: No route to host", "unreachable": true}
2023-12-09 00:15:03,335 p=4481 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-09 00:15:03,335 p=4481 u=gonzales n=ansible | 192.168.56.108             : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
2023-12-09 00:15:03,336 p=4481 u=gonzales n=ansible | 192.168.56.110             : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
2023-12-09 00:16:01,837 p=4502 u=gonzales n=ansible | PLAY [all] ****************************************************************************************************************************
2023-12-09 00:16:01,844 p=4502 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-09 00:16:02,657 p=4502 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:16:03,000 p=4502 u=gonzales n=ansible | ok: [192.168.56.110]
2023-12-09 00:16:03,009 p=4502 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-09 00:16:03,009 p=4502 u=gonzales n=ansible | 192.168.56.108             : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
2023-12-09 00:16:03,009 p=4502 u=gonzales n=ansible | 192.168.56.110             : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
2023-12-09 00:30:37,241 p=4730 u=gonzales n=ansible | PLAY [all] ****************************************************************************************************************************
2023-12-09 00:30:37,249 p=4730 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-09 00:30:38,005 p=4730 u=gonzales n=ansible | ok: [192.168.56.110]
2023-12-09 00:30:38,084 p=4730 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:30:38,089 p=4730 u=gonzales n=ansible | TASK [neutron : installing the components for neutron name=neutron-linuxbridge-agent] *************************************************
2023-12-09 00:30:38,137 p=4730 u=gonzales n=ansible | skipping: [192.168.56.110]
2023-12-09 00:30:52,137 p=4730 u=gonzales n=ansible | The following additional packages will be installed:
  conntrack ipset libipset13 neutron-common python3-designateclient
  python3-logutils python3-neutron python3-neutron-lib python3-os-ken
  python3-pecan python3-setproctitle python3-singledispatch python3-tinyrpc
  python3-waitress python3-webtest
Suggested packages:
  python-neutron-lib-doc python-pecan-doc python-tinyrpc-doc
  python-waitress-doc python-webtest-doc
The following NEW packages will be installed:
  conntrack ipset libipset13 neutron-common neutron-linuxbridge-agent
  python3-designateclient python3-logutils python3-neutron python3-neutron-lib
  python3-os-ken python3-pecan python3-setproctitle python3-singledispatch
  python3-tinyrpc python3-waitress python3-webtest
0 upgraded, 16 newly installed, 0 to remove and 5 not upgraded.
2023-12-09 00:30:52,137 p=4730 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:30:52,141 p=4730 u=gonzales n=ansible | TASK [neutron : configuring RabbitMQ message queue access dest=/etc/neutron/neutron.conf, content=[DEFAULT]
transport_url = rabbit://openstack:1234@controller
] ***
2023-12-09 00:30:53,648 p=4730 u=gonzales n=ansible | fatal: [192.168.56.110]: FAILED! => {"changed": false, "checksum": "35579e3e9f3c83d533cd93a41b046fcf5dacdcbe", "msg": "Destination directory /etc/neutron does not exist"}
2023-12-09 00:30:54,050 p=4730 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-4730kqbt5emg/tmp1ubssk6z[0m
[0;32m[0m[0;36m@@ -1,2228 +1,2 @@[0m
[0;36m[0m [DEFAULT]
[0;31m-core_plugin = ml2[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Where to store Neutron state files. This directory must be writable by the[0m
[0;31m[0m[0;31m-# agent. (string value)[0m
[0;31m[0m[0;31m-#state_path = /var/lib/neutron[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The host IP to bind to. (host address value)[0m
[0;31m[0m[0;31m-#bind_host = 0.0.0.0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The port to bind to (port value)[0m
[0;31m[0m[0;31m-# Minimum value: 0[0m
[0;31m[0m[0;31m-# Maximum value: 65535[0m
[0;31m[0m[0;31m-#bind_port = 9696[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The path for API extensions. Note that this can be a colon-separated list of[0m
[0;31m[0m[0;31m-# paths. For example: api_extensions_path =[0m
[0;31m[0m[0;31m-# extensions:/path/to/more/exts:/even/more/exts. The __path__ of[0m
[0;31m[0m[0;31m-# neutron.extensions is appended to this, so if your extensions are in there[0m
[0;31m[0m[0;31m-# you don't need to specify them here. (string value)[0m
[0;31m[0m[0;31m-#api_extensions_path =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The type of authentication to use (string value)[0m
[0;31m[0m[0;31m-#auth_strategy = keystone[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The core plugin Neutron will use (string value)[0m
[0;31m[0m[0;31m-#core_plugin = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The service plugins Neutron will use (list value)[0m
[0;31m[0m[0;31m-#service_plugins =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The base MAC address Neutron will use for VIFs. The first 3 octets will[0m
[0;31m[0m[0;31m-# remain unchanged. If the 4th octet is not 00, it will also be used. The[0m
[0;31m[0m[0;31m-# others will be randomly generated. (string value)[0m
[0;31m[0m[0;31m-#base_mac = fa:16:3e:00:00:00[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Allow the usage of the bulk API (boolean value)[0m
[0;31m[0m[0;31m-#allow_bulk = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The maximum number of items returned in a single response, value was[0m
[0;31m[0m[0;31m-# 'infinite' or negative integer means no limit (string value)[0m
[0;31m[0m[0;31m-#pagination_max_limit = -1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Default value of availability zone hints. The availability zone aware[0m
[0;31m[0m[0;31m-# schedulers use this when the resources availability_zone_hints is empty.[0m
[0;31m[0m[0;31m-# Multiple availability zones can be specified by a comma separated string.[0m
[0;31m[0m[0;31m-# This value can be empty. In this case, even if availability_zone_hints for a[0m
[0;31m[0m[0;31m-# resource is empty, availability zone is considered for high availability[0m
[0;31m[0m[0;31m-# while scheduling the resource. (list value)[0m
[0;31m[0m[0;31m-#default_availability_zones =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of DNS nameservers per subnet (integer value)[0m
[0;31m[0m[0;31m-#max_dns_nameservers = 5[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of host routes per subnet (integer value)[0m
[0;31m[0m[0;31m-#max_subnet_host_routes = 20[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enables IPv6 Prefix Delegation for automatic subnet CIDR allocation. Set to[0m
[0;31m[0m[0;31m-# True to enable IPv6 Prefix Delegation for subnet allocation in a PD-capable[0m
[0;31m[0m[0;31m-# environment. Users making subnet creation requests for IPv6 subnets without[0m
[0;31m[0m[0;31m-# providing a CIDR or subnetpool ID will be given a CIDR via the Prefix[0m
[0;31m[0m[0;31m-# Delegation mechanism. Note that enabling PD will override the behavior of the[0m
[0;31m[0m[0;31m-# default IPv6 subnetpool. (boolean value)[0m
[0;31m[0m[0;31m-#ipv6_pd_enabled = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DHCP lease duration (in seconds). Use -1 to tell dnsmasq to use infinite[0m
[0;31m[0m[0;31m-# lease times. (integer value)[0m
[0;31m[0m[0;31m-#dhcp_lease_duration = 86400[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain to use for building the hostnames (string value)[0m
[0;31m[0m[0;31m-#dns_domain = openstacklocal[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Driver for external DNS integration. (string value)[0m
[0;31m[0m[0;31m-#external_dns_driver = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Allow sending resource operation notification to DHCP agent (boolean value)[0m
[0;31m[0m[0;31m-#dhcp_agent_notification = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: Allow overlapping IP support in Neutron. Attention: the following[0m
[0;31m[0m[0;31m-# parameter MUST be set to False if Neutron is being used in conjunction with[0m
[0;31m[0m[0;31m-# Nova security groups. (boolean value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal since Yoga.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-#allow_overlapping_ips = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Hostname to be used by the Neutron server, agents and services running on[0m
[0;31m[0m[0;31m-# this machine. All the agents and services running on this machine must use[0m
[0;31m[0m[0;31m-# the same host value. (host address value)[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# This option has a sample default set, which means that[0m
[0;31m[0m[0;31m-# its actual default value may vary from the one documented[0m
[0;31m[0m[0;31m-# below.[0m
[0;31m[0m[0;31m-#host = example.domain[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# This string is prepended to the normal URL that is returned in links to the[0m
[0;31m[0m[0;31m-# OpenStack Network API. If it is empty (the default), the URLs are returned[0m
[0;31m[0m[0;31m-# unchanged. (string value)[0m
[0;31m[0m[0;31m-#network_link_prefix = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Send notification to nova when port status changes (boolean value)[0m
[0;31m[0m[0;31m-#notify_nova_on_port_status_changes = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Send notification to nova when port data (fixed_ips/floatingip) changes so[0m
[0;31m[0m[0;31m-# nova can update its cache. (boolean value)[0m
[0;31m[0m[0;31m-#notify_nova_on_port_data_changes = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of seconds between sending events to nova if there are any events to[0m
[0;31m[0m[0;31m-# send. (integer value)[0m
[0;31m[0m[0;31m-#send_events_interval = 2[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Set process name to match child worker role. Available options are: 'off' -[0m
[0;31m[0m[0;31m-# retains the previous behavior; 'on' - renames processes to 'neutron-server:[0m
[0;31m[0m[0;31m-# role (original string)'; 'brief' - renames the same as 'on', but without the[0m
[0;31m[0m[0;31m-# original string, such as 'neutron-server: role'. (string value)[0m
[0;31m[0m[0;31m-#setproctitle = on[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Neutron IPAM (IP address management) driver to use. By default, the reference[0m
[0;31m[0m[0;31m-# implementation of the Neutron IPAM driver is used. (string value)[0m
[0;31m[0m[0;31m-#ipam_driver = internal[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If True, then allow plugins that support it to create VLAN transparent[0m
[0;31m[0m[0;31m-# networks. (boolean value)[0m
[0;31m[0m[0;31m-#vlan_transparent = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If True, then allow plugins to decide whether to perform validations on[0m
[0;31m[0m[0;31m-# filter parameters. Filter validation is enabled if this config is turned on[0m
[0;31m[0m[0;31m-# and it is supported by all plugins (boolean value)[0m
[0;31m[0m[0;31m-#filter_validation = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# MTU of the underlying physical network. Neutron uses this value to calculate[0m
[0;31m[0m[0;31m-# MTU for all virtual network components. For flat and VLAN networks, neutron[0m
[0;31m[0m[0;31m-# uses this value without modification. For overlay networks such as VXLAN,[0m
[0;31m[0m[0;31m-# neutron automatically subtracts the overlay protocol overhead from this[0m
[0;31m[0m[0;31m-# value. Defaults to 1500, the standard value for Ethernet. (integer value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [ml2]/segment_mtu[0m
[0;31m[0m[0;31m-#global_physnet_mtu = 1500[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of times client connections (nova, ironic) should be retried on a[0m
[0;31m[0m[0;31m-# failed HTTP call. 0 (zero) means connection is attempted only once (not[0m
[0;31m[0m[0;31m-# retried). Setting to any positive integer means that on failure the[0m
[0;31m[0m[0;31m-# connection is retried that many times. For example, setting to 3 means total[0m
[0;31m[0m[0;31m-# attempts to connect will be 4. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 0[0m
[0;31m[0m[0;31m-#http_retries = 3[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If False, neutron-server will disable the following DHCP-agent related[0m
[0;31m[0m[0;31m-# functions:1. DHCP provisioning block 2. DHCP scheduler API extension 3.[0m
[0;31m[0m[0;31m-# Network scheduling mechanism 4. DHCP RPC/notification (boolean value)[0m
[0;31m[0m[0;31m-#enable_traditional_dhcp = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of backlog requests to configure the socket with (integer value)[0m
[0;31m[0m[0;31m-#backlog = 4096[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of seconds to keep retrying to listen (integer value)[0m
[0;31m[0m[0;31m-#retry_until_window = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable SSL on the API server (boolean value)[0m
[0;31m[0m[0;31m-#use_ssl = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Seconds between running periodic tasks. (integer value)[0m
[0;31m[0m[0;31m-#periodic_interval = 40[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of separate API worker processes for service. If not specified, the[0m
[0;31m[0m[0;31m-# default is equal to the number of CPUs available for best performance, capped[0m
[0;31m[0m[0;31m-# by potential RAM usage. (integer value)[0m
[0;31m[0m[0;31m-#api_workers = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of RPC worker processes for service. If not specified, the default is[0m
[0;31m[0m[0;31m-# equal to half the number of API workers. (integer value)[0m
[0;31m[0m[0;31m-#rpc_workers = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of RPC worker processes dedicated to state reports queue. (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#rpc_state_report_workers = 1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Range of seconds to randomly delay when starting the periodic task scheduler[0m
[0;31m[0m[0;31m-# to reduce stampeding. (Disable by setting to 0) (integer value)[0m
[0;31m[0m[0;31m-#periodic_fuzzy_delay = 5[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum seconds to wait for a response from an RPC call. (integer value)[0m
[0;31m[0m[0;31m-#rpc_response_max_timeout = 600[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron.agent[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The driver used to manage the virtual interface. (string value)[0m
[0;31m[0m[0;31m-#interface_driver = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Location for Metadata Proxy UNIX domain socket. (string value)[0m
[0;31m[0m[0;31m-#metadata_proxy_socket = $state_path/metadata_proxy[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User (uid or name) running metadata proxy after its initialization (if empty:[0m
[0;31m[0m[0;31m-# agent effective user). (string value)[0m
[0;31m[0m[0;31m-#metadata_proxy_user =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Group (gid or name) running metadata proxy after its initialization (if[0m
[0;31m[0m[0;31m-# empty: agent effective group). (string value)[0m
[0;31m[0m[0;31m-#metadata_proxy_group =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron.db[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Seconds to regard the agent is down; should be at least twice[0m
[0;31m[0m[0;31m-# report_interval, to be sure the agent is down for good. (integer value)[0m
[0;31m[0m[0;31m-#agent_down_time = 75[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Representing the resource type whose load is being reported by the agent.[0m
[0;31m[0m[0;31m-# This can be "networks", "subnets" or "ports". When specified (Default is[0m
[0;31m[0m[0;31m-# networks), the server will extract particular load sent as part of its agent[0m
[0;31m[0m[0;31m-# configuration object from the agent report state, which is the number of[0m
[0;31m[0m[0;31m-# resources being consumed, at every report_interval.dhcp_load_type can be used[0m
[0;31m[0m[0;31m-# in combination with network_scheduler_driver =[0m
[0;31m[0m[0;31m-# neutron.scheduler.dhcp_agent_scheduler.WeightScheduler When the[0m
[0;31m[0m[0;31m-# network_scheduler_driver is WeightScheduler, dhcp_load_type can be configured[0m
[0;31m[0m[0;31m-# to represent the choice for the resource being balanced. Example:[0m
[0;31m[0m[0;31m-# dhcp_load_type=networks (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# networks - <No description provided>[0m
[0;31m[0m[0;31m-# subnets - <No description provided>[0m
[0;31m[0m[0;31m-# ports - <No description provided>[0m
[0;31m[0m[0;31m-#dhcp_load_type = networks[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Agent starts with admin_state_up=False when enable_new_agents=False. In the[0m
[0;31m[0m[0;31m-# case, user's resources will not be scheduled automatically to the agent until[0m
[0;31m[0m[0;31m-# admin changes admin_state_up to True. (boolean value)[0m
[0;31m[0m[0;31m-#enable_new_agents = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of resources for neutron to divide the large RPC call data sets. It[0m
[0;31m[0m[0;31m-# can be reduced if RPC timeout occurred. The best value can be determined[0m
[0;31m[0m[0;31m-# empirically in your environment. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#rpc_resources_processing_step = 20[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of routes per router (integer value)[0m
[0;31m[0m[0;31m-#max_routes = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Define the default value of enable_snat if not provided in[0m
[0;31m[0m[0;31m-# external_gateway_info. (boolean value)[0m
[0;31m[0m[0;31m-#enable_snat_by_default = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Driver to use for scheduling network to DHCP agent (string value)[0m
[0;31m[0m[0;31m-#network_scheduler_driver = neutron.scheduler.dhcp_agent_scheduler.WeightScheduler[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Allow auto scheduling networks to DHCP agent. (boolean value)[0m
[0;31m[0m[0;31m-#network_auto_schedule = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Automatically remove networks from offline DHCP agents. (boolean value)[0m
[0;31m[0m[0;31m-#allow_automatic_dhcp_failover = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of DHCP agents scheduled to host a tenant network. If this number is[0m
[0;31m[0m[0;31m-# greater than 1, the scheduler automatically assigns multiple DHCP agents for[0m
[0;31m[0m[0;31m-# a given tenant network, providing high availability for the DHCP service.[0m
[0;31m[0m[0;31m-# However this does not provide high availability for the IPv6 metadata service[0m
[0;31m[0m[0;31m-# in isolated networks. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#dhcp_agents_per_network = 1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable services on an agent with admin_state_up False. If this option is[0m
[0;31m[0m[0;31m-# False, when admin_state_up of an agent is turned False, services on it will[0m
[0;31m[0m[0;31m-# be disabled. Agents with admin_state_up False are not selected for automatic[0m
[0;31m[0m[0;31m-# scheduling regardless of this option. But manual scheduling to such agents is[0m
[0;31m[0m[0;31m-# available if this option is True. (boolean value)[0m
[0;31m[0m[0;31m-#enable_services_on_agents_with_admin_state_down = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The base mac address used for unique DVR instances by Neutron. The first 3[0m
[0;31m[0m[0;31m-# octets will remain unchanged. If the 4th octet is not 00, it will also be[0m
[0;31m[0m[0;31m-# used. The others will be randomly generated. The 'dvr_base_mac' *must* be[0m
[0;31m[0m[0;31m-# different from 'base_mac' to avoid mixing them up with MAC's allocated for[0m
[0;31m[0m[0;31m-# tenant ports. A 4 octet example would be dvr_base_mac = fa:16:3f:4f:00:00.[0m
[0;31m[0m[0;31m-# The default is 3 octet (string value)[0m
[0;31m[0m[0;31m-#dvr_base_mac = fa:16:3f:00:00:00[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# System-wide flag to determine the type of router that tenants can create.[0m
[0;31m[0m[0;31m-# Only admin can override. (boolean value)[0m
[0;31m[0m[0;31m-#router_distributed = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Determine if setup is configured for DVR. If False, DVR API extension will be[0m
[0;31m[0m[0;31m-# disabled. (boolean value)[0m
[0;31m[0m[0;31m-#enable_dvr = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Flag to determine if hosting a DVR local router to the DHCP agent is desired.[0m
[0;31m[0m[0;31m-# If False, any L3 function supported by the DHCP agent instance will not be[0m
[0;31m[0m[0;31m-# possible, for instance: DNS. (boolean value)[0m
[0;31m[0m[0;31m-#host_dvr_for_dhcp = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Driver to use for scheduling router to a default L3 agent (string value)[0m
[0;31m[0m[0;31m-#router_scheduler_driver = neutron.scheduler.l3_agent_scheduler.LeastRoutersScheduler[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Allow auto scheduling of routers to L3 agent. (boolean value)[0m
[0;31m[0m[0;31m-#router_auto_schedule = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Automatically reschedule routers from offline L3 agents to online L3 agents.[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#allow_automatic_l3agent_failover = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable HA mode for virtual routers. (boolean value)[0m
[0;31m[0m[0;31m-#l3_ha = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of L3 agents which a HA router will be scheduled on. If it is[0m
[0;31m[0m[0;31m-# set to 0 then the router will be scheduled on every agent. (integer value)[0m
[0;31m[0m[0;31m-#max_l3_agents_per_router = 3[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Subnet used for the l3 HA admin network. (string value)[0m
[0;31m[0m[0;31m-#l3_ha_net_cidr = 169.254.192.0/18[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The network type to use when creating the HA network for an HA router. By[0m
[0;31m[0m[0;31m-# default or if empty, the first 'tenant_network_types' is used. This is[0m
[0;31m[0m[0;31m-# helpful when the VRRP traffic should use a specific network which is not the[0m
[0;31m[0m[0;31m-# default one. (string value)[0m
[0;31m[0m[0;31m-#l3_ha_network_type =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The physical network name with which the HA network can be created. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#l3_ha_network_physical_name =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron.extensions[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of allowed address pairs (integer value)[0m
[0;31m[0m[0;31m-#max_allowed_address_pair = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Defines the allowed conntrack helpers, and conntack helper module protocol[0m
[0;31m[0m[0;31m-# constraints. (list value)[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# This option has a sample default set, which means that[0m
[0;31m[0m[0;31m-# its actual default value may vary from the one documented[0m
[0;31m[0m[0;31m-# below.[0m
[0;31m[0m[0;31m-#allowed_conntrack_helpers = tftp:udp,ftp:tcp,sip:tcp,sip:udp[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.log[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If set to true, the logging level will be set to DEBUG instead of the default[0m
[0;31m[0m[0;31m-# INFO level. (boolean value)[0m
[0;31m[0m[0;31m-# Note: This option can be changed without restarting.[0m
[0;31m[0m[0;31m-#debug = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The name of a logging configuration file. This file is appended to any[0m
[0;31m[0m[0;31m-# existing logging configuration files. For details about logging configuration[0m
[0;31m[0m[0;31m-# files, see the Python logging module documentation. Note that when logging[0m
[0;31m[0m[0;31m-# configuration files are used then all logging configuration is set in the[0m
[0;31m[0m[0;31m-# configuration file and other logging configuration options are ignored (for[0m
[0;31m[0m[0;31m-# example, log-date-format). (string value)[0m
[0;31m[0m[0;31m-# Note: This option can be changed without restarting.[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/log_config[0m
[0;31m[0m[0;31m-#log_config_append = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Defines the format string for %%(asctime)s in log records. Default:[0m
[0;31m[0m[0;31m-# %(default)s . This option is ignored if log_config_append is set. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#log_date_format = %Y-%m-%d %H:%M:%S[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Name of log file to send logging output to. If no default is set,[0m
[0;31m[0m[0;31m-# logging will go to stderr as defined by use_stderr. This option is ignored if[0m
[0;31m[0m[0;31m-# log_config_append is set. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/logfile[0m
[0;31m[0m[0;31m-#log_file = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) The base directory used for relative log_file  paths. This option[0m
[0;31m[0m[0;31m-# is ignored if log_config_append is set. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/logdir[0m
[0;31m[0m[0;31m-#log_dir = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Uses logging handler designed to watch file system. When log file is moved or[0m
[0;31m[0m[0;31m-# removed this handler will open a new log file with specified path[0m
[0;31m[0m[0;31m-# instantaneously. It makes sense only if log_file option is specified and[0m
[0;31m[0m[0;31m-# Linux platform is used. This option is ignored if log_config_append is set.[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#watch_log_file = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Use syslog for logging. Existing syslog format is DEPRECATED and will be[0m
[0;31m[0m[0;31m-# changed later to honor RFC5424. This option is ignored if log_config_append[0m
[0;31m[0m[0;31m-# is set. (boolean value)[0m
[0;31m[0m[0;31m-#use_syslog = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable journald for logging. If running in a systemd environment you may wish[0m
[0;31m[0m[0;31m-# to enable journal support. Doing so will use the journal native protocol[0m
[0;31m[0m[0;31m-# which includes structured metadata in addition to log messages.This option is[0m
[0;31m[0m[0;31m-# ignored if log_config_append is set. (boolean value)[0m
[0;31m[0m[0;31m-#use_journal = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Syslog facility to receive log lines. This option is ignored if[0m
[0;31m[0m[0;31m-# log_config_append is set. (string value)[0m
[0;31m[0m[0;31m-#syslog_log_facility = LOG_USER[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Use JSON formatting for logging. This option is ignored if log_config_append[0m
[0;31m[0m[0;31m-# is set. (boolean value)[0m
[0;31m[0m[0;31m-#use_json = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log output to standard error. This option is ignored if log_config_append is[0m
[0;31m[0m[0;31m-# set. (boolean value)[0m
[0;31m[0m[0;31m-#use_stderr = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log output to Windows Event Log. (boolean value)[0m
[0;31m[0m[0;31m-#use_eventlog = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The amount of time before the log files are rotated. This option is ignored[0m
[0;31m[0m[0;31m-# unless log_rotation_type is set to "interval". (integer value)[0m
[0;31m[0m[0;31m-#log_rotate_interval = 1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Rotation interval type. The time of the last file change (or the time when[0m
[0;31m[0m[0;31m-# the service was started) is used when scheduling the next rotation. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# Seconds - <No description provided>[0m
[0;31m[0m[0;31m-# Minutes - <No description provided>[0m
[0;31m[0m[0;31m-# Hours - <No description provided>[0m
[0;31m[0m[0;31m-# Days - <No description provided>[0m
[0;31m[0m[0;31m-# Weekday - <No description provided>[0m
[0;31m[0m[0;31m-# Midnight - <No description provided>[0m
[0;31m[0m[0;31m-#log_rotate_interval_type = days[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of rotated log files. (integer value)[0m
[0;31m[0m[0;31m-#max_logfile_count = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log file maximum size in MB. This option is ignored if "log_rotation_type" is[0m
[0;31m[0m[0;31m-# not set to "size". (integer value)[0m
[0;31m[0m[0;31m-#max_logfile_size_mb = 200[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log rotation type. (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# interval - Rotate logs at predefined time intervals.[0m
[0;31m[0m[0;31m-# size - Rotate logs once they reach a predefined size.[0m
[0;31m[0m[0;31m-# none - Do not rotate log files.[0m
[0;31m[0m[0;31m-#log_rotation_type = none[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Format string to use for log messages with context. Used by[0m
[0;31m[0m[0;31m-# oslo_log.formatters.ContextFormatter (string value)[0m
[0;31m[0m[0;31m-#logging_context_format_string = %(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [%(request_id)s %(user_identity)s] %(instance)s%(message)s[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Format string to use for log messages when context is undefined. Used by[0m
[0;31m[0m[0;31m-# oslo_log.formatters.ContextFormatter (string value)[0m
[0;31m[0m[0;31m-#logging_default_format_string = %(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [-] %(instance)s%(message)s[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Additional data to append to log message when logging level for the message[0m
[0;31m[0m[0;31m-# is DEBUG. Used by oslo_log.formatters.ContextFormatter (string value)[0m
[0;31m[0m[0;31m-#logging_debug_format_suffix = %(funcName)s %(pathname)s:%(lineno)d[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Prefix each line of exception output with this format. Used by[0m
[0;31m[0m[0;31m-# oslo_log.formatters.ContextFormatter (string value)[0m
[0;31m[0m[0;31m-#logging_exception_prefix = %(asctime)s.%(msecs)03d %(process)d ERROR %(name)s %(instance)s[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Defines the format string for %(user_identity)s that is used in[0m
[0;31m[0m[0;31m-# logging_context_format_string. Used by oslo_log.formatters.ContextFormatter[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#logging_user_identity_format = %(user)s %(project)s %(domain)s %(user_domain)s %(project_domain)s[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# List of package logging levels in logger=LEVEL pairs. This option is ignored[0m
[0;31m[0m[0;31m-# if log_config_append is set. (list value)[0m
[0;31m[0m[0;31m-#default_log_levels = amqp=WARN,amqplib=WARN,boto=WARN,qpid=WARN,sqlalchemy=WARN,suds=INFO,oslo.messaging=INFO,oslo_messaging=INFO,iso8601=WARN,requests.packages.urllib3.connectionpool=WARN,urllib3.connectionpool=WARN,websocket=WARN,requests.packages.urllib3.util.retry=WARN,urllib3.util.retry=WARN,keystonemiddleware=WARN,routes.middleware=WARN,stevedore=WARN,taskflow=WARN,keystoneauth=WARN,oslo.cache=INFO,oslo_policy=INFO,dogpile.core.dogpile=INFO[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enables or disables publication of error events. (boolean value)[0m
[0;31m[0m[0;31m-#publish_errors = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The format for an instance that is passed with the log message. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#instance_format = "[instance: %(uuid)s] "[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The format for an instance UUID that is passed with the log message. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#instance_uuid_format = "[instance: %(uuid)s] "[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Interval, number of seconds, of log rate limiting. (integer value)[0m
[0;31m[0m[0;31m-#rate_limit_interval = 0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of logged messages per rate_limit_interval. (integer value)[0m
[0;31m[0m[0;31m-#rate_limit_burst = 0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log level name used by rate limiting: CRITICAL, ERROR, INFO, WARNING, DEBUG[0m
[0;31m[0m[0;31m-# or empty string. Logs with level greater or equal to rate_limit_except_level[0m
[0;31m[0m[0;31m-# are not filtered. An empty string means that all levels are filtered. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#rate_limit_except_level = CRITICAL[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enables or disables fatal status of deprecations. (boolean value)[0m
[0;31m[0m[0;31m-#fatal_deprecations = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.messaging[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Size of RPC connection pool. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#rpc_conn_pool_size = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The pool size limit for connections expiration policy (integer value)[0m
[0;31m[0m[0;31m-#conn_pool_min_size = 2[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The time-to-live in sec of idle connections in the pool (integer value)[0m
[0;31m[0m[0;31m-#conn_pool_ttl = 1200[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Size of executor thread pool when executor is threading or eventlet. (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/rpc_thread_pool_size[0m
[0;31m[0m[0;31m-#executor_thread_pool_size = 64[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Seconds to wait for a response from a call. (integer value)[0m
[0;31m[0m[0;31m-#rpc_response_timeout = 60[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The network address and optional user credentials for connecting to the[0m
[0;31m[0m[0;31m-# messaging backend, in URL format. The expected format is:[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# driver://[user:pass@]host:port[,[userN:passN@]hostN:portN]/virtual_host?query[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Example: rabbit://rabbitmq:password@127.0.0.1:5672//[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# For full details on the fields in the URL see the documentation of[0m
[0;31m[0m[0;31m-# oslo_messaging.TransportURL at[0m
[0;31m[0m[0;31m-# https://docs.openstack.org/oslo.messaging/latest/reference/transport.html[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#transport_url = rabbit://[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The default exchange under which topics are scoped. May be overridden by an[0m
[0;31m[0m[0;31m-# exchange name specified in the transport_url option. (string value)[0m
[0;31m[0m[0;31m-#control_exchange = neutron[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Add an endpoint to answer to ping calls. Endpoint is named[0m
[0;31m[0m[0;31m-# oslo_rpc_server_ping (boolean value)[0m
[0;31m[0m[0;31m-#rpc_ping_enabled = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.service.periodic_task[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Some periodic tasks can be run in a separate process. Should we run them[0m
[0;31m[0m[0;31m-# here? (boolean value)[0m
[0;31m[0m[0;31m-#run_external_periodic_tasks = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.service.service[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable eventlet backdoor.  Acceptable values are 0, <port>, and[0m
[0;31m[0m[0;31m-# <start>:<end>, where 0 results in listening on a random tcp port number;[0m
[0;31m[0m[0;31m-# <port> results in listening on the specified port number (and not enabling[0m
[0;31m[0m[0;31m-# backdoor if that port is in use); and <start>:<end> results in listening on[0m
[0;31m[0m[0;31m-# the smallest unused port number within the specified range of port numbers.[0m
[0;31m[0m[0;31m-# The chosen port is displayed in the service's log file. (string value)[0m
[0;31m[0m[0;31m-#backdoor_port = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable eventlet backdoor, using the provided path as a unix socket that can[0m
[0;31m[0m[0;31m-# receive connections. This option is mutually exclusive with 'backdoor_port'[0m
[0;31m[0m[0;31m-# in that only one should be provided. If both are provided then the existence[0m
[0;31m[0m[0;31m-# of this option overrides the usage of that option. Inside the path {pid} will[0m
[0;31m[0m[0;31m-# be replaced with the PID of the current process. (string value)[0m
[0;31m[0m[0;31m-#backdoor_socket = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enables or disables logging values of all registered options when starting a[0m
[0;31m[0m[0;31m-# service (at DEBUG level). (boolean value)[0m
[0;31m[0m[0;31m-#log_options = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Specify a timeout after which a gracefully shutdown server will exit. Zero[0m
[0;31m[0m[0;31m-# value means endless wait. (integer value)[0m
[0;31m[0m[0;31m-#graceful_shutdown_timeout = 60[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.service.wsgi[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# File name for the paste.deploy config for api service (string value)[0m
[0;31m[0m[0;31m-#api_paste_config = api-paste.ini[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# A python format string that is used as the template to generate log lines.[0m
[0;31m[0m[0;31m-# The following values can beformatted into it: client_ip, date_time,[0m
[0;31m[0m[0;31m-# request_line, status_code, body_length, wall_seconds. (string value)[0m
[0;31m[0m[0;31m-#wsgi_log_format = %(client_ip)s "%(request_line)s" status: %(status_code)s  len: %(body_length)s time: %(wall_seconds).7f[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Sets the value of TCP_KEEPIDLE in seconds for each server socket. Not[0m
[0;31m[0m[0;31m-# supported on OS X. (integer value)[0m
[0;31m[0m[0;31m-#tcp_keepidle = 600[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Size of the pool of greenthreads used by wsgi (integer value)[0m
[0;31m[0m[0;31m-#wsgi_default_pool_size = 100[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum line size of message headers to be accepted. max_header_line may need[0m
[0;31m[0m[0;31m-# to be increased when using large tokens (typically those generated when[0m
[0;31m[0m[0;31m-# keystone is configured to use PKI tokens with big service catalogs). (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#max_header_line = 16384[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If False, closes the client socket connection explicitly. (boolean value)[0m
[0;31m[0m[0;31m-#wsgi_keep_alive = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Timeout for client connections' socket operations. If an incoming connection[0m
[0;31m[0m[0;31m-# is idle for this number of seconds it will be closed. A value of '0' means[0m
[0;31m[0m[0;31m-# wait forever. (integer value)[0m
[0;31m[0m[0;31m-#client_socket_timeout = 900[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# True if the server should send exception tracebacks to the clients on 500[0m
[0;31m[0m[0;31m-# errors. If False, the server will respond with empty bodies. (boolean value)[0m
[0;31m[0m[0;31m-#wsgi_server_debug = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[agent][0m
[0;31m[0m[0;31m-root_helper = "sudo /usr/bin/neutron-rootwrap /etc/neutron/rootwrap.conf"[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron.agent[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Root helper application. Use 'sudo neutron-rootwrap[0m
[0;31m[0m[0;31m-# /etc/neutron/rootwrap.conf' to use the real root filter facility. Change to[0m
[0;31m[0m[0;31m-# 'sudo' to skip the filtering and just run the command directly. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#root_helper = sudo[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Use the root helper when listing the namespaces on a system. This may not be[0m
[0;31m[0m[0;31m-# required depending on the security configuration. If the root helper is not[0m
[0;31m[0m[0;31m-# required, set this to False for a performance improvement. (boolean value)[0m
[0;31m[0m[0;31m-#use_helper_for_ns_read = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Root helper daemon application to use when possible.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Use 'sudo neutron-rootwrap-daemon /etc/neutron/rootwrap.conf' to run rootwrap[0m
[0;31m[0m[0;31m-# in "daemon mode" which has been reported to improve performance at scale. For[0m
[0;31m[0m[0;31m-# more information on running rootwrap in "daemon mode", see:[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# https://docs.openstack.org/oslo.rootwrap/latest/user/usage.html#daemon-mode[0m
[0;31m[0m[0;31m-#  (string value)[0m
[0;31m[0m[0;31m-#root_helper_daemon = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Seconds between nodes reporting state to server; should be less than[0m
[0;31m[0m[0;31m-# agent_down_time, best if it is half or less than agent_down_time. (floating[0m
[0;31m[0m[0;31m-# point value)[0m
[0;31m[0m[0;31m-#report_interval = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log agent heartbeats (boolean value)[0m
[0;31m[0m[0;31m-#log_agent_heartbeats = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Add comments to iptables rules. Set to false to disallow the addition of[0m
[0;31m[0m[0;31m-# comments to generated iptables rules that describe each rule's purpose.[0m
[0;31m[0m[0;31m-# System must support the iptables comments module for addition of comments.[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#comment_iptables_rules = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Duplicate every iptables difference calculation to ensure the format being[0m
[0;31m[0m[0;31m-# generated matches the format of iptables-save. This option should not be[0m
[0;31m[0m[0;31m-# turned on for production systems because it imposes a performance penalty.[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#debug_iptables_rules = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Use random-fully in SNAT masquerade rules. (boolean value)[0m
[0;31m[0m[0;31m-#use_random_fully = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Action to be executed when a child process dies (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# respawn - <No description provided>[0m
[0;31m[0m[0;31m-# exit - <No description provided>[0m
[0;31m[0m[0;31m-#check_child_processes_action = respawn[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Interval between checks of child process liveness (seconds), use 0 to disable[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#check_child_processes_interval = 60[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Location of scripts used to kill external processes. Names of scripts here[0m
[0;31m[0m[0;31m-# must follow the pattern: "<process-name>-kill" where <process-name> is name[0m
[0;31m[0m[0;31m-# of the process which should be killed using this script. For example, kill[0m
[0;31m[0m[0;31m-# script for dnsmasq process should be named "dnsmasq-kill". If path is set to[0m
[0;31m[0m[0;31m-# None, then default "kill" command will be used to stop processes. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#kill_scripts_path = /etc/neutron/kill_scripts/[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Availability zone of this node (string value)[0m
[0;31m[0m[0;31m-#availability_zone = nova[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[cache][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.cache[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Prefix for building the configuration dictionary for the cache region. This[0m
[0;31m[0m[0;31m-# should not need to be changed unless there is another dogpile.cache region[0m
[0;31m[0m[0;31m-# with the same configuration name. (string value)[0m
[0;31m[0m[0;31m-#config_prefix = cache.oslo[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Default TTL, in seconds, for any cached item in the dogpile.cache region.[0m
[0;31m[0m[0;31m-# This applies to any cached method that doesn't have an explicit cache[0m
[0;31m[0m[0;31m-# expiration time defined for it. (integer value)[0m
[0;31m[0m[0;31m-#expiration_time = 600[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Cache backend module. For eventlet-based or environments with hundreds of[0m
[0;31m[0m[0;31m-# threaded servers, Memcache with pooling (oslo_cache.memcache_pool) is[0m
[0;31m[0m[0;31m-# recommended. For environments with less than 100 threaded servers, Memcached[0m
[0;31m[0m[0;31m-# (dogpile.cache.memcached) or Redis (dogpile.cache.redis) is recommended. Test[0m
[0;31m[0m[0;31m-# environments with a single instance of the server can use the[0m
[0;31m[0m[0;31m-# dogpile.cache.memory backend. (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# oslo_cache.memcache_pool - <No description provided>[0m
[0;31m[0m[0;31m-# oslo_cache.dict - <No description provided>[0m
[0;31m[0m[0;31m-# oslo_cache.mongo - <No description provided>[0m
[0;31m[0m[0;31m-# oslo_cache.etcd3gw - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.pymemcache - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.memcached - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.pylibmc - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.bmemcached - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.dbm - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.redis - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.memory - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.memory_pickle - <No description provided>[0m
[0;31m[0m[0;31m-# dogpile.cache.null - <No description provided>[0m
[0;31m[0m[0;31m-#backend = dogpile.cache.null[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Arguments supplied to the backend module. Specify this option once per[0m
[0;31m[0m[0;31m-# argument to be passed to the dogpile.cache backend. Example format:[0m
[0;31m[0m[0;31m-# "<argname>:<value>". (multi valued)[0m
[0;31m[0m[0;31m-#backend_argument =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Proxy classes to import that will affect the way the dogpile.cache backend[0m
[0;31m[0m[0;31m-# functions. See the dogpile.cache documentation on changing-backend-behavior.[0m
[0;31m[0m[0;31m-# (list value)[0m
[0;31m[0m[0;31m-#proxies =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Global toggle for caching. (boolean value)[0m
[0;31m[0m[0;31m-#enabled = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Extra debugging from the cache backend (cache keys, get/set/delete/etc[0m
[0;31m[0m[0;31m-# calls). This is only really useful if you need to see the specific cache-[0m
[0;31m[0m[0;31m-# backend get/set/delete calls with the keys/values.  Typically this should be[0m
[0;31m[0m[0;31m-# left set to false. (boolean value)[0m
[0;31m[0m[0;31m-#debug_cache_backend = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Memcache servers in the format of "host:port". (dogpile.cache.memcached and[0m
[0;31m[0m[0;31m-# oslo_cache.memcache_pool backends only). If a given host refer to an IPv6 or[0m
[0;31m[0m[0;31m-# a given domain refer to IPv6 then you should prefix the given address with[0m
[0;31m[0m[0;31m-# the address family (``inet6``) (e.g ``inet6[::1]:11211``,[0m
[0;31m[0m[0;31m-# ``inet6:[fd12:3456:789a:1::1]:11211``,[0m
[0;31m[0m[0;31m-# ``inet6:[controller-0.internalapi]:11211``). If the address family is not[0m
[0;31m[0m[0;31m-# given then default address family used will be ``inet`` which correspond to[0m
[0;31m[0m[0;31m-# IPv4 (list value)[0m
[0;31m[0m[0;31m-#memcache_servers = localhost:11211[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of seconds memcached server is considered dead before it is tried[0m
[0;31m[0m[0;31m-# again. (dogpile.cache.memcache and oslo_cache.memcache_pool backends only).[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#memcache_dead_retry = 300[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Timeout in seconds for every call to a server. (dogpile.cache.memcache and[0m
[0;31m[0m[0;31m-# oslo_cache.memcache_pool backends only). (floating point value)[0m
[0;31m[0m[0;31m-#memcache_socket_timeout = 1.0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Max total number of open connections to every memcached server.[0m
[0;31m[0m[0;31m-# (oslo_cache.memcache_pool backend only). (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_maxsize = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of seconds a connection to memcached is held unused in the pool before[0m
[0;31m[0m[0;31m-# it is closed. (oslo_cache.memcache_pool backend only). (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_unused_timeout = 60[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of seconds that an operation will wait to get a memcache client[0m
[0;31m[0m[0;31m-# connection. (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_connection_get_timeout = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Global toggle if memcache will be flushed on reconnect.[0m
[0;31m[0m[0;31m-# (oslo_cache.memcache_pool backend only). (boolean value)[0m
[0;31m[0m[0;31m-#memcache_pool_flush_on_reconnect = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Global toggle for TLS usage when comunicating with the caching servers.[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#tls_enabled = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Path to a file of concatenated CA certificates in PEM format necessary to[0m
[0;31m[0m[0;31m-# establish the caching servers' authenticity. If tls_enabled is False, this[0m
[0;31m[0m[0;31m-# option is ignored. (string value)[0m
[0;31m[0m[0;31m-#tls_cafile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Path to a single file in PEM format containing the client's certificate as[0m
[0;31m[0m[0;31m-# well as any number of CA certificates needed to establish the certificate's[0m
[0;31m[0m[0;31m-# authenticity. This file is only required when client side authentication is[0m
[0;31m[0m[0;31m-# necessary. If tls_enabled is False, this option is ignored. (string value)[0m
[0;31m[0m[0;31m-#tls_certfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Path to a single file containing the client's private key in. Otherwise the[0m
[0;31m[0m[0;31m-# private key will be taken from the file specified in tls_certfile. If[0m
[0;31m[0m[0;31m-# tls_enabled is False, this option is ignored. (string value)[0m
[0;31m[0m[0;31m-#tls_keyfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Set the available ciphers for sockets created with the TLS context. It should[0m
[0;31m[0m[0;31m-# be a string in the OpenSSL cipher list format. If not specified, all OpenSSL[0m
[0;31m[0m[0;31m-# enabled ciphers will be available. (string value)[0m
[0;31m[0m[0;31m-#tls_allowed_ciphers = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[cors][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.middleware.cors[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Indicate whether this resource may be shared with the domain received in the[0m
[0;31m[0m[0;31m-# requests "origin" header. Format: "<protocol>://<host>[:<port>]", no trailing[0m
[0;31m[0m[0;31m-# slash. Example: https://horizon.example.com (list value)[0m
[0;31m[0m[0;31m-#allowed_origin = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Indicate that the actual request can include user credentials (boolean value)[0m
[0;31m[0m[0;31m-#allow_credentials = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Indicate which headers are safe to expose to the API. Defaults to HTTP Simple[0m
[0;31m[0m[0;31m-# Headers. (list value)[0m
[0;31m[0m[0;31m-#expose_headers = X-Auth-Token,X-Subject-Token,X-Service-Token,X-OpenStack-Request-ID,OpenStack-Volume-microversion[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum cache age of CORS preflight requests. (integer value)[0m
[0;31m[0m[0;31m-#max_age = 3600[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Indicate which methods can be used during the actual request. (list value)[0m
[0;31m[0m[0;31m-#allow_methods = GET,PUT,POST,DELETE,PATCH[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Indicate which header field names may be used during the actual request.[0m
[0;31m[0m[0;31m-# (list value)[0m
[0;31m[0m[0;31m-#allow_headers = X-Auth-Token,X-Identity-Status,X-Roles,X-Service-Catalog,X-User-Id,X-Tenant-Id,X-OpenStack-Request-ID[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[database][0m
[0;31m[0m[0;31m-connection = sqlite:////var/lib/neutron/neutron.sqlite[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron.db[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Database engine for which script will be generated when using offline[0m
[0;31m[0m[0;31m-# migration. (string value)[0m
[0;31m[0m[0;31m-#engine =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.db[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If True, SQLite uses synchronous mode. (boolean value)[0m
[0;31m[0m[0;31m-#sqlite_synchronous = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The back end to use for the database. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/db_backend[0m
[0;31m[0m[0;31m-#backend = sqlalchemy[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The SQLAlchemy connection string to use to connect to the database. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/sql_connection[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DATABASE]/sql_connection[0m
[0;31m[0m[0;31m-# Deprecated group/name - [sql]/connection[0m
[0;31m[0m[0;31m-#connection = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The SQLAlchemy connection string to use to connect to the slave database.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#slave_connection = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The SQL mode to be used for MySQL sessions. This option, including the[0m
[0;31m[0m[0;31m-# default, overrides any server-set SQL mode. To use whatever SQL mode is set[0m
[0;31m[0m[0;31m-# by the server configuration, set this to no value. Example: mysql_sql_mode=[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#mysql_sql_mode = TRADITIONAL[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If True, transparently enables support for handling MySQL Cluster (NDB).[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#mysql_enable_ndb = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Connections which have been present in the connection pool longer than this[0m
[0;31m[0m[0;31m-# number of seconds will be replaced with a new one the next time they are[0m
[0;31m[0m[0;31m-# checked out from the pool. (integer value)[0m
[0;31m[0m[0;31m-#connection_recycle_time = 3600[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of SQL connections to keep open in a pool. Setting a value of[0m
[0;31m[0m[0;31m-# 0 indicates no limit. (integer value)[0m
[0;31m[0m[0;31m-#max_pool_size = 5[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum number of database connection retries during startup. Set to -1 to[0m
[0;31m[0m[0;31m-# specify an infinite retry count. (integer value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/sql_max_retries[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DATABASE]/sql_max_retries[0m
[0;31m[0m[0;31m-#max_retries = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Interval between retries of opening a SQL connection. (integer value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/sql_retry_interval[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DATABASE]/reconnect_interval[0m
[0;31m[0m[0;31m-#retry_interval = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If set, use this value for max_overflow with SQLAlchemy. (integer value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/sql_max_overflow[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DATABASE]/sqlalchemy_max_overflow[0m
[0;31m[0m[0;31m-#max_overflow = 50[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Verbosity of SQL debugging information: 0=None, 100=Everything. (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Minimum value: 0[0m
[0;31m[0m[0;31m-# Maximum value: 100[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/sql_connection_debug[0m
[0;31m[0m[0;31m-#connection_debug = 0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Add Python stack traces to SQL as comment strings. (boolean value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/sql_connection_trace[0m
[0;31m[0m[0;31m-#connection_trace = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If set, use this value for pool_timeout with SQLAlchemy. (integer value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DATABASE]/sqlalchemy_pool_timeout[0m
[0;31m[0m[0;31m-#pool_timeout = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable the experimental use of database reconnect on connection lost.[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#use_db_reconnect = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Seconds between retries of a database transaction. (integer value)[0m
[0;31m[0m[0;31m-#db_retry_interval = 1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If True, increases the interval between retries of a database operation up to[0m
[0;31m[0m[0;31m-# db_max_retry_interval. (boolean value)[0m
[0;31m[0m[0;31m-#db_inc_retry_interval = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# If db_inc_retry_interval is set, the maximum seconds between retries of a[0m
[0;31m[0m[0;31m-# database operation. (integer value)[0m
[0;31m[0m[0;31m-#db_max_retry_interval = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum retries in case of connection error or deadlock error before error is[0m
[0;31m[0m[0;31m-# raised. Set to -1 to specify an infinite retry count. (integer value)[0m
[0;31m[0m[0;31m-#db_max_retries = 20[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optional URL parameters to append onto the connection URL at connect time;[0m
[0;31m[0m[0;31m-# specify as param1=value1&param2=value2&... (string value)[0m
[0;31m[0m[0;31m-#connection_parameters =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[healthcheck][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.middleware.healthcheck[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: The path to respond to healtcheck requests on. (string value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-#path = /healthcheck[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Show more detailed information as part of the response. Security note:[0m
[0;31m[0m[0;31m-# Enabling this option may expose sensitive details about the service being[0m
[0;31m[0m[0;31m-# monitored. Be sure to verify that it will not violate your security policies.[0m
[0;31m[0m[0;31m-# (boolean value)[0m
[0;31m[0m[0;31m-#detailed = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Additional backends that can perform health checks and report that[0m
[0;31m[0m[0;31m-# information back as part of a request. (list value)[0m
[0;31m[0m[0;31m-#backends =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Check the presence of a file to determine if an application is running on a[0m
[0;31m[0m[0;31m-# port. Used by DisableByFileHealthcheck plugin. (string value)[0m
[0;31m[0m[0;31m-#disable_by_file_path = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Check the presence of a file based on a port to determine if an application[0m
[0;31m[0m[0;31m-# is running on a port. Expects a "port:path" list of strings. Used by[0m
[0;31m[0m[0;31m-# DisableByFilesPortsHealthcheck plugin. (list value)[0m
[0;31m[0m[0;31m-#disable_by_file_paths =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[ironic][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From ironic.auth[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Authentication URL (string value)[0m
[0;31m[0m[0;31m-#auth_url = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Authentication type to load (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [ironic]/auth_plugin[0m
[0;31m[0m[0;31m-#auth_type = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded Certificate Authority to use when verifying HTTPs connections.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#cafile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded client certificate cert file (string value)[0m
[0;31m[0m[0;31m-#certfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Collect per-API call timing information. (boolean value)[0m
[0;31m[0m[0;31m-#collect_timing = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optional domain ID to use with v3 and v2 parameters. It will be used for both[0m
[0;31m[0m[0;31m-# the user and project domain in v3 and ignored in v2 authentication. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#default_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optional domain name to use with v3 API and v2 parameters. It will be used[0m
[0;31m[0m[0;31m-# for both the user and project domain in v3 and ignored in v2 authentication.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#default_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain ID to scope to (string value)[0m
[0;31m[0m[0;31m-#domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain name to scope to (string value)[0m
[0;31m[0m[0;31m-#domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Verify HTTPS connections. (boolean value)[0m
[0;31m[0m[0;31m-#insecure = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded client certificate key file (string value)[0m
[0;31m[0m[0;31m-#keyfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's password (string value)[0m
[0;31m[0m[0;31m-#password = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain ID containing project (string value)[0m
[0;31m[0m[0;31m-#project_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain name containing project (string value)[0m
[0;31m[0m[0;31m-#project_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Project ID to scope to (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [ironic]/tenant_id[0m
[0;31m[0m[0;31m-#project_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Project name to scope to (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [ironic]/tenant_name[0m
[0;31m[0m[0;31m-#project_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log requests to multiple loggers. (boolean value)[0m
[0;31m[0m[0;31m-#split_loggers = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Scope for system operations (string value)[0m
[0;31m[0m[0;31m-#system_scope = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Tenant ID (string value)[0m
[0;31m[0m[0;31m-#tenant_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Tenant Name (string value)[0m
[0;31m[0m[0;31m-#tenant_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Timeout value for http requests (integer value)[0m
[0;31m[0m[0;31m-#timeout = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Trust ID (string value)[0m
[0;31m[0m[0;31m-#trust_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's domain id (string value)[0m
[0;31m[0m[0;31m-#user_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's domain name (string value)[0m
[0;31m[0m[0;31m-#user_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User id (string value)[0m
[0;31m[0m[0;31m-#user_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Username (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [ironic]/user_name[0m
[0;31m[0m[0;31m-#username = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Send notification events to ironic. (For example on relevant port status[0m
[0;31m[0m[0;31m-# changes.) (boolean value)[0m
[0;31m[0m[0;31m-#enable_notifications = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[keystone_authtoken][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From keystonemiddleware.auth_token[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Complete "public" Identity API endpoint. This endpoint should not be an[0m
[0;31m[0m[0;31m-# "admin" endpoint, as it should be accessible by all end users.[0m
[0;31m[0m[0;31m-# Unauthenticated clients are redirected to this endpoint to authenticate.[0m
[0;31m[0m[0;31m-# Although this endpoint should ideally be unversioned, client support in the[0m
[0;31m[0m[0;31m-# wild varies. If you're using a versioned v2 endpoint here, then this should[0m
[0;31m[0m[0;31m-# *not* be the same endpoint the service user utilizes for validating tokens,[0m
[0;31m[0m[0;31m-# because normal end users may not be able to reach that endpoint. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [keystone_authtoken]/auth_uri[0m
[0;31m[0m[0;31m-#www_authenticate_uri = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: Complete "public" Identity API endpoint. This endpoint should not[0m
[0;31m[0m[0;31m-# be an "admin" endpoint, as it should be accessible by all end users.[0m
[0;31m[0m[0;31m-# Unauthenticated clients are redirected to this endpoint to authenticate.[0m
[0;31m[0m[0;31m-# Although this endpoint should ideally be unversioned, client support in the[0m
[0;31m[0m[0;31m-# wild varies. If you're using a versioned v2 endpoint here, then this should[0m
[0;31m[0m[0;31m-# *not* be the same endpoint the service user utilizes for validating tokens,[0m
[0;31m[0m[0;31m-# because normal end users may not be able to reach that endpoint. This option[0m
[0;31m[0m[0;31m-# is deprecated in favor of www_authenticate_uri and will be removed in the S[0m
[0;31m[0m[0;31m-# release. (string value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal since Queens.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-# Reason: The auth_uri option is deprecated in favor of www_authenticate_uri[0m
[0;31m[0m[0;31m-# and will be removed in the S  release.[0m
[0;31m[0m[0;31m-#auth_uri = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# API version of the Identity API endpoint. (string value)[0m
[0;31m[0m[0;31m-#auth_version = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Interface to use for the Identity API endpoint. Valid values are "public",[0m
[0;31m[0m[0;31m-# "internal" (default) or "admin". (string value)[0m
[0;31m[0m[0;31m-#interface = internal[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Do not handle authorization requests within the middleware, but delegate the[0m
[0;31m[0m[0;31m-# authorization decision to downstream WSGI components. (boolean value)[0m
[0;31m[0m[0;31m-#delay_auth_decision = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Request timeout value for communicating with Identity API server. (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#http_connect_timeout = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# How many times are we trying to reconnect when communicating with Identity[0m
[0;31m[0m[0;31m-# API Server. (integer value)[0m
[0;31m[0m[0;31m-#http_request_max_retries = 3[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Request environment key where the Swift cache object is stored. When[0m
[0;31m[0m[0;31m-# auth_token middleware is deployed with a Swift cache, use this option to have[0m
[0;31m[0m[0;31m-# the middleware share a caching backend with swift. Otherwise, use the[0m
[0;31m[0m[0;31m-# ``memcached_servers`` option instead. (string value)[0m
[0;31m[0m[0;31m-#cache = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Required if identity server requires client certificate (string value)[0m
[0;31m[0m[0;31m-#certfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Required if identity server requires client certificate (string value)[0m
[0;31m[0m[0;31m-#keyfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# A PEM encoded Certificate Authority to use when verifying HTTPs connections.[0m
[0;31m[0m[0;31m-# Defaults to system CAs. (string value)[0m
[0;31m[0m[0;31m-#cafile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Verify HTTPS connections. (boolean value)[0m
[0;31m[0m[0;31m-#insecure = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The region in which the identity server can be found. (string value)[0m
[0;31m[0m[0;31m-#region_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optionally specify a list of memcached server(s) to use for caching. If left[0m
[0;31m[0m[0;31m-# undefined, tokens will instead be cached in-process. (list value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [keystone_authtoken]/memcache_servers[0m
[0;31m[0m[0;31m-#memcached_servers = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# In order to prevent excessive effort spent validating tokens, the middleware[0m
[0;31m[0m[0;31m-# caches previously-seen tokens for a configurable duration (in seconds). Set[0m
[0;31m[0m[0;31m-# to -1 to disable caching completely. (integer value)[0m
[0;31m[0m[0;31m-#token_cache_time = 300[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) If defined, indicate whether token data should be authenticated or[0m
[0;31m[0m[0;31m-# authenticated and encrypted. If MAC, token data is authenticated (with HMAC)[0m
[0;31m[0m[0;31m-# in the cache. If ENCRYPT, token data is encrypted and authenticated in the[0m
[0;31m[0m[0;31m-# cache. If the value is not one of these options or empty, auth_token will[0m
[0;31m[0m[0;31m-# raise an exception on initialization. (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# None - <No description provided>[0m
[0;31m[0m[0;31m-# MAC - <No description provided>[0m
[0;31m[0m[0;31m-# ENCRYPT - <No description provided>[0m
[0;31m[0m[0;31m-#memcache_security_strategy = None[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional, mandatory if memcache_security_strategy is defined) This string is[0m
[0;31m[0m[0;31m-# used for key derivation. (string value)[0m
[0;31m[0m[0;31m-#memcache_secret_key = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Number of seconds memcached server is considered dead before it is[0m
[0;31m[0m[0;31m-# tried again. (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_dead_retry = 300[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Maximum total number of open connections to every memcached[0m
[0;31m[0m[0;31m-# server. (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_maxsize = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Socket timeout in seconds for communicating with a memcached[0m
[0;31m[0m[0;31m-# server. (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_socket_timeout = 3[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Number of seconds a connection to memcached is held unused in the[0m
[0;31m[0m[0;31m-# pool before it is closed. (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_unused_timeout = 60[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Number of seconds that an operation will wait to get a memcached[0m
[0;31m[0m[0;31m-# client connection from the pool. (integer value)[0m
[0;31m[0m[0;31m-#memcache_pool_conn_get_timeout = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Use the advanced (eventlet safe) memcached client pool. (boolean[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#memcache_use_advanced_pool = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# (Optional) Indicate whether to set the X-Service-Catalog header. If False,[0m
[0;31m[0m[0;31m-# middleware will not ask for service catalog on token validation and will not[0m
[0;31m[0m[0;31m-# set the X-Service-Catalog header. (boolean value)[0m
[0;31m[0m[0;31m-#include_service_catalog = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Used to control the use and type of token binding. Can be set to: "disabled"[0m
[0;31m[0m[0;31m-# to not check token binding. "permissive" (default) to validate binding[0m
[0;31m[0m[0;31m-# information if the bind type is of a form known to the server and ignore it[0m
[0;31m[0m[0;31m-# if not. "strict" like "permissive" but if the bind type is unknown the token[0m
[0;31m[0m[0;31m-# will be rejected. "required" any form of token binding is needed to be[0m
[0;31m[0m[0;31m-# allowed. Finally the name of a binding method that must be present in tokens.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#enforce_token_bind = permissive[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# A choice of roles that must be present in a service token. Service tokens are[0m
[0;31m[0m[0;31m-# allowed to request that an expired token can be used and so this check should[0m
[0;31m[0m[0;31m-# tightly control that only actual services should be sending this token. Roles[0m
[0;31m[0m[0;31m-# here are applied as an ANY check so any role in this list must be present.[0m
[0;31m[0m[0;31m-# For backwards compatibility reasons this currently only affects the[0m
[0;31m[0m[0;31m-# allow_expired check. (list value)[0m
[0;31m[0m[0;31m-#service_token_roles = service[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# For backwards compatibility reasons we must let valid service tokens pass[0m
[0;31m[0m[0;31m-# that don't pass the service_token_roles check as valid. Setting this true[0m
[0;31m[0m[0;31m-# will become the default in a future release and should be enabled if[0m
[0;31m[0m[0;31m-# possible. (boolean value)[0m
[0;31m[0m[0;31m-#service_token_roles_required = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The name or type of the service as it appears in the service catalog. This is[0m
[0;31m[0m[0;31m-# used to validate tokens that have restricted access rules. (string value)[0m
[0;31m[0m[0;31m-#service_type = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Authentication type to load (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [keystone_authtoken]/auth_plugin[0m
[0;31m[0m[0;31m-#auth_type = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Config Section from which to load plugin specific options (string value)[0m
[0;31m[0m[0;31m-#auth_section = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[nova][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Name of nova region to use. Useful if keystone manages more than one region.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#region_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Type of the nova endpoint to use.  This endpoint will be looked up in the[0m
[0;31m[0m[0;31m-# keystone catalog and should be one of public, internal or admin. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# public - <No description provided>[0m
[0;31m[0m[0;31m-# admin - <No description provided>[0m
[0;31m[0m[0;31m-# internal - <No description provided>[0m
[0;31m[0m[0;31m-#endpoint_type = public[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: When this option is enabled, during the live migration, the OVS[0m
[0;31m[0m[0;31m-# agent will only send the "vif-plugged-event" when the destination host[0m
[0;31m[0m[0;31m-# interface is bound. This option also disables any other agent (like DHCP) to[0m
[0;31m[0m[0;31m-# send to Nova this event when the port is provisioned.This option can be[0m
[0;31m[0m[0;31m-# enabled if Nova patch https://review.opendev.org/c/openstack/nova/+/767368 is[0m
[0;31m[0m[0;31m-# in place.This option is temporary and will be removed in Y and the behavior[0m
[0;31m[0m[0;31m-# will be "True". (boolean value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-# Reason: In Y the Nova patch[0m
[0;31m[0m[0;31m-# https://review.opendev.org/c/openstack/nova/+/767368 will be in the code even[0m
[0;31m[0m[0;31m-# when running a Nova server in X.[0m
[0;31m[0m[0;31m-#live_migration_events = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From nova.auth[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Authentication URL (string value)[0m
[0;31m[0m[0;31m-#auth_url = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Authentication type to load (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [nova]/auth_plugin[0m
[0;31m[0m[0;31m-#auth_type = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded Certificate Authority to use when verifying HTTPs connections.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#cafile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded client certificate cert file (string value)[0m
[0;31m[0m[0;31m-#certfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Collect per-API call timing information. (boolean value)[0m
[0;31m[0m[0;31m-#collect_timing = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optional domain ID to use with v3 and v2 parameters. It will be used for both[0m
[0;31m[0m[0;31m-# the user and project domain in v3 and ignored in v2 authentication. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#default_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optional domain name to use with v3 API and v2 parameters. It will be used[0m
[0;31m[0m[0;31m-# for both the user and project domain in v3 and ignored in v2 authentication.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#default_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain ID to scope to (string value)[0m
[0;31m[0m[0;31m-#domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain name to scope to (string value)[0m
[0;31m[0m[0;31m-#domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Verify HTTPS connections. (boolean value)[0m
[0;31m[0m[0;31m-#insecure = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded client certificate key file (string value)[0m
[0;31m[0m[0;31m-#keyfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's password (string value)[0m
[0;31m[0m[0;31m-#password = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain ID containing project (string value)[0m
[0;31m[0m[0;31m-#project_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain name containing project (string value)[0m
[0;31m[0m[0;31m-#project_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Project ID to scope to (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [nova]/tenant_id[0m
[0;31m[0m[0;31m-#project_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Project name to scope to (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [nova]/tenant_name[0m
[0;31m[0m[0;31m-#project_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log requests to multiple loggers. (boolean value)[0m
[0;31m[0m[0;31m-#split_loggers = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Scope for system operations (string value)[0m
[0;31m[0m[0;31m-#system_scope = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Tenant ID (string value)[0m
[0;31m[0m[0;31m-#tenant_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Tenant Name (string value)[0m
[0;31m[0m[0;31m-#tenant_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Timeout value for http requests (integer value)[0m
[0;31m[0m[0;31m-#timeout = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Trust ID (string value)[0m
[0;31m[0m[0;31m-#trust_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's domain id (string value)[0m
[0;31m[0m[0;31m-#user_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's domain name (string value)[0m
[0;31m[0m[0;31m-#user_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User id (string value)[0m
[0;31m[0m[0;31m-#user_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Username (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [nova]/user_name[0m
[0;31m[0m[0;31m-#username = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_concurrency][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.concurrency[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enables or disables inter-process locks. (boolean value)[0m
[0;31m[0m[0;31m-#disable_process_locking = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Directory to use for lock files.  For security, the specified directory[0m
[0;31m[0m[0;31m-# should only be writable by the user running the processes that need locking.[0m
[0;31m[0m[0;31m-# Defaults to environment variable OSLO_LOCK_PATH. If external locks are used,[0m
[0;31m[0m[0;31m-# a lock path must be set. (string value)[0m
[0;31m[0m[0;31m-#lock_path = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_messaging_amqp][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.messaging[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Name for the AMQP container. must be globally unique. Defaults to a generated[0m
[0;31m[0m[0;31m-# UUID (string value)[0m
[0;31m[0m[0;31m-#container_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Timeout for inactive connections (in seconds) (integer value)[0m
[0;31m[0m[0;31m-#idle_timeout = 0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Debug: dump AMQP frames to stdout (boolean value)[0m
[0;31m[0m[0;31m-#trace = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Attempt to connect via SSL. If no other ssl-related parameters are given, it[0m
[0;31m[0m[0;31m-# will use the system's CA-bundle to verify the server's certificate. (boolean[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#ssl = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# CA certificate PEM file used to verify the server's certificate (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#ssl_ca_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Self-identifying certificate PEM file for client authentication (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#ssl_cert_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Private key PEM file used to sign ssl_cert_file certificate (optional)[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#ssl_key_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Password for decrypting ssl_key_file (if encrypted) (string value)[0m
[0;31m[0m[0;31m-#ssl_key_password = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# By default SSL checks that the name in the server's certificate matches the[0m
[0;31m[0m[0;31m-# hostname in the transport_url. In some configurations it may be preferable to[0m
[0;31m[0m[0;31m-# use the virtual hostname instead, for example if the server uses the Server[0m
[0;31m[0m[0;31m-# Name Indication TLS extension (rfc6066) to provide a certificate per virtual[0m
[0;31m[0m[0;31m-# host. Set ssl_verify_vhost to True if the server's SSL certificate uses the[0m
[0;31m[0m[0;31m-# virtual host name instead of the DNS name. (boolean value)[0m
[0;31m[0m[0;31m-#ssl_verify_vhost = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Space separated list of acceptable SASL mechanisms (string value)[0m
[0;31m[0m[0;31m-#sasl_mechanisms =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Path to directory that contains the SASL configuration (string value)[0m
[0;31m[0m[0;31m-#sasl_config_dir =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Name of configuration file (without .conf suffix) (string value)[0m
[0;31m[0m[0;31m-#sasl_config_name =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# SASL realm to use if no realm present in username (string value)[0m
[0;31m[0m[0;31m-#sasl_default_realm =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Seconds to pause before attempting to re-connect. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#connection_retry_interval = 1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Increase the connection_retry_interval by this many seconds after each[0m
[0;31m[0m[0;31m-# unsuccessful failover attempt. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 0[0m
[0;31m[0m[0;31m-#connection_retry_backoff = 2[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum limit for connection_retry_interval + connection_retry_backoff[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#connection_retry_interval_max = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Time to pause between re-connecting an AMQP 1.0 link that failed due to a[0m
[0;31m[0m[0;31m-# recoverable error. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#link_retry_delay = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The maximum number of attempts to re-send a reply message which failed due to[0m
[0;31m[0m[0;31m-# a recoverable error. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: -1[0m
[0;31m[0m[0;31m-#default_reply_retry = 0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The deadline for an rpc reply message delivery. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 5[0m
[0;31m[0m[0;31m-#default_reply_timeout = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The deadline for an rpc cast or call message delivery. Only used when caller[0m
[0;31m[0m[0;31m-# does not provide a timeout expiry. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 5[0m
[0;31m[0m[0;31m-#default_send_timeout = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The deadline for a sent notification message delivery. Only used when caller[0m
[0;31m[0m[0;31m-# does not provide a timeout expiry. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 5[0m
[0;31m[0m[0;31m-#default_notify_timeout = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The duration to schedule a purge of idle sender links. Detach link after[0m
[0;31m[0m[0;31m-# expiry. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#default_sender_link_timeout = 600[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Indicates the addressing mode used by the driver.[0m
[0;31m[0m[0;31m-# Permitted values:[0m
[0;31m[0m[0;31m-# 'legacy'   - use legacy non-routable addressing[0m
[0;31m[0m[0;31m-# 'routable' - use routable addresses[0m
[0;31m[0m[0;31m-# 'dynamic'  - use legacy addresses if the message bus does not support routing[0m
[0;31m[0m[0;31m-# otherwise use routable addressing (string value)[0m
[0;31m[0m[0;31m-#addressing_mode = dynamic[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable virtual host support for those message buses that do not natively[0m
[0;31m[0m[0;31m-# support virtual hosting (such as qpidd). When set to true the virtual host[0m
[0;31m[0m[0;31m-# name will be added to all message bus addresses, effectively creating a[0m
[0;31m[0m[0;31m-# private 'subnet' per virtual host. Set to False if the message bus supports[0m
[0;31m[0m[0;31m-# virtual hosting using the 'hostname' field in the AMQP 1.0 Open performative[0m
[0;31m[0m[0;31m-# as the name of the virtual host. (boolean value)[0m
[0;31m[0m[0;31m-#pseudo_vhost = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# address prefix used when sending to a specific server (string value)[0m
[0;31m[0m[0;31m-#server_request_prefix = exclusive[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# address prefix used when broadcasting to all servers (string value)[0m
[0;31m[0m[0;31m-#broadcast_prefix = broadcast[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# address prefix when sending to any server in group (string value)[0m
[0;31m[0m[0;31m-#group_request_prefix = unicast[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Address prefix for all generated RPC addresses (string value)[0m
[0;31m[0m[0;31m-#rpc_address_prefix = openstack.org/om/rpc[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Address prefix for all generated Notification addresses (string value)[0m
[0;31m[0m[0;31m-#notify_address_prefix = openstack.org/om/notify[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Appended to the address prefix when sending a fanout message. Used by the[0m
[0;31m[0m[0;31m-# message bus to identify fanout messages. (string value)[0m
[0;31m[0m[0;31m-#multicast_address = multicast[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Appended to the address prefix when sending to a particular RPC/Notification[0m
[0;31m[0m[0;31m-# server. Used by the message bus to identify messages sent to a single[0m
[0;31m[0m[0;31m-# destination. (string value)[0m
[0;31m[0m[0;31m-#unicast_address = unicast[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Appended to the address prefix when sending to a group of consumers. Used by[0m
[0;31m[0m[0;31m-# the message bus to identify messages that should be delivered in a round-[0m
[0;31m[0m[0;31m-# robin fashion across consumers. (string value)[0m
[0;31m[0m[0;31m-#anycast_address = anycast[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Exchange name used in notification addresses.[0m
[0;31m[0m[0;31m-# Exchange name resolution precedence:[0m
[0;31m[0m[0;31m-# Target.exchange if set[0m
[0;31m[0m[0;31m-# else default_notification_exchange if set[0m
[0;31m[0m[0;31m-# else control_exchange if set[0m
[0;31m[0m[0;31m-# else 'notify' (string value)[0m
[0;31m[0m[0;31m-#default_notification_exchange = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Exchange name used in RPC addresses.[0m
[0;31m[0m[0;31m-# Exchange name resolution precedence:[0m
[0;31m[0m[0;31m-# Target.exchange if set[0m
[0;31m[0m[0;31m-# else default_rpc_exchange if set[0m
[0;31m[0m[0;31m-# else control_exchange if set[0m
[0;31m[0m[0;31m-# else 'rpc' (string value)[0m
[0;31m[0m[0;31m-#default_rpc_exchange = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Window size for incoming RPC Reply messages. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#reply_link_credit = 200[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Window size for incoming RPC Request messages (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#rpc_server_credit = 100[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Window size for incoming Notification messages (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#notify_server_credit = 100[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Send messages of this type pre-settled.[0m
[0;31m[0m[0;31m-# Pre-settled messages will not receive acknowledgement[0m
[0;31m[0m[0;31m-# from the peer. Note well: pre-settled messages may be[0m
[0;31m[0m[0;31m-# silently discarded if the delivery fails.[0m
[0;31m[0m[0;31m-# Permitted values:[0m
[0;31m[0m[0;31m-# 'rpc-call' - send RPC Calls pre-settled[0m
[0;31m[0m[0;31m-# 'rpc-reply'- send RPC Replies pre-settled[0m
[0;31m[0m[0;31m-# 'rpc-cast' - Send RPC Casts pre-settled[0m
[0;31m[0m[0;31m-# 'notify'   - Send Notifications pre-settled[0m
[0;31m[0m[0;31m-#  (multi valued)[0m
[0;31m[0m[0;31m-#pre_settled = rpc-cast[0m
[0;31m[0m[0;31m-#pre_settled = rpc-reply[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_messaging_kafka][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.messaging[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Max fetch bytes of Kafka consumer (integer value)[0m
[0;31m[0m[0;31m-#kafka_max_fetch_bytes = 1048576[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Default timeout(s) for Kafka consumers (floating point value)[0m
[0;31m[0m[0;31m-#kafka_consumer_timeout = 1.0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: Pool Size for Kafka Consumers (integer value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-# Reason: Driver no longer uses connection pool.[0m
[0;31m[0m[0;31m-#pool_size = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: The pool size limit for connections expiration policy (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-# Reason: Driver no longer uses connection pool.[0m
[0;31m[0m[0;31m-#conn_pool_min_size = 2[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: The time-to-live in sec of idle connections in the pool (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-# Reason: Driver no longer uses connection pool.[0m
[0;31m[0m[0;31m-#conn_pool_ttl = 1200[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Group id for Kafka consumer. Consumers in one group will coordinate message[0m
[0;31m[0m[0;31m-# consumption (string value)[0m
[0;31m[0m[0;31m-#consumer_group = oslo_messaging_consumer[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Upper bound on the delay for KafkaProducer batching in seconds (floating[0m
[0;31m[0m[0;31m-# point value)[0m
[0;31m[0m[0;31m-#producer_batch_timeout = 0.0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Size of batch for the producer async send (integer value)[0m
[0;31m[0m[0;31m-#producer_batch_size = 16384[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The compression codec for all data generated by the producer. If not set,[0m
[0;31m[0m[0;31m-# compression will not be used. Note that the allowed values of this depend on[0m
[0;31m[0m[0;31m-# the kafka version (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# none - <No description provided>[0m
[0;31m[0m[0;31m-# gzip - <No description provided>[0m
[0;31m[0m[0;31m-# snappy - <No description provided>[0m
[0;31m[0m[0;31m-# lz4 - <No description provided>[0m
[0;31m[0m[0;31m-# zstd - <No description provided>[0m
[0;31m[0m[0;31m-#compression_codec = none[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable asynchronous consumer commits (boolean value)[0m
[0;31m[0m[0;31m-#enable_auto_commit = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The maximum number of records returned in a poll call (integer value)[0m
[0;31m[0m[0;31m-#max_poll_records = 500[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Protocol used to communicate with brokers (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# PLAINTEXT - <No description provided>[0m
[0;31m[0m[0;31m-# SASL_PLAINTEXT - <No description provided>[0m
[0;31m[0m[0;31m-# SSL - <No description provided>[0m
[0;31m[0m[0;31m-# SASL_SSL - <No description provided>[0m
[0;31m[0m[0;31m-#security_protocol = PLAINTEXT[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Mechanism when security protocol is SASL (string value)[0m
[0;31m[0m[0;31m-#sasl_mechanism = PLAIN[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# CA certificate PEM file used to verify the server certificate (string value)[0m
[0;31m[0m[0;31m-#ssl_cafile =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Client certificate PEM file used for authentication. (string value)[0m
[0;31m[0m[0;31m-#ssl_client_cert_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Client key PEM file used for authentication. (string value)[0m
[0;31m[0m[0;31m-#ssl_client_key_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Client key password file used for authentication. (string value)[0m
[0;31m[0m[0;31m-#ssl_client_key_password =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_messaging_notifications][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.messaging[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The Drivers(s) to handle sending notifications. Possible values are[0m
[0;31m[0m[0;31m-# messaging, messagingv2, routing, log, test, noop (multi valued)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/notification_driver[0m
[0;31m[0m[0;31m-#driver =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# A URL representing the messaging driver to use for notifications. If not set,[0m
[0;31m[0m[0;31m-# we fall back to the same configuration used for RPC. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/notification_transport_url[0m
[0;31m[0m[0;31m-#transport_url = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# AMQP topic used for OpenStack notifications. (list value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [rpc_notifier2]/topics[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/notification_topics[0m
[0;31m[0m[0;31m-#topics = notifications[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The maximum number of attempts to re-send a notification message which failed[0m
[0;31m[0m[0;31m-# to be delivered due to a recoverable error. 0 - No retry, -1 - indefinite[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#retry = -1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_messaging_rabbit][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.messaging[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Use durable queues in AMQP. If rabbit_quorum_queue is enabled, queues will be[0m
[0;31m[0m[0;31m-# durable and this value will be ignored. (boolean value)[0m
[0;31m[0m[0;31m-#amqp_durable_queues = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Auto-delete queues in AMQP. (boolean value)[0m
[0;31m[0m[0;31m-#amqp_auto_delete = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Connect over SSL. (boolean value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [oslo_messaging_rabbit]/rabbit_use_ssl[0m
[0;31m[0m[0;31m-#ssl = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# SSL version to use (valid only if SSL enabled). Valid values are TLSv1 and[0m
[0;31m[0m[0;31m-# SSLv23. SSLv2, SSLv3, TLSv1_1, and TLSv1_2 may be available on some[0m
[0;31m[0m[0;31m-# distributions. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [oslo_messaging_rabbit]/kombu_ssl_version[0m
[0;31m[0m[0;31m-#ssl_version =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# SSL key file (valid only if SSL enabled). (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [oslo_messaging_rabbit]/kombu_ssl_keyfile[0m
[0;31m[0m[0;31m-#ssl_key_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# SSL cert file (valid only if SSL enabled). (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [oslo_messaging_rabbit]/kombu_ssl_certfile[0m
[0;31m[0m[0;31m-#ssl_cert_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# SSL certification authority file (valid only if SSL enabled). (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [oslo_messaging_rabbit]/kombu_ssl_ca_certs[0m
[0;31m[0m[0;31m-#ssl_ca_file =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Run the health check heartbeat thread through a native python thread by[0m
[0;31m[0m[0;31m-# default. If this option is equal to False then the health check heartbeat[0m
[0;31m[0m[0;31m-# will inherit the execution model from the parent process. For example if the[0m
[0;31m[0m[0;31m-# parent process has monkey patched the stdlib by using eventlet/greenlet then[0m
[0;31m[0m[0;31m-# the heartbeat will be run through a green thread. (boolean value)[0m
[0;31m[0m[0;31m-#heartbeat_in_pthread = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# How long to wait before reconnecting in response to an AMQP consumer cancel[0m
[0;31m[0m[0;31m-# notification. (floating point value)[0m
[0;31m[0m[0;31m-#kombu_reconnect_delay = 1.0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# EXPERIMENTAL: Possible values are: gzip, bz2. If not set compression will not[0m
[0;31m[0m[0;31m-# be used. This option may not be available in future versions. (string value)[0m
[0;31m[0m[0;31m-#kombu_compression = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# How long to wait a missing client before abandoning to send it its replies.[0m
[0;31m[0m[0;31m-# This value should not be longer than rpc_response_timeout. (integer value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [oslo_messaging_rabbit]/kombu_reconnect_timeout[0m
[0;31m[0m[0;31m-#kombu_missing_consumer_retry_timeout = 60[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Determines how the next RabbitMQ node is chosen in case the one we are[0m
[0;31m[0m[0;31m-# currently connected to becomes unavailable. Takes effect only if more than[0m
[0;31m[0m[0;31m-# one RabbitMQ node is provided in config. (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# round-robin - <No description provided>[0m
[0;31m[0m[0;31m-# shuffle - <No description provided>[0m
[0;31m[0m[0;31m-#kombu_failover_strategy = round-robin[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The RabbitMQ login method. (string value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# PLAIN - <No description provided>[0m
[0;31m[0m[0;31m-# AMQPLAIN - <No description provided>[0m
[0;31m[0m[0;31m-# RABBIT-CR-DEMO - <No description provided>[0m
[0;31m[0m[0;31m-#rabbit_login_method = AMQPLAIN[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# How frequently to retry connecting with RabbitMQ. (integer value)[0m
[0;31m[0m[0;31m-#rabbit_retry_interval = 1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# How long to backoff for between retries when connecting to RabbitMQ. (integer[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#rabbit_retry_backoff = 2[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Maximum interval of RabbitMQ connection retries. Default is 30 seconds.[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#rabbit_interval_max = 30[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Try to use HA queues in RabbitMQ (x-ha-policy: all). If you change this[0m
[0;31m[0m[0;31m-# option, you must wipe the RabbitMQ database. In RabbitMQ 3.0, queue mirroring[0m
[0;31m[0m[0;31m-# is no longer controlled by the x-ha-policy argument when declaring a queue.[0m
[0;31m[0m[0;31m-# If you just want to make sure that all queues (except those with auto-[0m
[0;31m[0m[0;31m-# generated names) are mirrored across all nodes, run: "rabbitmqctl set_policy[0m
[0;31m[0m[0;31m-# HA '^(?!amq\.).*' '{"ha-mode": "all"}' " (boolean value)[0m
[0;31m[0m[0;31m-#rabbit_ha_queues = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Use quorum queues in RabbitMQ (x-queue-type: quorum). The quorum queue is a[0m
[0;31m[0m[0;31m-# modern queue type for RabbitMQ implementing a durable, replicated FIFO queue[0m
[0;31m[0m[0;31m-# based on the Raft consensus algorithm. It is available as of RabbitMQ 3.8.0.[0m
[0;31m[0m[0;31m-# If set this option will conflict with the HA queues (``rabbit_ha_queues``)[0m
[0;31m[0m[0;31m-# aka mirrored queues, in other words the HA queues should be disabled, quorum[0m
[0;31m[0m[0;31m-# queues durable by default so the amqp_durable_queues opion is ignored when[0m
[0;31m[0m[0;31m-# this option enabled. (boolean value)[0m
[0;31m[0m[0;31m-#rabbit_quorum_queue = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Positive integer representing duration in seconds for queue TTL (x-expires).[0m
[0;31m[0m[0;31m-# Queues which are unused for the duration of the TTL are automatically[0m
[0;31m[0m[0;31m-# deleted. The parameter affects only reply and fanout queues. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#rabbit_transient_queues_ttl = 1800[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Specifies the number of messages to prefetch. Setting to zero allows[0m
[0;31m[0m[0;31m-# unlimited messages. (integer value)[0m
[0;31m[0m[0;31m-#rabbit_qos_prefetch_count = 0[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of seconds after which the Rabbit broker is considered down if[0m
[0;31m[0m[0;31m-# heartbeat's keep-alive fails (0 disables heartbeat). (integer value)[0m
[0;31m[0m[0;31m-#heartbeat_timeout_threshold = 60[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# How often times during the heartbeat_timeout_threshold we check the[0m
[0;31m[0m[0;31m-# heartbeat. (integer value)[0m
[0;31m[0m[0;31m-#heartbeat_rate = 2[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# DEPRECATED: (DEPRECATED) Enable/Disable the RabbitMQ mandatory flag for[0m
[0;31m[0m[0;31m-# direct send. The direct send is used as reply, so the MessageUndeliverable[0m
[0;31m[0m[0;31m-# exception is raised in case the client queue does not[0m
[0;31m[0m[0;31m-# exist.MessageUndeliverable exception will be used to loop for a timeout to[0m
[0;31m[0m[0;31m-# lets a chance to sender to recover.This flag is deprecated and it will not be[0m
[0;31m[0m[0;31m-# possible to deactivate this functionality anymore (boolean value)[0m
[0;31m[0m[0;31m-# This option is deprecated for removal.[0m
[0;31m[0m[0;31m-# Its value may be silently ignored in the future.[0m
[0;31m[0m[0;31m-# Reason: Mandatory flag no longer deactivable.[0m
[0;31m[0m[0;31m-#direct_mandatory_flag = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Enable x-cancel-on-ha-failover flag so that rabbitmq server will cancel and[0m
[0;31m[0m[0;31m-# notify consumerswhen queue is down (boolean value)[0m
[0;31m[0m[0;31m-#enable_cancel_on_failover = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_middleware][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.middleware.http_proxy_to_wsgi[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Whether the application is behind a proxy or not. This determines if the[0m
[0;31m[0m[0;31m-# middleware should parse the headers or not. (boolean value)[0m
[0;31m[0m[0;31m-#enable_proxy_headers_parsing = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_policy][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.policy[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# This option controls whether or not to enforce scope when evaluating[0m
[0;31m[0m[0;31m-# policies. If ``True``, the scope of the token used in the request is compared[0m
[0;31m[0m[0;31m-# to the ``scope_types`` of the policy being enforced. If the scopes do not[0m
[0;31m[0m[0;31m-# match, an ``InvalidScope`` exception will be raised. If ``False``, a message[0m
[0;31m[0m[0;31m-# will be logged informing operators that policies are being invoked with[0m
[0;31m[0m[0;31m-# mismatching scope. (boolean value)[0m
[0;31m[0m[0;31m-#enforce_scope = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# This option controls whether or not to use old deprecated defaults when[0m
[0;31m[0m[0;31m-# evaluating policies. If ``True``, the old deprecated defaults are not going[0m
[0;31m[0m[0;31m-# to be evaluated. This means if any existing token is allowed for old defaults[0m
[0;31m[0m[0;31m-# but is disallowed for new defaults, it will be disallowed. It is encouraged[0m
[0;31m[0m[0;31m-# to enable this flag along with the ``enforce_scope`` flag so that you can get[0m
[0;31m[0m[0;31m-# the benefits of new defaults and ``scope_type`` together. If ``False``, the[0m
[0;31m[0m[0;31m-# deprecated policy check string is logically OR'd with the new policy check[0m
[0;31m[0m[0;31m-# string, allowing for a graceful upgrade experience between releases with new[0m
[0;31m[0m[0;31m-# policies, which is the default behavior. (boolean value)[0m
[0;31m[0m[0;31m-#enforce_new_defaults = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The relative or absolute path of a file that maps roles to permissions for a[0m
[0;31m[0m[0;31m-# given service. Relative paths must be specified in relation to the[0m
[0;31m[0m[0;31m-# configuration file setting this option. (string value)[0m
[0;31m[0m[0;31m-#policy_file = policy.yaml[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Default rule. Enforced when a requested rule is not found. (string value)[0m
[0;31m[0m[0;31m-#policy_default_rule = default[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Directories where policy configuration files are stored. They can be relative[0m
[0;31m[0m[0;31m-# to any directory in the search path defined by the config_dir option, or[0m
[0;31m[0m[0;31m-# absolute paths. The file defined by policy_file must exist for these[0m
[0;31m[0m[0;31m-# directories to be searched.  Missing or empty directories are ignored. (multi[0m
[0;31m[0m[0;31m-# valued)[0m
[0;31m[0m[0;31m-#policy_dirs = policy.d[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Content Type to send and receive data for REST based policy check (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# application/x-www-form-urlencoded - <No description provided>[0m
[0;31m[0m[0;31m-# application/json - <No description provided>[0m
[0;31m[0m[0;31m-#remote_content_type = application/x-www-form-urlencoded[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# server identity verification for REST based policy check (boolean value)[0m
[0;31m[0m[0;31m-#remote_ssl_verify_server_crt = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Absolute path to ca cert file for REST based policy check (string value)[0m
[0;31m[0m[0;31m-#remote_ssl_ca_crt_file = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Absolute path to client cert for REST based policy check (string value)[0m
[0;31m[0m[0;31m-#remote_ssl_client_crt_file = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Absolute path client key file REST based policy check (string value)[0m
[0;31m[0m[0;31m-#remote_ssl_client_key_file = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[oslo_reports][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.reports[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Path to a log directory where to create a file (string value)[0m
[0;31m[0m[0;31m-#log_dir = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The path to a file to watch for changes to trigger the reports, instead of[0m
[0;31m[0m[0;31m-# signals. Setting this option disables the signal trigger for the reports. If[0m
[0;31m[0m[0;31m-# application is running as a WSGI application it is recommended to use this[0m
[0;31m[0m[0;31m-# instead of signals. (string value)[0m
[0;31m[0m[0;31m-#file_event_handler = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# How many seconds to wait between polls when file_event_handler is set[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#file_event_handler_interval = 1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[placement][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Name of placement region to use. Useful if keystone manages more than one[0m
[0;31m[0m[0;31m-# region. (string value)[0m
[0;31m[0m[0;31m-#region_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Type of the placement endpoint to use.  This endpoint will be looked up in[0m
[0;31m[0m[0;31m-# the keystone catalog and should be one of public, internal or admin. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-# public - <No description provided>[0m
[0;31m[0m[0;31m-# admin - <No description provided>[0m
[0;31m[0m[0;31m-# internal - <No description provided>[0m
[0;31m[0m[0;31m-#endpoint_type = public[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From placement.auth[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Authentication URL (string value)[0m
[0;31m[0m[0;31m-#auth_url = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Authentication type to load (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [placement]/auth_plugin[0m
[0;31m[0m[0;31m-#auth_type = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded Certificate Authority to use when verifying HTTPs connections.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#cafile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded client certificate cert file (string value)[0m
[0;31m[0m[0;31m-#certfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Collect per-API call timing information. (boolean value)[0m
[0;31m[0m[0;31m-#collect_timing = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optional domain ID to use with v3 and v2 parameters. It will be used for both[0m
[0;31m[0m[0;31m-# the user and project domain in v3 and ignored in v2 authentication. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#default_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Optional domain name to use with v3 API and v2 parameters. It will be used[0m
[0;31m[0m[0;31m-# for both the user and project domain in v3 and ignored in v2 authentication.[0m
[0;31m[0m[0;31m-# (string value)[0m
[0;31m[0m[0;31m-#default_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain ID to scope to (string value)[0m
[0;31m[0m[0;31m-#domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain name to scope to (string value)[0m
[0;31m[0m[0;31m-#domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Verify HTTPS connections. (boolean value)[0m
[0;31m[0m[0;31m-#insecure = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# PEM encoded client certificate key file (string value)[0m
[0;31m[0m[0;31m-#keyfile = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's password (string value)[0m
[0;31m[0m[0;31m-#password = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain ID containing project (string value)[0m
[0;31m[0m[0;31m-#project_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Domain name containing project (string value)[0m
[0;31m[0m[0;31m-#project_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Project ID to scope to (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [placement]/tenant_id[0m
[0;31m[0m[0;31m-#project_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Project name to scope to (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [placement]/tenant_name[0m
[0;31m[0m[0;31m-#project_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Log requests to multiple loggers. (boolean value)[0m
[0;31m[0m[0;31m-#split_loggers = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Scope for system operations (string value)[0m
[0;31m[0m[0;31m-#system_scope = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Tenant ID (string value)[0m
[0;31m[0m[0;31m-#tenant_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Tenant Name (string value)[0m
[0;31m[0m[0;31m-#tenant_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Timeout value for http requests (integer value)[0m
[0;31m[0m[0;31m-#timeout = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Trust ID (string value)[0m
[0;31m[0m[0;31m-#trust_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's domain id (string value)[0m
[0;31m[0m[0;31m-#user_domain_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User's domain name (string value)[0m
[0;31m[0m[0;31m-#user_domain_name = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User id (string value)[0m
[0;31m[0m[0;31m-#user_id = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Username (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [placement]/user_name[0m
[0;31m[0m[0;31m-#username = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[privsep][0m
[0;31m[0m[0;31m-# Configuration options for the oslo.privsep daemon. Note that this group name[0m
[0;31m[0m[0;31m-# can be changed by the consuming service. Check the service's docs to see if[0m
[0;31m[0m[0;31m-# this is the case.[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.privsep[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# User that the privsep daemon should run as. (string value)[0m
[0;31m[0m[0;31m-#user = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Group that the privsep daemon should run as. (string value)[0m
[0;31m[0m[0;31m-#group = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# List of Linux capabilities retained by the privsep daemon. (list value)[0m
[0;31m[0m[0;31m-#capabilities =[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# The number of threads available for privsep to concurrently run processes.[0m
[0;31m[0m[0;31m-# Defaults to the number of CPU cores in the system. (integer value)[0m
[0;31m[0m[0;31m-# Minimum value: 1[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# This option has a sample default set, which means that[0m
[0;31m[0m[0;31m-# its actual default value may vary from the one documented[0m
[0;31m[0m[0;31m-# below.[0m
[0;31m[0m[0;31m-#thread_pool_size = multiprocessing.cpu_count()[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Command to invoke to start the privsep daemon if not using the "fork" method.[0m
[0;31m[0m[0;31m-# If not specified, a default is generated using "sudo privsep-helper" and[0m
[0;31m[0m[0;31m-# arguments designed to recreate the current configuration. This command must[0m
[0;31m[0m[0;31m-# accept suitable --privsep_context and --privsep_sock_path arguments. (string[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#helper_command = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Logger name to use for this privsep context.  By default all contexts log[0m
[0;31m[0m[0;31m-# with oslo_privsep.daemon. (string value)[0m
[0;31m[0m[0;31m-#logger_name = oslo_privsep.daemon[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[profiler][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From osprofiler[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Enable the profiling for all services on this node.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Default value is False (fully disable the profiling feature).[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# * True: Enables the feature[0m
[0;31m[0m[0;31m-# * False: Disables the feature. The profiling cannot be started via this[0m
[0;31m[0m[0;31m-# project[0m
[0;31m[0m[0;31m-#   operations. If the profiling is triggered by another project, this project[0m
[0;31m[0m[0;31m-#   part will be empty.[0m
[0;31m[0m[0;31m-#  (boolean value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [profiler]/profiler_enabled[0m
[0;31m[0m[0;31m-#enabled = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Enable SQL requests profiling in services.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Default value is False (SQL requests won't be traced).[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# * True: Enables SQL requests profiling. Each SQL query will be part of the[0m
[0;31m[0m[0;31m-#   trace and can the be analyzed by how much time was spent for that.[0m
[0;31m[0m[0;31m-# * False: Disables SQL requests profiling. The spent time is only shown on a[0m
[0;31m[0m[0;31m-#   higher level of operations. Single SQL queries cannot be analyzed this way.[0m
[0;31m[0m[0;31m-#  (boolean value)[0m
[0;31m[0m[0;31m-#trace_sqlalchemy = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Secret key(s) to use for encrypting context data for performance profiling.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# This string value should have the following format:[0m
[0;31m[0m[0;31m-# <key1>[,<key2>,...<keyn>],[0m
[0;31m[0m[0;31m-# where each key is some random string. A user who triggers the profiling via[0m
[0;31m[0m[0;31m-# the REST API has to set one of these keys in the headers of the REST API call[0m
[0;31m[0m[0;31m-# to include profiling results of this node for this particular project.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Both "enabled" flag and "hmac_keys" config options should be set to enable[0m
[0;31m[0m[0;31m-# profiling. Also, to generate correct profiling information across all[0m
[0;31m[0m[0;31m-# services[0m
[0;31m[0m[0;31m-# at least one key needs to be consistent between OpenStack projects. This[0m
[0;31m[0m[0;31m-# ensures it can be used from client side to generate the trace, containing[0m
[0;31m[0m[0;31m-# information from all possible resources.[0m
[0;31m[0m[0;31m-#  (string value)[0m
[0;31m[0m[0;31m-#hmac_keys = SECRET_KEY[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Connection string for a notifier backend.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Default value is ``messaging://`` which sets the notifier to oslo_messaging.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Examples of possible values:[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# * ``messaging://`` - use oslo_messaging driver for sending spans.[0m
[0;31m[0m[0;31m-# * ``redis://127.0.0.1:6379`` - use redis driver for sending spans.[0m
[0;31m[0m[0;31m-# * ``mongodb://127.0.0.1:27017`` - use mongodb driver for sending spans.[0m
[0;31m[0m[0;31m-# * ``elasticsearch://127.0.0.1:9200`` - use elasticsearch driver for sending[0m
[0;31m[0m[0;31m-#   spans.[0m
[0;31m[0m[0;31m-# * ``jaeger://127.0.0.1:6831`` - use jaeger tracing as driver for sending[0m
[0;31m[0m[0;31m-# spans.[0m
[0;31m[0m[0;31m-#  (string value)[0m
[0;31m[0m[0;31m-#connection_string = messaging://[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Document type for notification indexing in elasticsearch.[0m
[0;31m[0m[0;31m-#  (string value)[0m
[0;31m[0m[0;31m-#es_doc_type = notification[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# This parameter is a time value parameter (for example: es_scroll_time=2m),[0m
[0;31m[0m[0;31m-# indicating for how long the nodes that participate in the search will[0m
[0;31m[0m[0;31m-# maintain[0m
[0;31m[0m[0;31m-# relevant resources in order to continue and support it.[0m
[0;31m[0m[0;31m-#  (string value)[0m
[0;31m[0m[0;31m-#es_scroll_time = 2m[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Elasticsearch splits large requests in batches. This parameter defines[0m
[0;31m[0m[0;31m-# maximum size of each batch (for example: es_scroll_size=10000).[0m
[0;31m[0m[0;31m-#  (integer value)[0m
[0;31m[0m[0;31m-#es_scroll_size = 10000[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Redissentinel provides a timeout option on the connections.[0m
[0;31m[0m[0;31m-# This parameter defines that timeout (for example: socket_timeout=0.1).[0m
[0;31m[0m[0;31m-#  (floating point value)[0m
[0;31m[0m[0;31m-#socket_timeout = 0.1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Redissentinel uses a service name to identify a master redis service.[0m
[0;31m[0m[0;31m-# This parameter defines the name (for example:[0m
[0;31m[0m[0;31m-# ``sentinal_service_name=mymaster``).[0m
[0;31m[0m[0;31m-#  (string value)[0m
[0;31m[0m[0;31m-#sentinel_service_name = mymaster[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Enable filter traces that contain error/exception to a separated place.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Default value is set to False.[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# Possible values:[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# * True: Enable filter traces that contain error/exception.[0m
[0;31m[0m[0;31m-# * False: Disable the filter.[0m
[0;31m[0m[0;31m-#  (boolean value)[0m
[0;31m[0m[0;31m-#filter_error_trace = false[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[quotas][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Default number of resource allowed per tenant. A negative value means[0m
[0;31m[0m[0;31m-# unlimited. (integer value)[0m
[0;31m[0m[0;31m-#default_quota = -1[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of networks allowed per tenant. A negative value means unlimited.[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#quota_network = 100[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of subnets allowed per tenant, A negative value means unlimited.[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#quota_subnet = 100[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of ports allowed per tenant. A negative value means unlimited.[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#quota_port = 500[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Default driver to use for quota checks. (string value)[0m
[0;31m[0m[0;31m-#quota_driver = neutron.db.quota.driver_nolock.DbQuotaNoLockDriver[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Keep in track in the database of current resource quota usage. Plugins which[0m
[0;31m[0m[0;31m-# do not leverage the neutron database should set this flag to False. (boolean[0m
[0;31m[0m[0;31m-# value)[0m
[0;31m[0m[0;31m-#track_quota_usage = true[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From neutron.extensions[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of routers allowed per tenant. A negative value means unlimited.[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#quota_router = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of floating IPs allowed per tenant. A negative value means unlimited.[0m
[0;31m[0m[0;31m-# (integer value)[0m
[0;31m[0m[0;31m-#quota_floatingip = 50[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of security groups allowed per tenant. A negative value means[0m
[0;31m[0m[0;31m-# unlimited. (integer value)[0m
[0;31m[0m[0;31m-#quota_security_group = 10[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Number of security rules allowed per tenant. A negative value means[0m
[0;31m[0m[0;31m-# unlimited. (integer value)[0m
[0;31m[0m[0;31m-#quota_security_group_rule = 100[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[ssl][0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-# From oslo.service.sslutils[0m
[0;31m[0m[0;31m-#[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# CA certificate file to use to verify connecting clients. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/ssl_ca_file[0m
[0;31m[0m[0;31m-#ca_file = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Certificate file to use when starting the server securely. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/ssl_cert_file[0m
[0;31m[0m[0;31m-#cert_file = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Private key file to use when starting the server securely. (string value)[0m
[0;31m[0m[0;31m-# Deprecated group/name - [DEFAULT]/ssl_key_file[0m
[0;31m[0m[0;31m-#key_file = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# SSL version to use (valid only if SSL enabled). Valid values are TLSv1 and[0m
[0;31m[0m[0;31m-# SSLv23. SSLv2, SSLv3, TLSv1_1, and TLSv1_2 may be available on some[0m
[0;31m[0m[0;31m-# distributions. (string value)[0m
[0;31m[0m[0;31m-#version = <None>[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-# Sets the list of available ciphers. value should be a string in the OpenSSL[0m
[0;31m[0m[0;31m-# cipher list format. (string value)[0m
[0;31m[0m[0;31m-#ciphers = <None>[0m
[0;31m[0m[0;32m+transport_url = rabbit://openstack:1234@controller[0m
[0;32m[0m

2023-12-09 00:30:54,051 p=4730 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:30:54,057 p=4730 u=gonzales n=ansible | TASK [neutron : configuring Identity service access (1) dest=/etc/neutron/neutron.conf, content=[DEFAULT]
auth_strategy = keystone

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:30:55,465 p=4730 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-4730kqbt5emg/tmpdp1o188r[0m
[0;32m[0m[0;36m@@ -1,2 +1,13 @@[0m
[0;36m[0m [DEFAULT]
[0;31m-transport_url = rabbit://openstack:1234@controller[0m
[0;31m[0m[0;32m+auth_strategy = keystone[0m
[0;32m[0m[0;32m+[0m
[0;32m[0m[0;32m+[keystone_authtoken][0m
[0;32m[0m[0;32m+www_authenticate_uri = http://controller:5000[0m
[0;32m[0m[0;32m+auth_url = http://controller:5000[0m
[0;32m[0m[0;32m+memcached_servers = controller:11211[0m
[0;32m[0m[0;32m+auth_type = password[0m
[0;32m[0m[0;32m+project_domain_name = default[0m
[0;32m[0m[0;32m+user_domain_name = default[0m
[0;32m[0m[0;32m+project_name = service[0m
[0;32m[0m[0;32m+username = neutron[0m
[0;32m[0m[0;32m+password = 1234[0m
[0;32m[0m

2023-12-09 00:30:55,466 p=4730 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:30:55,470 p=4730 u=gonzales n=ansible | TASK [neutron : configuring the lock path dest=/etc/neutron/neutron.conf, content=[oslo_currency]
lock_path = /var/lib/neutron/tmp
] ***
2023-12-09 00:30:56,574 p=4730 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-4730kqbt5emg/tmpewph35v7[0m
[0;32m[0m[0;36m@@ -1,13 +1,2 @@[0m
[0;36m[0m[0;31m-[DEFAULT][0m
[0;31m[0m[0;31m-auth_strategy = keystone[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[keystone_authtoken][0m
[0;31m[0m[0;31m-www_authenticate_uri = http://controller:5000[0m
[0;31m[0m[0;31m-auth_url = http://controller:5000[0m
[0;31m[0m[0;31m-memcached_servers = controller:11211[0m
[0;31m[0m[0;31m-auth_type = password[0m
[0;31m[0m[0;31m-project_domain_name = default[0m
[0;31m[0m[0;31m-user_domain_name = default[0m
[0;31m[0m[0;31m-project_name = service[0m
[0;31m[0m[0;31m-username = neutron[0m
[0;31m[0m[0;31m-password = 1234[0m
[0;31m[0m[0;32m+[oslo_currency][0m
[0;32m[0m[0;32m+lock_path = /var/lib/neutron/tmp[0m
[0;32m[0m

2023-12-09 00:30:56,574 p=4730 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:30:56,578 p=4730 u=gonzales n=ansible | TASK [neutron : configuring the access parameters dest=/etc/nova/nova.conf, content=[neutron]
auth_url = http://controller:5000
auth_type = password
project_domain_name = default
user_domain_name = default
region_name = RegionOne
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:30:57,384 p=4730 u=gonzales n=ansible | diff skipped: destination file size is greater than 104448

2023-12-09 00:30:57,384 p=4730 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:30:57,403 p=4730 u=gonzales n=ansible | TASK [neutron : restarting the compute service _raw_params=service nova-compute restart] **********************************************
2023-12-09 00:30:57,889 p=4730 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:30:57,894 p=4730 u=gonzales n=ansible | TASK [neutron : restarting the linux bridge agent _raw_params=service neutron-linuxbridge-agent restart] ******************************
2023-12-09 00:30:58,325 p=4730 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:30:58,342 p=4730 u=gonzales n=ansible | TASK [neutron : Installing neutron and its dependencies name=['openstack-neutron', 'openstack-neutron-ml2', 'openstack-neutron-linuxbridge', 'ebtables']] ***
2023-12-09 00:30:58,374 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,377 p=4730 u=gonzales n=ansible | TASK [neutron : Configuring metadata_agent.ini file src=metadata_agent.ini, dest=/etc/neutron/metadata_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:30:58,411 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,418 p=4730 u=gonzales n=ansible | TASK [neutron : Configuring nova.conf file src=nova.conf, dest=/etc/nova/nova.conf, owner=root, group=nova, mode=0640] ****************
2023-12-09 00:30:58,450 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,456 p=4730 u=gonzales n=ansible | TASK [neutron : Creating a link] ******************************************************************************************************
2023-12-09 00:30:58,491 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,494 p=4730 u=gonzales n=ansible | TASK [neutron : Populating the database] **********************************************************************************************
2023-12-09 00:30:58,539 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,543 p=4730 u=gonzales n=ansible | TASK [neutron : Restarting the nova-api service] **************************************************************************************
2023-12-09 00:30:58,581 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,584 p=4730 u=gonzales n=ansible | TASK [neutron : Starting and enabling the Networking services] ************************************************************************
2023-12-09 00:30:58,617 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,620 p=4730 u=gonzales n=ansible | TASK [neutron : Editing neutron.conf file src=neutron.conf, dest=/etc/neutron/neutron.conf, owner=root, group=neutron, mode=0640] *****
2023-12-09 00:30:58,655 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,659 p=4730 u=gonzales n=ansible | TASK [neutron : Editing ml2_conf.ini file src=ml2_conf.ini, dest=/etc/neutron/plugins/ml2/ml2_conf.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:30:58,693 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,696 p=4730 u=gonzales n=ansible | TASK [neutron : Editing linuxbridge_agent.ini file src=linuxbridge_agent.ini, dest=/etc/neutron/plugins/ml2/linuxbridge_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:30:58,727 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,733 p=4730 u=gonzales n=ansible | TASK [neutron : Editing dhcp_agent.ini file src=dhcp_agent.ini, dest=/etc/neutron/dhcp_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:30:58,769 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,773 p=4730 u=gonzales n=ansible | TASK [neutron : Creating neutron database name=neutron, state=present] ****************************************************************
2023-12-09 00:30:58,811 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,814 p=4730 u=gonzales n=ansible | TASK [neutron : Granting privileges on neutron database name=neutron, host={{ item }}, password=neutronpass, priv=neutron.*:ALL, state=present] ***
2023-12-09 00:30:58,863 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=localhost) 
2023-12-09 00:30:58,866 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=%) 
2023-12-09 00:30:58,870 p=4730 u=gonzales n=ansible | TASK [neutron : Sourcing the admin credentials executable=/bin/bash, _raw_params=source /home/cserver/admin-openrc] *******************
2023-12-09 00:30:58,908 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,912 p=4730 u=gonzales n=ansible | TASK [neutron : Creating neutron user command=openstack user create --domain default --password-prompt neutron, responses={'User Password': 'neutronpass', 'Repeat User Password': 'neutronpass'}] ***
2023-12-09 00:30:58,945 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,948 p=4730 u=gonzales n=ansible | TASK [neutron : Adding admin roles to the neutron user _raw_params=openstack role add --project service --user neutron admin] *********
2023-12-09 00:30:58,978 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:58,982 p=4730 u=gonzales n=ansible | TASK [neutron : Creating neutron service entity _raw_params=openstack service create --name neutron --description 'OpenStack Networking Service' network] ***
2023-12-09 00:30:59,021 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:59,025 p=4730 u=gonzales n=ansible | TASK [neutron : Creating the network service API endpoints _raw_params=openstack endpoint create --region RegionOne network public http://controller:9696
openstack endpoint create --region RegionOne network internal http://controller:9696
openstack endpoint create --region RegionOne network admin http://controller:9696
] ***
2023-12-09 00:30:59,062 p=4730 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:30:59,069 p=4730 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-09 00:30:59,070 p=4730 u=gonzales n=ansible | 192.168.56.108             : ok=8    changed=7    unreachable=0    failed=0    skipped=18   rescued=0    ignored=0   
2023-12-09 00:30:59,070 p=4730 u=gonzales n=ansible | 192.168.56.110             : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   
2023-12-09 00:32:49,324 p=4961 u=gonzales n=ansible | PLAY [all] ****************************************************************************************************************************
2023-12-09 00:32:49,332 p=4961 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-09 00:32:50,085 p=4961 u=gonzales n=ansible | ok: [192.168.56.110]
2023-12-09 00:32:50,155 p=4961 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:32:50,161 p=4961 u=gonzales n=ansible | TASK [neutron : installing the components for neutron name=neutron-linuxbridge-agent] *************************************************
2023-12-09 00:32:50,210 p=4961 u=gonzales n=ansible | skipping: [192.168.56.110]
2023-12-09 00:32:51,119 p=4961 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:32:51,122 p=4961 u=gonzales n=ansible | TASK [neutron : configuring RabbitMQ message queue access dest=/etc/neutron/neutron.conf, content=[DEFAULT]
transport_url = rabbit://openstack:1234@controller
] ***
2023-12-09 00:32:52,102 p=4961 u=gonzales n=ansible | fatal: [192.168.56.110]: FAILED! => {"changed": false, "checksum": "35579e3e9f3c83d533cd93a41b046fcf5dacdcbe", "msg": "Destination directory /etc/neutron does not exist"}
2023-12-09 00:32:52,225 p=4961 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-4961fvshod5e/tmpix0gj3dt[0m
[0;32m[0m[0;36m@@ -1,2 +1,2 @@[0m
[0;36m[0m[0;31m-[oslo_currency][0m
[0;31m[0m[0;31m-lock_path = /var/lib/neutron/tmp[0m
[0;31m[0m[0;32m+[DEFAULT][0m
[0;32m[0m[0;32m+transport_url = rabbit://openstack:1234@controller[0m
[0;32m[0m

2023-12-09 00:32:52,225 p=4961 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:32:52,228 p=4961 u=gonzales n=ansible | TASK [neutron : configuring Identity service access (1) dest=/etc/neutron/neutron.conf, content=[DEFAULT]
auth_strategy = keystone

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:32:53,048 p=4961 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-4961fvshod5e/tmpgfixf090[0m
[0;32m[0m[0;36m@@ -1,2 +1,13 @@[0m
[0;36m[0m [DEFAULT]
[0;31m-transport_url = rabbit://openstack:1234@controller[0m
[0;31m[0m[0;32m+auth_strategy = keystone[0m
[0;32m[0m[0;32m+[0m
[0;32m[0m[0;32m+[keystone_authtoken][0m
[0;32m[0m[0;32m+www_authenticate_uri = http://controller:5000[0m
[0;32m[0m[0;32m+auth_url = http://controller:5000[0m
[0;32m[0m[0;32m+memcached_servers = controller:11211[0m
[0;32m[0m[0;32m+auth_type = password[0m
[0;32m[0m[0;32m+project_domain_name = default[0m
[0;32m[0m[0;32m+user_domain_name = default[0m
[0;32m[0m[0;32m+project_name = service[0m
[0;32m[0m[0;32m+username = neutron[0m
[0;32m[0m[0;32m+password = 1234[0m
[0;32m[0m

2023-12-09 00:32:53,049 p=4961 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:32:53,052 p=4961 u=gonzales n=ansible | TASK [neutron : configuring the lock path dest=/etc/neutron/neutron.conf, content=[oslo_currency]
lock_path = /var/lib/neutron/tmp
] ***
2023-12-09 00:32:53,890 p=4961 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-4961fvshod5e/tmprhqhqt86[0m
[0;32m[0m[0;36m@@ -1,13 +1,2 @@[0m
[0;36m[0m[0;31m-[DEFAULT][0m
[0;31m[0m[0;31m-auth_strategy = keystone[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[keystone_authtoken][0m
[0;31m[0m[0;31m-www_authenticate_uri = http://controller:5000[0m
[0;31m[0m[0;31m-auth_url = http://controller:5000[0m
[0;31m[0m[0;31m-memcached_servers = controller:11211[0m
[0;31m[0m[0;31m-auth_type = password[0m
[0;31m[0m[0;31m-project_domain_name = default[0m
[0;31m[0m[0;31m-user_domain_name = default[0m
[0;31m[0m[0;31m-project_name = service[0m
[0;31m[0m[0;31m-username = neutron[0m
[0;31m[0m[0;31m-password = 1234[0m
[0;31m[0m[0;32m+[oslo_currency][0m
[0;32m[0m[0;32m+lock_path = /var/lib/neutron/tmp[0m
[0;32m[0m

2023-12-09 00:32:53,891 p=4961 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:32:53,894 p=4961 u=gonzales n=ansible | TASK [neutron : configuring the access parameters dest=/etc/nova/nova.conf, content=[neutron]
auth_url = http://controller:5000
auth_type = password
project_domain_name = default
user_domain_name = default
region_name = RegionOne
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:32:54,377 p=4961 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:32:54,380 p=4961 u=gonzales n=ansible | TASK [neutron : restarting the compute service _raw_params=service nova-compute restart] **********************************************
2023-12-09 00:32:54,758 p=4961 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:32:54,761 p=4961 u=gonzales n=ansible | TASK [neutron : restarting the linux bridge agent _raw_params=service neutron-linuxbridge-agent restart] ******************************
2023-12-09 00:32:55,081 p=4961 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:32:55,085 p=4961 u=gonzales n=ansible | TASK [neutron : Installing neutron and its dependencies name=['openstack-neutron', 'openstack-neutron-ml2', 'openstack-neutron-linuxbridge', 'ebtables']] ***
2023-12-09 00:32:55,123 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,126 p=4961 u=gonzales n=ansible | TASK [neutron : Configuring metadata_agent.ini file src=metadata_agent.ini, dest=/etc/neutron/metadata_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:32:55,164 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,167 p=4961 u=gonzales n=ansible | TASK [neutron : Configuring nova.conf file src=nova.conf, dest=/etc/nova/nova.conf, owner=root, group=nova, mode=0640] ****************
2023-12-09 00:32:55,200 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,204 p=4961 u=gonzales n=ansible | TASK [neutron : Creating a link] ******************************************************************************************************
2023-12-09 00:32:55,243 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,247 p=4961 u=gonzales n=ansible | TASK [neutron : Populating the database] **********************************************************************************************
2023-12-09 00:32:55,279 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,282 p=4961 u=gonzales n=ansible | TASK [neutron : Restarting the nova-api service] **************************************************************************************
2023-12-09 00:32:55,316 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,320 p=4961 u=gonzales n=ansible | TASK [neutron : Starting and enabling the Networking services] ************************************************************************
2023-12-09 00:32:55,353 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,357 p=4961 u=gonzales n=ansible | TASK [neutron : Editing neutron.conf file src=neutron.conf, dest=/etc/neutron/neutron.conf, owner=root, group=neutron, mode=0640] *****
2023-12-09 00:32:55,396 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,400 p=4961 u=gonzales n=ansible | TASK [neutron : Editing ml2_conf.ini file src=ml2_conf.ini, dest=/etc/neutron/plugins/ml2/ml2_conf.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:32:55,447 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,450 p=4961 u=gonzales n=ansible | TASK [neutron : Editing linuxbridge_agent.ini file src=linuxbridge_agent.ini, dest=/etc/neutron/plugins/ml2/linuxbridge_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:32:55,480 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,484 p=4961 u=gonzales n=ansible | TASK [neutron : Editing dhcp_agent.ini file src=dhcp_agent.ini, dest=/etc/neutron/dhcp_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:32:55,515 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,523 p=4961 u=gonzales n=ansible | TASK [neutron : Creating neutron database name=neutron, state=present] ****************************************************************
2023-12-09 00:32:55,562 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,565 p=4961 u=gonzales n=ansible | TASK [neutron : Granting privileges on neutron database name=neutron, host={{ item }}, password=neutronpass, priv=neutron.*:ALL, state=present] ***
2023-12-09 00:32:55,611 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=localhost) 
2023-12-09 00:32:55,614 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=%) 
2023-12-09 00:32:55,617 p=4961 u=gonzales n=ansible | TASK [neutron : Sourcing the admin credentials executable=/bin/bash, _raw_params=source /home/cserver/admin-openrc] *******************
2023-12-09 00:32:55,655 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,659 p=4961 u=gonzales n=ansible | TASK [neutron : Creating neutron user command=openstack user create --domain default --password-prompt neutron, responses={'User Password': 'neutronpass', 'Repeat User Password': 'neutronpass'}] ***
2023-12-09 00:32:55,695 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,699 p=4961 u=gonzales n=ansible | TASK [neutron : Adding admin roles to the neutron user _raw_params=openstack role add --project service --user neutron admin] *********
2023-12-09 00:32:55,735 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,739 p=4961 u=gonzales n=ansible | TASK [neutron : Creating neutron service entity _raw_params=openstack service create --name neutron --description 'OpenStack Networking Service' network] ***
2023-12-09 00:32:55,778 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,782 p=4961 u=gonzales n=ansible | TASK [neutron : Creating the network service API endpoints _raw_params=openstack endpoint create --region RegionOne network public http://controller:9696
openstack endpoint create --region RegionOne network internal http://controller:9696
openstack endpoint create --region RegionOne network admin http://controller:9696
] ***
2023-12-09 00:32:55,815 p=4961 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:32:55,823 p=4961 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-09 00:32:55,823 p=4961 u=gonzales n=ansible | 192.168.56.108             : ok=8    changed=5    unreachable=0    failed=0    skipped=18   rescued=0    ignored=0   
2023-12-09 00:32:55,823 p=4961 u=gonzales n=ansible | 192.168.56.110             : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   
2023-12-09 00:33:33,536 p=5166 u=gonzales n=ansible | PLAY [all] ****************************************************************************************************************************
2023-12-09 00:33:33,545 p=5166 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-09 00:33:34,065 p=5166 u=gonzales n=ansible | ok: [192.168.56.110]
2023-12-09 00:33:34,143 p=5166 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:33:34,148 p=5166 u=gonzales n=ansible | TASK [neutron : installing the components for neutron name=neutron-linuxbridge-agent] *************************************************
2023-12-09 00:33:34,198 p=5166 u=gonzales n=ansible | skipping: [192.168.56.110]
2023-12-09 00:33:35,078 p=5166 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:33:35,082 p=5166 u=gonzales n=ansible | TASK [neutron : configuring Identity service access (1) dest=/etc/neutron/neutron.conf, content=[DEFAULT]
auth_strategy = keystone

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:33:36,088 p=5166 u=gonzales n=ansible | fatal: [192.168.56.110]: FAILED! => {"changed": false, "checksum": "76b597e22279d095304c14fd83fc540829268ac8", "msg": "Destination directory /etc/neutron does not exist"}
2023-12-09 00:33:36,198 p=5166 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-5166o3760d7o/tmpl4ds0m9s[0m
[0;32m[0m[0;36m@@ -1,2 +1,13 @@[0m
[0;36m[0m[0;31m-[oslo_currency][0m
[0;31m[0m[0;31m-lock_path = /var/lib/neutron/tmp[0m
[0;31m[0m[0;32m+[DEFAULT][0m
[0;32m[0m[0;32m+auth_strategy = keystone[0m
[0;32m[0m[0;32m+[0m
[0;32m[0m[0;32m+[keystone_authtoken][0m
[0;32m[0m[0;32m+www_authenticate_uri = http://controller:5000[0m
[0;32m[0m[0;32m+auth_url = http://controller:5000[0m
[0;32m[0m[0;32m+memcached_servers = controller:11211[0m
[0;32m[0m[0;32m+auth_type = password[0m
[0;32m[0m[0;32m+project_domain_name = default[0m
[0;32m[0m[0;32m+user_domain_name = default[0m
[0;32m[0m[0;32m+project_name = service[0m
[0;32m[0m[0;32m+username = neutron[0m
[0;32m[0m[0;32m+password = 1234[0m
[0;32m[0m

2023-12-09 00:33:36,198 p=5166 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:33:36,201 p=5166 u=gonzales n=ansible | TASK [neutron : configuring the lock path dest=/etc/neutron/neutron.conf, content=[oslo_currency]
lock_path = /var/lib/neutron/tmp
] ***
2023-12-09 00:33:37,051 p=5166 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-5166o3760d7o/tmpw19zfm11[0m
[0;32m[0m[0;36m@@ -1,13 +1,2 @@[0m
[0;36m[0m[0;31m-[DEFAULT][0m
[0;31m[0m[0;31m-auth_strategy = keystone[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[keystone_authtoken][0m
[0;31m[0m[0;31m-www_authenticate_uri = http://controller:5000[0m
[0;31m[0m[0;31m-auth_url = http://controller:5000[0m
[0;31m[0m[0;31m-memcached_servers = controller:11211[0m
[0;31m[0m[0;31m-auth_type = password[0m
[0;31m[0m[0;31m-project_domain_name = default[0m
[0;31m[0m[0;31m-user_domain_name = default[0m
[0;31m[0m[0;31m-project_name = service[0m
[0;31m[0m[0;31m-username = neutron[0m
[0;31m[0m[0;31m-password = 1234[0m
[0;31m[0m[0;32m+[oslo_currency][0m
[0;32m[0m[0;32m+lock_path = /var/lib/neutron/tmp[0m
[0;32m[0m

2023-12-09 00:33:37,051 p=5166 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:33:37,054 p=5166 u=gonzales n=ansible | TASK [neutron : configuring the access parameters dest=/etc/nova/nova.conf, content=[neutron]
auth_url = http://controller:5000
auth_type = password
project_domain_name = default
user_domain_name = default
region_name = RegionOne
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:33:37,522 p=5166 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:33:37,525 p=5166 u=gonzales n=ansible | TASK [neutron : restarting the compute service _raw_params=service nova-compute restart] **********************************************
2023-12-09 00:33:37,885 p=5166 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:33:37,888 p=5166 u=gonzales n=ansible | TASK [neutron : restarting the linux bridge agent _raw_params=service neutron-linuxbridge-agent restart] ******************************
2023-12-09 00:33:38,219 p=5166 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:33:38,222 p=5166 u=gonzales n=ansible | TASK [neutron : Installing neutron and its dependencies name=['openstack-neutron', 'openstack-neutron-ml2', 'openstack-neutron-linuxbridge', 'ebtables']] ***
2023-12-09 00:33:38,252 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,255 p=5166 u=gonzales n=ansible | TASK [neutron : Configuring metadata_agent.ini file src=metadata_agent.ini, dest=/etc/neutron/metadata_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:33:38,287 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,291 p=5166 u=gonzales n=ansible | TASK [neutron : Configuring nova.conf file src=nova.conf, dest=/etc/nova/nova.conf, owner=root, group=nova, mode=0640] ****************
2023-12-09 00:33:38,323 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,326 p=5166 u=gonzales n=ansible | TASK [neutron : Creating a link] ******************************************************************************************************
2023-12-09 00:33:38,364 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,367 p=5166 u=gonzales n=ansible | TASK [neutron : Populating the database] **********************************************************************************************
2023-12-09 00:33:38,408 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,413 p=5166 u=gonzales n=ansible | TASK [neutron : Restarting the nova-api service] **************************************************************************************
2023-12-09 00:33:38,443 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,447 p=5166 u=gonzales n=ansible | TASK [neutron : Starting and enabling the Networking services] ************************************************************************
2023-12-09 00:33:38,482 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,485 p=5166 u=gonzales n=ansible | TASK [neutron : Editing neutron.conf file src=neutron.conf, dest=/etc/neutron/neutron.conf, owner=root, group=neutron, mode=0640] *****
2023-12-09 00:33:38,526 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,530 p=5166 u=gonzales n=ansible | TASK [neutron : Editing ml2_conf.ini file src=ml2_conf.ini, dest=/etc/neutron/plugins/ml2/ml2_conf.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:33:38,562 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,566 p=5166 u=gonzales n=ansible | TASK [neutron : Editing linuxbridge_agent.ini file src=linuxbridge_agent.ini, dest=/etc/neutron/plugins/ml2/linuxbridge_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:33:38,598 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,602 p=5166 u=gonzales n=ansible | TASK [neutron : Editing dhcp_agent.ini file src=dhcp_agent.ini, dest=/etc/neutron/dhcp_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:33:38,635 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,639 p=5166 u=gonzales n=ansible | TASK [neutron : Creating neutron database name=neutron, state=present] ****************************************************************
2023-12-09 00:33:38,675 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,679 p=5166 u=gonzales n=ansible | TASK [neutron : Granting privileges on neutron database name=neutron, host={{ item }}, password=neutronpass, priv=neutron.*:ALL, state=present] ***
2023-12-09 00:33:38,716 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=localhost) 
2023-12-09 00:33:38,716 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=%) 
2023-12-09 00:33:38,720 p=5166 u=gonzales n=ansible | TASK [neutron : Sourcing the admin credentials executable=/bin/bash, _raw_params=source /home/cserver/admin-openrc] *******************
2023-12-09 00:33:38,753 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,757 p=5166 u=gonzales n=ansible | TASK [neutron : Creating neutron user command=openstack user create --domain default --password-prompt neutron, responses={'User Password': 'neutronpass', 'Repeat User Password': 'neutronpass'}] ***
2023-12-09 00:33:38,791 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,797 p=5166 u=gonzales n=ansible | TASK [neutron : Adding admin roles to the neutron user _raw_params=openstack role add --project service --user neutron admin] *********
2023-12-09 00:33:38,834 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,838 p=5166 u=gonzales n=ansible | TASK [neutron : Creating neutron service entity _raw_params=openstack service create --name neutron --description 'OpenStack Networking Service' network] ***
2023-12-09 00:33:38,879 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,882 p=5166 u=gonzales n=ansible | TASK [neutron : Creating the network service API endpoints _raw_params=openstack endpoint create --region RegionOne network public http://controller:9696
openstack endpoint create --region RegionOne network internal http://controller:9696
openstack endpoint create --region RegionOne network admin http://controller:9696
] ***
2023-12-09 00:33:38,918 p=5166 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:33:38,925 p=5166 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-09 00:33:38,925 p=5166 u=gonzales n=ansible | 192.168.56.108             : ok=7    changed=4    unreachable=0    failed=0    skipped=18   rescued=0    ignored=0   
2023-12-09 00:33:38,925 p=5166 u=gonzales n=ansible | 192.168.56.110             : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   
2023-12-09 00:34:58,765 p=5342 u=gonzales n=ansible | PLAY [all] ****************************************************************************************************************************
2023-12-09 00:34:58,774 p=5342 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-09 00:34:59,588 p=5342 u=gonzales n=ansible | ok: [192.168.56.110]
2023-12-09 00:34:59,720 p=5342 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:34:59,726 p=5342 u=gonzales n=ansible | TASK [neutron : installing the components for neutron name=neutron-linuxbridge-agent] *************************************************
2023-12-09 00:34:59,783 p=5342 u=gonzales n=ansible | skipping: [192.168.56.110]
2023-12-09 00:35:00,824 p=5342 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:35:00,828 p=5342 u=gonzales n=ansible | TASK [neutron : configuring Identity service access (1) dest=/home/gonzales/.ansible/tmp/ansible-local-5166o3760d7o/tmpl4ds0m9s, content=[DEFAULT]
auth_strategy = keystone

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:35:01,789 p=5342 u=gonzales n=ansible | fatal: [192.168.56.110]: FAILED! => {"changed": false, "checksum": "76b597e22279d095304c14fd83fc540829268ac8", "msg": "Destination directory /home/gonzales/.ansible/tmp/ansible-local-5166o3760d7o does not exist"}
2023-12-09 00:35:01,900 p=5342 u=gonzales n=ansible | fatal: [192.168.56.108]: FAILED! => {"changed": false, "checksum": "76b597e22279d095304c14fd83fc540829268ac8", "msg": "Destination directory /home/gonzales/.ansible/tmp/ansible-local-5166o3760d7o does not exist"}
2023-12-09 00:35:01,901 p=5342 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-09 00:35:01,901 p=5342 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2023-12-09 00:35:01,901 p=5342 u=gonzales n=ansible | 192.168.56.110             : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   
2023-12-09 00:36:29,421 p=5428 u=gonzales n=ansible | PLAY [all] ****************************************************************************************************************************
2023-12-09 00:36:29,429 p=5428 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] *********************************************
2023-12-09 00:36:30,167 p=5428 u=gonzales n=ansible | ok: [192.168.56.110]
2023-12-09 00:36:30,233 p=5428 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:36:30,238 p=5428 u=gonzales n=ansible | TASK [neutron : installing the components for neutron name=neutron-linuxbridge-agent] *************************************************
2023-12-09 00:36:30,292 p=5428 u=gonzales n=ansible | skipping: [192.168.56.110]
2023-12-09 00:36:31,167 p=5428 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:36:31,171 p=5428 u=gonzales n=ansible | TASK [neutron : configuring RabbitMQ message queue access dest=/etc/neutron/neutron.conf, content=[DEFAULT]
transport_url = rabbit://openstack:1234@controller
] ***
2023-12-09 00:36:32,186 p=5428 u=gonzales n=ansible | fatal: [192.168.56.110]: FAILED! => {"changed": false, "checksum": "35579e3e9f3c83d533cd93a41b046fcf5dacdcbe", "msg": "Destination directory /etc/neutron does not exist"}
2023-12-09 00:36:32,298 p=5428 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-54281xjczljz/tmpywey1a0q[0m
[0;32m[0m[0;36m@@ -1,2 +1,2 @@[0m
[0;36m[0m[0;31m-[oslo_currency][0m
[0;31m[0m[0;31m-lock_path = /var/lib/neutron/tmp[0m
[0;31m[0m[0;32m+[DEFAULT][0m
[0;32m[0m[0;32m+transport_url = rabbit://openstack:1234@controller[0m
[0;32m[0m

2023-12-09 00:36:32,298 p=5428 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:36:32,301 p=5428 u=gonzales n=ansible | TASK [neutron : configuring Identity service access (1) dest=/etc/neutron/neutron.conf, content=[DEFAULT]
auth_strategy = keystone

[keystone_authtoken]
www_authenticate_uri = http://controller:5000
auth_url = http://controller:5000
memcached_servers = controller:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:36:33,152 p=5428 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-54281xjczljz/tmp4j5na_zb[0m
[0;32m[0m[0;36m@@ -1,2 +1,13 @@[0m
[0;36m[0m [DEFAULT]
[0;31m-transport_url = rabbit://openstack:1234@controller[0m
[0;31m[0m[0;32m+auth_strategy = keystone[0m
[0;32m[0m[0;32m+[0m
[0;32m[0m[0;32m+[keystone_authtoken][0m
[0;32m[0m[0;32m+www_authenticate_uri = http://controller:5000[0m
[0;32m[0m[0;32m+auth_url = http://controller:5000[0m
[0;32m[0m[0;32m+memcached_servers = controller:11211[0m
[0;32m[0m[0;32m+auth_type = password[0m
[0;32m[0m[0;32m+project_domain_name = default[0m
[0;32m[0m[0;32m+user_domain_name = default[0m
[0;32m[0m[0;32m+project_name = service[0m
[0;32m[0m[0;32m+username = neutron[0m
[0;32m[0m[0;32m+password = 1234[0m
[0;32m[0m

2023-12-09 00:36:33,152 p=5428 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:36:33,155 p=5428 u=gonzales n=ansible | TASK [neutron : configuring the lock path dest=/etc/neutron/neutron.conf, content=[oslo_currency]
lock_path = /var/lib/neutron/tmp
] ***
2023-12-09 00:36:33,961 p=5428 u=gonzales n=ansible | [0;31m--- before: /etc/neutron/neutron.conf[0m
[0;31m[0m[0;32m+++ after: /home/gonzales/.ansible/tmp/ansible-local-54281xjczljz/tmpw06g88ui[0m
[0;32m[0m[0;36m@@ -1,13 +1,2 @@[0m
[0;36m[0m[0;31m-[DEFAULT][0m
[0;31m[0m[0;31m-auth_strategy = keystone[0m
[0;31m[0m[0;31m-[0m
[0;31m[0m[0;31m-[keystone_authtoken][0m
[0;31m[0m[0;31m-www_authenticate_uri = http://controller:5000[0m
[0;31m[0m[0;31m-auth_url = http://controller:5000[0m
[0;31m[0m[0;31m-memcached_servers = controller:11211[0m
[0;31m[0m[0;31m-auth_type = password[0m
[0;31m[0m[0;31m-project_domain_name = default[0m
[0;31m[0m[0;31m-user_domain_name = default[0m
[0;31m[0m[0;31m-project_name = service[0m
[0;31m[0m[0;31m-username = neutron[0m
[0;31m[0m[0;31m-password = 1234[0m
[0;31m[0m[0;32m+[oslo_currency][0m
[0;32m[0m[0;32m+lock_path = /var/lib/neutron/tmp[0m
[0;32m[0m

2023-12-09 00:36:33,962 p=5428 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:36:33,965 p=5428 u=gonzales n=ansible | TASK [neutron : configuring the access parameters dest=/etc/nova/nova.conf, content=[neutron]
auth_url = http://controller:5000
auth_type = password
project_domain_name = default
user_domain_name = default
region_name = RegionOne
project_name = service
username = neutron
password = 1234
] ***
2023-12-09 00:36:34,409 p=5428 u=gonzales n=ansible | ok: [192.168.56.108]
2023-12-09 00:36:34,412 p=5428 u=gonzales n=ansible | TASK [neutron : restarting the compute service _raw_params=service nova-compute restart] **********************************************
2023-12-09 00:36:34,823 p=5428 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:36:34,826 p=5428 u=gonzales n=ansible | TASK [neutron : restarting the linux bridge agent _raw_params=service neutron-linuxbridge-agent restart] ******************************
2023-12-09 00:36:35,149 p=5428 u=gonzales n=ansible | changed: [192.168.56.108]
2023-12-09 00:36:35,155 p=5428 u=gonzales n=ansible | TASK [neutron : Installing neutron and its dependencies name=['openstack-neutron', 'openstack-neutron-ml2', 'openstack-neutron-linuxbridge', 'ebtables']] ***
2023-12-09 00:36:35,190 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,194 p=5428 u=gonzales n=ansible | TASK [neutron : Configuring metadata_agent.ini file src=metadata_agent.ini, dest=/etc/neutron/metadata_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:36:35,226 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,229 p=5428 u=gonzales n=ansible | TASK [neutron : Configuring nova.conf file src=nova.conf, dest=/etc/nova/nova.conf, owner=root, group=nova, mode=0640] ****************
2023-12-09 00:36:35,263 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,268 p=5428 u=gonzales n=ansible | TASK [neutron : Creating a link] ******************************************************************************************************
2023-12-09 00:36:35,305 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,308 p=5428 u=gonzales n=ansible | TASK [neutron : Populating the database] **********************************************************************************************
2023-12-09 00:36:35,347 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,350 p=5428 u=gonzales n=ansible | TASK [neutron : Restarting the nova-api service] **************************************************************************************
2023-12-09 00:36:35,385 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,389 p=5428 u=gonzales n=ansible | TASK [neutron : Starting and enabling the Networking services] ************************************************************************
2023-12-09 00:36:35,423 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,427 p=5428 u=gonzales n=ansible | TASK [neutron : Editing neutron.conf file src=neutron.conf, dest=/etc/neutron/neutron.conf, owner=root, group=neutron, mode=0640] *****
2023-12-09 00:36:35,462 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,465 p=5428 u=gonzales n=ansible | TASK [neutron : Editing ml2_conf.ini file src=ml2_conf.ini, dest=/etc/neutron/plugins/ml2/ml2_conf.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:36:35,502 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,506 p=5428 u=gonzales n=ansible | TASK [neutron : Editing linuxbridge_agent.ini file src=linuxbridge_agent.ini, dest=/etc/neutron/plugins/ml2/linuxbridge_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:36:35,545 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,548 p=5428 u=gonzales n=ansible | TASK [neutron : Editing dhcp_agent.ini file src=dhcp_agent.ini, dest=/etc/neutron/dhcp_agent.ini, owner=root, group=neutron, mode=0640] ***
2023-12-09 00:36:35,581 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,586 p=5428 u=gonzales n=ansible | TASK [neutron : Creating neutron database name=neutron, state=present] ****************************************************************
2023-12-09 00:36:35,628 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,631 p=5428 u=gonzales n=ansible | TASK [neutron : Granting privileges on neutron database name=neutron, host={{ item }}, password=neutronpass, priv=neutron.*:ALL, state=present] ***
2023-12-09 00:36:35,672 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=localhost) 
2023-12-09 00:36:35,677 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108] => (item=%) 
2023-12-09 00:36:35,685 p=5428 u=gonzales n=ansible | TASK [neutron : Sourcing the admin credentials executable=/bin/bash, _raw_params=source /home/cserver/admin-openrc] *******************
2023-12-09 00:36:35,726 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,730 p=5428 u=gonzales n=ansible | TASK [neutron : Creating neutron user command=openstack user create --domain default --password-prompt neutron, responses={'User Password': 'neutronpass', 'Repeat User Password': 'neutronpass'}] ***
2023-12-09 00:36:35,761 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,765 p=5428 u=gonzales n=ansible | TASK [neutron : Adding admin roles to the neutron user _raw_params=openstack role add --project service --user neutron admin] *********
2023-12-09 00:36:35,796 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,799 p=5428 u=gonzales n=ansible | TASK [neutron : Creating neutron service entity _raw_params=openstack service create --name neutron --description 'OpenStack Networking Service' network] ***
2023-12-09 00:36:35,831 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,834 p=5428 u=gonzales n=ansible | TASK [neutron : Creating the network service API endpoints _raw_params=openstack endpoint create --region RegionOne network public http://controller:9696
openstack endpoint create --region RegionOne network internal http://controller:9696
openstack endpoint create --region RegionOne network admin http://controller:9696
] ***
2023-12-09 00:36:35,870 p=5428 u=gonzales n=ansible | skipping: [192.168.56.108]
2023-12-09 00:36:35,878 p=5428 u=gonzales n=ansible | PLAY RECAP ****************************************************************************************************************************
2023-12-09 00:36:35,878 p=5428 u=gonzales n=ansible | 192.168.56.108             : ok=8    changed=5    unreachable=0    failed=0    skipped=18   rescued=0    ignored=0   
2023-12-09 00:36:35,879 p=5428 u=gonzales n=ansible | 192.168.56.110             : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   
2024-03-07 00:04:05,588 p=3568 u=gonzales n=ansible | [WARNING]: Could not match supplied host pattern, ignoring: controlnode

2024-03-07 00:04:05,588 p=3568 u=gonzales n=ansible | PLAY [Collect log files] *******************************************************
2024-03-07 00:04:05,589 p=3568 u=gonzales n=ansible | skipping: no hosts matched
2024-03-07 00:04:05,589 p=3568 u=gonzales n=ansible | PLAY RECAP *********************************************************************
2024-03-07 00:09:49,219 p=3620 u=gonzales n=ansible | [WARNING]: Could not match supplied host pattern, ignoring: controlnode

2024-03-07 00:09:49,220 p=3620 u=gonzales n=ansible | PLAY [Collect log files] *******************************************************
2024-03-07 00:09:49,220 p=3620 u=gonzales n=ansible | skipping: no hosts matched
2024-03-07 00:09:49,220 p=3620 u=gonzales n=ansible | PLAY RECAP *********************************************************************
2024-03-07 00:11:49,762 p=3748 u=gonzales n=ansible | PLAY [Collect log files] *******************************************************
2024-03-07 00:11:49,777 p=3748 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2024-03-07 00:11:49,878 p=3748 u=gonzales n=ansible | fatal: [192.168.56.108]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Load key \"/home/gonzales/.ssh\": Is a directory\r\ngonzales@192.168.56.108: Permission denied (publickey,password).", "unreachable": true}
2024-03-07 00:11:49,879 p=3748 u=gonzales n=ansible | PLAY RECAP *********************************************************************
2024-03-07 00:11:49,879 p=3748 u=gonzales n=ansible | 192.168.56.108             : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
2024-03-07 00:17:24,424 p=3837 u=gonzales n=ansible | PLAY [Collect log files] *******************************************************
2024-03-07 00:17:24,430 p=3837 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2024-03-07 00:17:25,228 p=3837 u=gonzales n=ansible | ok: [192.168.56.108]
2024-03-07 00:17:25,233 p=3837 u=gonzales n=ansible | TASK [Create directory for logs path=/home/manage/logs/, state=directory] ******
2024-03-07 00:17:25,541 p=3837 u=gonzales n=ansible | [0;31m--- before[0m
[0;31m[0m[0;32m+++ after[0m
[0;32m[0m[0;36m@@ -1,4 +1,4 @@[0m
[0;36m[0m {
     "path": "/home/manage/logs/",
[0;31m-    "state": "absent"[0m
[0;31m[0m[0;32m+    "state": "directory"[0m
[0;32m[0m }


2024-03-07 00:17:25,541 p=3837 u=gonzales n=ansible | changed: [192.168.56.108]
2024-03-07 00:17:25,546 p=3837 u=gonzales n=ansible | TASK [Fetch log files src=/var/log/{{ item }}, dest=/tmp/logs/syslog/, flat=True] ***
2024-03-07 00:17:25,873 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=alternatives.log)
2024-03-07 00:17:26,092 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=auth.log)
2024-03-07 00:17:26,312 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=bootstrap.log)
2024-03-07 00:17:26,525 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=btmp)
2024-03-07 00:17:26,737 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=dpkg.log)
2024-03-07 00:17:27,052 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=faillog)
2024-03-07 00:17:27,268 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=fontconfig.log)
2024-03-07 00:17:27,484 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=gpu-manager.log)
2024-03-07 00:17:27,709 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=kern.log)
2024-03-07 00:17:29,721 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=lastlog)
2024-03-07 00:17:29,956 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=syslog)
2024-03-07 00:17:30,236 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=syslog.1)
2024-03-07 00:17:30,460 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=ubuntu-advantage.log)
2024-03-07 00:17:30,677 p=3837 u=gonzales n=ansible | failed: [192.168.56.108] (item=ubuntu-advantage-timer.log) => {"ansible_loop_var": "item", "changed": false, "item": "ubuntu-advantage-timer.log", "msg": "file not found: /var/log/ubuntu-advantage-timer.log"}
2024-03-07 00:17:30,920 p=3837 u=gonzales n=ansible | changed: [192.168.56.108] => (item=wtmp)
2024-03-07 00:17:30,921 p=3837 u=gonzales n=ansible | PLAY RECAP *********************************************************************
2024-03-07 00:17:30,921 p=3837 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=1    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2024-03-07 00:19:34,989 p=3981 u=gonzales n=ansible | PLAY [Collect log files] *******************************************************
2024-03-07 00:19:34,996 p=3981 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2024-03-07 00:19:35,727 p=3981 u=gonzales n=ansible | ok: [192.168.56.108]
2024-03-07 00:19:35,732 p=3981 u=gonzales n=ansible | TASK [Create directory for logs path=/home/manage/logs/, state=directory] ******
2024-03-07 00:19:36,063 p=3981 u=gonzales n=ansible | ok: [192.168.56.108]
2024-03-07 00:19:36,066 p=3981 u=gonzales n=ansible | TASK [Fetch log files src=/var/log/{{ item }}, dest=/tmp/logs/syslog/, flat=True] ***
2024-03-07 00:19:36,386 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=alternatives.log)
2024-03-07 00:19:36,603 p=3981 u=gonzales n=ansible | changed: [192.168.56.108] => (item=auth.log)
2024-03-07 00:19:36,822 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=bootstrap.log)
2024-03-07 00:19:37,036 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=btmp)
2024-03-07 00:19:37,257 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=dpkg.log)
2024-03-07 00:19:37,598 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=faillog)
2024-03-07 00:19:37,817 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=fontconfig.log)
2024-03-07 00:19:38,031 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=gpu-manager.log)
2024-03-07 00:19:38,246 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=kern.log)
2024-03-07 00:19:39,979 p=3981 u=gonzales n=ansible | changed: [192.168.56.108] => (item=lastlog)
2024-03-07 00:19:40,219 p=3981 u=gonzales n=ansible | changed: [192.168.56.108] => (item=syslog)
2024-03-07 00:19:40,512 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=syslog.1)
2024-03-07 00:19:40,722 p=3981 u=gonzales n=ansible | ok: [192.168.56.108] => (item=ubuntu-advantage.log)
2024-03-07 00:19:40,951 p=3981 u=gonzales n=ansible | failed: [192.168.56.108] (item=ubuntu-advantage-timer.log) => {"ansible_loop_var": "item", "changed": false, "item": "ubuntu-advantage-timer.log", "msg": "file not found: /var/log/ubuntu-advantage-timer.log"}
2024-03-07 00:19:41,202 p=3981 u=gonzales n=ansible | changed: [192.168.56.108] => (item=wtmp)
2024-03-07 00:19:41,203 p=3981 u=gonzales n=ansible | PLAY RECAP *********************************************************************
2024-03-07 00:19:41,203 p=3981 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2024-03-07 00:20:12,046 p=4117 u=gonzales n=ansible | PLAY [Collect log files] *******************************************************
2024-03-07 00:20:12,052 p=4117 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2024-03-07 00:20:12,605 p=4117 u=gonzales n=ansible | ok: [192.168.56.108]
2024-03-07 00:20:12,609 p=4117 u=gonzales n=ansible | TASK [Create directory for logs path=/home/manage/logs/, state=directory] ******
2024-03-07 00:20:12,922 p=4117 u=gonzales n=ansible | ok: [192.168.56.108]
2024-03-07 00:20:12,926 p=4117 u=gonzales n=ansible | TASK [Fetch log files src=/var/log/{{ item }}, dest=/tmp/logs/syslog/, flat=True] ***
2024-03-07 00:20:13,246 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=alternatives.log)
2024-03-07 00:20:13,464 p=4117 u=gonzales n=ansible | changed: [192.168.56.108] => (item=auth.log)
2024-03-07 00:20:13,688 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=bootstrap.log)
2024-03-07 00:20:13,908 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=btmp)
2024-03-07 00:20:14,119 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=dpkg.log)
2024-03-07 00:20:14,424 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=faillog)
2024-03-07 00:20:14,639 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=fontconfig.log)
2024-03-07 00:20:14,849 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=gpu-manager.log)
2024-03-07 00:20:15,068 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=kern.log)
2024-03-07 00:20:17,270 p=4117 u=gonzales n=ansible | changed: [192.168.56.108] => (item=lastlog)
2024-03-07 00:20:17,515 p=4117 u=gonzales n=ansible | changed: [192.168.56.108] => (item=syslog)
2024-03-07 00:20:17,796 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=syslog.1)
2024-03-07 00:20:18,018 p=4117 u=gonzales n=ansible | ok: [192.168.56.108] => (item=ubuntu-advantage.log)
2024-03-07 00:20:18,238 p=4117 u=gonzales n=ansible | failed: [192.168.56.108] (item=ubuntu-advantage-timer.log) => {"ansible_loop_var": "item", "changed": false, "item": "ubuntu-advantage-timer.log", "msg": "file not found: /var/log/ubuntu-advantage-timer.log"}
2024-03-07 00:20:18,485 p=4117 u=gonzales n=ansible | changed: [192.168.56.108] => (item=wtmp)
2024-03-07 00:20:18,486 p=4117 u=gonzales n=ansible | PLAY RECAP *********************************************************************
2024-03-07 00:20:18,486 p=4117 u=gonzales n=ansible | 192.168.56.108             : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
2024-03-07 00:21:04,233 p=4251 u=gonzales n=ansible | PLAY [Collect log files] *******************************************************
2024-03-07 00:21:04,239 p=4251 u=gonzales n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2024-03-07 00:21:04,792 p=4251 u=gonzales n=ansible | ok: [192.168.56.108]
2024-03-07 00:21:04,797 p=4251 u=gonzales n=ansible | TASK [Create directory for logs path=/home/manage/logs/, state=directory] ******
2024-03-07 00:21:05,109 p=4251 u=gonzales n=ansible | ok: [192.168.56.108]
2024-03-07 00:21:05,112 p=4251 u=gonzales n=ansible | TASK [Fetch log files src=/var/log/{{ item }}, dest=/tmp/logs/syslog/, flat=True] ***
2024-03-07 00:21:05,433 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=alternatives.log)
2024-03-07 00:21:05,651 p=4251 u=gonzales n=ansible | changed: [192.168.56.108] => (item=auth.log)
2024-03-07 00:21:05,879 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=bootstrap.log)
2024-03-07 00:21:06,107 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=btmp)
2024-03-07 00:21:06,322 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=dpkg.log)
2024-03-07 00:21:06,633 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=faillog)
2024-03-07 00:21:06,839 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=fontconfig.log)
2024-03-07 00:21:07,054 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=gpu-manager.log)
2024-03-07 00:21:07,289 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=kern.log)
2024-03-07 00:21:09,321 p=4251 u=gonzales n=ansible | changed: [192.168.56.108] => (item=lastlog)
2024-03-07 00:21:09,557 p=4251 u=gonzales n=ansible | changed: [192.168.56.108] => (item=syslog)
2024-03-07 00:21:09,851 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=syslog.1)
2024-03-07 00:21:10,066 p=4251 u=gonzales n=ansible | ok: [192.168.56.108] => (item=ubuntu-advantage.log)
2024-03-07 00:21:10,299 p=4251 u=gonzales n=ansible | changed: [192.168.56.108] => (item=wtmp)
2024-03-07 00:21:10,304 p=4251 u=gonzales n=ansible | PLAY RECAP *********************************************************************
2024-03-07 00:21:10,304 p=4251 u=gonzales n=ansible | 192.168.56.108             : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

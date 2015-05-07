selfsign
=========
[![Build Status](https://travis-ci.org/gotansible/selfsign.svg)](https://travis-ci.org/gotansible/selfsign)
[![Ansible Galaxy](http://img.shields.io/badge/galaxy-selfsign-blue.svg?style=flat)](https://galaxy.ansible.com/list#/roles/3588)

Easy self signed certificates. Generates a new CA setup including CA cert, key, serial etc.  Then generates new certs signed by this CA.

Requirements
------------

* openssl - Assumes a recent version of openssl is installed.

Role Variables
--------------

```yml
   # the root folder where all files are generated
   selfsign_folder: /etc/pki/selfsign

   # self sign certs internal to a datacenter often don't have DNS to verify the commonName
   # of the server host, so the server's IP address(es) is/are added as an extension
   selfsign_server_ips: 
     - 192.168.50.9

	# multiple resolvable hostnames for the same server
   selfsign_server_dnsnames:
     - server.example.com 
	 - alias.example.com

   # the file name of your new cert, if you don't change this, each subsequent run
   # will NOT overwrite the last run unless selfsign_overwrite is set to true
   # 3 files will be created with this name:
   # * private/selfSignNew.key
   # * certs/selfSignNew.crt
   selfsign_next_cert_name: selfSignNew

   # your information that will be embedded in the subject of the new certificate
   selfsign_countryName: US
   selfsign_stateOrProvinceName: California
   selfsign_localityName: Santa Monica
   selfsign_organizationName: Example Company
   selfsign_commonName: example.com

   # email is optional
   selfsign_emailAddress: admin@example.com

   # if the key and or cert already exists setting this to true will cause them to get overwritten
   # USE WITH CAUTION
   selfsign_overwrite: false

```

Dependencies
------------

None, although, we could add one to an openssl package.  However, at this point, it may
be more secure to require consumers to thoughtfully pick their openssl implementation to use and typically openssl is already install on most modern *nix systems.:w

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: gotansible.selfsign
		   selfsign_server_ips: 
		     - 10.0.3.35
		   selfsign_commonName: mycooldomain.com 
		   selfsign_next_cert_name: myGroovyCertName
		   selfsign_organizationName: Gooogahooo, Inc.


License
-------

MIT

Author Information
------------------

Created by Franklin Wise in Santa Monica, CA.


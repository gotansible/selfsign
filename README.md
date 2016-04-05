sslcert
=========
[![Build Status](https://travis-ci.org/gotansible/sslcert.svg)](https://travis-ci.org/gotansible/sslcert)
[![Ansible Galaxy](http://img.shields.io/badge/galaxy-sslcert-blue.svg?style=flat)](https://galaxy.ansible.com/list#/roles/3588)

Easy CSR, Private Key, and self-signed SSL Certificate generation.

If you just want the CSR and the Private Key, just ignore the selfsigned cert that's generated and submit the CSR to whatever CA will generate your cert.

Generates a new CA setup including CA cert, key, serial etc.  Then generates new certs signed by this CA.

Requirements
------------

* openssl - Assumes a recent version of openssl is installed.

Role Variables
--------------

```yml
   # the root folder where all files are generated
   sslcert_folder: /etc/pki/selfsign

   # self sign certs internal to a datacenter often don't have DNS to verify the commonName
   # of the server host, so the server's IP address(es) is/are added as an extension
   sslcert_server_ips: 
     - 192.168.50.9

	# multiple resolvable hostnames for the same server
   sslcert_server_dnsnames:
     - server.example.com 
	 - alias.example.com

   # the file name of your new cert, if you don't change this, each subsequent run
   # will NOT overwrite the last run unless sslcert_overwrite is set to true
   # 3 files will be created with this name:
   # * private/selfSignNew.key
   # * certs/selfSignNew.crt
   sslcert_next_cert_name: selfSignNew

   # your information that will be embedded in the subject of the new certificate
   sslcert_countryName: US
   sslcert_stateOrProvinceName: California
   sslcert_localityName: Santa Monica
   sslcert_organizationName: Example Company
   sslcert_commonName: example.com
   sslcert_emailAddress: admin@example.com

   # if the key and or cert already exists setting this to true will cause them to get overwritten
   # USE WITH CAUTION
   sslcert_overwrite: false

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
         - role: gotansible.sslcert
		   sslcert_server_ips: 
		     - 10.0.3.35
		   sslcert_commonName: mycooldomain.com 
		   sslcert_next_cert_name: myGroovyCertName
		   sslcert_organizationName: Gooogahooo, Inc.
		   sslcert_emailAddress: admin@mycooldomain.com

License
-------

MIT

Author Information
------------------

Created by Franklin Wise in Santa Monica, CA.


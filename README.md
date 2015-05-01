Role Name - selfsign
=========

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
   # of the server host, so the server's IP address is added as an extension
   selfsign_server_ip: 192.168.50.9

   # the file name of your new cert, if you don't change this, each subsequent run
   # will overwrite the last run
   selfsign_next_cert_name: selfSignNew

   # your information that will be embedded in the subject of the new certificate
   selfsign_countryName: US
   selfsign_stateOrProvinceName: California
   selfsign_localityName: Santa Monica
   selfsign_organizationName: Example Company
   selfsign_commonName: example.com
   # email is optional
   selfsign_emailAddress: admin@example.com

``

Dependencies
------------

None, although, we could add one to an openssl package.  However, at this point, it may
be more secure to require consumers to thoughtfully pick their openssl implementation to use and typically openssl is already install on most modern *nix

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: gotansible.selfsign, selfsign_server_ip: "10.0.3.35", selfsign_commonName: mycooldomain.com }

License
-------

MIT

Author Information
------------------

Created by Franklin Wise in Santa Monica, CA.

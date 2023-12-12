# delete data sources
curl 'http://admin:admin@127.0.0.1:3000/api/datasources/4' -X DELETE -H 'Content-Type: application/json;charset=UTF-8'

# add data sources
curl 'http://admin:admin@127.0.0.1:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"jmeterdb2","type":"influxdb","url":"http://jmeter-influxdb:8086","access":"proxy","isDefault":false,"basicAuth":false,"basicAuthUser":"","basicAuthPassword":"","withCredentials":false,"database":"","jsonData":{"organization":"jmeter","defaultBucket":"jmeter","httpMode":"POST","version":"Flux"},"secureJsonData":{"token":"test@123"},"user":"admin","password":"admin","version":2,"readOnly":false}'
Setup:
	1. Install current nodejs LTS version
	2. Navigate to the root of the node project in terminal
	3. run 'npm update' in terminal

To run back-end server:
	1. Open a terminal and navigate to the 'Back-end' folder
	2. Run the following command:
		npm start
	'or' for liveloading w/ nodemon:
		npm run devstart

ENDPOINTS:
	strata:
		Create new strata - POST to /API/strata
			strata_plan_id, 
			strata_name, 
			strata_address,
        	office_address, 
			office_email
		
		Get all strata - /API/strata
		Get strata by id - /API/strata/:strata_plan_id

		Delete strata - DELETE /API/strata:strata_plan_id

	users:
		Get all users - /API/users

cURL:
	A utility that will allow you to perform POST, PUT & DELETE from
	the command line. 

	POST:
curl --data "strata_plan_id=3&strata_name=strata3&strata_address=3stratastreet&office_address=3officestreet&office_email=office@email.com" http://localhost:5000/api/strata

	DELETE:
curl -X "DELETE" http://localhost:5000/api/strata/3
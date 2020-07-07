function sendForm() {
    var title = document.getElementById("title").value;
    var author = document.getElementById("author").value;
    var pdfUpload = document.getElementById("pdfUpload").value;
    alert('Works');


/*
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status != 'OK' || results[0].partial_match == true || !validPhone) {
            if(status != 'OK' || results[0].partial_match == true){
                alert('Invalid address');
            }
            else if(!validPhone){
                alert('Phone number is in an incorrect format');
            }
        } else {
            var lat = results[0].geometry.location.lat().toString();
            var lng = results[0].geometry.location.lng().toString()
            var form = {
                "adr1" : adr1,
                "adr2" : adr2,
                "city" : city,
                "state" : state,
                "zip" : zip,
                "rent" : rent,
                "dateFrom" : dateFrom,
                "dateTo" : dateTo,
                "email" : email,
                "phone" : phone,
                "lat": lat,
                "lng": lng
            };

            request = new XMLHttpRequest();
            request.open("POST", "https://sublet-genius.herokuapp.com/listings", true);
            //request.open("POST", "http://localhost:3000/listings", true);
            request.setRequestHeader("Content-type", "application/json");

            request.onreadystatechange = function(){
                if (request.readyState == 4 && request.status == 200) {
                    var res = request.responseText;
                    var status = JSON.parse(res);
                    var body = document.getElementsByTagName("BODY")[0];
                    if (status.error != undefined){
                        body.innerHTML = "<p>" + status.error 
                        + "</p>" +
                                         "<p><a href='listings.html'></a></p>";
                    } else {
                        window.location = 'listing-submitted.html'
                    }           
                }
            }
            var data = JSON.stringify(form);
            request.send(data);
        }
    });
}
*/





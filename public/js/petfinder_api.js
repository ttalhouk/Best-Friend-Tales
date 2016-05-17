$(document).ready(function(){
    var url = 'http://api.petfinder.com/pet.getRandom?key=' + ENV["PETFINDER_KEY"] + '&shelterid=KY305&output=full&format=json';
    $.ajax({
        type : 'GET',
        data : {},
        url : url+'&callback=?' ,
        dataType: 'json',
        success : function(data) {
            console.log(data)
            // stores result
            // var result = '';
            // var petfinder = data.petfinder;
            // var infoHTML = '<ul>';
            // infoHTML += '<li>';
            // infoHTML += '<strong>Description</strong><br>';
            // infoHTML += petfinder.pet.description['$t'];
            // infoHTML += '</li>';

            // infoHTML += '</li>';

            // infoHTML += '</ul>';
            // // return infoHTML;
            // $('#petfinderInfo').html(infoHTML);

            // // $('#petfinderInfo').html(petfinder.pet.description['$t']);
            // //
            // console.log(petfinder);
        },
        error : function(request,error)
        {
            alert("Request: "+JSON.stringify(request));
        }
    });
})

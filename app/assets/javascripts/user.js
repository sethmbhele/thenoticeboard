 $(document).ready (function() {

      
    $("#edit_password").validate({
      onclick: false,
      rules:
        {
        "user[username]":{required: true},
        "user[email]":{required: true,
          email:true},
       
        "user[password]":{ required:true,
          minlength:6 },
        "user[password_confirmation]":{required:true,equalTo:"#newpassword"  },
             "user[status]":{ required:true }
             
 
      },
      messages: {
        "user[username]":{required: 'Please enter username'} ,
        "user[email]":{required: 'Please enter email'} ,
         
        "user[password]": {required: 'Please enter  password'},
        "user[password_confirmation]":{required:"Please enter confirm password"},
             "user[status]": {required: 'Please select user type'}
         
      }

    });



      
    $("#new_user").validate({
      onclick: false,
      rules:
        {
        "user[username]":{required: true},
        "user[email]":{required: true,
          email:true},
       
        "user[password]":{ required:true,
          minlength:6 },
        "user[password_confirmation]":{required:true },
             "user[status]":{ required:true }
             
 
      },
      messages: {
        "user[username]":{required: 'Please enter username'} ,
        "user[email]":{required: 'Please enter email'} ,
         
        "user[password]": {required: 'Please enter  password'},
        "user[password_confirmation]":{required:"Please enter confirm password"},
             "user[status]": {required: 'Please select user type'}
         
      }

    });


  });
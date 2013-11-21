$(document).ready (function() {

      
    $("#new_post").validate({
      onclick: false,
      rules:
        {
        "post[name]":{required: true},
         "post[company_name]":{required: true},
         "post[company_type]":{required: true},
         "post[company_reg_no]":{required: true},
         "post[company_address]":{required: true},
         "post[company_description]":{required: true},
         "post[country_id]":{required: true},
         "post[category_id]":{required: true},
         "post[subcategory_id]":{required: true},
         "post[question_id]":{required: true},
         "post[subquestion_id]":{required: true},
         "post[state_id]":{required: true},
         "post[city]":{required: true},
         "post[zip]":{required: true},
         "post[phone]":{required: true},
         "post[url]":{required: true},
         "post[email]":{required: true,
          email:true}
       
      },
      messages: {

         "post[name]":{required: 'Please enter name'},
         "post[company_name]":{required: 'Please enter company name'},
         "post[company_type]":{required: 'Please enter company type'},
         "post[company_reg_no]":{required: 'Please enter company register no'},
         "post[company_address]":{required: 'Please enter company address'},
         "post[company_description]":{required: 'Please enter description'},
         "post[country]":{required: 'Please select country'},
         "post[state]":{required: 'Please select state'},
         "post[category]":{required: 'Please select category'},
         "post[subcategory]":{required: 'Please select subcategory'},
         "post[question]":{required: 'Please select question'},
         "post[subquestion]":{required: 'Please select subquestion'},
         "post[city]":{required: 'Please enter city'},
         "post[zip]":{required: 'Please enter zip'},
         "post[phone]":{required: 'Please enter phone'},
         "post[url]":{required: 'Please enter url'},
         "post[email]":{required: 'Please enter email'}
        
         
      }

    });


  
    $('#edit_post_form').validate({
      onclick: false,
      rules:
        {
        "post[name]":{required: true},
         "post[company_name]":{required: true},
         "post[company_type]":{required: true},
         "post[company_reg_no]":{required: true},
         "post[company_address]":{required: true},
         "post[company_description]":{required: true},
         "post[country_id]":{required: true},
         "post[category_id]":{required: true},
         "post[subcategory_id]":{required: true},
         "post[state_id]":{required: true},
         "post[question_id]":{required: true},
         "post[subquestion_id]":{required: true},
         "post[city]":{required: true},
         "post[zip]":{required: true},
         "post[phone]":{required: true},
         "post[url]":{required: true},
         "post[email]":{required: true,
          email:true}
       
      },
      messages: {

         "post[name]":{required: 'Please enter name'},
         "post[company_name]":{required: 'Please enter company name'},
         "post[company_type]":{required: 'Please enter company type'},
         "post[company_reg_no]":{required: 'Please enter company register no'},
         "post[company_address]":{required: 'Please enter company address'},
         "post[company_description]":{required: 'Please enter description'},
         "post[country]":{required: 'Please select country'},
         "post[state]":{required: 'Please select state'},
         "post[category]":{required: 'Please select category'},
         "post[subcategory]":{required: 'Please select subcategory'},
         "post[question]":{required: 'Please select question'},
         "post[subquestion]":{required: 'Please select subquestion'},
         "post[city]":{required: 'Please enter city'},
         "post[zip]":{required: 'Please enter zip'},
         "post[phone]":{required: 'Please enter phone'},
         "post[url]":{required: 'Please enter url'},
         "post[email]":{required: 'Please enter email'}
        
         
      }

    });

















  });
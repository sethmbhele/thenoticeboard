# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# function for dynamic select after selection for country state drop down should  sort according to that country



jQuery ->
  
  states = $('#post_state_id').html()
  $('#post_country_id').change ->
    country = $('#post_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#post_state_id').html(options)
      $('#state').show()
    else
      $('#post_state_id').empty()
      $('#state').hide()


# function for dynamic select after selection for category sort the down  subcategory list according to that category


jQuery ->
  $('#subcategory').hide()
  subcategories = $('#post_subcategory_id').html()
  $('#post_category_id').change ->
    category = $('#post_category_id :selected').text()   
    options = $(subcategories).filter("optgroup[label='#{category}']").html()
    if options
      $('#post_subcategory_id').html(options)
      $('#subcategory').show()
    else
      $('#post_subcategory_id').empty()
      $('#subcategory').hide()


  $('#questions_master').hide()
  questions = $('#post_question_id').html()
  $('#post_subcategory_id').change ->
    subcategory = $('#post_subcategory_id :selected').text()   
    options = $(questions).filter("optgroup[label='#{subcategory}']").html()
    if options
      $('#post_question_id').html(options)
      $('#questions_master').show()
    else
      $('#post_question_id').empty()
      $('#questions_master').hide()



  $('#sub_questions').hide()
  subquestions = $('#post_subsubquestion_id').html()
  $('#post_question_id').change ->
    question = $('#post_question_id :selected').text()   
    options = $(subquestions).filter("optgroup[label='#{question}']").html()
    if options
      $('#post_subquestion_id').html(options)
      $('#sub_questions').show()
    else
      $('#post_subquestion_id').empty()
      $('#sub_questions').hide()
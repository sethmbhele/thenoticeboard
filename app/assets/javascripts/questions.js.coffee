

jQuery ->
  $('#form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('#form').on 'click', '.add_fields', (event) ->

    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()


#questions

jQuery ->

  $('#questions_master').hide()
  questions = $('#post_question_id').html()
  $('#post_subcategory_id').change ->
    subcategory = $('#post_subcategory_id :selected').text()   
    options = $(questions).filter("optgroup[label='#{subcategory}']").html()
    if options
      $('#post_question_id').html(options)
      $('#questions_master').show()
      $('#sub_questions').show()
    else
      $('#post_question_id').empty()
      $('#questions_master').hide()


#subquestions

  jQuery ->

  $('#sub_questions').hide()
  subquestions = $('#post_subquestion_id').html()
  $('#post_question_id').change ->
    question = $('#post_question_id :selected').text() 
    options = $(subquestions).filter("optgroup[label='#{question}']").html()
    if options
      $('#post_subquestion_id').html(options)
      $('#sub_questions').show()
    else
      $('#post_subquestion_id').empty()
      $('#sub_questions').hide()
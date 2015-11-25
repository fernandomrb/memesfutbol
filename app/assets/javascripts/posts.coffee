# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', 'a.like', (status,data,xhr)->
  # the `data` parameter is the decoded JSON object
  $(".dislike-count[data-id=#{data.id}]").text '<%= post.get_downvotes.size %>'
  $(".likes-count[data-id=#{data.id}]").text data.count
  
  return

$(document).on 'ajax:success', 'a.dislike', (status,data,xhr)->
  # the `data` parameter is the decoded JSON object
  $(".like-count[data-id=#{data.id}]").text '<%= post.get_upvotes.size %>'
  $(".dislikes-count[data-id=#{data.id}]").text data.count
  
  return
class SetRating
  constructor: (@name, @div) ->
    xhr = new XMLHttpRequest()
    xhr.open "GET", "http://www.omdbapi.com/?t=#{@name}&y=&plot=short&r=json", true
    xhr.onreadystatechange = =>
      if xhr.readyState is (xhr.DONE || 4)
        response = JSON.parse xhr.responseText
        span = document.createElement "span"
        if response.Response is "False"
          span.innerHTML = "IMDB: N/A"
        else
          span.innerHTML = "IMDB: " + response.imdbRating
        if (attach = (@div.getElementsByClassName("period")[0] || @div.getElementsByClassName("tertiary")[0]))?
          span.className = "release"
          attach.appendChild span
        else if (attach = @div.getElementsByClassName("single-item__desc")[0])?
          span.className = "single-item__subtitle typo typo--canary"
          attach.appendChild span
    xhr.send()





for epi in document.getElementsByClassName "list-item"
  new SetRating epi.getElementsByClassName("title")[0]?.innerHTML, epi

for epi in document.getElementsByClassName "one-half"
  new SetRating epi.getElementsByClassName("single-item__title")[0]?.getElementsByTagName("strong")[0]?.innerHTML, epi

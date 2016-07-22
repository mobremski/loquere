# Loquere
Your app description, here.



[ ![Codeship Status for mobremski/loquere](https://codeship.com/projects/633d9d50-2f20-0134-0a9e-5ebc8f268022/status?branch=master)](https://codeship.com/projects/163821)
![Code Climate](https://codeclimate.com/github/mobremski/loquere.png)
![Coverage Status](https://coveralls.io/repos/mobremski/loquere/badge.png)


<div class="map row">
  <iframe
    width="375"
    height="375"
    zoom="10"
    frameborder="0" style="border:0"
    src="https://www.google.com/maps/embed/v1/place?key=<%=ENV['GOOGLE_KEY']%>&zoom=16&q=<%= @meetup.address %>, <%= @meetup.zip %>"
  </iframe>
</div>




style="z-index: 10; position: fixed; left: 0; top: 10; height: 60px;"

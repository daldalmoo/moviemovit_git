<%@ page contentType="text/html; charset=UTF-8"%>

  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>jQuery Bar Rating - Minimal, light-weight jQuery ratings</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=1024, initial-scale=1">

    <link rel="stylesheet" href="ratingjs/examples/css/normalize.min.css">
    <link rel="stylesheet" href="ratingjs/examples/css/main.css">
    <link rel="stylesheet" href="ratingjs/examples/css/examples.css">

    <!-- Icons -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <style>
      @font-face {
        font-family: 'Glyphicons Halflings';
        src:url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.eot');
        src:url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.woff') format('woff'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.ttf') format('truetype'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
      }
    </style>

    <!-- Themes -->
    <link rel="stylesheet" href="ratingjs/dist/themes/bars-1to10.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/bars-movie.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/bars-square.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/bars-pill.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/bars-reversed.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/bars-horizontal.css">

    <link rel="stylesheet" href="ratingjs/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/css-stars.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/bootstrap-stars.css">
    <link rel="stylesheet" href="ratingjs/dist/themes/fontawesome-stars-o.css">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet" type="text/css">


  </head>
  
  <body>
 
  
<form name='frm' method='POST' action='./reviewform.do'>
    <section class="section section-examples">
    <%-- <input type="hidden" name="uid" value="<%=uid %>"> --%>

       <!--  <div class="col col-fullwidth"> -->
       <div class="star-ratings">
 			 <div class="stars stars-example-fontawesome-o">
                 화질 <select id="example-fontawesome-o" name="rating" data-current-rating="0" autocomplete="off">
                  <option value=""></option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
           </select>
                <span class="title current-rating">
                  Current rating: <span class="value"></span>
                </span>
                <span class="title your-rating hidden">
                  Your rating: <span class="value"></span>&nbsp;
                  <a href="#" class="clear-rating"><i class="fa fa-times-circle"></i></a>
                </span>
              </div>
            </div>
    </section>
    </form>
  
  
  
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="ratingjs/examples/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="ratingjs/jquery.barrating.js"></script>
    <script src="ratingjs/examples/js/examples.js"></script>
  </body>
  
  
  
  
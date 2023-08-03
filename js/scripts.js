$(document).ready(function () {
  var counter = 0;
  let step = 48;
  var currentDiv = 1;
      
  $("body>section:nth-of-type(3) h1, body>section:nth-of-type(3) h2, body>section:nth-of-type(3) h3 /*, body>section:nth-of-type(3) h4, body>section:nth-of-type(3) h5*/")
    .each(function () {
      counter++;
      
      $(this).attr('id', 'anchor' + counter);
      $("body>section:nth-of-type(2) div:nth-of-type("+currentDiv+")").append('<a href="#anchor' + counter + '" class="like' + $(this).prop("tagName") +
        '" data-scroll="#anchor' + counter + '">' +
        this
          .innerHTML + '</a>');
      currentDiv = Math.floor(counter / step) + 1;
    });


  counter = 0;
  step = 48;
  currentDiv = 1;
  $("body>section:nth-of-type(4) div:nth-of-type("+currentDiv+")").append('<p class="likeH1">Tablas</p>');
  $("body>section:nth-of-type(3) table thead tr:first-of-type th:first-of-type")
    .each(function () {
      counter++;
      currentDiv = Math.floor(counter / step) + 1;
      $(this).attr('id', 'anchortable' + counter);
      $("body>section:nth-of-type(4) div:nth-of-type("+currentDiv+")").append('<a href="#anchortable' + counter + '" class="like' + $(this).prop("tagName") +
        '" data-scroll="#anchortable' + counter + '">' +
        ucfirst(this.innerHTML.replace ("Tabla de ", "")) + '</a>');
    });

  $("body>section:nth-of-type(4) div:nth-of-type("+currentDiv+")").append('<p class="likeH1">Mapas</p>');
  $("body>section:nth-of-type(3) img[data-title]")
    .each(function () {
      counter++;
      currentDiv = Math.floor(counter / step) + 1;
      $(this).attr('id', 'anchortable' + counter);
      $("body>section:nth-of-type(4) div:nth-of-type("+currentDiv+")").append('<a href="#anchortable' + counter + '" class="like' + $(this).prop("tagName") +
        '" data-scroll="#anchortable' + counter + '">' +
        $(this).data("title") + '</a>');
    });


    
  $(".likeH1,.likeH2,.likeH3,.likeH4,.likeH5,.likeTH").click(function (e) {
    e.preventDefault();
    $('html,body').animate({
      scrollTop: $($(this).data("scroll")).offset().top
    }, 'fast');
  });

  $("body>a:last-of-type").click(function () {
    $('html,body').animate({
      scrollTop: $("body>section:nth-of-type(2)").offset().top
    }, 'fast');
  });

  $(document).scroll(function () {
    if ($(document).scrollTop() > $(window).height()) {
      $("body>a:last-of-type").addClass("show");
    } else {
      $("body>a:last-of-type").removeClass("show");
    }
  });

  /* Aleatorio de tablas */
  $("table[data-dice]").click(function (e) {
    $("tbody tr").removeClass("random");
    let rand = Math.floor(Math.random() * parseInt($(this).data("dice")));
    var count = 0;
    console.log(rand + 1);
    $("tbody tr", this).each(function () {
      if ($(this).data("dice")) {
        if (rand >= count && rand < (count + parseInt($(this).data("dice")))) {
          $(this).addClass("random");
          $('html,body').animate({
            scrollTop: $(this).offset().top
          }, 'fast');
        }
        count = count + parseInt($(this).data("dice"));
      } else {
        if (rand == count) {
          $(this).addClass("random");
          $('html,body').animate({
            scrollTop: $(this).offset().top
          }, 'fast');
        }
        count++;
      }
    });
  });
});

function ucfirst(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}
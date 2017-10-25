function main() {
  $('.skillset').hide();
  $('.skillset').fadeIn(1000);
  $('.skill-js').hide();
  $('.skill-jquery').hide();
  $('.fitness-plan').hide();
  $('.plans').hide();
  $('.gyms').hide();
  $('.addressview').hide();
  $('.projects').hide();
  $('.trainers').hide();
  $('.after').hide();
  $('.set-address').hide();
  
  $('.fbutton').on('click', function() {
		$(this).next().slideToggle(400);
        $(this).toggleClass('active');
	});
  
  var $username;
  
  $('.login-submit-button').on('click', function() {
		$(this).next().slideToggle(400);
        $(this).toggleClass('active');
        var xhttp = new XMLHttpRequest();
        $username = $('.username').val();
        var $password = $('.password').val();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
                var isValid = this.responseText;
        
                if (isValid === 'valid') {
                    $('.fbutton').hide();
                    $('.projects').hide();
                    $('.result').text('Hello ' + encodeURIComponent($username) + '!');
                    $('.after').fadeIn(400);
                    $('.skill-js').fadeIn(400);
                    $('.skill-jquery').fadeIn(400);
                    $('.fitness-plan').fadeIn(400);
                } else {
                    $('.result').text('invalid login!');
                }
            }
        };
        var html = "login.php?username=" + encodeURIComponent($username) + "&password=" + encodeURIComponent($password);
        xhttp.open("GET", html, true);
        xhttp.send(); 
	});
  
  $('.register-submit-button').on('click', function() {
		$(this).next().slideToggle(400);
        $(this).toggleClass('active');
        var xhttp = new XMLHttpRequest();
        $username = $('.usernameR').val();
        var $password = $('.passwordR').val();
        var $firstname = $('.firstname').val();
        var $lastname = $('.lastname').val();
        var $type = $('input[name=type]:checked').val();
        
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
                var isValid = this.responseText;
        
                if (isValid === 'register successful') {
                    $('.fbutton').hide();
                    $('.projects').hide();
                    $('.result').text('Hello ' + encodeURIComponent($username) + '!');
                    $('.after').fadeIn(400);
                    $('.skill-js').fadeIn(400);
                    $('.skill-jquery').fadeIn(400);
                    $('.fitness-plan').fadeIn(400);
                } else {
                    $('.result').text('invalid registration');
                }
            }
        };
        var html = "register.php?username=" + encodeURIComponent($username) + "&password=" + encodeURIComponent($password) + "&lastname=" + encodeURIComponent($lastname) + "&firstname=" + encodeURIComponent($firstname) + "&type=" + encodeURIComponent($type);
        xhttp.open("GET", html, true);
        xhttp.send(); 
	});
  
    $('.set-address-button').on('click', function() {
        $(this).toggleClass('active');
        $(this).next().slideToggle(400);
    });
    
    $('.get-address-button').on('click', function() {
        $(this).toggleClass('active');
        var xhttp = new XMLHttpRequest();
        var html = "getaddress.php?username=" + encodeURIComponent($username);
        
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
                var isValid = this.responseText;
                $('.addressview').text(isValid);
                $('.addressview').slideToggle(400);
            }
        };
        xhttp.open("GET", html, true);
        xhttp.send(); 
        
    });
      
  $('.address-submit-button').on('click', function() {
        $(this).toggleClass('active');
        var xhttp = new XMLHttpRequest();
        var $address1 = $('input[name=address1]').val();
        var $city = $('input[name=city]').val();
        var $state = $('input[name=state]').val();
        var $zip = $('input[name=zip]').val();
        var html = "setaddress.php?username=" + encodeURIComponent($username) + "&address1=" + encodeURIComponent($address1) + "&city=" + encodeURIComponent($city) + "&state=" + encodeURIComponent($state) + "&zip=" + encodeURIComponent($zip);
        
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
                $('.set-address').hide();
            }
        };
        xhttp.open("GET", html, true);
        xhttp.send(); 
	});
  
    $('.gym-button').on('click', function() {
        $(this).toggleClass('active');
        var xhttp = new XMLHttpRequest();
        var html = "getgym.php";
        
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
                var isValid = this.responseText;
                $(this).next().slideToggle(400);
                $('.gyms').text(isValid);
                $('.gyms').slideToggle(400);
            }
        };
        
        xhttp.open("GET", html, true);
        xhttp.send();
    });
    
    $('.trainers-button').on('click', function() {
        $(this).toggleClass('active');
        var xhttp = new XMLHttpRequest();
        var html = "gettrainers.php";
        
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
                var isValid = this.responseText;
                $(this).next().slideToggle(400);
                $('.trainers').text(isValid);
                $('.trainers').slideToggle(400);
            }
        };
        
        xhttp.open("GET", html, true);
        xhttp.send();
    });
    
    $('.plans-button').on('click', function() {
        $(this).toggleClass('active');
        var xhttp = new XMLHttpRequest();
        var html = "getfitnessplans.php";
        
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
                var isValid = this.responseText;
                $(this).next().slideToggle(400);
                $('.plans').text(isValid);
                $('.plans').slideToggle(400);
            }
        };
        
        xhttp.open("GET", html, true);
        xhttp.send();
    });
}

$(document).ready(main);
$(document).ready(function (){
            $("#down").click(function (){
                $('html, body').animate({
                    scrollTop: $("#experience").offset().top
                }, 1000);
            });
        });

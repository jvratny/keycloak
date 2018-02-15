<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>
    <link rel="icon" href="https://clients.eurowag.com/images/favicon.ico" />

<link href="https://clients.eurowag.com/css/content.css?260420171847" type="text/css" rel="stylesheet" media="screen,projection" />
	<link href="https://clients.eurowag.com/css/login.css?120720171821" type="text/css" rel="stylesheet" media="screen,projection" />

    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
  <script type="text/javascript" src="https://clients.eurowag.com/js/jquery.min.js"></script> 
  <script type="text/javascript">
    $(function () {

      var $submenus = $('.lang');
      var menuTimer;
    
      // Main menu hovers
      $('.lang').bind('mouseenter', function (event) {
        var $submenu = $(event.currentTarget).find('.submenu,.submenu-lang');
        if ($submenu.length == 0) return;
        $submenus.not(event.currentTarget).triggerHandler('mouseleave');
        $submenu.stop().fadeTo(200, 1);
        $('.lang').addClass('hover');
        var $arrow = $('<span class="arrow" />').css({ left: $('.lang').width() / 2 });
        $('.lang').append($arrow);
        $('#header .selectedLang').addClass('hover');
        clearTimeout(menuTimer);
      });
      $('.lang').bind('mouseleave', function (event) {
        var $submenu = $(event.currentTarget).find('.submenu,.submenu-lang');
        if ($submenu.length == 0) return;
        clearTimeout(menuTimer);
        menuTimer = setTimeout(function () { $submenu.stop().fadeTo(100, 0, function () { $submenu.css({ display: 'none' }); $('#header .selectedLang').removeClass('hover'); }).closest('li').removeClass('hover').find('.arrow').remove(); }, 200);
      });
    });
  </script>

</head>

<body class="${properties.kcBodyClass!}">

<div id="header" class="clearfix">
		    <div class="container">
			    <p class="logo">
				    <a href="http://www.eurowag.com/en?manualSelection=en" title="EUROWAG"></a>
			    </p>


            <#if realm.internationalizationEnabled>
          <span class="lang" >
            <span class="selectedLang" > Select language: ${locale.current}</span>
            <div class="submenu">
		          <ul>
                                <#list locale.supported as l>
                     <li><a href="${l.url}">${l.label}</a></li>
               </#list>
		          </ul>
	          </div>
              </span>
            </#if>
		    </div>
	    </div><!--#header -->

        <div id="main">
		    <div id="LoginContainer" class="container clearfix">

			    <div id="login-welcome">
				
   
                            <#nested "header">         
			    </div>
          
			    <div id="login-box" class="clearfix">
				    <#nested "form">
					    </div>
				    </div>
			    </div>

          

          <div id="footer">
            <div class="line">&nbsp;</div>
            <div class="mastercard">The EUROWAG MasterCard is issued by PPRO Financial Limited pursuant to a license from MasterCard International Incorporated. MasterCard and the MasterCard Brand Mark are registered trademarks of MasterCard International Incorporated. PPRO Financial Ltd (PPRO), a company incorporated in England with registered address 23 Hanover Square London W1S 1JB, England and company registration number 07653641 and authorised by the FCA as an electronic money institution under registration number 900029. All communications should be sent to W.A.G. payment solutions, a.s., Na Vítězné pláni 1719/4, Prague 140 00, Czech Republic.</div>
          
			      <strong>&copy;W.A.G. payment solutions, a.s.</strong>
		      </div><!-- #footer-->
		    </div><!--.container -->
	    </div><!--#main -->
</body>
</html>
</#macro>

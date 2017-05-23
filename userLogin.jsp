<html>
<head>
<link rel="stylesheet" href="w3.css" />
</head>
<style>
nav{
font-family: "Comic Sans MS", cursive, sans-serif;
}
input{
font-size:14px;
font-family:cursive;
}
</style>
<body class="w3-container">
<nav class="w3-container w3-display-topright w3-gray w3-round-xxlarge w3-border-top w3-border-bottom" style="height:30px;margin-right:1cm;display:inline;word-spacing:20px;margin-top:.2cm;">
<a href="index.html" class="w3-hover-white w3-medium" >Home</a>
<a href="sreg.html" class="w3-hover-white w3-medium" >Register</a>
<a href="auLogin.jsp" class="w3-hover-white w3-medium" >Admin</a>
<a href="userLogin.jsp" class="w3-hover-white w3-medium">UserLogin</a>
</nav>
<header class="w3-container w3-cyan w3-border w3-round-xlarge" style="height:120px;" >
<div style="float:left;">
<img src="./images/logo.jpg" class="w3-round-xxlarge" />
</div>
<div style="float:left;width:200px;height:200px;margin-left:2cm;">
<img src="./images/C1.png" style="width:820px;height:100px;margin-top:.01cm;" class="w3-round-xlarge" />
</div>
</header>
<section class=" w3-container w3-border w3-gray w3-round-large" >
<div style="float:left;border:0px dashed white;width:800px;height:300px;margin-bottom:.1cm;">
<figure>
<img class="w3-center w3-circle w3-display-left" src="./images/main2.png" style="margin-left:2cm;width:40%;height:40%;"/>
</figure>
</div>
<div class="w3-panel  w3-display-right" style="width:32%;margin-right:1cm;margin-top:1.4cm;">
<fieldset class="w3-cyan w3-text-white w3-border-white" style='text-align:left; width:250px;border:2px dashed skyblue;margin-right:5cm;background-color:lightyellow;'>
<legend class="w3-card-4 w3-cyan w3-text-white w3-round-large">USER LOGIN</legend>
<form action='check.jsp'>
<p>
<input type=text name=usid placeholder='Enter UserId' required=required/></p>
<p><input type=hidden name=utype value='user' />
<input type=password name=uspwd placeholder='Enter Password' required=required/></p>
<input type=submit name=s value='Login' style='font-size:20px;background-color:skyblue;color:white;'> &nbsp;&nbsp;&nbsp;<input type=reset name=r value='clear' style='background-color:skyblue;color:white;'>
</form>
</fieldset>
</div>
<div class="w3-container" >
<img src="./images/social.jpg" style="height:120px;" class="w3-circle" />
</div>
</section>
<footer class="w3-container w3-cyan w3-round-xxlarge" style="">
<div class=" w3-width-300 w3-round-large w3-hover-white w3-text-hover-blue w3-center">
<span style="font-size:18px;font-family:'Comic Sans MS';color:white;margin-top:1cm;">
Developed at Adroit Info com India Pvt Ltd.
</span>
</div>
</footer>
</body>
</html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="w3.css" />
</head>
<style>
nav{
font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>
<body class="w3-container">
<nav class=" w3-container w3-display-topmiddle">
<div class="w3-bar w3-white ">
<a href="vamembers.jsp" class="w3-bar-item w3-button w3-blue" >Groups</a>
<a href="vusers.jsp" class="w3-bar-item w3-button " >Users</a>
<a href="addDict.jsp" class="w3-bar-item w3-button w3-blue" >Words</a>
<a href="viewDict.jsp" class="w3-bar-item w3-button " >ViewWords</a>
<a href="index.html" class="w3-bar-item w3-button w3-orange ">Logout</a>
</div>
</nav>
<header class="w3-container w3-cyan w3-border w3-round-xlarge" style="height:120px;" >
<div style="float:left;">
<img src="./images/logo.jpg" class="w3-round-xxlarge" />
</div>
<!--<div style="float:left;width:200px;height:200px;margin-left:2cm;">
<img src="./images/C1.png" style="width:820px;height:100px;margin-top:.01cm;" class="w3-round-xlarge" />
</div>-->
</header>
<section class=" w3-container  w3-border  w3-round-large w3-padding-16 w3-section" >
<h3 class="w3-panel w3-blue w3-center w3-round-xxlarge">Add Words</h3><hr>
<form method=post action='addDict2.jsp' >
<table class=" w3-center" align=center border=0>
<tr><td><input type=text name=word size=15 class="w3-input w3-animate-input" style="30%" placeholder="New Word" required=required></td></tr>
<tr><td><br></td></tr>
<tr><td><br></td></tr>
<tr><td><input type=submit value='Save'>&nbsp;<input type=reset></td></tr>
</table></form>
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
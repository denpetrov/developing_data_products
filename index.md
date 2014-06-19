---
title       : Parlaments
subtitle    : Parlament parties seats of different countries
author      : Denis PETROV
job         : Coursera student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>
strong {
  font-weight: bold;
}
</style>




## About the data

We present the data of the number of seats in parlamesn for different countries 
of different years of elections.
The data contains:
* __Party__ is a party of the parlament.
* __Seats__ is a number of seats in the parlament of selected country for 
the chosen year.
* __perc of seats__ is a percentage of seats.
* __Banzhaf Power Index__ is a power index defined by the probability of 
changing an outcome of a vote where voting rights are not necessarily equally 
divided among the voters or shareholders 
[read more on 
<a href="http://en.wikipedia.org/wiki/Banzhaf_power_index">Wikipedia</a>].
* __Shapley Shubik Power Index__ is an index which counts the number 
of times a party makes the coalition a winning one joining it 
(order does matter)
[[Wikipedia](http://en.wikipedia.org/wiki/Shapley%E2%80%93Shubik_power_index)].

---

## Data representation

By choosing a country and a year from the list you obtain:
* Pie chart of the seats of each party
* Table of detailed information including party name, number of seats and 
indices.

One can try the application 
[here](https://petrov.shinyapps.io/my_coef_coursera/).

---

## Data example (pie chart)



Pie chart for Austria (1979)



<!-- PieChart generated in R 3.1.0 by googleVis 0.5.1 package -->
<!-- Thu Jun 19 20:22:01 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataPieChartID38f70f46bec () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Green Alternatie/Green in Parliament",
17 
],
[
 "Freedom Party of Austria",
18 
],
[
 "Austrian Peoples Party",
79 
],
[
 "Austrian Socialist Party",
69 
] 
];
data.addColumn('string','Party');
data.addColumn('number','Seats');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartPieChartID38f70f46bec() {
var data = gvisDataPieChartID38f70f46bec();
var options = {};
options["allowHtml"] = true;
options["height"] = "500";

    var chart = new google.visualization.PieChart(
    document.getElementById('PieChartID38f70f46bec')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartPieChartID38f70f46bec);
})();
function displayChartPieChartID38f70f46bec() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartPieChartID38f70f46bec"></script>
 
<!-- divChart -->
  
<div id="PieChartID38f70f46bec"
  style="width: 600px; height: 500px;">
</div>

---

## Data example (table)

Corresponding table for Austria (1979)

<!-- html table generated in R 3.1.0 by xtable 1.7-3 package -->
<!-- Thu Jun 19 18:31:43 2014 -->
<TABLE border=1>
<TR> <TH> Party </TH> <TH> Seats </TH> <TH> perc of seats </TH> <TH> Banzhaf Power Index </TH> <TH> Shapley Shubik Power Index </TH>  </TR>
  <TR> <TD> Green Alternatie/Green in Parliament </TD> <TD align="right">  17 </TD> <TD align="right"> 0.09 </TD> <TD align="right"> 0.17 </TD> <TD align="right"> 0.17 </TD> </TR>
  <TR> <TD> Freedom Party of Austria </TD> <TD align="right">  18 </TD> <TD align="right"> 0.10 </TD> <TD align="right"> 0.17 </TD> <TD align="right"> 0.17 </TD> </TR>
  <TR> <TD> Austrian Peoples Party </TD> <TD align="right">  79 </TD> <TD align="right"> 0.43 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.50 </TD> </TR>
  <TR> <TD> Austrian Socialist Party </TD> <TD align="right">  69 </TD> <TD align="right"> 0.38 </TD> <TD align="right"> 0.17 </TD> <TD align="right"> 0.17 </TD> </TR>
   </TABLE>


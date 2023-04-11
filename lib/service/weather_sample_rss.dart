// https://weather.gc.ca/rss/city/on-118_e.xml
const sampleAtom = """
<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="en-ca">
<!--
This is a data file that is meant to be read by RSS readers or aggregators.
See https://www.canada.ca/en/environment-climate-change/services/weather-general-tools-resources/ways-to-access-forecasts.html to learn more about our RSS service.
-->
<title>Ottawa (Kanata - Orléans) - Weather - Environment Canada</title>
<link rel="related" href="https://weather.gc.ca/city/pages/on-118_metric_e.html" type="text/html"/>
<link rel="self" href="https://weather.gc.ca/rss/city/on-118_e.xml" type="application/atom+xml"/>
<link rel="alternate" hreflang="fr-ca" href="https://meteo.gc.ca/rss/city/on-118_f.xml" type="application/atom+xml"/>
<author>
  <name>Environment Canada</name>
  <uri>https://weather.gc.ca</uri>
</author>
<updated>2023-04-09T18:04:03Z</updated>
<id>tag:weather.gc.ca,2013-04-16:20230409180403</id>
<logo>https://weather.gc.ca/template/gcweb/v5.0.1/assets/wmms-alt.png</logo>
<icon>https://weather.gc.ca/template/gcweb/v5.0.1/assets/favicon.ico</icon>
<rights>Copyright 2023, Environment Canada</rights>
<entry>
  <title>No watches or warnings in effect, Ottawa (Kanata - Orléans)</title>
  <link type="text/html" href="https://weather.gc.ca/index_e.html"/>
  <updated>2023-04-06T17:15:07Z</updated>
  <published>2023-04-06T17:15:07Z</published>
  <category term="Warnings and Watches"/>
  <summary type="html">No watches or warnings in effect.</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_w1:20230406171507</id>
</entry>
<entry>
  <title>Current Conditions: Mainly Sunny, 9.2°C</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T18:00:00Z</updated>
  <published>2023-04-09T18:00:00Z</published>
  <category term="Current Conditions"/>
  <summary type="html">
    <![CDATA[<b>Observed at:</b> Ottawa Macdonald-Cartier Int'l Airport 2:00 PM EDT Sunday 9 April 2023<br/> <b>Condition:</b> Mainly Sunny<br/> <b>Temperature:</b> 9.2&deg;C<br/> <b>Pressure / Tendency:</b> 103.4 kPa falling<br/> <b>Visibility:</b> 24 km<br/> <b>Humidity:</b> 31 %<br/> <b>Dewpoint:</b> -7.0&deg;C<br/> <b>Wind:</b> W 18 km/h<br/> <b>Air Quality Health Index:</b> 3<br/>]]>
  </summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_cc:20230409180000</id>
</entry>
<entry>
  <title>Sunday: Sunny. High 11.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Sunny. High 11. UV index 5 or moderate. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc0:20230409150000</id>
</entry><entry>
  <title>Sunday night: Clear. Low minus 4.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Clear. Wind up to 15 km/h. Low minus 4. Wind chill near minus 7. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc1:20230409150000</id>
</entry><entry>
  <title>Monday: Mainly sunny. High 16.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Sunny. Becoming a mix of sun and cloud near noon. Wind becoming southwest 20 km/h in the afternoon. High 16. Wind chill minus 7 in the morning. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc2:20230409150000</id>
</entry><entry>
  <title>Monday night: Chance of showers. Low 7. POP 40%</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Cloudy periods with 40 percent chance of showers. Low 7. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc3:20230409150000</id>
</entry><entry>
  <title>Tuesday: Cloudy. High 17.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Cloudy. High 17. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc4:20230409150000</id>
</entry><entry>
  <title>Tuesday night: Cloudy. Low 6.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Cloudy. Low 6. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc5:20230409150000</id>
</entry><entry>
  <title>Wednesday: A mix of sun and cloud. High 19.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">A mix of sun and cloud. High 19. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc6:20230409150000</id>
</entry><entry>
  <title>Wednesday night: Cloudy periods. Low 7.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Cloudy periods. Low 7. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc7:20230409150000</id>
</entry><entry>
  <title>Thursday: A mix of sun and cloud. High 27.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">A mix of sun and cloud. High 27. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc8:20230409150000</id>
</entry><entry>
  <title>Thursday night: Cloudy periods. Low 11.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Cloudy periods. Low 11. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc9:20230409150000</id>
</entry><entry>
  <title>Friday: A mix of sun and cloud. High 24.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">A mix of sun and cloud. High 24. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc10:20230409150000</id>
</entry><entry>
  <title>Friday night: Cloudy periods. Low 10.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">Cloudy periods. Low 10. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc11:20230409150000</id>
</entry><entry>
  <title>Saturday: A mix of sun and cloud. High 22.</title>
  <link type="text/html" href="https://weather.gc.ca/city/pages/on-118_metric_e.html"/>
  <updated>2023-04-09T15:00:00Z</updated>
  <published>2023-04-09T15:00:00Z</published>
  <category term="Weather Forecasts"/>
  <summary type="html">A mix of sun and cloud. High 22. Forecast issued 11:00 AM EDT Sunday 9 April 2023</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_fc12:20230409150000</id>
</entry>
</feed>""";

// https://weather.gc.ca/rss/warning/on-118_e.xml
const alertAtom = """
<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="en-ca">
<!--
This is a data file that is meant to be read by RSS readers or aggregators.
See https://www.canada.ca/en/environment-climate-change/services/weather-general-tools-resources/ways-to-access-forecasts.html to learn more about our RSS service.
-->
<title>Ottawa (Kanata - Orléans) - Weather Alert - Environment Canada</title>
<link rel="related" href="https://weather.gc.ca/index_e.html" type="text/html"/>
<link rel="self" href="https://weather.gc.ca/rss/warning/on-118_e.xml" type="application/atom+xml"/>
<link rel="alternate" hreflang="fr-ca" href="https://meteo.gc.ca/rss/warning/on-118_f.xml" type="application/atom+xml"/>
<author>
  <name>Environment Canada</name>
  <uri>https://weather.gc.ca</uri>
</author>
<updated>2023-04-06T17:15:07Z</updated>
<id>tag:weather.gc.ca,2013-04-16:20230406171507</id>
<logo>https://weather.gc.ca/template/gcweb/v5.0.1/assets/wmms-alt.png</logo>
<icon>https://weather.gc.ca/template/gcweb/v5.0.1/assets/favicon.ico</icon>
<rights>Copyright 2023, Environment Canada</rights>
<entry>
  <title>No watches or warnings in effect, Ottawa (Kanata - Orléans)</title>
  <link type="text/html" href="https://weather.gc.ca/index_e.html"/>
  <updated>2023-04-06T17:15:07Z</updated>
  <published>2023-04-06T17:15:07Z</published>
  <category term="Warnings and Watches"/>
  <summary type="html">No watches or warnings in effect.</summary>
  <id>tag:weather.gc.ca,2013-04-16:on-118_w1:20230406171507</id>
</entry>
</feed>""";

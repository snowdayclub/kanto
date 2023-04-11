// https://dd.weather.gc.ca/citypage_weather/xml/ON/s0000430_e.xml
const sampleXml = """
<?xml version="1.0" encoding="UTF-8"?>
<siteData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://dd.weather.gc.ca/citypage_weather/schema/site.xsd">
   <license>https://dd.weather.gc.ca/doc/LICENCE_GENERAL.txt</license>
   <dateTime name="xmlCreation" zone="UTC" UTCOffset="0">
      <year>2023</year>
      <month name="April">04</month>
      <day name="Sunday">09</day>
      <hour>18</hour>
      <minute>03</minute>
      <timeStamp>20230409180319</timeStamp>
      <textSummary>Sunday April 09, 2023 at 18:03 UTC</textSummary>
   </dateTime>
   <dateTime name="xmlCreation" zone="EST" UTCOffset="-5">
      <year>2023</year>
      <month name="April">04</month>
      <day name="Sunday">09</day>
      <hour>13</hour>
      <minute>03</minute>
      <timeStamp>20230409130319</timeStamp>
      <textSummary>Sunday April 09, 2023 at 13:03 EST</textSummary>
   </dateTime>
   <location>
      <continent>North America</continent>
      <country code="ca">Canada</country>
      <province code="on">Ontario</province>
      <name code="s0000430" lat="45.40N" lon="75.69W">Ottawa (Kanata - Orléans)</name>
      <region>Ottawa North - Kanata - Orléans</region>
   </location>
   <warnings/>
   <currentConditions>
      <station code="yow" lat="45.32N" lon="75.67W">Ottawa Macdonald-Cartier Int&apos;l Airport</station>
      <dateTime name="observation" zone="UTC" UTCOffset="0">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>18</hour>
         <minute>00</minute>
         <timeStamp>20230409180000</timeStamp>
         <textSummary>Sunday April 09, 2023 at 18:00 UTC</textSummary>
      </dateTime>
      <dateTime name="observation" zone="EST" UTCOffset="-5">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>13</hour>
         <minute>00</minute>
         <timeStamp>20230409130000</timeStamp>
         <textSummary>Sunday April 09, 2023 at 13:00 EST</textSummary>
      </dateTime>
      <condition>Mainly Sunny</condition>
      <iconCode format="gif">01</iconCode>
      <temperature unitType="metric" units="C">9.2</temperature>
      <dewpoint unitType="metric" units="C">-7.0</dewpoint>
      <windChill unitType="metric">-5</windChill>
      <pressure unitType="metric" units="kPa" change="0.15" tendency="falling">103.4</pressure>
      <visibility unitType="metric" units="km">24</visibility>
      <relativeHumidity units="%">31</relativeHumidity>
      <wind>
         <speed unitType="metric" units="km/h">18</speed>
         <gust unitType="metric" units="km/h"></gust>
         <direction>W</direction>
         <bearing units="degrees">263.0</bearing>
      </wind>
   </currentConditions>
   <forecastGroup>
      <dateTime name="forecastIssue" zone="UTC" UTCOffset="0">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>15</hour>
         <minute>00</minute>
         <timeStamp>20230409150000</timeStamp>
         <textSummary>Sunday April 09, 2023 at 15:00 UTC</textSummary>
      </dateTime>
      <dateTime name="forecastIssue" zone="EST" UTCOffset="-5">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>10</hour>
         <minute>00</minute>
         <timeStamp>20230409100000</timeStamp>
         <textSummary>Sunday April 09, 2023 at 10:00 EST</textSummary>
      </dateTime>
      <regionalNormals>
         <textSummary>Low zero. High 10.</textSummary>
         <temperature unitType="metric" units="C" class="high">10</temperature>
         <temperature unitType="metric" units="C" class="low">0</temperature>
      </regionalNormals>
      <forecast>
         <period textForecastName="Today">Sunday</period>
         <textSummary>Sunny. High 11. UV index 5 or moderate.</textSummary>
         <cloudPrecip>
            <textSummary>Sunny.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">00</iconCode>
            <pop units="%"></pop>
            <textSummary>Sunny</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>High 11.</textSummary>
            <temperature unitType="metric" units="C" class="high">11</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>NW</direction>
               <bearing units="degrees">32</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <uv category="moderate">
            <index>5</index>
            <textSummary>UV index 5 or moderate.</textSummary>
         </uv>
         <relativeHumidity units="%">40</relativeHumidity>
         <humidex/>
         <frost>
            <textSummary></textSummary>
         </frost>
      </forecast>
      <forecast>
         <period textForecastName="Tonight">Sunday night</period>
         <textSummary>Clear. Wind up to 15 km/h. Low minus 4. Wind chill near minus 7.</textSummary>
         <cloudPrecip>
            <textSummary>Clear.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">30</iconCode>
            <pop units="%"></pop>
            <textSummary>Clear</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>Low minus 4.</textSummary>
            <temperature unitType="metric" units="C" class="low">-4</temperature>
         </temperatures>
         <winds>
            <textSummary>Wind up to 15 km/h.</textSummary>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>SW</direction>
               <bearing units="degrees">22</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill>
            <textSummary>Wind chill near minus 7.</textSummary>
            <calculated index="1" unitType="metric" class="near">-7</calculated>
            <frostBite></frostBite>
         </windChill>
         <relativeHumidity units="%">85</relativeHumidity>
         <humidex/>
         <frost>
            <textSummary></textSummary>
         </frost>
      </forecast>
      <forecast>
         <period textForecastName="Monday">Monday</period>
         <textSummary>Sunny. Becoming a mix of sun and cloud near noon. Wind becoming southwest 20 km/h in the afternoon. High 16. Wind chill minus 7 in the morning.</textSummary>
         <cloudPrecip>
            <textSummary>Sunny. Becoming a mix of sun and cloud near noon.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">01</iconCode>
            <pop units="%"></pop>
            <textSummary>Mainly sunny</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>High 16.</textSummary>
            <temperature unitType="metric" units="C" class="high">16</temperature>
         </temperatures>
         <winds>
            <textSummary>Wind becoming southwest 20 km/h in the afternoon.</textSummary>
            <wind index="1" rank="minor">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>SW</direction>
               <bearing units="degrees">22</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">15</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>SW</direction>
               <bearing units="degrees">22</bearing>
            </wind>
            <wind index="3" rank="major">
               <speed unitType="metric" units="km/h">20</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>SW</direction>
               <bearing units="degrees">22</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill>
            <textSummary>Wind chill minus 7 in the morning.</textSummary>
            <calculated index="1" unitType="metric" class="morning">-7</calculated>
            <frostBite></frostBite>
         </windChill>
         <relativeHumidity units="%">45</relativeHumidity>
         <humidex/>
         <frost>
            <textSummary></textSummary>
         </frost>
      </forecast>
      <forecast>
         <period textForecastName="Monday night">Monday night</period>
         <textSummary>Cloudy periods with 40 percent chance of showers. Low 7.</textSummary>
         <cloudPrecip>
            <textSummary>Cloudy periods with 40 percent chance of showers.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">36</iconCode>
            <pop units="%">40</pop>
            <textSummary>Chance of showers</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>Low 7.</textSummary>
            <temperature unitType="metric" units="C" class="low">7</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">20</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>SW</direction>
               <bearing units="degrees">22</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">15</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>W</direction>
               <bearing units="degrees">27</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="46" end="58">rain</precipType>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">70</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Tuesday">Tuesday</period>
         <textSummary>Cloudy. High 17.</textSummary>
         <cloudPrecip>
            <textSummary>Cloudy.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">10</iconCode>
            <pop units="%"></pop>
            <textSummary>Cloudy</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>High 17.</textSummary>
            <temperature unitType="metric" units="C" class="high">17</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="minor">
               <speed unitType="metric" units="km/h">15</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>W</direction>
               <bearing units="degrees">27</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">20</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>SW</direction>
               <bearing units="degrees">22</bearing>
            </wind>
            <wind index="3" rank="major">
               <speed unitType="metric" units="km/h">30</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>SW</direction>
               <bearing units="degrees">22</bearing>
            </wind>
            <wind index="4" rank="minor">
               <speed unitType="metric" units="km/h">20</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>W</direction>
               <bearing units="degrees">27</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">50</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Tuesday night">Tuesday night</period>
         <textSummary>Cloudy. Low 6.</textSummary>
         <cloudPrecip>
            <textSummary>Cloudy.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">10</iconCode>
            <pop units="%"></pop>
            <textSummary>Cloudy</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>Low 6.</textSummary>
            <temperature unitType="metric" units="C" class="low">6</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">20</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>W</direction>
               <bearing units="degrees">27</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>NW</direction>
               <bearing units="degrees">32</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">100</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Wednesday">Wednesday</period>
         <textSummary>A mix of sun and cloud. High 19.</textSummary>
         <cloudPrecip>
            <textSummary>A mix of sun and cloud.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">02</iconCode>
            <pop units="%"></pop>
            <textSummary>A mix of sun and cloud</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>High 19.</textSummary>
            <temperature unitType="metric" units="C" class="high">19</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>NW</direction>
               <bearing units="degrees">32</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">45</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Wednesday night">Wednesday night</period>
         <textSummary>Cloudy periods. Low 7.</textSummary>
         <cloudPrecip>
            <textSummary>Cloudy periods.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">32</iconCode>
            <pop units="%"></pop>
            <textSummary>Cloudy periods</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>Low 7.</textSummary>
            <temperature unitType="metric" units="C" class="low">7</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>S</direction>
               <bearing units="degrees">18</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">95</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Thursday">Thursday</period>
         <textSummary>A mix of sun and cloud. High 27.</textSummary>
         <cloudPrecip>
            <textSummary>A mix of sun and cloud.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">02</iconCode>
            <pop units="%"></pop>
            <textSummary>A mix of sun and cloud</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>High 27.</textSummary>
            <temperature unitType="metric" units="C" class="high">27</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>W</direction>
               <bearing units="degrees">27</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">50</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Thursday night">Thursday night</period>
         <textSummary>Cloudy periods. Low 11.</textSummary>
         <cloudPrecip>
            <textSummary>Cloudy periods.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">32</iconCode>
            <pop units="%"></pop>
            <textSummary>Cloudy periods</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>Low 11.</textSummary>
            <temperature unitType="metric" units="C" class="low">11</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">70</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Friday">Friday</period>
         <textSummary>A mix of sun and cloud. High 24.</textSummary>
         <cloudPrecip>
            <textSummary>A mix of sun and cloud.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">02</iconCode>
            <pop units="%"></pop>
            <textSummary>A mix of sun and cloud</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>High 24.</textSummary>
            <temperature unitType="metric" units="C" class="high">24</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>S</direction>
               <bearing units="degrees">18</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">50</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Friday night">Friday night</period>
         <textSummary>Cloudy periods. Low 10.</textSummary>
         <cloudPrecip>
            <textSummary>Cloudy periods.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">32</iconCode>
            <pop units="%"></pop>
            <textSummary>Cloudy periods</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>Low 10.</textSummary>
            <temperature unitType="metric" units="C" class="low">10</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>S</direction>
               <bearing units="degrees">18</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">65</relativeHumidity>
         <humidex/>
      </forecast>
      <forecast>
         <period textForecastName="Saturday">Saturday</period>
         <textSummary>A mix of sun and cloud. High 22.</textSummary>
         <cloudPrecip>
            <textSummary>A mix of sun and cloud.</textSummary>
         </cloudPrecip>
         <abbreviatedForecast>
            <iconCode format="gif">02</iconCode>
            <pop units="%"></pop>
            <textSummary>A mix of sun and cloud</textSummary>
         </abbreviatedForecast>
         <temperatures>
            <textSummary>High 22.</textSummary>
            <temperature unitType="metric" units="C" class="high">22</temperature>
         </temperatures>
         <winds>
            <wind index="1" rank="major">
               <speed unitType="metric" units="km/h">05</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>VR</direction>
               <bearing units="degrees">99</bearing>
            </wind>
            <wind index="2" rank="major">
               <speed unitType="metric" units="km/h">10</speed>
               <gust unitType="metric" units="km/h">00</gust>
               <direction>S</direction>
               <bearing units="degrees">18</bearing>
            </wind>
         </winds>
         <precipitation>
            <textSummary></textSummary>
            <precipType start="" end=""/>
         </precipitation>
         <windChill/>
         <relativeHumidity units="%">50</relativeHumidity>
         <humidex/>
      </forecast>
   </forecastGroup>
   <hourlyForecastGroup>
      <dateTime name="forecastIssue" zone="UTC" UTCOffset="0">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>15</hour>
         <minute>00</minute>
         <timeStamp>20230409150000</timeStamp>
         <textSummary>Sunday April 09, 2023 at 15:00 UTC</textSummary>
      </dateTime>
      <dateTime name="forecastIssue" zone="EDT" UTCOffset="-4">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>11</hour>
         <minute>00</minute>
         <timeStamp>20230409110000</timeStamp>
         <textSummary>Sunday April 09, 2023 at 11:00 EDT</textSummary>
      </dateTime>
      <hourlyForecast dateTimeUTC="202304091900">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">10</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304092000">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">10</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304092100">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">11</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304092200">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">9</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304092300">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">7</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100000">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">5</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100100">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">3</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100200">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">0</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100300">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">-2</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-6</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">10</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100400">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">-3</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-7</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">10</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100500">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">-3</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-7</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">10</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100600">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">-4</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-6</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100700">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">-4</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-6</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100800">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">-4</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-6</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304100900">
         <condition>Clear</condition>
         <iconCode format="png">30</iconCode>
         <temperature unitType="metric" units="C">-4</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-6</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">5</speed>
            <direction windDirFull="Variable direction">VR</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101000">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">-3</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-7</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">10</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101100">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">-3</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-7</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">10</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101200">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">-2</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric">-7</windChill>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">15</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101300">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">0</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">15</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101400">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">3</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">15</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101500">
         <condition>Sunny</condition>
         <iconCode format="png">00</iconCode>
         <temperature unitType="metric" units="C">5</temperature>
         <lop category="Nil" units="%">0</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">15</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101600">
         <condition>A mix of sun and cloud</condition>
         <iconCode format="png">02</iconCode>
         <temperature unitType="metric" units="C">8</temperature>
         <lop category="Low" units="%">20</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">15</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101700">
         <condition>A mix of sun and cloud</condition>
         <iconCode format="png">02</iconCode>
         <temperature unitType="metric" units="C">12</temperature>
         <lop category="Low" units="%">20</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">15</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
      <hourlyForecast dateTimeUTC="202304101800">
         <condition>A mix of sun and cloud</condition>
         <iconCode format="png">02</iconCode>
         <temperature unitType="metric" units="C">15</temperature>
         <lop category="Low" units="%">20</lop>
         <windChill unitType="metric"/>
         <humidex unitType="metric"/>
         <wind>
            <speed unitType="metric" units="km/h">20</speed>
            <direction windDirFull="Southwest">SW</direction>
            <gust unitType="metric" units="km/h"/>
         </wind>
      </hourlyForecast>
   </hourlyForecastGroup>
   <yesterdayConditions>
      <temperature unitType="metric" units="C" class="high">6.1</temperature>
      <temperature unitType="metric" units="C" class="low">-7.2</temperature>
      <precip unitType="metric" units="mm">0.0</precip>
   </yesterdayConditions>
   <riseSet>
      <disclaimer>The information provided here, for the times of the rise and set of the sun, is an estimate included as a convenience to our clients. Values shown here may differ from the official sunrise/sunset data available from (http://hia-iha.nrc-cnrc.gc.ca/sunrise_e.html)</disclaimer>
      <dateTime name="sunrise" zone="UTC" UTCOffset="0">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>10</hour>
         <minute>29</minute>
         <timeStamp>20230409102900</timeStamp>
         <textSummary>Sunday April 09, 2023 at 10:29 UTC</textSummary>
      </dateTime>
      <dateTime name="sunrise" zone="EST" UTCOffset="-5">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>05</hour>
         <minute>29</minute>
         <timeStamp>20230409052900</timeStamp>
         <textSummary>Sunday April 09, 2023 at 05:29 EST</textSummary>
      </dateTime>
      <dateTime name="sunset" zone="UTC" UTCOffset="0">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>23</hour>
         <minute>41</minute>
         <timeStamp>20230409234100</timeStamp>
         <textSummary>Sunday April 09, 2023 at 23:41 UTC</textSummary>
      </dateTime>
      <dateTime name="sunset" zone="EST" UTCOffset="-5">
         <year>2023</year>
         <month name="April">04</month>
         <day name="Sunday">09</day>
         <hour>18</hour>
         <minute>41</minute>
         <timeStamp>20230409184100</timeStamp>
         <textSummary>Sunday April 09, 2023 at 18:41 EST</textSummary>
      </dateTime>
   </riseSet>
   <almanac>
      <temperature class="extremeMax" period="1939-2011" unitType="metric" units="C" year="1945">23.3</temperature>
      <temperature class="extremeMin" period="1939-2011" unitType="metric" units="C" year="1997">-11.3</temperature>
      <temperature class="normalMax" unitType="metric" units="C">8.9</temperature>
      <temperature class="normalMin" unitType="metric" units="C">-1.0</temperature>
      <temperature class="normalMean" unitType="metric" units="C">4.0</temperature>
      <precipitation class="extremeRainfall" period="1939-2011" unitType="metric" units="mm" year="1980">32.2</precipitation>
      <precipitation class="extremeSnowfall" period="1939-2011" unitType="metric" units="cm" year="2000">4.2</precipitation>
      <precipitation class="extremePrecipitation" period="1939-2011" unitType="metric" units="mm" year="1980">32.2</precipitation>
      <precipitation class="extremeSnowOnGround" period="1955-2011" unitType="metric" units="cm" year="1971">46.0</precipitation>
      <pop units="%">41.0</pop>
   </almanac>
</siteData>""";

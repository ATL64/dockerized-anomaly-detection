# dockerized-anomaly-detection


      App currently hosted on google cloud here: http://35.242.195.100:8330/

      This  time-series based anomaly detection is based upon automated model selection based on AIC. 
      The candidate models for each time series are ARIMA models of different orders (seasonal and non seasonal).
      Given a table with counts, dates and dimensions, this code will automatically generate tens of thousands of forecasts 
      and identify which measurements (of the last day), are 'anomalies'. This is described by the alert level.
      All frontend for this app is fully dynamic, solely depending on the input table with the time series and dimensions.

      The input table (called db_data in the code), should have the format given by an SQL like:
      SELECT date(timestamp) as date, count(views) as views, location, product 
      FROM some_table 
      GROUP BY date, location, product 
      ORDER BY DATE
      
      Code for backend and frontend of the app available at: https://github.com/ATL64/anomaly-detection

    
Observations:
    - This was an experiment, and do not recommend using this in production, partly because of the messy code which was written in one go.  More important though are the learnings below.
    
   - For an e-commerce use case, it is much better to sacrifice the visualization and focus on the detection.  No need to 'see' the ones that are not anomalies, and in practice it is better to just consider a few hundred or less time series.
   
   - Instead of observing daily counts, it is way more practical to look at hourly counts, minute counts being even better.  This is because the curves are much smoother and exhibit daily periodicity.  The usual drops or spikes in a BI scenario are much more identfiable this way rather than looking at the daily counts.
   
   - Instead of R and shiny server, I would try Python for the next attempt.  This is because in case of productionizing the system, it will be much easier to mantain Python (given it's popularity) instead of R code.  It also lends itself better for making a proper app in my point of view.  
   
   - To run this, build the image and then  ``` sudo docker run -d -p 8330:80 image_name```

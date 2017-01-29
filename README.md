# dockerized-anomaly-detection


      App currently hosted on Digital Ocean here: http://45.55.221.209/

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

      If you wish to implement this for your company some minor changes might be needed.
      For more information write me at ATL64x@gmail.com
 <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript">
    google.load('visualization', '1', {packages: ['geochart']});

    function drawVisualization() {
      var data = new google.visualization.DataTable();
      data.addRows(7);
      data.addColumn('string', 'Country');
      data.addColumn('number', 'Confirmed malaria cases');
      data.setValue(0, 0, 'Germany');
      data.setValue(0, 1, 2000);
      data.setValue(1, 0, 'United States');
      data.setValue(1, 1, 3000);
      data.setValue(2, 0, 'Brazil');
      data.setValue(2, 1, 4000);
      data.setValue(3, 0, 'Canada');
      data.setValue(3, 1, 5000);
      data.setValue(4, 0, 'France');
      data.setValue(4, 1, 6000);
      data.setValue(5, 0, 'RU');
      data.setValue(5, 1, 7000);
      data.setValue(6, 0, 'India');
      data.setValue(6, 1, 3000);
      
      var geochart = new google.visualization.GeoChart(
          document.getElementById('visualization'));
      geochart.draw(data, {width: 556, height: 347});
    }
    

    google.setOnLoadCallback(drawVisualization);
  </script>
<div id="visualization"></div>
  
Bivariate Scatter Plots for GeoJSON Feature Collections
=======================================================

This is an extremely simple plug-in for D3 that generates an SVG-based bivariate scatter plot for a [GeoJSON][geojson] [Feature Collection][geojsonfc]. 

This code was heavily influenced by [Mike Bostock's][bostock] [Scatterplots][bostocksp] example. In fact, you might even say I just straight-up copied the code and changed it to meet my needs. Because, that's exactly what I did. Thank you, Mike, for this example. 

## API

<a href="">#</a> d3.**bspGeoJson**(_collection_, _options_)

Create a bivariate scatter plot (BSP) that compares two properties of the [Features][geojsonf] in a [Feature Collection][geojsonfc]. Returns a reference to the D3 selection for the appended SVG with two additional functions described below.

The _collection_ parameter is required and **must** be a GeoJSON Feature collection. Behavior is undefined if this parameter is not a Feature Collection.

The _options_ parameter is required and allows you to define the following properties. Properties that must be defined are listed in bold face. 

* _**var1**_ : [String] The property that will be mapped to the x-axis.
* _**var2**_ : [String] The property that will be mapped to the y-axis.
* _**colorizer**_ : [Function] Determines the color for each dot based the classification of each variable.
* _**classifier**_ : [Function] Determines the class of a dot given a variable name and value.
* _id_ : [String] The ID of the container for the BSP, defaults to 'body'
* _margin_ : [Array] Array of numbers, must specify all; [top, right, bottom, left], defaults to [30, 10, 10, 10]
* _width_ : [Number] Width of the plot, defaults to 400 pixels
* _height_ : [Number] Height of the plot, defaults to 400 pixels. 
* _radius_ : [Number] Radius of each dot on the plot, defaults to 3.5px.
* _domainx_ : [Array | String] Defines the domain of the x-axis
    * An array of length two defines the lower and upper bounds
    * Using the string "max" defines the domain from 0 to the maximum value for that property in the collection, [nice-ified][nice].
    * All other values, including null, defines the domain as the extents of the property values in the collection, [nice-ified][nice].
* _domainy_ : [Array | String] Defines the domain of the y-axis
    * An array of length two defines the lower and upper bounds
    * Using the string "max" defines the domain from 0 to the maximum value for that property in the collection, [nice-ified][nice].
    * All other values, including null, defines the domain as the extents of the property values in the collection, [nice-ified][nice].
* _ticksx_ : [Number] The number of tick marks along the x-axis.
* _ticksy_ : [Number] The number of tick marks along the y-axis.
* _name1_ : [String] A more readable label that is used for the x-axis.
* _name2_ : [String] A more readable label that is used for the y-axis.
* _linker_ : [Function] Details to come...

<a href="">#</a> bspGeoJson.**updateVariables**(_var1_, _var2_)

Updates the BSP to compare two different properties of the [Features][geojsonf] in a [Feature Collection][geojsonfc]. 

<a href="">#</a> bspGeoJson.**updateVariablesWithNames**(_var1_, _name1_, _var2_, _name2_)

Updates the BSP to compare two different properties of the [Features][geojsonf] in a [Feature Collection][geojsonfc] including more readable names.

### Linking Functionality

Details to come.

### Example Usage

```HTML 

<html lang="en">
<head>
  <script src="//d3.v3.min.js" charset="utf-8"></script>
  <script src="//d3.bspGeoJson.min.js"></script>
  <link href="//d3.bspGeoJson.css" rel='stylesheet' />
</head>
<body>
  <script type="text/javascript">
    d3.json('collection.json', function (error, collection) {
      if (error) { 
        return console.warn(error); 
      }

      d3.bspGeoJson(collection, {
        'var1' : 'gdp',
        'var2' : 'gnp',
        'classifier' : classifier,
        'colorizer' : colorizer
      });
    })

    function classifier (name, value) {
        ...
    }

    function colorizer (cls1, cls2) {
        ...
    }

  </script>
</body>
</html>

```

<!-- Links -->

[bostock]: http://bost.ocks.org/mike/
[bostocksp]: http://bl.ocks.org/mbostock/3887118
[geog461w]: http://bulletins.psu.edu/undergrad/courses/G/GEOG/461W
[geog461wfp]: http://www.geovista.psu.edu/resources/geog461w.html
[geojson]: http://geojson.org/
[geojsonf]: http://geojson.org/geojson-spec.html#feature-objects
[geojsonfc]: http://geojson.org/geojson-spec.html#feature-collection-objects
[nice]: https://github.com/mbostock/d3/wiki/Quantitative-Scales#linear_nice

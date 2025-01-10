// Making a API call to a flask server;
console.log('Crime stats is loaded')
async function init() {
    try {
        const data = await d3.json('/api/CrimeStats');
        console.log(data);

        // Check if the Cities field exists and is an array
        if (data) {
            let Cities = [...new Set(data.map(obj => obj.Cities))]
            //console.log(Cities);

            // Use d3 to select the dropdown with id of `#selDataset`
            let dropdownMenu = d3.select("#selDataset");

            // Use the list of city names to populate the select options
            Cities.forEach((city) => {
                dropdownMenu.append("option").text(city).property("value", city);
                console.log(city);
            });
                // Get the first sample from the list
                const firstCity = Cities[0];

                // Build charts and metadata panel with the first sample
                buildCharts(firstCity);
                buildMetadata(firstCity);
                console.log(firstCity);
        
        } else {
            console.error("Cities is not defined or is not an array.");
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}


// Function for event listener
function optionChanged(newCity) {
    // Build charts and metadata panel each time a new sample is selected
    buildCharts(newCity);
    buildMetadata(newCity);
}
// Build the metadata panel
async function buildMetadata(city) {
    const data = await d3.json('/api/CrimeStats')
    console.log("city");
    console.log(city);
 // get the metadata field
    let Violation = data.Violation
 // Filter the metadata for the object with the desired sample number
    let result = Violation.filter(meta => meta.Cities == city)[0]
 // Use d3 to select the panel with id of `#sample-metadata`
    let panel = d3.select("#sample-metadata");
 // Use `.html("") to clear any existing metadata
    panel.html("");
 // Inside a loop, you will need to use d3 to append new
 // tags for each key-value in the filtered metadata.
    Object.entries(result).forEach(([key, value]) => {
        panel.append("h6").text(`${key}: ${value}`);
        console.log(result);
    });
}

init()
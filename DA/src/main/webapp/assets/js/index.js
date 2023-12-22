// Define the API host
const host = "https://provinces.open-api.vn/api/";

// Function to call the API and render province data for Hà Nội
var callAPIForHanoi = () => {
    return axios.get(`${host}p/1?depth=2`)
        .then((response) => {
            renderData([response.data], "province");
            // Trigger the change event to update the dependent dropdowns
            $("#province").change();
        })
        .catch((error) => {
            console.error('Error fetching Hà Nội province data:', error);
        });
}

// Call the API for Hà Nội
callAPIForHanoi();

// Functions to call API and render district and ward data
var callApiDistrict = (api) => {
    return axios.get(api)
        .then((response) => {
            renderData(response.data.districts, "district");
        })
        .catch((error) => {
            console.error('Error fetching district data:', error);
        });
}

var callApiWard = (api) => {
    return axios.get(api)
        .then((response) => {
            renderData(response.data.wards, "ward");
        })
        .catch((error) => {
            console.error('Error fetching ward data:', error);
        });
}

// Function to render data in the dropdown
var renderData = (array, select) => {
    // Get the existing options
    const existingOptions = document.querySelector("#" + select).innerHTML;

    // Create new options based on the array
    let newOptions = '<option value="">chọn</option>';
    array.forEach(element => {
        newOptions += `<option value="${element.code}">${element.name}</option>`;
    });

    // Append the new options to the existing ones
    document.querySelector("#" + select).innerHTML = existingOptions + newOptions;
}

// Event listeners for dropdown changes
$("#province").change(() => {
    callApiDistrict(`${host}p/${$("#province").val()}?depth=2`);
});

$("#district").change(() => {
    callApiWard(`${host}d/${$("#district").val()}?depth=2`);
});

$("#ward").change(() => {
    printResult();
});

// Function to print the selected address
var printResult = () => {
    const provinceText = $("#province option:selected").text();
    const districtText = $("#district option:selected").text();
    const wardText = $("#ward option:selected").text();

    if (districtText !== "" && provinceText !== "" && wardText !== "") {
        let result = `${provinceText} ,${districtText} ,${wardText} `;
        $("#result").text(result);
    }
}

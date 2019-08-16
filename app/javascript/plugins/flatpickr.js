import flatpickr from "flatpickr"
require("flatpickr/dist/themes/dark.css");
// import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


flatpickr("#query_starting_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#query_ending_date"})]
})


flatpickr("#booking_starting_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#booking_ending_date"})]
})

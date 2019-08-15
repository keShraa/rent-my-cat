import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


flatpickr("#cats_starting_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#cats_ending_date"})]
})

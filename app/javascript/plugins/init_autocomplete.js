import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelectorAll('#flat_address');
  addressInput.forEach((input) => {
    if (addressInput) {
      places({ container: input });
    }
  })
};

export { initAutocomplete };

// Declarations
const categoryNameFirst = document.querySelector('.category-name');
console.log(categoryNameFirst);
const categoryNames = document.querySelectorAll('.category-name');
let categorySelected = undefined;

// Functions

function addHighlight(e) {
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });
  e.target.classList.add('categoryNameHighlight');
  categorySelected = e.target
}


function underline(e) {
  console.log('highlighting!');
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });

  e.target.classList.add('categoryNameHighlight');
}

function underlineCategorySelected() {
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });
  categorySelected.classList.add('categoryNameHighlight');
}


// Event Listeners

categoryNames.forEach((name) => {
  name.addEventListener('click', addHighlight);
});

categoryNames.forEach((name) => {
  name.addEventListener('mouseover', underline);
});

categoryNames.forEach((name) => {
  name.addEventListener('mouseout', underlineCategorySelected);
});

// Initializer
categoryNameFirst.classList.add('categoryNameHighlight');


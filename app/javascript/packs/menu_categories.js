// Declarations
const categoryNameFirst = document.querySelector('.category-name');
const categoryNames = document.querySelectorAll('.category-name');
let selectedCategory = categoryNames[0];
const menuBox = document.querySelector('.menu-items');

function addHighlight(e) {
  selectedCategory = e.target;
  console.log(selectedCategory);
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });
  e.target.classList.add('categoryNameHighlight');

}


function underline(e) {
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });
  e.target.classList.add('categoryNameHighlight');
}

function underlineCategorySelected() {
  console.log(selectedCategory);
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });
  selectedCategory.classList.add('categoryNameHighlight');
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


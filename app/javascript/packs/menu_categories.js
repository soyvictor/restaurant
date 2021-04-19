// Declarations
const categoryNameFirst = document.querySelector('.category-name');
const categoryNames = document.querySelectorAll('.category-name');
let selectedCategory = categoryNames[0];
const menuBox = document.querySelector('.menu-items');

//begin intersection observer code

const intersectionWatch = document.querySelectorAll('.intersection');
let options = {
  root: null,
  rootMargin: "-50% 0px -50% 0px",
  // rootMargin: "-200px 0px 100px 0px",
  // threshold: 0.01
}
function addHighlightIntersection(element) {
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });
  categoryNames.forEach((name) => {
    if (name.innerText === element) {
      name.classList.add('categoryNameHighlight');
      categorySelected = name;
    }
  });
}


function obCallBack(entries) {
  entries.forEach(entry => {
    if( entry.isIntersecting) {
      // console.log("intersecting");
      const element = entry.target.classList[0];
      addHighlightIntersection(element);
    }
  })
}

let observer = new IntersectionObserver(obCallBack, options);

intersectionWatch.forEach((category) => {
  observer.observe(category)
});

// function addHighlight(e) {
//   selectedCategory = e.target;
//   console.log(selectedCategory);
//   categoryNames.forEach((name) => {
//      name.classList.remove('categoryNameHighlight');
//   });
//   selectedCategory.classList.add('categoryNameHighlight');
// }


// end intersection observer code


// function underline(e) {
//   categoryNames.forEach((name) => {
//     name.classList.remove('categoryNameHighlight');
//   });
//   e.target.classList.add('categoryNameHighlight');
// }

// function underlineCategorySelected() {
//   console.log(selectedCategory);
//   categoryNames.forEach((name) => {
//     name.classList.remove('categoryNameHighlight');
//   });
//   selectedCategory.classList.add('categoryNameHighlight');
// }


// Event Listeners

// categoryNames.forEach((element) => {
//   console.log(element);
//   element.addEventListener('click', addHighlight);
// });

// categoryNames.forEach((name) => {
//   name.addEventListener('mouseover', underline);
// });

// categoryNames.forEach((name) => {
//   name.addEventListener('mouseout', underlineCategorySelected);
// });

// Initializer
categoryNameFirst.classList.add('categoryNameHighlight');


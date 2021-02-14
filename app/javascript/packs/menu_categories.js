// Declarations
const categoryNameFirst = document.querySelector('.category-name');
const categoryNames = document.querySelectorAll('.category-name');
let categorySelected = categoryNames[0];  // Not sure if this is correct syntax
const intersectionWatch = document.querySelectorAll('.intersection');
const menuBox = document.querySelector('.menu-items')

// const menuHeading = document.querySelector('#order');
// Functions

// function conlog() {
//   console.log(menuHeading.getBoundingClientRect().top);
// }

// window.addEventListener('scroll', conlog);

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


function obCallBack(payload) {
  if(payload[0].intersectionRatio === 1) {
    console.log('Changed Categories');
    const element = payload[0].target.id;
    console.log(element);
    addHighlightIntersection(element);
  }

}

const ob = new IntersectionObserver(obCallBack, { threshold: 1, rootMargin: "-40% 0px -40% 0px" });
// 150 and 400
intersectionWatch.forEach((category) => {
  ob.observe(category)
});




function addHighlight(e) {
  categoryNames.forEach((name) => {
    name.classList.remove('categoryNameHighlight');
  });
  e.target.classList.add('categoryNameHighlight');
  categorySelected = e.target;
}


function underline(e) {
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


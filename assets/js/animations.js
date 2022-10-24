
function animateHeroImage(selector) {
    const tl = new gsap.timeline({ scrollTrigger: selector })
    tl.fromTo(
        selector,
        3,
        { css: { opacity: 0, width: '0px', height: '0px', marginLeft: '38em', marginTop: '25em' } },
        { css: { opacity: 1, width: '300px', height: '300px', marginLeft: '38em', marginTop: '0em' } }
      )
}

function animateBoxBorders(selector) {
  const boxes = document.querySelectorAll(selector)
  const tl = new gsap.timeline({ scrollTrigger: boxes })
  
  tl.fromTo(
    boxes,
    3,
    {borderWidth: "thick"},
    {borderWidth: "thin"}
  )
  
}



function callHomeAnimations() {
  //animateBoxBorders(".card-wrapper")
  animateHeroImage('.plant-hero')
}

document.addEventListener('DOMContentLoaded', function (event) {
    window.addEventListener('load', function () {
      gsap.registerPlugin(ScrollTrigger)
      callHomeAnimations()
    })
  })


  callHomeAnimations()
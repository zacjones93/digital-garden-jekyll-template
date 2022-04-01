
function animateHeroImage(selector) {
    const tl = new gsap.timeline({ scrollTrigger: selector })
    tl.fromTo(
        selector,
        3,
        { css: { opacity: 0, width: '0px', height: '0px', marginLeft: '60em'} },
        { css: { opacity: 1, width: '300px', height: '300px', marginLeft: '38em' } }
      )
}

function animateTopicBoxes(selector) {
  const boxes = document.querySelectorAll(selector)

  boxes.forEach((box) => {
    gsap.fromTo(box, 
      {
        display: 'none',
        height: 0,
        padding: '1em',
        margin: '.5em',
        background: '#CCF2D4', 
        borderRadius: '4px', 
        border: '1px solid #27D6B8', 
        width: '12em',
        duration: .5,
      },
      {
      display: 'block',
      height: 'inherit',
      padding: '1em',
      margin: '.5em',
      background: '#CCF2D4', 
      borderRadius: '4px', 
      border: '1px solid #27D6B8', 
      width: '12em',
      ease: 'none',
      duration: 3,
    })
  })
}


function callHomeAnimations() {
  //animateTopicBoxes(".card-wrapper")
  animateHeroImage('.plant-hero')
}

document.addEventListener('DOMContentLoaded', function (event) {
    window.addEventListener('load', function () {
      gsap.registerPlugin(ScrollTrigger)
      callHomeAnimations()
    })
  })


  callHomeAnimations()
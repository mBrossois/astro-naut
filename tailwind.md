# Tailwind CSS Cheatsheet

## Layout

### Display
| Class | CSS |
|-------|-----|
| `block` | `display: block` |
| `inline-block` | `display: inline-block` |
| `inline` | `display: inline` |
| `flex` | `display: flex` |
| `inline-flex` | `display: inline-flex` |
| `grid` | `display: grid` |
| `hidden` | `display: none` |

### Position
```
static  relative  absolute  fixed  sticky
inset-0          → top/right/bottom/left: 0
inset-x-0        → left/right: 0
inset-y-0        → top/bottom: 0
top-4  right-4  bottom-4  left-4
z-10  z-20  z-50  z-auto
```

---

## Flexbox

```html
<div class="flex flex-row gap-4 items-center justify-between flex-wrap">

<!-- Direction -->
flex-row  flex-col  flex-row-reverse  flex-col-reverse

<!-- Justify (main axis) -->
justify-start  justify-center  justify-end
justify-between  justify-around  justify-evenly

<!-- Align (cross axis) -->
items-start  items-center  items-end  items-stretch  items-baseline

<!-- Align Self -->
self-start  self-center  self-end  self-stretch

<!-- Wrap -->
flex-wrap  flex-nowrap  flex-wrap-reverse

<!-- Grow / Shrink -->
flex-1   → flex: 1 1 0%
flex-auto → flex: 1 1 auto
flex-none → flex: none
grow  grow-0  shrink  shrink-0

<!-- Gap -->
gap-4  gap-x-4  gap-y-2
```

---

## Grid

```html
<div class="grid grid-cols-3 gap-4">

<!-- Columns -->
grid-cols-1  grid-cols-2  grid-cols-3 ... grid-cols-12
grid-cols-none

<!-- Rows -->
grid-rows-1  grid-rows-2  grid-rows-3 ... grid-rows-6

<!-- Column Span -->
col-span-1  col-span-2  col-span-full
col-start-1  col-end-3

<!-- Row Span -->
row-span-2  row-span-full

<!-- Auto -->
grid-flow-row  grid-flow-col  grid-flow-dense
auto-cols-auto  auto-cols-fr  auto-rows-auto  auto-rows-fr
```

---

## Spacing

### Padding & Margin Scale
```
0=0  1=0.25rem  2=0.5rem  3=0.75rem  4=1rem  5=1.25rem
6=1.5rem  8=2rem  10=2.5rem  12=3rem  16=4rem
20=5rem  24=6rem  32=8rem  40=10rem  48=12rem  64=16rem
```

```
p-4    → padding: 1rem
px-4   → padding-left/right: 1rem
py-2   → padding-top/bottom: 0.5rem
pt-1  pr-2  pb-3  pl-4

m-4  mx-auto  my-8  mt-2  mr-4  mb-6  ml-0
-m-4   → negative margin
space-x-4  → margin between horizontal children
space-y-2  → margin between vertical children
```

---

## Sizing

```
w-0  w-1  w-4  w-8  w-16  w-32  w-64
w-1/2  w-1/3  w-2/3  w-1/4  w-3/4
w-full  w-screen  w-auto  w-fit  w-min  w-max
w-[200px]  → arbitrary value

h-0  h-4  h-16  h-32  h-64
h-full  h-screen  h-auto  h-fit  h-min  h-max
h-svh  h-dvh  h-lvh

min-w-0  min-w-full  max-w-sm  max-w-md  max-w-lg
max-w-xl  max-w-2xl  max-w-4xl  max-w-7xl  max-w-full  max-w-none

size-4  → width & height: 1rem (shorthand)
```

---

## Typography

```
<!-- Font Family -->
font-sans  font-serif  font-mono

<!-- Font Size -->
text-xs  text-sm  text-base  text-lg  text-xl
text-2xl  text-3xl  text-4xl  text-5xl  text-6xl  text-9xl

<!-- Font Weight -->
font-thin  font-light  font-normal  font-medium
font-semibold  font-bold  font-extrabold  font-black

<!-- Font Style -->
italic  not-italic

<!-- Line Height -->
leading-none  leading-tight  leading-snug  leading-normal
leading-relaxed  leading-loose  leading-3 ... leading-10

<!-- Letter Spacing -->
tracking-tighter  tracking-tight  tracking-normal
tracking-wide  tracking-wider  tracking-widest

<!-- Text Alignment -->
text-left  text-center  text-right  text-justify

<!-- Text Color -->
text-gray-500  text-blue-600  text-red-500  text-white  text-black
text-[#ff5733]  → arbitrary

<!-- Text Decoration -->
underline  overline  line-through  no-underline
decoration-blue-500  decoration-2  decoration-dotted

<!-- Text Transform -->
uppercase  lowercase  capitalize  normal-case

<!-- Overflow -->
truncate  text-ellipsis  text-clip  whitespace-nowrap
overflow-hidden  overflow-ellipsis

<!-- Vertical Align -->
align-top  align-middle  align-bottom  align-baseline
```

---

## Backgrounds & Colors

```
<!-- Background Color -->
bg-white  bg-black  bg-transparent
bg-gray-100  bg-blue-500  bg-red-600
bg-[#custom]

<!-- Opacity -->
bg-opacity-50  (or use bg-blue-500/50)
text-black/75   → text with 75% opacity

<!-- Gradient -->
bg-gradient-to-r  from-blue-500  to-purple-600
bg-gradient-to-br  from-pink-500  via-red-500  to-yellow-500

<!-- Background Size / Position -->
bg-cover  bg-contain  bg-auto
bg-center  bg-top  bg-bottom  bg-left  bg-right
bg-no-repeat  bg-repeat  bg-repeat-x  bg-repeat-y
```

---

## Borders

```
<!-- Border Width -->
border  border-0  border-2  border-4  border-8
border-t  border-r  border-b  border-l
border-x  border-y

<!-- Border Color -->
border-gray-300  border-blue-500

<!-- Border Style -->
border-solid  border-dashed  border-dotted  border-double  border-none

<!-- Border Radius -->
rounded-none  rounded-sm  rounded  rounded-md  rounded-lg
rounded-xl  rounded-2xl  rounded-3xl  rounded-full
rounded-t-lg  rounded-r-md  rounded-b-sm  rounded-l-full
rounded-tl-lg  rounded-tr-md

<!-- Divide (between children) -->
divide-x  divide-y  divide-x-2
divide-gray-300  divide-solid
```

---

## Effects & Filters

```
<!-- Shadow -->
shadow-sm  shadow  shadow-md  shadow-lg  shadow-xl  shadow-2xl  shadow-none
shadow-blue-500/50  → colored shadow

<!-- Opacity -->
opacity-0  opacity-25  opacity-50  opacity-75  opacity-100

<!-- Blur -->
blur-none  blur-sm  blur  blur-md  blur-lg  blur-xl  blur-3xl

<!-- Backdrop -->
backdrop-blur-sm  backdrop-blur-md  backdrop-blur-xl
backdrop-brightness-50  backdrop-grayscale

<!-- Mix Blend Mode -->
mix-blend-multiply  mix-blend-screen  mix-blend-overlay

<!-- Ring (focus rings) -->
ring  ring-2  ring-4  ring-blue-500  ring-offset-2
```

---

## Transitions & Animations

```
<!-- Transition -->
transition  transition-all  transition-colors
transition-opacity  transition-transform  transition-shadow

duration-75  duration-100  duration-150  duration-200
duration-300  duration-500  duration-700  duration-1000

ease-linear  ease-in  ease-out  ease-in-out
delay-75  delay-100  delay-150  delay-300

<!-- Transform -->
scale-50  scale-75  scale-100  scale-110  scale-150
scale-x-75  scale-y-110
rotate-0  rotate-45  rotate-90  rotate-180  -rotate-45
translate-x-4  translate-y-2  -translate-x-full
skew-x-3  skew-y-6
transform-gpu  → GPU acceleration

<!-- Animate (built-in) -->
animate-spin  animate-ping  animate-pulse  animate-bounce  animate-none
```

---

## Responsive Design

Breakpoints (mobile-first):
```
sm:   640px+
md:   768px+
lg:   1024px+
xl:   1280px+
2xl:  1536px+
```

```html
<div class="w-full md:w-1/2 lg:w-1/3">
<p class="text-sm md:text-base lg:text-lg">
<div class="hidden lg:block">
<div class="flex flex-col md:flex-row">
```

---

## State Variants

```
hover:bg-blue-600  hover:scale-105  hover:shadow-lg
focus:outline-none  focus:ring-2  focus:ring-blue-500
focus-within:ring-2  focus-visible:ring-2
active:scale-95
disabled:opacity-50  disabled:cursor-not-allowed
checked:bg-blue-500
placeholder:text-gray-400

group          → on parent
group-hover:text-white  → on child

peer           → on sibling
peer-checked:text-blue-500

dark:bg-gray-900  dark:text-white  → dark mode
```

---

## Interactivity

```
cursor-pointer  cursor-not-allowed  cursor-wait  cursor-grab  cursor-default
select-none  select-text  select-all
pointer-events-none  pointer-events-auto
resize  resize-none  resize-x  resize-y
appearance-none
outline-none  outline  outline-2  outline-blue-500
list-none  list-disc  list-decimal
```

---

## Overflow & Visibility

```
overflow-hidden  overflow-scroll  overflow-auto  overflow-visible
overflow-x-hidden  overflow-y-auto
overscroll-contain  overscroll-none

visible  invisible
opacity-0  opacity-100

sr-only   → visually hidden but accessible
not-sr-only
```

---

## Tailwind Config

```js
// tailwind.config.js
module.exports = {
  content: ['./src/**/*.{html,js,jsx,ts,tsx,svelte,astro}'],
  darkMode: 'class', // or 'media'
  theme: {
    extend: {
      colors: {
        brand: '#ff5733',
        primary: { 500: '#3b82f6', 600: '#2563eb' },
      },
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans],
      },
      spacing: { '128': '32rem' },
      screens: { '3xl': '1920px' },
      borderRadius: { '4xl': '2rem' },
      keyframes: {
        wiggle: {
          '0%, 100%': { transform: 'rotate(-3deg)' },
          '50%': { transform: 'rotate(3deg)' },
        },
      },
      animation: {
        wiggle: 'wiggle 1s ease-in-out infinite',
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
  ],
};
```

---

## Custom Classes with @apply

```css
/* In your CSS file */
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer components {
  .btn-primary {
    @apply px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition;
  }
}

@layer utilities {
  .text-shadow {
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
  }
}
```

---

## Arbitrary Values

```html
<!-- Any value in brackets -->
<div class="w-[200px] h-[calc(100vh-4rem)]">
<p class="text-[14px] text-[#ff5733]">
<div class="top-[117px] left-[calc(50%-11rem)]">
<div class="bg-[url('/img/hero.png')]">
<div class="grid-cols-[1fr_2fr_1fr]">

<!-- CSS variables -->
<div class="bg-[--my-color]">
```
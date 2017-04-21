# Neat class generator

Generates css classes from Neat grids.

# Installation

## NPM

- `npm install --save neat-class-generator`

## Bower
- `bower install neat-class-generator`

# Documentation

`@include grid-generate-classes()` will generate classes for a grid map that is
passed in to it.

Classes will be generated using the `class:` property of the grid map.
**This property is required** and will be appended to the generated classes for
that grid. As an example defining the property as `class: my-grid`, this would
result in a class name of `.my-grid-column-2-of-12`, etc. This property must be
defined prior to the `grid-generate-classes` mixin being called.

<strong>example SCSS</strong>
```SCSS
@include grid-generate-classes($neat-grid);
```
<strong>example CSS</strong>
```CSS

.grid-column-1-of-12 {
  width: calc(8.33333% - 21.66667px);
  float: left;
  margin-left: 20px; }

.grid-column-2-of-12 {
  width: calc(16.66667% - 23.33333px);
  float: left;
  margin-left: 20px; }

.grid-column-3-of-12 {
  width: calc(25% - 25px);
  float: left;
  margin-left: 20px; }

// etc…
```

<strong>example SCSS</strong>
```SCSS
$custom-neat-grid: (
  class: custom,
  columns: 12,
  gutter: 50px,
  media: 1000px,
);

@include grid-generate-classes($custom-neat-grid);
```
<strong>example CSS</strong>
```CSS

@media only screen and (min-width: 1000px) {
  .custom-column-1-of-12 {
    width: calc(8.33333% - 54.16667px);
    float: left;
    margin-left: 50px; }
  .custom-column-2-of-12 {
    width: calc(16.66667% - 58.33333px);
    float: left;
    margin-left: 50px; }
  .custom-column-3-of-12 {
    width: calc(25% - 62.5px);
    float: left;
    margin-left: 50px; }

  // etc…
}
```

## Generated classes

Neat class generator will create classes for each of Neat's mixin properties
in the order in which they are generated. Since `grid-container` does not change
it is only generated once, under the name `.grid-container`.

The following is a manifest of all generated classes, with `{class}` standing in
for the grid map's `class:` property and `{column}` standing in
for the grid map's `column:` property. If the grid contains a `media:` property,
the generated classes will automatically be wrapped in the appropriate
media query.

1. `.{class}-column-1-of-{column}` to `.{class}-column-{column}-of-{column}`
2. `.{class}-push-neg-{column}-of-{column}` (negative) to `.{class}-push-{column}-of-{column}`
3. `.{class}-shift-neg-{column}-of-{column}` (negative) to `.{class}-shift-{column}-of-{column}`
4. `.{class}-visual`
5. `.{class}-collapse`
6. `.grid-container`

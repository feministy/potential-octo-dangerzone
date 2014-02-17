# Taco Town

Welcome to Taco Town, my favorite restaurant *in the world*.

Here at Taco Town, we only accept orders that challenge our brains and
make us question our sanity by solving the knapsack problem. Just for
fun, and because it gives us an excuse for slow order time.

Taco Town is a DIY pop-up restaurant. To get started, you'll need:

* some sort of file, preferably comma separated, that contains
 - on the first line: your requested order total
 - on the subsequent lines: one menu item followed by a price in US currency (ex: 'extra cheesey taco,$29.98')

## Starting your own restaurant

1. Place your menu file in the `lib` folder.
2. Start up a new restaurant using the path to your menu file:

```ruby
diner = Restaurant.new('path/to/file')
```

3. Process your restaurant's inventory:

```ruby
diner.process_inventory
```

4. Set up your menu and open your doors:

```ruby
diner.open_for_business
```

5. When you're ready to see all of your order options, run:

```ruby
diner.order_options
```

And voila! Enjoy your food.

## Technical requirements

This code is written and tested for Ruby 2.0.0.

To run tests, you will need to install RSpec. This uses version 2.14.1
and should be backwards compatible with any RSpec version that uses the
`expect` syntax.

## Running tests

First, if you don't have a recent version of RSpec:

```
gem install rspec
```

And then, I'm sorry this is so hard, run:

```
rspec
```

(*giggles*)



# Gilded Rose

## Requirements:
  - Each item has a name, sell in and quality
    - At the end of each day sell in decreases by 1 (unless it is 0)
    - Quality:
      - Quality decreases by 1 if sell in => 0
      - Quality decreases by 2 if sell in < 0
      - Quality can not be below 0 or above 50

    - Exceptions
      - Aged Brie increases in quality (until it gets to 50)
      - Sulfuras never have to be sold and don't decrease in quality
      - Backstage Passes
        - increase in quality as SellIn value approaches
        - increase in quality by 2 when there are 10 days or less
        - increase in quality by 3 when there are 5 days or less
        - quality drops to 0 after the concert
      - 'Conjured' items degrade in Quality twice as fast as normal items


## My process

1. Set up the project
    - Run bundle init
    - Run rspec init
    - Create README
    - Reorganise file structure
    - Add simplecov gem for coverage report
    - Add rubocop gem for linting

3. Separate out item and shop class.

2. Write tests in line with the requirements given. I followed the steps above to help me form each test.

3. Remove each type of item into its own method for calculating the change in quality and sell in and ensure all the tests still pass.

4. Add in conjured items using the same method as laid out above.

## Still to do:

- Refactor tests
- Turn each product into its own class
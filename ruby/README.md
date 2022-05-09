# Gilded Rose

## Initial set up
- bundle init
- rspec init
- create README
- reorganise file structure
- add simplecov gem for coverage report
- add rubocop gem for linting

## Gilded rose rules:
  - Each item has a name, SellIn, quality
    - At the end of each day SellIn decreases by 1 (unless it is 0)
    - Quality:
      - Quality decreases by 1 if SellIn => 0
      - Quality decreases by 2 if SellIn < 0
      - Quality can not be below 0 or above 50

    - Exceptions
      - Aged Brie increases in quality (until it gets to 50)
      - Sulfuras never have to be sold and don't decrease in quality
      - Backstage Passes
        - increase in quality as SellIn value approaches
        - increase in quality by 2 when there are 10 days or less
        - increase in quality by 3 when there are 5 days or less
        - quality drops to 0 after the concert
      - “Conjured” items degrade in Quality twice as fast as normal items
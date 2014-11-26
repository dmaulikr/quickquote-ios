Feature: Test

Scenario Outline: View correct premium for different combinations of age, gender, state etc

     Given I want a car insurance quote
     When I submit my  details '<age>', '<gender>', '<state>', '<year>' & '<make>' for a car insurance quote
     Then I should see the correct '<premium>' shown

    Examples:
      |  age |  gender  |  state             | year | make             |  premium  |
      |  23  |  male    |  New South Wales   | 2000	| BMW              |  $55.54   |
      |  70  |  female  |  Victoria          | 2014	| Alfa Romeo       |  $137.51  |
      |  100 |  female  |  Queensland        | 2005 | Audi             |  $230.8   |
      |  18  |  female  |  Western Australia | 1999	| BMW              |  $51.73   |



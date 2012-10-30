Feature: display list of movies sorted by different criteria keeping session
 
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies filtered and sorted by title or release date after some use of the application

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page

Scenario: sort movies alphabetically, add new movie and keep session
  When I follow "Movie Title"
  Then I should see "Amelie" before "When Harry Met Sally"
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Fight Club"
  And I select "R" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  Then I should see "Amelie" before "When Harry Met Sally"

Scenario: sort movies in increasing order of release date, see info about a movie and keep session
  When I follow "Release Date"
  Then I should see "When Harry Met Sally" before "Amelie"
  When I follow "More about Aladdin"
  Then I follow "Back to movie list"
  Then I am on the RottenPotatoes home page
  Then I should see "When Harry Met Sally" before "Amelie"

Scenario: restrict to movies with 'PG' or 'R' or 'G' ratings, sort movies in increasing order of release date, add new movies and keep session

  When I check the following ratings: G, PG, R
  And I uncheck the following ratings: NC-17, PG-13
  And I press "ratings_submit"
  Then I am on the RottenPotatoes home page
  And I should see "Aladdin"
  And I should not see "Chocolat"

  When I follow "Release Date"
  Then I should be on the RottenPotatoes home page
  Then I should see "When Harry Met Sally" before "Amelie"

  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Fight Club"
  And I select "R" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  And I should see "Aladdin"
  And I should not see "Chocolat"
  Then I should see "When Harry Met Sally" before "Amelie"



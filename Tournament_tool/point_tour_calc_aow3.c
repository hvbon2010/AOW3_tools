/*
 * AOW3 - Gear Game
 * Calculate the points of the tournament
 * Author: Bon Ho Van (bonban, BonBan_EOL)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

/* In the tournament, for the first win, you will get the START_VALUE_POINT for the tournament points.
 * After each consecutive win, the score will be increased gradually until the maximum point.
 * If you fail, the tournament points will be reset to their START_VALUE_POINT.
 * The START_VALUE_XXX_LEAGUE & MAX_VALUE_XXX_LEAGUE will be +1 for the higher league.
 */
#define START_VALUE_STEEL_LEAGUE  7
#define MAX_VALUE_STEEL_LEAGUE    START_VALUE_STEEL_LEAGUE + 10

#define MAX_INPUT_STRING          128
#define NUMBER_OF_BATTLES         30

/* the leagues in the tournament */
typedef enum league {
  STEELL = 0,
  BROZEN,
  SILVER,
  GOLD,
  DIAMOND,
  STAR
} league_t;

static int compare( const void* a, const void* b)
{
  int int_a = * ( (int*) a );
  int int_b = * ( (int*) b );

  if ( int_a == int_b ) return 0;
  else if ( int_a < int_b ) return -1;
  else return 1;
}

static void convert_integer_in_str_to_array(const char *int_in_str, int max_elements, int *int_array, int *num_elements) {
  char *end = (char *)int_in_str;
  int counter = 0;
  while(*end) {
    *(int_array + counter) = strtol(end, &end, 10);
    // printf("int_array[%d]: %d\n", counter, *(int_array + counter));
    while (*end == ',') {
      end++;
    }
    if(++counter >= max_elements) {
      break;
    }
  }
  *num_elements = counter;
}

/* calculate_maximum_points
 * Desc: Support to get the maximum tournament point that the user may get after 30 battles
 * Param:  league (enum)
 * Output: number of points (int)
 */
static int calculate_maximum_points(league_t league) {
  int max_points = 0;
  int start_value_in_league = START_VALUE_STEEL_LEAGUE+league;
  int max_value_in_league = MAX_VALUE_STEEL_LEAGUE+league;

  for(int i = 0; i < NUMBER_OF_BATTLES; i++) {
    if((start_value_in_league + i) >= max_value_in_league) {
      max_points += max_value_in_league;
    } else {
      max_points += start_value_in_league + i;
    }
  }
  return max_points;
}

/* total_points_after_battle (for all battles win)
 * Desc: Support to show total points after a battle
 * Param:  league (enum)
 */
static void total_points_after_battle(league_t league) {
  int total_points = 0;
  int start_value_in_league = START_VALUE_STEEL_LEAGUE+league;
  int max_value_in_league = MAX_VALUE_STEEL_LEAGUE+league;

  for(int i = 0; i < NUMBER_OF_BATTLES; i++) {
    if((start_value_in_league + i) >= max_value_in_league) {
      total_points += max_value_in_league;
    } else {
      total_points += start_value_in_league + i;
    }
    printf("[INFO] Total points after battle[%d]: %d\n", i+1, total_points);
  }
}

/* calculate_maximum_points_for_defeat_battles
 * Desc: Support to get the maximum tournament point that the user may get after 30 battles 
 * (if user have defeated battles in battle [...])
 * Param:  league (enum)
 * Output: number of points (int)
 */
static int calculate_maximum_points_for_defeat_battles(league_t league, const int *defeated_battles, int num_defeated, bool show_points) {
  int max_points = 0;
  int start_value_in_league = START_VALUE_STEEL_LEAGUE+league;
  int max_value_in_league = MAX_VALUE_STEEL_LEAGUE+league;
  int defeated_battles_l[30] = {0};
  int counter_of_defeated_battle = 0;
  int counter = 0;

  // for(int i = 0; i < num_defeated; i++) {
  //   printf("defeated_battles[%d]: %d\n", i, defeated_battles[i]);
  // }

  /* copy defeated_battles to defeated_battles_l */
  memcpy(defeated_battles_l, defeated_battles, num_defeated*sizeof(int));

  // printf("Before sort\n");
  // for(int i = 0; i < num_defeated; i++) {
  //   printf("defeated_battles_l[%d]: %d\n", i, defeated_battles_l[i]);
  // }

  /* sort of defeated battles */
  qsort(defeated_battles_l, num_defeated, sizeof(int), compare);
  // printf("After sort\n");
  // for(int i = 0; i < num_defeated; i++) {
  //   printf("defeated_battles_l[%d]: %d\n", i, defeated_battles_l[i]);
  // }

  for(int i = 0; i < NUMBER_OF_BATTLES; i++) {
    /* Compare defated battle with current battle
       If the defeated battel = current battle 
       => reset counter to get start point value for next win battle */ 
    if(defeated_battles_l[counter_of_defeated_battle] == (i+1)) {
      counter_of_defeated_battle++;
      if(show_points) {
        printf("[INFO] Total points after battle[%d]: %d\n", i+1, max_points);
      }
      /* Reset counter */
      counter = 0;
      continue;
    }

    if((start_value_in_league + counter) >= max_value_in_league) {
      max_points += max_value_in_league;
    } else {
      max_points += start_value_in_league + counter;
    }
    if(show_points) {
      printf("[INFO] Total points after battle[%d]: %d\n", i+1, max_points);
    }
    /* Increase counter */
    counter++;
  }
  return max_points;
}

int main()
{
  int league = STEELL;
  int defeated_battles[NUMBER_OF_BATTLES] = {0};
  int num_of_defeated_battles = 0;
  char in_defeated_battles[MAX_INPUT_STRING] = {0};
  int max_point = 0;

  printf("######CALCULATE the tournament points of AOW3 Game#########\n");
  /* Input your league */
  printf("[Input] Enter league: \n\
        STEELL  : 0\n\
        BROZEN  : 1\n\
        SILVER  : 2\n\
        GOLD    : 3\n\
        DIAMOND : 4\n\
        STAR    : 5\n\
        >>> ");
  scanf(" %d", &league);
  printf("[Input] Enter the list of defeated battles \n\
        If not, type 'N/n') [...]: ");
  scanf(" %[^\n]s", in_defeated_battles);
  if(strspn(in_defeated_battles, "0123456789, ") == strlen(in_defeated_battles)) {
    printf("############################################\n");
    printf("[INFO] defeated battles in string: %s\n", in_defeated_battles);
    printf("[INFO] Convert integer in string to array\n");
    convert_integer_in_str_to_array((const char *)in_defeated_battles, NUMBER_OF_BATTLES, defeated_battles, &num_of_defeated_battles);
    printf("[INFO] Number of defeated battles: %d\n", num_of_defeated_battles);
  }
  printf("############################################\n");
  max_point = calculate_maximum_points(league);
  printf("[INFO] Max points in your league: %d\n", max_point);
  printf("############################################\n");
  total_points_after_battle(league);
  if(num_of_defeated_battles != 0) {
    printf("############################################\n");
    max_point = calculate_maximum_points_for_defeat_battles(league, defeated_battles, num_of_defeated_battles, false);
    printf("[INFO] Max points if defeated battle at [%s]: %d\n", in_defeated_battles, max_point);
    calculate_maximum_points_for_defeat_battles(league, defeated_battles, num_of_defeated_battles, true);
  }
  printf("############################################\n");
  return 0;
}
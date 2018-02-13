json.name @team.name
json.favorite @team.favorite
json.id @team.id
json.max_scoring_goal_count @team.max_scoring_goal_count
json.max_missed_goal_count @team.max_missed_goal_count

json.team_with_closest_score do
  json.name @team.team_with_closest_score&.name
  json.total_score @team.team_with_closest_score&.total_score
end

json.team_with_max_score_margin do
  json.name @team.team_with_max_score_margin.name
  json.total_score @team.team_with_max_score_margin.total_score
end

json.matches {}

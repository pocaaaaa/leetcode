-- 출처 : https://leetcode.com/problems/find-emotionally-consistent-users/description
-- gimini 도움

SELECT 
    user_id, 
    dominant_reaction, 
    reaction_ratio
FROM (
    SELECT 
        user_id,
        MAX(reaction) KEEP (DENSE_RANK LAST ORDER BY reaction_count) AS dominant_reaction,
        ROUND(MAX(reaction_count) KEEP (DENSE_RANK LAST ORDER BY reaction_count) / total_user_reactions, 2) AS reaction_ratio,
        total_distinct_contents
    FROM (
        SELECT 
            user_id, 
            reaction, 
            COUNT(*) OVER (PARTITION BY user_id, reaction) AS reaction_count,
            COUNT(*) OVER (PARTITION BY user_id) AS total_user_reactions,
            COUNT(DISTINCT content_id) OVER (PARTITION BY user_id) AS total_distinct_contents
        FROM reactions
    )
    GROUP BY user_id, total_user_reactions, total_distinct_contents
)
WHERE total_distinct_contents >= 5 
  AND reaction_ratio >= 0.6
ORDER BY reaction_ratio DESC, user_id ASC;
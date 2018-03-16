df <- tribble(
  ~ Team, ~ Manager,
  'a', 'A',
  'a', 'B',
  'b', 'A',
  'b', 'B',
  'c', 'A',
  'd', 'B',
  'e', 'A',
  'e', 'B'
)

# 去除Team重复且Manager为B的记录
df %>% 
  group_by(Team) %>% 
  filter(!(length(Team) >= 2 & Manager == 'B'))


# Cohen's d plot
n <- 30 ## 样本量
t <- seq(0, 12, 0.01)
par(mar = c(4, 4, .2, .1))
plot(
  t / sqrt(n), 2 * (1 - pt(t, n - 1)),
  xlab = 'd = t / sqrt(n)', type = 'l', panel.first = grid()
)
abline(v = c(.01, .2, .5, .8, 1.2, 2), lty = 2)
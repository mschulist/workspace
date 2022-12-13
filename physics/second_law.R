file <- read_csv("physics/second_law.csv")

# Splitting the df into many dfs for every 6 columns
dfs <- map(
  seq(1, ncol(file), by = 6),
  ~ file[, .x:(.x + 5)]
)

filter_fun <- function(df) {
  df <- df %>% mutate(mass = parse_number(colnames(df)[1])) %>% 
  rename(time = 1, force = 2, gatestate = 3, distance = 4, 
                      velocity = 5, acceleration = 6)
  first <- min(which(!is.na(df$velocity)))
  last <- max(which(!is.na(df$velocity)))
  
  df <- df[first:last,]
  df
}

# Getting the frequency as a column
df <- map_df(
  1:length(dfs),
  ~ dfs[[.x]] %>%
    filter_fun() %>% 
    summarize(mass, force = mean(force, na.rm = T), 
              acceleration = mean(acceleration, na.rm = T)) %>% 
    distinct()
)
df[2,3] <- 1
avg <- df %>% 
  group_by(mass) %>% 
  summarize(force = mean(force), acceleration = mean(acceleration))


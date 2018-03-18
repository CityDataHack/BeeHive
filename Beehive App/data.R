pop <- read_csv(".\\tfl data\\Population Jobs.csv")

base2012 <- read_csv(".\\tfl data\\PTAL Data\\BaseYearFY2021FY31 PTALs.csv")
set.seed(14)

df <- data.frame(SiteID= c("Development 1 - Poor Plan", "Development 1 - Good Plan", 
                             "Development 2", "Development 3", "Development 4"),
  SchoolsAccessIndex = c(3, 3, 4, 1, 3),
SupermarketsAccessIndex = c(3, 3, 4, 4, 2),
SafetyIndex = c(3, 3, 5, 4, 3),
GreenSpaceIndex = c(3, 3, 2, 1, 5),
ActiveTravelPlanIndex = c(2, 5, 2, 5, 3))

base2012 <- base2012 %>%
                filter(ID %in% c(48601, 48602, 48603, 48604, 48605)) %>%
                bind_cols(df)

# base2012$PTALBY <- gsub("1a", "1", base2012$PTALBY)
# base2012$PTALBY <- gsub("1b", "1", base2012$PTALBY)
# base2012$PTALBY <- gsub("6a", "6", base2012$PTALBY)
# base2012$PTALBY <- gsub("6b", "6", base2012$PTALBY)
# base2012$PTALBY <- as.factor(base2012$PTALBY)

base2012$PTALBY <- as.numeric(base2012$PTALBY)

# base2012$PTALBY[base2012$PTALBY==1] <- 0
# base2012$PTALBY[base2012$PTALBY==2] <- 1
# base2012$PTALBY[base2012$PTALBY==3] <- 2
# base2012$PTALBY[base2012$PTALBY==4] <- 3
# base2012$PTALBY[base2012$PTALBY==5] <- 4
# base2012$PTALBY[base2012$PTALBY==6] <- 5
# base2012$PTALBY[base2012$PTALBY==7] <- 6

summary(base2012)
base2012 <- base2012 %>%
                    # mutate(GeneralAccessibilityIndex = PTALBY*0.4)
  rowwise() %>% 
  mutate(GeneralAccessibilityIndex = round((PTALBY*0.3) + (SchoolsAccessIndex*0.2) +
                        (SupermarketsAccessIndex*0.2)+(SafetyIndex*0.1) + (ActiveTravelPlanIndex*0.2), 0))
# str(base2012)
# accountChoices <- as.character(base2012$ID)
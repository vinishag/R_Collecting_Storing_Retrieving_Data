
library(tidyverse)

# ***********QUES1 3.2.4 QUES 3, 4**********************

# Ques3


# "Drv" stands for drive type; f = front wheel drive, r = rear wheel drive, 4 = 4wd

#Ques4

# the data set entered for the ggplot is mpg, geom_point is the type of graph (scatter plot)
# the aesthetics specifies the x and the y axis and the color assigned to the plot is blue
ggplot(data = mpg) +
geom_point(mapping = aes(x = hwy , y = cyl))


# ***********QUES2 3.3.1 QUES 2**********************

# Ques2 


?mpg

# Model - Categorical as the displ vs model shows linearity wrt model

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = model), color = "blue")

# displ - Continous as hwy vs displ plot shows non linearity concluding they are continuous

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# year - categorical (discrete year values (1999, 2008))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = year), color = "blue")

# cyl  - categorical as it has discrete values (4,5,6,7,8)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cyl), color = "blue")

# trans - categorical as the graph shows linearity wrt trans (manual ( m6, m5), auto (s6, s5, s4, l6, l5, l4, l3 av))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = trans), color = "blue")

# drv - Categorical as the graph shows linearity wrt drv ( f, r, 4)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = drv), color = "blue")

# cty - Continous as displ vs cty plot shows non linearity concluding they are continuous

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty), color = "blue")


# Hwy - Continous as displ vs hwy plot shows non linearity concluding they are continuous

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "red")

# fl - Categorical as the fl vs hwy graph shows linearity wrt fl (c,d,e,p,r)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = fl, y = hwy), color = "red")

# class - categorical as the displ vs class shows linearity wrt class
#(2 seater, compact, midsize, minivan, pickup, supercompant, suv)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = class), color = "red")


# ***********QUES3 3.5.1 QUES 3, 5**********************


#Ques3

# (.) ignores that dimension of faceting
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
  

# Ques5

?facet_wrap


# nrow: number of rows
# ncol: number of columns

# To create a facet_wrap we need to define the variable on the basis of which the facets need to be created
# along with ncol and nrow

# Facet_grid does not require ncol and nrow because two variables are mentioned on the basis of which 
# the facets need to be created (facet_grid also works if we mention just one variable along with (.))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 4, ncol = 2)





# ***********QUES4 3.6.1 QUES 2, 6**********************

# Ques2

# The query should create a plot of engine displacement vs highway miles per gallon
# with a scatter plot points varying on the basis of 3 drv categories (f,r,4)
# differentiated by 3 different colors
# Also the graph is plot in both scatter plot form and smooth plotting 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# Ques6

#1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 4.5) + 
  geom_smooth(se = FALSE, color = "blue")

#2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE, color = "blue")

#3
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

#4

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_smooth(se = FALSE, mapping = aes(x = displ, y = hwy), color = "blue")
  
#5

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = drv)) + 
  geom_smooth(se = FALSE, color = "blue", aes(linetype = drv))

#6

ggplot(mpg, aes(displ, hwy, fill = drv)) +
    geom_point(shape = 21, colour = "white", size = 3.5, stroke = 4)


# ***********QUES5 3.7.1 QUES 1**********************

# Ques1

# the default geom for stat_summary() is a point range plot

library(ggplot2)

?stat_summary

?geom_pointrange
?stat_bin

ggplot(data = diamonds) +
geom_pointrange(mapping = aes(x = cut , y = depth ),
                fun.ymin = min,
                fun.ymax = max,
                fun.y = median,
                stat = "summary")




# ***********QUES6 3.8.1 QUES 1, 3**********************

# Ques1

# The problem is that the plot points are overlapping hence we will use geom_jitter for position adjustment

ggplot(data = mpg, aes(hwy, cty)) +
  geom_jitter()




#Ques3

?geom_count
?geom_jitter

#Both are useful to prevent overplotting. 
#But geom_jitter is useful for small datasets where as geom_count counts the number of overlapping
# observations within a point area and can be useful for large datasets



ggplot(data = mpg) +
  geom_jitter(mapping = aes(x = cyl, y = drv, color = manufacturer))

ggplot(data = mpg) +
  geom_count(mapping = aes(x = cyl, y = drv, color = manufacturer), stat = "sum")




# ***********QUES7 3.9.1 QUES 4**********************

#Ques4

?coord_fixed
?geom_abline
?mpg

# Coord_fixed helps maintain a 45degrees between the x and y axis. 
# Ensuring one unit of x axis is same as 1 unit of y axis ( scaling remains same)

# Geom_abline adds refernce lines to the plot according to the slop created by the graph.

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()

# The plot here summarises a linear relationship between hwy and cyl but it is not aligned at 45 degrees
# The performance of cars at highway is slightly better than in cities




# ***********QUES 8 Example from Chapter 3 from Book "R for Data Science" **********************


# Examples from R for Data Science

#1 Simple ggplot from mpg dataset, plot for engine displacement vs highway miles per gallon

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#2 Adding aesthetics using a third variable from the dataset to differentiate information by color on the plot

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


#2 Adding aesthetics using a third variable from the dataset to differentiate informationby size on the plot

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

#3 Adding aesthetics using a third variable from the dataset to differentiate information by adding transperancy on the plot

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#4 Adding aesthetics using a third variable from the dataset to differentiate information by shape on the plot

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#5 Changing the overall colour of the points to blue

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#6 Introducing facets to split the graph on the basis of class variable and fitting the plots into 2 rows

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#7 Introducing facets to split the graph on the basis of combinations of cyl and drv variables

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

#8 Creating a smooth line plot for the same graph in #1

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

#9 Creating a smooth line plot with a third variable creating sub curves in the plot and different line type to
# differentiate the categories of the third variable

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

#10 Creating a smooth line plot with a third variable creating sub curves in the plot and group together
# to maintain the same type of curve

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

#11  Creating a smooth line plot with a third variable creating sub curves in the plot

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

#12 Creating the same plot of displ vs hwy in both geom_point and geom_smooth

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


#13 Creating the same plot of displ vs hwy in both geom_point and geom_smooth, but mapping only once

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

#14 Creating plot for displ vs hwy and adding a third variable as class in giving color to scatter plot only 
# also plotting s smooth curve for the same information

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

#15 Creating plot for displ vs hwy and adding a third variable as class in giving color to scatter plot only 
# also plotting s smooth curve for the same information for just "Subcompact" class category

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

#16 Creating a bar plot for diamonds dataset for count vs cut

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

#16 Creating a bar plot for diamonds dataset for count vs cut , 
#where statecount() by default creates a bar graph with count as one of the parameters

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

#17 Creating a bar plot for diamonds dataset for count vs cut , where count is in the form of proportions
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

#18 Creating a line plot for cut vs depth and marking the given data as points

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#19 creating count vs cut and using fill or color as aesthetics

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

#20 creating count vs cut and using fill to introduce the third variable clarity as an aesthetic

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#21 creating count vs cut and using fill to introduce the third variable clarity as an aesthetic 
# to add details adding transperancy (aplha ) to show overlapping observations

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

#22 creating count vs cut and using fill to introduce the third variable clarity as an aesthetic 
# to add details adding doge as the position to show overlapping observations beside each other

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#23 For multiple points lying on the same position in the plot, we add a little random noise 
# so that each point will differ from each other and the plot can have all the possible points
# even thought they are approximated

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

#24 Creating box plot for class vs hwy 
# 2nd plot has the same plot with the axis interchanged

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

#25 Examples polar plot 

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()



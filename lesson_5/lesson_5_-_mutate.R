# ����������� �������
library(vroom)
library(dplyr)

# �������� ������
ga_data <- vroom("https://raw.githubusercontent.com/selesnow/publications/master/code_example/from_excel_to_r/lesson_3/ga_nowember.csv")

# mutate
# ��������� ����� �������
ga_data <- mutate(ga_data,
                  bounce_rate = bounces / sessions)

ga_data <- mutate(ga_data,
                  bounce_rate = bounces / sessions,
                  br_group    = if_else(bounce_rate > 0.6, "high_br", "normal_br"))

# ��������� �������������� � ��� ������������ ��������
ga_data %>% mutate_if(is.character, toupper)

# ����������� �������� ������������ �������� �������� ���������� ���������
ga_data %>% mutate_at(vars(matches("s$")), sqrt )

# transemute
# ������� ��� ������� ����� ���������������
transmute(ga_data,
          bounce_rate = bounces / sessions,
          date        = format(date, "%d %B %Y"),
          source)

# ��������������� ������� �� �� �������� � ������� ��� ���������
transmute_if(ga_data, 
             is.character, toupper)

# uk-smoking-survey-analysis
SQL &amp; Power BI analysis of UK smoking survey data

**Project Review**
This project analyses a UK Smoking Survey dataset to understand demographic patterns in smoking behaviour, cigarette consumption habits, and socio-economic factors influencing tobacco use. Using MySQL for data cleaning and analysis, and Power BI for visualisation, the dataset was standardised, aggregated, and transformed into meaningful insights.
The results highlight smoking prevalence across age groups, regions, income brackets, education levels, and marital status, as well as consumption intensity among smokers. These findings support data-driven decision-making in public health interventions and behavioural research.

**Problem Statement**
The raw dataset contained missing values, inconsistent categorical labels, and unstructured demographic fields. Without cleaning and standardisation, the data could not be used to reliably calculate prevalence rates or consumption metrics. This created challenges such as:
- Inability to measure smoking prevalence across demographic categories
- No clarity on which groups exhibit the highest tobacco use
- Difficulty comparing cigarette consumption patterns (weekday vs weekend)
- Challenges identifying which socio-economic factors contribute most to smoking behaviour

The project aimed to:
- Clean and structure the dataset
- Build key indicators (prevalence, consumption averages, smoker segmentation)
- Analyse demographic and regional patterns
- Create visual insights via Power BI
- Build an end-to-end reproducible SQL workflow

**Key Findings**
**1. Overall Smoking Metrics (KPIs)**
Total Respondents: 1,691
Total Smokers: 421
Smoking Prevalence: 24.9%
Average Cigarettes/Day (Smokers Only): ~14.5
Weekend Smoking: Higher than weekday smoking
- The dataset shows moderate smoking prevalence, with clear behavioural differences between weekdays and weekends.

**2. Smoking by Age Group**
Highest prevalence:
16–24: 37.2%
25–34: 35.1%
Lowest prevalence:
65+: 11.4%
 - Younger adults demonstrate significantly higher smoking levels, showing a strong age-related pattern.

**3. Smoking by Region**
Top smoking regions:
Scotland: 34.5%
London: 27.5%
Lowest:
Midlands & East Anglia: 20.8%
 - Scotland has notably higher smoking rates, indicating regional health disparities.

**4. Smoking by Socio-Economic Factors**
Education Level
Highest smoking rates:
GCSE/CSE: 37.3%
GCSE/O-Level: 34.1%
Lowest:
Degree holders: 14.9%
 - Lower educational attainment strongly correlates with higher smoking prevalence.

Income Band
Highest prevalence:
£10,400–£15,600: 31%
Under £2,600: 27.1%
Lowest:
£28,600–£36,400: 11.4%
Above £36,400: 16.9%
 - Smoking is more common among low-income groups, reinforcing socio-economic inequalities.

**5. Smoking by Marital Status**
Highest smoking groups:
Single: 37%
Divorced: 36%
Separated: 32.4%
Lowest:
Married: 17.6%
Widowed: 17.9%
 - Individuals without a partner tend to smoke more frequently, suggesting lifestyle and social influence factors.

**6. Cigarette Consumption Patterns**
Weekday vs Weekend
Weekday avg: 13.8 cigarettes
Weekend avg: 16.4 cigarettes
 - Smoking intensity increases on weekends.

Cigarette Type Distribution
Packets: 70.5%
Hand-rolled: 17.1%
Mixed Use: 12.4% combined
Consumption by Type
Higher consumption among:
Hand-rolled and mixed-type users (~16–17/day)
Lower consumption among:
Packet-only users (~13.8/day)
 - Tobacco type choice influences consumption intensity.

**Conclusion**
The analysis reveals clear demographic and socio-economic patterns in smoking behaviour across the UK. Smoking is particularly prevalent among younger adults, individuals with lower education, lower-income groups, and residents of Scotland. Smokers tend to consume more cigarettes during weekends and when using hand-rolled or mixed cigarette types.
These insights support targeted public health strategies focusing on high-risk groups and highlight the value of data-driven policy development.



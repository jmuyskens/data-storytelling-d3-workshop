all: oecd.csv

clean:
	rm oecd_life_expectancy.csv
	rm oecd_health_spending.csv
	rm oecd.csv

oecd_life_expectancy.csv:
	curl "https://stats.oecd.org/sdmx-json/data/DP_LIVE/.LIFEEXP.TOT.YR.A/OECD?contentType=csv&detail=code&separator=comma&csv-lang=en&startPeriod=1960&endPeriod=2016" --output oecd_life_expectancy.csv
	
oecd_health_spending.csv:
	curl "https://stats.oecd.org/sdmx-json/data/DP_LIVE/.HEALTHEXP.TOT.USD_CAP.A/OECD?contentType=csv&detail=code&separator=comma&csv-lang=en&startPeriod=1970&endPeriod=2016" --output oecd_health_spending.csv
	
oecd.csv: oecd_life_expectancy.csv oecd_health_spending.csv
	Rscript oecd.R
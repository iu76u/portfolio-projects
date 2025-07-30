select *
from CovidDeaths
where continent is not null
order by 3,4

--select *
--from CovidVaccinations
--order by 3,4


select location, date,total_cases,new_cases,population,total_Deaths
from CovidDeaths 

--lokking into total cases v total deaths percentage in india during covid-19

select location, date,total_cases,total_Deaths,(total_Deaths/total_cases)*100 as deathpercentage
from CovidDeaths 
where location like '%India'



--looking into Total_cases vs population , how many people per 100 people got affected by covid-19

select location, date,total_cases,population,(total_cases/population)*100 as casesper100
from CovidDeaths 
--where location like '%India'

--looking where the infected rate is highest compared to their population

select location, max(total_cases)as highestinfectedcount,population,(max(total_cases)/population)*100 as casesper100
from CovidDeaths 
group by location,population
order by casesper100 desc
--where location like '%India'


--countries with the highest death count

select location,max(cast(total_Deaths as int)) as maxdeaths
from CovidDeaths 
where continent is not null
group by location
order by maxdeaths desc


--Let's check death count by continent

select continent,max(cast(total_Deaths as int)) as maxdeaths
from CovidDeaths 
where continent is not null
group by continent
order by  maxdeaths desc


--global numbers
select  date,sum(new_cases),sum(cast(new_Deaths as int)),sum(new_cases)/sum(cast(new_Deaths as int))*100 as deathpercentage
from CovidDeaths 
where continent is not null
group by date

--looking at total population vs vaccinations


select dea.continent , dea.location, dea.population, vac.date , vac.new_vaccinations
, sum(cast(vac.new_vaccinations as int)) over(partition by dea.location order by dea.location , dea.date) as peoplevaccinated
from CovidDeaths as dea
join CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by new_vaccinations asc



--use CTE'S

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac


-- TEMP TABLES

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
PeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (PeopleVaccinated/Population)*100
From #PercentPopulationVaccinated

--creating views

create view percentpopulationvaccinated as
select continent,max(cast(total_Deaths as int)) as maxdeaths
from CovidDeaths 
where continent is not null
group by continent
--order by  maxdeaths desc




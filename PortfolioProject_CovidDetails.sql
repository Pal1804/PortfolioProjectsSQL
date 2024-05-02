select * from PortfolioProject.dbo.CovidDeaths$;

select * from PortfolioProject.dbo.CovidVaccination$;

select location, date, total_cases,new_cases,total_deaths,population
from PortfolioProject.dbo.CovidDeaths$
order by 1,2;

-- location vis covid cases
select location, date, total_cases,new_cases,total_deaths,population 
from PortfolioProject.dbo.CovidDeaths$
where location like '%states%'
order by 1,2;

--Looking at Total cases VS Population

select location, date, total_cases,population, (total_cases/population)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths$
where location like 'Af%'
order by 1,2;

--Looking at countries with highest infection rate compare to population

select location,population,max(total_cases) as HightestInfectionRate, max(total_cases/population)*100 as 
PercentageInfectionPopulation
from PortfolioProject.dbo.CovidDeaths$
group by location,population
order by PercentageInfectionPopulation desc;

--highest Death Count per population

select location,population,max(total_deaths) as HighestDeathRate, max(total_deaths/population)*100 as 
PercentageDeathPopulation
from PortfolioProject.dbo.CovidDeaths$
where continent is not null
group by location,population
order by PercentageDeathPopulation desc;

select Dea.continent,Dea.date,Dea.population,Dea.location, Vac.new_vaccinations
from PortfolioProject.dbo.CovidDeaths$ Dea join PortfolioProject.dbo.CovidVaccination$ Vac
on Dea.location=Vac.location and Dea.date=Vac.date
where dea.continent is not null
order by 1,2,3;


-- Using CTE (Common Table Expression)
with PopVsVac (Continent,Date,population,location,new_vaccinations)
as
(
select Dea.continent,Dea.date,Dea.population,Dea.location, Vac.new_vaccinations
from PortfolioProject.dbo.CovidDeaths$ Dea join PortfolioProject.dbo.CovidVaccination$ Vac
on Dea.location=Vac.location and Dea.date=Vac.date
where dea.continent is not null
)
select * from PopVsVac
--order by 1,2,3;








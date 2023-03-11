create view RollingVaccinatedPopulation as 
select dea.continent,dea.location,dea.date,dea.population,vec.total_vaccinations
,sum(cast(vec.total_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as AggregateTotalVaccination
from [Covid Data exploration project]..CovidDeaths dea
join [Covid Data exploration project]..CovidVacinations vec
on dea.location = vec.location
and dea.date = vec.date
where dea.continent is not null


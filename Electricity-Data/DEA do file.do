#dmu are electricity distribution companies
cd "C:\Users\Tri Dung Huynh\Desktop\Electricity"
import excel "1563042-Electricity-Information-Disclosure-Summary-Database-2008-to-2012.xls", sheet("Mode2") cellrange(A4:I147) firstrow
format %ty yr
destring dmu, replace
save "Electricity_NZ.dta", replace
use "Electricity_NZ.dta", clear
summarize
dea CLO CLU DTC = nofcp ES
dea CLO CLU DTC = nofcp ES, rts(vrs)
dea CLO CLU DTC SA = nofcp ES
dea CLO CLU DTC SA = nofcp ES, rts(vrs)

# dmu are years
cd "C:\Users\Tri Dung Huynh\Desktop\Electricity"
import excel "1563042-Electricity-Information-Disclosure-Summary-Database-2008-to-2012.xls", sheet("dmu_year") cellrange(A4:I147) firstrow
format %ty yr
save "Electricity_NZ_year.dta",
use "Electricity_NZ_year.dta", clear
summarize
dea CLO CLU DTC SA = nofcp ES
dea CLO CLU DTC SA = nofcp ES, rts(vrs)

# correlation
clear
import excel "C:\Users\Tri Dung Huynh\Desktop\Electricity\DEA Results.xls", sheet("CRS_Q") cellrange(L10:P153) firstrow clear
correlate VRS CRS VRS_Q CRS_Q CLU_Total


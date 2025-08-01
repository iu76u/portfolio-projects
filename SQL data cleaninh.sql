select *
from housing

select SaleDate2 , convert(Date, SaleDate)
from housing

update housing
SET SaleDate2 = convert(Date, SaleDate)

ALTER TABLE housing
ADD SaleDate2 Date;

update housing
SET SaleDate2 = convert(Date, SaleDate)




select PropertyAddress
from housing
--where PropertyAddress is null



select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress ,isnull(b.PropertyAddress,a.PropertyAddress)
from housing as a
join housing as b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where b.PropertyAddress is null

update b
set PropertyAddress= isnull(b.PropertyAddress,a.PropertyAddress)
from housing as a
join housing as b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where b.PropertyAddress is null

select PropertyAddress
from housing
--where PropertyAddress is null


select 
SUBSTRING(PropertyAddress ,1,CHARINDEX(',', PropertyAddress)-1) as ADDRESS
,SUBSTRING(PropertyAddress ,CHARINDEX(',', PropertyAddress) +1 , len(PropertyAddress)) as ADDRESS
from housing

ALTER TABLE housing
ADD PropertysplitAddress nvarchar(255);

update housing
SET PropertysplitAddress = SUBSTRING(PropertyAddress ,1,CHARINDEX(',', PropertyAddress)-1)

ALTER TABLE housing
ADD  PropertycityAddresss nvarchar(255);

update housing
SET  PropertycityAddresss = SUBSTRING(PropertyAddress ,CHARINDEX(',', PropertyAddress) +1 , len(PropertyAddress))



select 
parsename(replace(OwnerAddress,',','.'),3)as streetname,
parsename(replace(OwnerAddress,',','.'),2)as cityname,
parsename(replace(OwnerAddress,',','.'),1)as state
from housing

ALTER TABLE housing
ADD OwnersplitAddress nvarchar(255);

update housing
SET OwnersplitAddress = parsename(replace(OwnerAddress,',','.'),3)

ALTER TABLE housing
ADD Ownersplitcities nvarchar(255);

update housing
SET Ownersplitcities = parsename(replace(OwnerAddress,',','.'),2)

ALTER TABLE housing
ADD Ownersplitstate nvarchar(255);

update housing
SET Ownersplitstate = parsename(replace(OwnerAddress,',','.'),1)


select 
distinct(SoldAsVacant),
count(SoldAsVacant)
from housing
group by SoldAsVacant


select SoldAsVacant,
case when SoldAsVacant ='y' then 'yes'
when SoldAsVacant='n' then 'no'
else SoldAsVacant
end
from housing


update housing
set SoldAsVacant=case when SoldAsVacant ='y' then 'yes'
when SoldAsVacant='n' then 'no'
else SoldAsVacant
end

rownuwcte as(
select *,
ROW_NUMBER() over(
                 partition by ParcelID,
                 PropertyAddress,
                 SaleDate,
                 SalePrice,
                 LegalReference
                 order by
                 UniqueID
                 ) row_num
from housing
)
select *
from rownuwcte




select *
from housing

alter table housing
drop column Ownersplitcity,OwnerAddress,TaxDistrict, PropertyAddress
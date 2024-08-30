## generate uuid

> SELECT REPLACE(CONCAT('CUKID',LEFT(UUID(),7)),'-','');


## variables inside the query
```mysql
    select count(x.id) from (select
    # count(claim_claim.id),
    claim_claim.id                                       as id,
    policy_policy.id                                     as policy_id,
    claim_claim.incident_date < policy_policy.start_date as isCreatedOnThePass,
    claim_claim.incident_date > claim_claim.created      as isCreatedOnTheFuture,
    @num := CAST(insurance_coverage.value AS UNSIGNED)   as num,
    @unit := CAST(insurance_coverage.unit AS CHAR)       as unit,
    @maxNoticeDate := CASE
                        WHEN @unit = 'YEAR' THEN DATE_ADD(claim_claim.incident_date, INTERVAL @num YEAR)
                        WHEN @unit = 'MONTH' THEN DATE_ADD(claim_claim.incident_date, INTERVAL @num MONTH)
                        WHEN @unit = 'DAY' THEN DATE_ADD(claim_claim.incident_date, INTERVAL @num DAY)
                        WHEN @unit = 'WEEK' THEN DATE_ADD(claim_claim.incident_date, INTERVAL @num WEEK)
        END                                              as maxNoticeDate,
    claim_claim.created > @maxNoticeDate                 as isCreatedOutOfMax,
    claim_claim.incident_date                            as claim_incident_date,
    claim_claim.created                                  as claim_creation_date,
    policy_policy.start_date                             as policy_start_date,
    claim_claim.product_id
    from claim.claim claim_claim
            inner join claim.policy claim_policy on claim_claim.id = claim_policy.claim_id
            inner join policy.policy policy_policy on policy_policy.id = claim_policy.id
            inner join policy.product policy_product on policy_product.policy_id = policy_policy.id
            inner join insurance.coverage insurance_coverage on claim_claim.product_id = insurance_coverage.product_id
    where insurance_coverage.name = 'claimNoticePeriod'
    and (
                claim_claim.incident_date < policy_policy.start_date || # pasado
                claim_claim.incident_date > claim_claim.created ||# futuro
                claim_claim.created > @maxNoticeDate # out of range
        )
    #   and policy_policy.created > '2022-01-01'
    ) as x

```

# Show locked proccess

SHOW FULL PROCESSLIST;


# search inside a json

Select user_metadata, partner_id,email
from user.users
where partner_id like '%I-surance%'
  and (
        (
                    JSON_EXTRACT(user_metadata, '$.country') = CAST('null' AS JSON) or
                    JSON_EXTRACT(user_metadata, '$.country') is null
        )
        OR
        (
                    JSON_EXTRACT(user_metadata, '$.language') != 'ES' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'es' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'FR' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'fr' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'EN' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'en' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'IT' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'it' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'NL' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'nl' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'PL' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'pl' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'DE' and
                    JSON_EXTRACT(user_metadata, '$.language') != 'de'
        )
      )
;
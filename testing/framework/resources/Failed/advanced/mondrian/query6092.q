select tenant.tenant_id as c0, tenant.tenant_name as c1 from line as line, line_tenant as line_tenant, tenant as tenant where line_tenant.tenant_id = tenant.tenant_id and line.line_id = line_tenant.line_id group by tenant.tenant_id, tenant.tenant_name order by tenant.tenant_id ASC NULLS LAST;
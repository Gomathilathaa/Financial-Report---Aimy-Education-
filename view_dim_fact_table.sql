CREATE VIEW Dim_BusinessUnit AS
SELECT 
    bu.Id AS BusinessUnitId,
    bu.Code,
    bu.Name,
    bu.EnterpriseId,
    bu.TradeName,
    bu.CompanyName,
    bu.TypeId,
    bu.ListingStatusId,
    bua.Country,
    bua.Region,
    bua.City,
    bua.Suburb,
    bua.Postcode,
    bua.StreetAddress,
    bus.CountryCode,
    bus.TimezoneIdentifier,
    bus.LanguageId,
    bus.ServiceAreaId,
    bus.LicenceTypeId,
    bubs.CurrencySymbol,
    bubs.CurrencyCode,
    bubs.TaxNumber,
    bubs.TaxName,
    bubs.DefaultSaleTaxRate,
    bubs.SubsidyEstimationEnabled,
    bubs.AccountingProvider,
    bubs.BillingPeriodTypeId,
    bubs.SubsidyFrenquencyTypeId,
    bu.IsActive,
    bu.CreatedOn,
    bu.CreatedBy,
    bu.UpdatedOn,
    bu.UpdatedBy,
    bu.Version
FROM [Aimy].[dbo].[BusinessUnit] bu
LEFT JOIN [Aimy].[dbo].[BusinessUnitAddress] bua ON bu.Id = bua.BusinessUnitId
LEFT JOIN [Aimy].[dbo].[BusinessUnitSetting] bus ON bu.Id = bus.BusinessUnitId
LEFT JOIN [Aimy].[dbo].[BusinessUnitBillingSetting] bubs ON bu.Id = bubs.BusinessUnitId;

CREATE VIEW Dim_Org AS
SELECT 
    o.Id AS OrgId,
    o.Guid,
    o.Code,
    o.Name,
    o.HierarchicalName,
    o.EnterpriseId,
    o.PublishStatusId,
    o.IsActive,
    o.CreatedOn,
    o.CreatedBy,
    o.UpdatedOn,
    o.UpdatedBy,
    o.Version
FROM [Aimy].[dbo].[Org] o;

CREATE VIEW Dim_Enterprise AS
SELECT 
    e.Id AS EnterpriseId,
    e.Guid,
    e.Code,
    e.Name,
    e.Description,
    e.CompanyName,
    e.TypeId,
    es.CountryCode,
    es.CurrencySymbol,
    es.CurrencyCode,
    es.CountryId,
    es.TermControlEnabled,
    es.DefaultCustomerRating,
    e.IsActive,
    e.CreatedOn,
    e.CreatedBy,
    e.UpdatedOn,
    e.UpdatedBy
FROM [Aimy].[dbo].[Enterprise] e
LEFT JOIN [Aimy].[dbo].[EnterpriseSetting] es ON e.Id = es.EnterpriseId;

CREATE VIEW Dim_Account AS
SELECT 
    bua.Id AS AccountId,
    bua.BusinessUnitId,
    bua.DirectPaymentStatusId,
    bua.SubsidyStatusId,
    bua.Rating,
    bua.StatusId,
    bua.Note,
    bua.Reference,
    bua.IsActive,
    bua.CreatedOn,
    bua.CreatedBy,
    bua.UpdatedOn,
    bua.UpdatedBy
FROM [Aimy].[dbo].[BusinessUnitAccount] bua;



CREATE VIEW Dim_Subscription AS
SELECT 
    s.Id AS SubscriptionId,
    s.Name,
    s.Description,
    s.BusinessUnitId,
    s.OrgId,
    s.RecurringTypeId,
    s.BillingTypeId,
    s.StatusId,
    s.PublishStatusId,
    s.MinRating,
    s.IsActive,
    s.CreatedOn,
    s.CreatedBy,
    s.UpdatedOn,
    s.UpdatedBy
FROM [Aimy].[dbo].[Subscription] s;

CREATE VIEW Dim_Currency AS
SELECT 
    c.Id AS CurrencyId,
    c.TypeId,
    c.Name,
    c.Code,
    c.Symbol,
    c.IsActive,
    c.CreatedOn,
    c.CreatedBy,
    c.UpdatedOn,
    c.UpdatedBy
FROM [Aimy].[dbo].[Currency] c;

CREATE VIEW Dim_TaxRate AS
SELECT 
    tr.Id AS TaxRateId,
    tr.BusinessUnitId,
    tr.Name,
    tr.TypeId,
    tr.Rate,
    tr.IsActive,
    tr.CreatedOn,
    tr.CreatedBy,
    tr.UpdatedOn,
    tr.UpdatedBy
FROM [Aimy].[dbo].[TaxRate] tr;

CREATE VIEW Fact_Invoice AS
SELECT 
    i.Id AS InvoiceId,
    i.BusinessUnitId,
    i.OrgId,
    i.AccountId,
    i.TermId,
    i.CurrencyCode,
    i.StatusId,
    i.TotalOriginalAmount,
    i.TotalAmount,
    i.Subtotal,
    i.TotalTax,
    i.TotalDiscount,
    i.AmountDue,
    i.AmountPaid,
    i.AmountCredited,
    i.AmountEstimatedPayment,
    i.AmountProcessingDirectPayment,
    il.Quantity,
    il.UnitPrice,
    il.DiscountAmount,
    il.DiscountRate,
    il.TaxRateId,
    il.ItemId,
    i.Date AS DateKey,
    i.DueDate,
    i.FullyPaidDate,
    i.PeriodStart,
    i.PeriodEnd
FROM [Aimy].[dbo].[Invoice] i
LEFT JOIN [Aimy].[dbo].[InvoiceLine] il ON i.Id = il.InvoiceId;

CREATE VIEW Fact_Payment AS
SELECT 
    p.Id AS PaymentId,
    p.BusinessUnitId,
    p.OrgId,
    p.AccountId,
    p.CurrencyCode,
    p.StatusId,
    p.Amount,
    p.Subtotal,
    p.TotalTax,
    op.TotalAmount AS OverpaymentAmount,
    op.AmountAllocated,
    op.AmountRefunded,
    op.AmountRemaining,
    p.Date AS DateKey
FROM [Aimy].[dbo].[Payment] p
LEFT JOIN [Aimy].[dbo].[Overpayment] op ON p.OverpaymentId = op.Id;

CREATE VIEW Fact_TermBooking AS
SELECT 
    tb.Id AS TermBookingId,
    tb.BusinessUnitId,
    tb.OrgId,
    tb.AccountId,
    tb.TermId,    
    tb.BookingAmount,
    tb.ExtraAmount,
    tb.DiscountAmount,
    tb.TotalAmount,
    tb.StartDate AS DateKey,
    tb.EndDate,
    tb.StatusId
FROM [Aimy].[dbo].[TermBooking] tb;


CREATE VIEW Fact_FinanceTransaction AS
SELECT 
    ft.Guid AS TransactionId,
    ft.BusinessUnitId,
    ft.OrgId,
    ft.AccountId,
    ft.TermId,
    ft.EnterpriseTermId,
    ft.TotalAmount,
    ft.AmountPaid,
    ft.AmountCredited,
    ft.AmountDue,
    ft.AmountEstimatedPayment,
    ft.AmountProcessingDirectPayment,
    ft.Date AS DateKey,
    ft.DueDate,
    ft.StatusId
FROM [Aimy].[dbo].[FinanceTransaction] ft;

CREATE VIEW Fact_CreditNote AS
SELECT 
    cn.Id AS CreditNoteId,
    cn.BusinessUnitId,
    cn.OrgId,
    cn.AccountId,
    cn.TermId,
    cn.CurrencyCode,
    cn.TotalAmount,
    cn.TotalOriginalAmount,
    cn.Subtotal,
    cn.TotalTax,
    cn.AmountAllocated,
    cn.AmountRefunded,
    cn.AmountRemaining,
    cn.Date AS DateKey,
    cn.FullyPaidDate,
    cn.StatusId
FROM [Aimy].[dbo].[CreditNote] cn
LEFT JOIN [Aimy].[dbo].[CreditNoteLine] cnl ON cn.Id = cnl.CreditNoteId;

CREATE VIEW dim_businessUnit1 AS
SELECT 
    bu.Id AS BusinessUnitId,
    bu.Name,
    bu.EnterpriseId,
	e.CompanyName,
    bu.TradeName,
    bua.Country,
    bua.Region,
    bua.City,
    bua.Suburb,
    bua.Postcode,
    bua.StreetAddress,
    bus.CountryCode
FROM [Aimy].[dbo].[BusinessUnit] bu
LEFT JOIN [Aimy].[dbo].[BusinessUnitAddress] bua ON bu.Id = bua.BusinessUnitId
LEFT JOIN [Aimy].[dbo].[BusinessUnitSetting] bus ON bu.Id = bus.BusinessUnitId
LEFT JOIN [Aimy].[dbo].[Enterprise] e ON e.Id = bu.EnterpriseId;






CREATE VIEW dim_taxRate1 AS
SELECT 
    tr.Id AS TaxRateId,
    tr.BusinessUnitId,
    tr.Name,
    tr.TypeId,
    tr.Rate
FROM [Aimy].[dbo].[TaxRate] tr;
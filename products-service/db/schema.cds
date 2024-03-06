namespace sap.capire.products;

using { Currency, cuid, managed, sap.common.CodeList } from '@sap/cds/common';

entity Products : cuid, managed {
    title    : localized String(20);
    descr    : localized String(100);
    stock    : Integer;
    price    : Decimal(9,2);
    currency : Currency;
    category : Association to Categories;
}

entity Categories : CodeList {
    key ID   : Integer;
    parent   : Association to Categories;
    children : Composition of many Categories on children.parent = $self;
}
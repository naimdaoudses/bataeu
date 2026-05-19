using FacturaService as service from '../../srv/service';

annotate service.Facturas with @(
    // 1. AGREGA ESTE BLOQUE DE HEADERINFO AQUÍ:
    UI.HeaderInfo : {
        TypeName       : '{i18n>Factura}',          // Nombre de la entidad en singular
        TypeNamePlural : '{i18n>Facturas}',         // Nombre de la entidad en plural
        Title          : {
            $Type : 'UI.DataField',
            Value : nroFactura                      // Muestra el número de factura como título principal
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : '{i18n>DetalleFactura}'         // Opcional: Subtítulo debajo del número
        }
    },
    // Fin del bloque HeaderInfo

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>FechaDeEmision}',
                Value : fechaEmision,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Contenido}',
                Value : content,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : nroFactura,
            Label : '{i18n>NumeroDeFactura}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>FechaDeEmision}',
            Value : fechaEmision,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Contenido}',
            Value : content,
        },
    ],
);


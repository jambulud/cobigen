Ext.define('${variables.domain}.view.${variables.etoName?lower_case}.i18n.${variables.etoName?cap_first}_en_EN', {
    extend: 'Devon.I18nBundle',
    singleton: true,
    i18n: {
         ${variables.etoName?lower_case}s: {
            title: '${variables.etoName?cap_first}EN',
            html: 'List of ${variables.etoName?lower_case}sEN',
            grid: {
                id: 'ID',
                state: 'STATE'
            },
            buttons: {
                add: 'Add',
                edit: 'Edit',
                del: 'Delete',
                refresh: 'Refresh',
            }
        },

        tableEdit: {
            title: 'Table: ',
            newTitle: 'New table',
            status: 'STATUS',
            add: 'Add',
            remove: 'Remove',
            submit: 'Submit',
            cancel: 'Cancel',
            html: 'Details for ${variables.etoName?lower_case}EN #',
            grid: {
                number: 'Number',
                title: 'Title',
                status: ' STATUS',
            }
        },

        tableCrud: {
            title: 'Fill data',
            number: 'Number',
            state: 'State',
            submit: 'Submit',
            cancel: 'Cancel'
        }
    }
});
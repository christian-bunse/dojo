{NotImplemented} = require './errors'

service = {}

service.addAclEntry = (userId, poId, principalId, roleId) ->
    # The following steps are required:

    # check permission to write ACLs
    # update database entry
    # check permission to read PO
    # return result

    throw new NotImplemented()

    # Example result
    result =
        responseCode: 200
        responseObject:
            name: 'Any PO'
            parent: 'Another PO'
            children: []
            acl: []

    return result

module.exports = service

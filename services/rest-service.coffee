service = {}

service.addAclEntry = (userId, poId, principalId, roleId) ->
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

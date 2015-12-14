{expect} = require 'chai'
{EntityNotFound} = require '../services/errors'
dataAccessService = require '../services/data-access-service'
restService = require '../services/rest-service'

describe 'rest-service', ->
    beforeEach ->
        initializeDatabase()

    it 'should return 404 if po has been moved to trash', ->
        result = restService.addAclEntry 'Oscar Owner', 'B_2', 'Nancy New', 'reader'
        expect(result.responseCode).to.equal 404
        expect(result.responseObject).to.not.exist

    it 'should return 403 if user has no permission to write ACL', ->
        result = restService.addAclEntry 'Ronny Reader', 'A_3', 'Nancy New', 'reader'
        expect(result.responseCode).to.equal 403
        expect(result.responseObject).to.not.exist

    it 'should return 200 if user has permission to read and permission to write ACL', ->
        result = restService.addAclEntry 'Oscar Owner', 'A_3', 'Nancy New', 'reader'
        expect(result.responseCode).to.equal 200
        expect(result.responseObject).to.exist
        expect(result.responseObject.acl).not.to.be.empty

initializeDatabase = ->
    bucket =
        root:
            name: 'root'
            parent: null
            children: ['A_1']
            acl: []
        A_1:
            name: 'A_1'
            parent: 'root'
            children: ['A_2']
            acl: [
                principalId: "Oscar Owner",
                roleId: "owner"
            ]
        A_2:
            name: 'A_2'
            parent: 'A_1'
            children: ['A_3']
            acl: [
                principalId: "Ronny Reader",
                roleId: "reader"
            ]
        A_3:
            name: 'A_3'
            parent: 'A_2'
            children: []
            acl: []

        B_1:
            name: 'B_1'
            parent: 'trash'
            children: ['B_2']
            acl: []
        B_2:
            name: 'B_2'
            parent: 'B_1'
            children: []
            acl: []

    dataAccessService.initializeDatabase bucket

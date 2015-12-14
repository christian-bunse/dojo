{expect} = require 'chai'
{EntityNotFound} = require '../services/errors'
dataAccessService = require '../services/data-access-service'

describe 'data-access-service', ->
    beforeEach ->
        initializeDatabase()

    it 'should return \'trash\' as parent if A_1 is requested', ->
        poData = dataAccessService.get 'A_1'
        parent = poData.parent
        expect(parent).to.equal 'trash'

    it 'should throw EntityNotFound if \'trash\' is requested', ->
        expect(-> dataAccessService.get 'trash').to.throw(EntityNotFound);

initializeDatabase = ->
    bucket =
         A_1:
            name: 'A_1'
            parent: 'trash'
            children: []
            acl: []

    dataAccessService.initializeDatabase bucket
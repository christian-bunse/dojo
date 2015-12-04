{EntityNotFound} = require './errors'

databaseBucket = null

service =
    initializeDatabase: (_databaseBucket) ->
        databaseBucket = _databaseBucket

    get: (id) ->
        result = databaseBucket[id]
        if result?
            return result

        throw new EntityNotFound()

    update: (id, data) ->
        databaseBucket[id] = data
        return data

module.exports = service

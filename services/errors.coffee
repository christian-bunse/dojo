class EntityNotFound extends Error
    constructor: ->
        @message = 'Entity not found'

class NotImplemented extends Error
    constructor: ->
        @message = 'Not yet implemented - hey that\'s your job!'

module.exports = {
    EntityNotFound: EntityNotFound
}
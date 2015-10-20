debug = require('debug')('nanocyte-engine-simple:messages-controller')
MeshbluQueue = require '../models/meshblu-queue'
class MessagesController
  constructor: (options={}) ->
    @meshbluQueue = new MeshbluQueue

  create: (req, res) =>
    messageToQueue =
      auth:
        uuid: req.headers.meshblu_auth_uuid
        token: req.headers.meshblu_auth_token
      message: req.body

    @meshbluQueue.queueMessage messageToQueue
    res.status(200).send()

module.exports = MessagesController

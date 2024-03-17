require('dotenv').config()
const { DynamoDBClient } = require('@aws-sdk/client-dynamodb');
const {PutCommand, DynamoDBDocumentClient} = require('@aws-sdk/lib-dynamodb')

const dbClient = new DynamoDBClient({
    region: process.env.REGION,
    credentials:{
        accessKeyId:process.env.ACCESS_KEY,
        secretAccessKey:process.env.SECRET_ACCESS_KEY
    }
});

const marshallOptions = {
    convertEmptyValues:false,
    removeUndefinedValues:false,
    converClassInstanceToMap:false
}

const unmarshallOptions={
    wrapNumbers: false
}

const translateConfig = { marshallOptions, unmarshallOptions };

const documentClient = DynamoDBDocumentClient.from(dbClient, translateConfig);


//creating user
async function createUser(userId){
    const response = await documentClient.send(new PutCommand({
        TableName:"donor-table",
        Item:{
            userId: userId,
            name: "XYZ",
            age: 20,
            blood_group:"O+",
            mobile: 1234567890
        }
    }))

    console.log(response)
  }

  module.exports = {
    createUser
  }
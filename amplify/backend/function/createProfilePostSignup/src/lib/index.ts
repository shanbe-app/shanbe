import {Context, APIGatewayProxyCallback, APIGatewayEvent} from 'aws-lambda';
import * as AWS from 'aws-sdk';
import {DocumentClient} from "aws-sdk/clients/dynamodb";

AWS.config.update({region: process.env.TABLE_REGION});
const dynamodb: DocumentClient = new AWS.DynamoDB.DocumentClient();
let tableName = "";
if (process.env.ENV && process.env.ENV !== "NONE") {
    tableName = tableName + '-' + process.env.ENV;
}
export const lambdaHandler = (event: APIGatewayEvent, context: Context, callback: APIGatewayProxyCallback): void => {
    console.log(`Event: ${JSON.stringify(event, null, 2)}`);
    console.log(`Context: ${JSON.stringify(context, null, 2)}`);
    dynamodb.put({TableName: tableName, Item: {premium_until: null}}, (err, data) => {
        if (err)
            callback(err, {
                statusCode: 400,
                body: JSON.stringify({
                    message: 'hello world',
                }),
            })
        callback(err, {
            statusCode: 200,
            body: JSON.stringify({
                message: 'User profile created successfully.',
            }),
        })
    })
};
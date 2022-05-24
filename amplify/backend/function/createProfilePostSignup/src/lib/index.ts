import {Context, APIGatewayProxyCallback, APIGatewayEvent} from 'aws-lambda';
import * as AWS from 'aws-sdk';
import {DocumentClient} from "aws-sdk/clients/dynamodb";

AWS.config.update({region: process.env.AWS_REGION});
const dynamodb: DocumentClient = new AWS.DynamoDB.DocumentClient();
const tableName: string | undefined = process.env.PROFILE_TABLE_NAME;

export const lambdaHandler = (event: APIGatewayEvent, context: Context, callback: APIGatewayProxyCallback): void => {
    console.log(`Event: ${JSON.stringify(event, null, 2)}`);
    console.log(`Context: ${JSON.stringify(context, null, 2)}`);
    if (!tableName) {
        callback(new Error('table name not defined'), {
            statusCode: 500,
            body: JSON.stringify({
                message: 'Table name not defined',
            }),
        })
        return
    }
    dynamodb.put({TableName: tableName, Item: {premium_until: null}}, (err, data) => {
        if (err)
            callback(err, {
                statusCode: 422,
                body: JSON.stringify({
                    message: err.message,
                }),
            })
        callback(null, {
            statusCode: 200,
            body: JSON.stringify({
                message: 'User profile created successfully.',
            }),
        })
    })
};
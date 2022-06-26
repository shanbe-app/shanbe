import {Context, APIGatewayProxyCallback, APIGatewayEvent} from 'aws-lambda';
import * as AWS from 'aws-sdk';
import {DocumentClient} from "aws-sdk/clients/dynamodb";

AWS.config.update({region: process.env.AWS_REGION});
const dynamodb: DocumentClient = new AWS.DynamoDB.DocumentClient();
const tableName: string | undefined = process.env.PROFILE_TABLE_NAME;

interface CreateProfileResponse {
    statusCode: number;
    body: string;
}

exports.handler = async (event: APIGatewayEvent, context: Context): Promise<CreateProfileResponse> => {
    console.log(`Event: ${JSON.stringify(event, null, 2)}`);
    console.log(`Context: ${JSON.stringify(context, null, 2)}`);
    if (!tableName) {
        throw new Error('table name not defined')
    }
    if (event.requestContext.authorizer?.claims.sub) {
        const item = {
            id: {S: event.requestContext.authorizer?.claims.sub},
            premium_until: null,
            createdAt: {S: new Date().toISOString()},
            updatedAt: {S: new Date().toISOString()},
            __typename:{S: 'Profile'}
        }
        try {
            const insertResult = await dynamodb.put({TableName: tableName, Item: item}).promise()
            return {
                statusCode: 200,
                body: JSON.stringify({
                    message: 'User profile created successfully.',
                }),
            }
        } catch (e) {
            throw e
        }
    }
    throw new Error('Claim not present in request')
};
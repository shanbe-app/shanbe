"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const AWS = __importStar(require("aws-sdk"));
AWS.config.update({ region: process.env.AWS_REGION });
const dynamodb = new AWS.DynamoDB.DocumentClient();
const tableName = process.env.PROFILE_TABLE_NAME;
exports.handler = async (event, context) => {
    console.log(`Event: ${JSON.stringify(event, null, 2)}`);
    console.log(`Context: ${JSON.stringify(context, null, 2)}`);
    if (!tableName) {
        throw new Error('table name not defined');
    }
    if (event.requestContext.authorizer?.claims.sub) {
        const item = {
            id: { S: event.requestContext.authorizer?.claims.sub },
            premium_until: null,
            createdAt: { S: new Date().toISOString() },
            updatedAt: { S: new Date().toISOString() },
            __typename: { S: 'Profile' }
        };
        try {
            const insertResult = await dynamodb.put({ TableName: tableName, Item: item }).promise();
            return {
                statusCode: 200,
                body: JSON.stringify({
                    message: 'User profile created successfully.',
                }),
            };
        }
        catch (e) {
            throw e;
        }
    }
    throw new Error('Claim not present in request');
};

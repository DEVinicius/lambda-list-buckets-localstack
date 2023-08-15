const { describe, it, expect, beforeAll, afterAll} = require('@jest/globals')

const { S3 } = require('../../src/factory')
const { handler } = require('../../src')

describe('Testing AWS Offline Localstack', () => {
    const bucketConfig = {
        Bucket: 'test'
    }

    beforeAll(async() => {
        //create Bucket
        await S3.createBucket(bucketConfig).promise()
    })

    afterAll(async() => {
        await S3.deleteBucket(bucketConfig).promise()
    })

    it('should return an array with S3 Bucket', async() => {
        const expected = bucketConfig.Bucket

        const response = await handler()

        const { Buckets } = JSON.parse(response.body);

        const { Name } = Buckets.find(({Name}) => Name === expected)

        expect(Name).toStrictEqual(expected)
        expect(response.statusCode).toStrictEqual(200)
    })
})
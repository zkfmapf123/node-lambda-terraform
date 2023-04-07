import { APIGatewayEvent, APIGatewayProxyResult, Context } from 'aws-lambda'

export const handler = async (event: APIGatewayEvent, context: Context): Promise<APIGatewayProxyResult> => {
  const [{ Logger }, _] = await Promise.all([import('@src/common/utils/logger'), import('lodash')])

  Logger.info(`event: ${JSON.stringify(event, null, 2)}`)
  Logger.info(`context: ${JSON.stringify(context, null, 2)}`)

  Logger.info(`sum : ${_.sum([1, 2, 3])}`)

  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'hello world',
    }),
  }
}

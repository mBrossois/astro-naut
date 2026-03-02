import type { Access, FieldAccess } from 'payload'
import type { User } from '../payload-types'

const isAdmin = (user: User | null) => {
    return !!(user && user.roles && user.roles.includes('admin'))
}

export const adminOrAccessToken: FieldAccess = ({ req }) => {
  const accessToken = req?.headers?.get('x-access-token') === '12345';
  return !!(isAdmin(req.user) || accessToken)
}

export const loggedIn: Access = ({ req: { user } }) => {
    return Boolean(user)
}

export const hasReadRole: Access = ({ req: { user } }) => {
    return !!(user && user.roles && user.roles.includes('readOnly'))
  }
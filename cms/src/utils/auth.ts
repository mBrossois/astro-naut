import type { Access, FieldAccess } from 'payload'
import type { User } from '../payload-types'
import { hasRole } from './hasRole'

export const adminOrAccessToken: FieldAccess = ({ req }) => {
    if(hasRole('admin', req.user)) {
        return true
    }
    if(req?.headers?.get('x-access-token') === '12345') {
        return true
    }
    return false
}

export const adminOrPublished: Access = ({ req }) => {
    if(hasRole('admin', req.user)) {
        return true
    }
    return {
        _status: {
            equals: 'published'
        }
    }
}

export const loggedIn: Access = ({ req: { user } }) => {
    return Boolean(user)
}

export const hasReadRole: Access = ({ req: { user } }) => {
    return !!(user && user.roles && user.roles.includes('readOnly'))
  }
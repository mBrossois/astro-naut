import type { User } from "@/payload-types";

export const hasRole = (allRoles: User['roles'], user: User | null) => {
    if(user && user.roles) {
        return allRoles.includes(user.roles);
    }
    return false;
}
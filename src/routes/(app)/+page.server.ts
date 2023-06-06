import { PrismaClient, Prisma} from "@prisma/client";
import type { satisfies } from "semver";
import type { Actions } from "@sveltejs/kit";
const _db = new PrismaClient();
export const actions = {
    CreateKlemaKryka: async ({request}) => {
        const data = await request.formData();

        const NameKlema = data.get("NameKlema") as string;

        const NameKryka = data.get("NameKryka") as string;

        console.log("Клема");
    },

    ReloadMessages: async({request}) => {
        const data = await request.formData();
        const UserId = data.get("klema") as string;
        console.log(UserId);
    }
} satisfies Actions;

export async function load ({url}) {
        let q = url.searchParams.get("UserId");
        const users = await _db.users.findMany()
        let messages;
        if(q != undefined){
            messages = await _db.messages.findMany({
                where:{
                    UserId: q?.toString()
                }
            })
        }
        else{
            messages = await _db.messages.findMany({
                where:{
                    UserId: 'asd'
                }
            })
        }
        return {
            messages,
            users
        }
    };
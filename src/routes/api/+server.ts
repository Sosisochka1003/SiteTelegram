import { PrismaClient, Prisma} from "@prisma/client";
import type { RequestHandler } from "@sveltejs/kit";
import type { satisfies } from "semver";
const _db = new PrismaClient();

export const GET = (async ({url}) =>{
    const id = url.searchParams.get("q") as string;
    let messages;
    if(id != undefined){
        messages = await _db.messages.findMany({
            where:{
                UserId: id?.toString()
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
    return new Response(JSON.stringify(messages))
}) satisfies RequestHandler
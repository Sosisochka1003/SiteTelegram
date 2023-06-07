<script lang="ts">
    import { each } from "svelte/internal";
    import { invalidate, invalidateAll } from "$app/navigation";
    export let data: PageData;
    import { goto } from "$app/navigation";
    import { page } from "$app/stores"; 
	import type { PageData } from "./$types";

    const GetMessages = async (UserId: string) => {
        await $page.url.searchParams.set("UserId",UserId.toString());
        await goto(`?${$page.url.searchParams.toString()}`);
        invalidateAll();
    }
    
    const NormalTime = (Time: Date) =>{
        return Time.toLocaleDateString("ru-RU", {year: "numeric", month: "numeric", day: "numeric", hour: "numeric", minute: "numeric", second: "numeric"})
    }
</script>

<div id="line_block">
    {#each data.users as user}
    <button on:click={() => GetMessages(user.UserId)} class="users">{user.UserId}, {user.Name}</button><br>
    {/each}
 </div>
<div id="line_block" class="klema">
    {#each data.messages as message}
        <h2 class="messages" id="{message.Who_send}">{message.MessageText}</h2>
        <p id="{message.Who_send}">{NormalTime(message.TimeSend)}</p>
    {/each}
</div>

<style>
    :root {
        background-color: rgb(158, 173, 255);
    }

    .klema {
        border: 3px solid;
        border-radius: 10px;
        border-color: black;
        width: 700px;
    }

    h2 {
        border: 4px solid; /* Параметры границы */
        background: whitesmoke; /* Цвет фона */
        border-radius: 10px;
    }

    button.users {
        border-radius: 10px;
        width: auto;
        height: max-content;
        margin: 0 15px 15px 0;
        font-size: 25px;
        background-color: rgb(237, 231, 168);
    }

    h2.messages {
        width: auto;
        height: auto;
    }

    #Bot {
        text-align: left;
    }

    #User {
        text-align: right;
        align-items: right;
        align-content: right;
        align-self: right;
    }

    #line_block { 
        float:left; 
        padding: 10px;
    }
</style>
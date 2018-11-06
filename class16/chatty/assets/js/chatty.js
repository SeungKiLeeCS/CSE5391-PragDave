import { Socket } from "phoenix"

export class Chatty {

    constructor() {
        this.chats = document.getElementById("chats")
        this.channel = this.join_channel()
    }   

    join_channel() {
        // create and connect socket
        let socket = new Socket("/socket")
        socket.connect()
        // create and name channel
        let channel = socket.channel("chatty:common")
        channel.join()
        return channel
    }

    setupEventHandlers(channel) {
        channel.on("echo", msg => {
            this.chats.append(msg.key)
        })

        document.body.addEventListener("keypress", ev => {
            this.channel.push("keypress", {key: ev.key})
        })
    }

}
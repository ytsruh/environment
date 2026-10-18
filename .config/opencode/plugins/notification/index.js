import { Plugin } from "@opencode/plugin"
import { execFile } from "node:child_process"

function notify(title, message) {
	return new Promise((resolve) => {
		execFile(
			"osascript",
			["-e", `display notification "${message}" with title "${title}"`],
			(error) => {
				if (error) console.error(`notification failed: ${error.message}`)
				resolve()
			},
		)
	})
}

export default Plugin.define({
	id: "notification",
	setup(ctx) {
		if (ctx.options.enabled === false) return

		const controller = new AbortController()

		void (async () => {
			for await (const event of ctx.event.subscribe({
				signal: controller.signal,
			})) {
				// Send notification on session completion
				if (event.type === "session.idle") {
					await notify("opencode", "Session completed!")
				}
				// Send notification on permission request
				if (event.type === "permission.asked") {
					await notify("opencode", "Permission Requested")
				}
			}
		})()

		return () => controller.abort()
	},
})

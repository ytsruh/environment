export const NotificationPlugin = async ({ $ }) => {
	return {
		event: async ({ event }) => {
			// Send notification on session completion
			if (event.type === "session.idle") {
				await $`osascript -e 'display notification "Session completed!" with title "opencode"'`;
			}
			// Send notification on permission request
			if (event.type === "permission.asked") {
				await $`osascript -e 'display notification "Permission Requested" with title "opencode"'`;
			}
		},
	};
};

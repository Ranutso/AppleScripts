-- ℗ 2017 Andre Godoi
-- Created for managing Mail backups for Amazon.
-- Instructions:
-- Use the Configurations below to change the mailboxes (or folders) and dates you would
-- like to backup.

-- Configurations
set daysToBackup to 150
set daystoDelete to 30
set accountName to "Elemental"
set backupMailbox to "Elemental Archive"
set mailboxesToBackup to {"Inbox", "Systems and Support Engineering"}
set mailboxesToDelete to {"Jive/Global Services", "Jive/Services and Support KB", "Jive/Technical Publications", "Tickets"}
set shouldBackupSent to true

-- Initial sets
set filterDate to current date
set desiredBackupDate to filterDate - daysToBackup * days
set desiredDeleteDate to filterDate - daystoDelete * days
set desiredBackupDateForSent to filterDate - 20 * days -- We are hardcoding the days to backup Sent because Amazon will auto-delete mails older than 30 days.

-- Mail handling
using terms from application "Mail"
	tell application "Mail"
		-- First we will iterate over the backup mailboxes
		repeat with mailboxToBackup in mailboxesToBackup
			set thisBackupMailbox to mailbox mailboxToBackup of mailbox backupMailbox
			set thisMailbox to mailbox mailboxToBackup of account accountName
			-- The steps below are necessary in order to iterate in reverse over the messages.
			-- This is required because of how Mail and AppleScript handle message IDs.
			-- First they get the count of messages in the mailbox and the messages' IDs range from 1
			-- to this count number. Then, as Mail backs up each message, the number of messages
			-- in that folder decreases and Mail returns errors for the last messages.
			set firstMessageID to 1
			set lastMessageID to count of messages in thisMailbox
			-- Iterating in reverse
			repeat with withCurrentID from lastMessageID to firstMessageID by -1
				-- Associate (or retrieve) the message with the desired ID.
				set thisMessage to message withCurrentID of thisMailbox
				-- Check if we have to backup this message
				if thisMessage's date received comes before desiredBackupDate then
					set thisMessage's mailbox to thisBackupMailbox
				end if
			end repeat
		end repeat
		-- If we a are supposed to backup our Sent e-mails, we should do it with the special settings for that specific mailbox.
		if shouldBackupSent then
			set thisBackupMailbox to mailbox "Sent" of mailbox backupMailbox
			set thisMailbox to mailbox "Sent" of account accountName
			-- The steps below are necessary in order to iterate in reverse over the messages.
			-- This is required because of how Mail and AppleScript handle message IDs.
			-- First they get the count of messages in the mailbox and the messages' IDs range from 1
			-- to this count number. Then, as Mail backs up each message, the number of messages
			-- in that folder decreases and Mail returns errors for the last messages.
			set firstMessageID to 1
			set lastMessageID to count of messages in thisMailbox
			-- Iterating in reverse
			repeat with withCurrentID from lastMessageID to firstMessageID by -1
				-- Associate (or retrieve) the message with the desired ID.
				set thisMessage to message withCurrentID of thisMailbox
				-- Check if we have to backup this message. For the "Sent" mailbox, it has to be less than a month.
				if thisMessage's date received comes before desiredBackupDateForSent then
					set thisMessage's mailbox to thisBackupMailbox
				end if
			end repeat
		end if
		-- Now let's delete our messages
		repeat with mailboxToDelete in mailboxesToDelete
			set thisMailbox to mailbox mailboxToDelete of account accountName
			set firstMessageID to 1
			set lastMessageID to count of messages in thisMailbox
			repeat with withCurrentID from lastMessageID to firstMessageID by -1
				set thisMessage to message withCurrentID of thisMailbox
				if thisMessage's date received comes before desiredDeleteDate then
					delete thisMessage
				end if
			end repeat
		end repeat
	end tell
end using terms from
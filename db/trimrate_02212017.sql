-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2017 at 11:10 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trimrate`
--

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_actions`
--

CREATE TABLE `engine4_activity_actions` (
  `action_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  `attachment_count` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` mediumint(5) UNSIGNED NOT NULL DEFAULT '0',
  `like_count` mediumint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_actionsettings`
--

CREATE TABLE `engine4_activity_actionsettings` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_actiontypes`
--

CREATE TABLE `engine4_activity_actiontypes` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `displayable` tinyint(1) NOT NULL DEFAULT '3',
  `attachable` tinyint(1) NOT NULL DEFAULT '1',
  `commentable` tinyint(1) NOT NULL DEFAULT '1',
  `shareable` tinyint(1) NOT NULL DEFAULT '1',
  `is_generated` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_actiontypes`
--

INSERT INTO `engine4_activity_actiontypes` (`type`, `module`, `body`, `enabled`, `displayable`, `attachable`, `commentable`, `shareable`, `is_generated`) VALUES
('album_photo_new', 'album', '{item:$subject} added {var:$count} photo(s) to the album {item:$object}:', 1, 5, 1, 3, 1, 1),
('blog_new', 'blog', '{item:$subject} wrote a new blog entry:', 1, 5, 1, 3, 1, 1),
('classified_new', 'classified', '{item:$subject} posted a new classified listing:', 1, 5, 1, 3, 1, 1),
('comment_album', 'album', '{item:$subject} commented on {item:$owner}\'s {item:$object:album}: {body:$body}', 1, 1, 1, 1, 1, 0),
('comment_album_photo', 'album', '{item:$subject} commented on {item:$owner}\'s {item:$object:photo}: {body:$body}', 1, 1, 1, 1, 1, 0),
('comment_blog', 'blog', '{item:$subject} commented on {item:$owner}\'s {item:$object:blog entry}: {body:$body}', 1, 1, 1, 1, 1, 0),
('comment_classified', 'classified', '{item:$subject} commented on {item:$owner}\'s {item:$object:classified listing}: {body:$body}', 1, 1, 1, 1, 1, 0),
('comment_playlist', 'music', '{item:$subject} commented on {item:$owner}\'s {item:$object:music_playlist}.', 1, 1, 1, 1, 1, 1),
('comment_poll', 'poll', '{item:$subject} commented on {item:$owner}\'s {item:$object:poll}.', 1, 1, 1, 1, 1, 1),
('comment_video', 'video', '{item:$subject} commented on {item:$owner}\'s {item:$object:video}: {body:$body}', 1, 1, 1, 1, 1, 0),
('event_create', 'event', '{item:$subject} created a new event:', 1, 5, 1, 1, 1, 1),
('event_join', 'event', '{item:$subject} joined the event {item:$object}', 1, 3, 1, 1, 1, 1),
('event_photo_upload', 'event', '{item:$subject} added {var:$count} photo(s).', 1, 3, 2, 1, 1, 1),
('event_topic_create', 'event', '{item:$subject} posted a {item:$object:topic} in the event {itemParent:$object:event}: {body:$body}', 1, 3, 1, 1, 1, 1),
('event_topic_reply', 'event', '{item:$subject} replied to a {item:$object:topic} in the event {itemParent:$object:event}: {body:$body}', 1, 3, 1, 1, 1, 1),
('forum_promote', 'forum', '{item:$subject} has been made a moderator for the forum {item:$object}', 1, 3, 1, 1, 1, 1),
('forum_topic_create', 'forum', '{item:$subject} posted a {item:$object:topic} in the forum {itemParent:$object:forum}: {body:$body}', 1, 3, 1, 1, 1, 1),
('forum_topic_reply', 'forum', '{item:$subject} replied to a {item:$object:topic} in the forum {itemParent:$object:forum}: {body:$body}', 1, 3, 1, 1, 1, 1),
('friends', 'user', '{item:$subject} is now friends with {item:$object}.', 1, 3, 0, 1, 1, 1),
('friends_follow', 'user', '{item:$subject} is now following {item:$object}.', 1, 3, 0, 1, 1, 1),
('group_create', 'group', '{item:$subject} created a new group:', 1, 5, 1, 1, 1, 1),
('group_join', 'group', '{item:$subject} joined the group {item:$object}', 1, 3, 1, 1, 1, 1),
('group_photo_upload', 'group', '{item:$subject} added {var:$count} photo(s).', 1, 3, 2, 1, 1, 1),
('group_promote', 'group', '{item:$subject} has been made an officer for the group {item:$object}', 1, 3, 1, 1, 1, 1),
('group_topic_create', 'group', '{item:$subject} posted a {itemChild:$object:topic:$child_id} in the group {item:$object}: {body:$body}', 1, 3, 1, 1, 1, 1),
('group_topic_reply', 'group', '{item:$subject} replied to a {itemChild:$object:topic:$child_id} in the group {item:$object}: {body:$body}', 1, 3, 1, 1, 1, 1),
('login', 'user', '{item:$subject} has signed in.', 0, 1, 0, 1, 1, 1),
('logout', 'user', '{item:$subject} has signed out.', 0, 1, 0, 1, 1, 1),
('music_playlist_new', 'music', '{item:$subject} created a new playlist: {item:$object}', 1, 5, 1, 3, 1, 1),
('network_join', 'network', '{item:$subject} joined the network {item:$object}', 1, 3, 1, 1, 1, 1),
('poll_new', 'poll', '{item:$subject} created a new poll:', 1, 5, 1, 3, 1, 1),
('post', 'user', '{actors:$subject:$object}: {body:$body}', 1, 7, 1, 4, 1, 0),
('post_self', 'user', '{item:$subject} {body:$body}', 1, 5, 1, 4, 1, 0),
('profile_photo_update', 'user', '{item:$subject} has added a new profile photo.', 1, 5, 1, 4, 1, 1),
('share', 'activity', '{item:$subject} shared {item:$object}\'s {var:$type}. {body:$body}', 1, 5, 1, 1, 0, 1),
('signup', 'user', '{item:$subject} has just signed up. Say hello!', 1, 5, 0, 1, 1, 1),
('status', 'user', '{item:$subject} {body:$body}', 1, 5, 0, 1, 4, 0),
('tagged', 'user', '{item:$subject} tagged {item:$object} in a {var:$label}:', 1, 7, 1, 1, 0, 1),
('video_new', 'video', '{item:$subject} posted a new video:', 1, 5, 1, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_attachments`
--

CREATE TABLE `engine4_activity_attachments` (
  `attachment_id` int(11) UNSIGNED NOT NULL,
  `action_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) UNSIGNED NOT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_comments`
--

CREATE TABLE `engine4_activity_comments` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `like_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_likes`
--

CREATE TABLE `engine4_activity_likes` (
  `like_id` int(11) UNSIGNED NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_notifications`
--

CREATE TABLE `engine4_activity_notifications` (
  `notification_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `mitigated` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_notificationsettings`
--

CREATE TABLE `engine4_activity_notificationsettings` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_notificationtypes`
--

CREATE TABLE `engine4_activity_notificationtypes` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `is_request` tinyint(1) NOT NULL DEFAULT '0',
  `handler` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_notificationtypes`
--

INSERT INTO `engine4_activity_notificationtypes` (`type`, `module`, `body`, `is_request`, `handler`, `default`) VALUES
('blog_subscribed_new', 'blog', '{item:$subject} has posted a new blog entry: {item:$object}.', 0, '', 1),
('commented', 'activity', '{item:$subject} has commented on your {item:$object:$label}.', 0, '', 1),
('commented_commented', 'activity', '{item:$subject} has commented on a {item:$object:$label} you commented on.', 0, '', 1),
('event_accepted', 'event', 'Your request to join the event {item:$object} has been approved.', 0, '', 1),
('event_approve', 'event', '{item:$subject} has requested to join the event {item:$object}.', 0, '', 1),
('event_discussion_reply', 'event', '{item:$subject} has {item:$object:posted} on a {itemParent:$object::event topic} you posted on.', 0, '', 1),
('event_discussion_response', 'event', '{item:$subject} has {item:$object:posted} on a {itemParent:$object::event topic} you created.', 0, '', 1),
('event_invite', 'event', '{item:$subject} has invited you to the event {item:$object}.', 1, 'event.widget.request-event', 1),
('forum_promote', 'forum', 'You were promoted to moderator in the forum {item:$object}.', 0, '', 1),
('forum_topic_reply', 'forum', '{item:$subject} has {item:$postGuid:posted} on a {item:$object:forum topic} posted on.', 0, '', 1),
('forum_topic_response', 'forum', '{item:$subject} has {item:$postGuid:posted} on a {item:$object:forum topic} you created.', 0, '', 1),
('friend_accepted', 'user', 'You and {item:$subject} are now friends.', 0, '', 1),
('friend_follow', 'user', '{item:$subject} is now following you.', 0, '', 1),
('friend_follow_accepted', 'user', 'You are now following {item:$subject}.', 0, '', 1),
('friend_follow_request', 'user', '{item:$subject} has requested to follow you.', 1, 'user.friends.request-follow', 1),
('friend_request', 'user', '{item:$subject} has requested to be your friend.', 1, 'user.friends.request-friend', 1),
('group_accepted', 'group', 'Your request to join the group {item:$object} has been approved.', 0, '', 1),
('group_approve', 'group', '{item:$subject} has requested to join the group {item:$object}.', 0, '', 1),
('group_discussion_reply', 'group', '{item:$subject} has {item:$object:posted} on a {itemParent:$object::group topic} you posted on.', 0, '', 1),
('group_discussion_response', 'group', '{item:$subject} has {item:$object:posted} on a {itemParent:$object::group topic} you created.', 0, '', 1),
('group_invite', 'group', '{item:$subject} has invited you to the group {item:$object}.', 1, 'group.widget.request-group', 1),
('group_promote', 'group', 'You were promoted to officer in the group {item:$object}.', 0, '', 1),
('liked', 'activity', '{item:$subject} likes your {item:$object:$label}.', 0, '', 1),
('liked_commented', 'activity', '{item:$subject} has commented on a {item:$object:$label} you liked.', 0, '', 1),
('message_new', 'messages', '{item:$subject} has sent you a {item:$object:message}.', 0, '', 1),
('post_user', 'user', '{item:$subject} has posted on your {item:$object:profile}.', 0, '', 1),
('shared', 'activity', '{item:$subject} has shared your {item:$object:$label}.', 0, '', 1),
('tagged', 'user', '{item:$subject} tagged you in a {item:$object:$label}.', 0, '', 1),
('video_processed', 'video', 'Your {item:$object:video} is ready to be viewed.', 0, '', 1),
('video_processed_failed', 'video', 'Your {item:$object:video} has failed to process.', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_stream`
--

CREATE TABLE `engine4_activity_stream` (
  `target_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `target_id` int(11) UNSIGNED NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `action_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_album_albums`
--

CREATE TABLE `engine4_album_albums` (
  `album_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_album_categories`
--

CREATE TABLE `engine4_album_categories` (
  `category_id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_album_categories`
--

INSERT INTO `engine4_album_categories` (`category_id`, `user_id`, `category_name`) VALUES
(0, 1, 'All Categories'),
(1, 1, 'Arts & Culture'),
(2, 1, 'Business'),
(3, 1, 'Entertainment'),
(5, 1, 'Family & Home'),
(6, 1, 'Health'),
(7, 1, 'Recreation'),
(8, 1, 'Personal'),
(9, 1, 'Shopping'),
(10, 1, 'Society'),
(11, 1, 'Sports'),
(12, 1, 'Technology'),
(13, 1, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_album_photos`
--

CREATE TABLE `engine4_album_photos` (
  `photo_id` int(11) UNSIGNED NOT NULL,
  `album_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `order` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `owner_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_announcement_announcements`
--

CREATE TABLE `engine4_announcement_announcements` (
  `announcement_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `networks` text COLLATE utf8_unicode_ci,
  `member_levels` text COLLATE utf8_unicode_ci,
  `profile_types` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_authorization_allow`
--

CREATE TABLE `engine4_authorization_allow` (
  `resource_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `action` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `role` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` tinyint(1) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_authorization_allow`
--

INSERT INTO `engine4_authorization_allow` (`resource_type`, `resource_id`, `action`, `role`, `role_id`, `value`, `params`) VALUES
('forum', 1, 'post.create', 'registered', 0, 1, NULL),
('forum', 1, 'topic.create', 'registered', 0, 1, NULL),
('forum', 1, 'topic.delete', 'forum_list', 1, 1, NULL),
('forum', 1, 'topic.edit', 'forum_list', 1, 1, NULL),
('forum', 1, 'view', 'everyone', 0, 1, NULL),
('forum', 2, 'post.create', 'registered', 0, 1, NULL),
('forum', 2, 'topic.create', 'registered', 0, 1, NULL),
('forum', 2, 'topic.delete', 'forum_list', 2, 1, NULL),
('forum', 2, 'topic.edit', 'forum_list', 2, 1, NULL),
('forum', 2, 'view', 'everyone', 0, 1, NULL),
('forum', 3, 'post.create', 'registered', 0, 1, NULL),
('forum', 3, 'topic.create', 'registered', 0, 1, NULL),
('forum', 3, 'topic.delete', 'forum_list', 3, 1, NULL),
('forum', 3, 'topic.edit', 'forum_list', 3, 1, NULL),
('forum', 3, 'view', 'everyone', 0, 1, NULL),
('forum', 4, 'post.create', 'registered', 0, 1, NULL),
('forum', 4, 'topic.create', 'registered', 0, 1, NULL),
('forum', 4, 'topic.delete', 'forum_list', 4, 1, NULL),
('forum', 4, 'topic.edit', 'forum_list', 4, 1, NULL),
('forum', 4, 'view', 'everyone', 0, 1, NULL),
('forum', 5, 'post.create', 'registered', 0, 1, NULL),
('forum', 5, 'topic.create', 'registered', 0, 1, NULL),
('forum', 5, 'topic.delete', 'forum_list', 5, 1, NULL),
('forum', 5, 'topic.edit', 'forum_list', 5, 1, NULL),
('forum', 5, 'view', 'everyone', 0, 1, NULL),
('user', 1, 'comment', 'everyone', 0, 1, NULL),
('user', 1, 'comment', 'member', 0, 1, NULL),
('user', 1, 'comment', 'network', 0, 1, NULL),
('user', 1, 'comment', 'registered', 0, 1, NULL),
('user', 1, 'view', 'everyone', 0, 1, NULL),
('user', 1, 'view', 'member', 0, 1, NULL),
('user', 1, 'view', 'network', 0, 1, NULL),
('user', 1, 'view', 'registered', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_authorization_levels`
--

CREATE TABLE `engine4_authorization_levels` (
  `level_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('public','user','moderator','admin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `flag` enum('default','superadmin','public') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_authorization_levels`
--

INSERT INTO `engine4_authorization_levels` (`level_id`, `title`, `description`, `type`, `flag`) VALUES
(1, 'Superadmins', 'Users of this level can modify all of your settings and data.  This level cannot be modified or deleted.', 'admin', 'superadmin'),
(2, 'Admins', 'Users of this level have full access to all of your network settings and data.', 'admin', ''),
(3, 'Moderators', 'Users of this level may edit user-side content.', 'moderator', ''),
(4, 'Default Level', 'This is the default user level.  New users are assigned to it automatically.', 'user', 'default'),
(5, 'Public', 'Settings for this level apply to users who have not logged in.', 'public', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_authorization_permissions`
--

CREATE TABLE `engine4_authorization_permissions` (
  `level_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` tinyint(3) NOT NULL DEFAULT '0',
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_authorization_permissions`
--

INSERT INTO `engine4_authorization_permissions` (`level_id`, `type`, `name`, `value`, `params`) VALUES
(1, 'admin', 'view', 1, NULL),
(1, 'album', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'album', 'auth_tag', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'album', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'album', 'comment', 2, NULL),
(1, 'album', 'create', 1, NULL),
(1, 'album', 'delete', 2, NULL),
(1, 'album', 'edit', 2, NULL),
(1, 'album', 'tag', 2, NULL),
(1, 'album', 'view', 2, NULL),
(1, 'announcement', 'create', 1, NULL),
(1, 'announcement', 'delete', 2, NULL),
(1, 'announcement', 'edit', 2, NULL),
(1, 'announcement', 'view', 2, NULL),
(1, 'blog', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'blog', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(1, 'blog', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'blog', 'comment', 2, NULL),
(1, 'blog', 'create', 1, NULL),
(1, 'blog', 'delete', 2, NULL),
(1, 'blog', 'edit', 2, NULL),
(1, 'blog', 'max', 3, '1000'),
(1, 'blog', 'style', 1, NULL),
(1, 'blog', 'view', 2, NULL),
(1, 'chat', 'chat', 1, NULL),
(1, 'chat', 'im', 1, NULL),
(1, 'classified', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'classified', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr'),
(1, 'classified', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'classified', 'comment', 2, NULL),
(1, 'classified', 'create', 1, NULL),
(1, 'classified', 'css', 2, NULL),
(1, 'classified', 'delete', 2, NULL),
(1, 'classified', 'edit', 2, NULL),
(1, 'classified', 'max', 3, '1000'),
(1, 'classified', 'photo', 1, NULL),
(1, 'classified', 'style', 2, NULL),
(1, 'classified', 'view', 2, NULL),
(1, 'core_link', 'create', 1, NULL),
(1, 'core_link', 'delete', 2, NULL),
(1, 'core_link', 'view', 2, NULL),
(1, 'event', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(1, 'event', 'auth_photo', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(1, 'event', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(1, 'event', 'comment', 2, NULL),
(1, 'event', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(1, 'event', 'create', 1, NULL),
(1, 'event', 'delete', 2, NULL),
(1, 'event', 'edit', 2, NULL),
(1, 'event', 'invite', 1, NULL),
(1, 'event', 'photo', 1, NULL),
(1, 'event', 'style', 1, NULL),
(1, 'event', 'view', 2, NULL),
(1, 'forum', 'comment', 2, NULL),
(1, 'forum', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(1, 'forum', 'create', 2, NULL),
(1, 'forum', 'delete', 2, NULL),
(1, 'forum', 'edit', 2, NULL),
(1, 'forum', 'post.create', 2, NULL),
(1, 'forum', 'post.delete', 2, NULL),
(1, 'forum', 'post.edit', 2, NULL),
(1, 'forum', 'topic.create', 2, NULL),
(1, 'forum', 'topic.delete', 2, NULL),
(1, 'forum', 'topic.edit', 2, NULL),
(1, 'forum', 'view', 2, NULL),
(1, 'forum_post', 'create', 2, NULL),
(1, 'forum_post', 'delete', 2, NULL),
(1, 'forum_post', 'edit', 2, NULL),
(1, 'forum_topic', 'create', 2, NULL),
(1, 'forum_topic', 'delete', 2, NULL),
(1, 'forum_topic', 'edit', 2, NULL),
(1, 'forum_topic', 'move', 2, NULL),
(1, 'general', 'activity', 2, NULL),
(1, 'general', 'style', 2, NULL),
(1, 'group', 'auth_comment', 5, '["registered", "member", "officer"]'),
(1, 'group', 'auth_event', 5, '["registered", "member", "officer"]'),
(1, 'group', 'auth_photo', 5, '["registered", "member", "officer"]'),
(1, 'group', 'auth_view', 5, '["everyone", "registered", "member"]'),
(1, 'group', 'comment', 2, NULL),
(1, 'group', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(1, 'group', 'create', 1, NULL),
(1, 'group', 'delete', 2, NULL),
(1, 'group', 'edit', 2, NULL),
(1, 'group', 'event', 1, NULL),
(1, 'group', 'invite', 1, NULL),
(1, 'group', 'photo', 1, NULL),
(1, 'group', 'photo.edit', 2, NULL),
(1, 'group', 'style', 1, NULL),
(1, 'group', 'topic.edit', 2, NULL),
(1, 'group', 'view', 2, NULL),
(1, 'messages', 'auth', 3, 'friends'),
(1, 'messages', 'create', 1, NULL),
(1, 'messages', 'editor', 3, 'plaintext'),
(1, 'music_playlist', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'music_playlist', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'music_playlist', 'comment', 2, NULL),
(1, 'music_playlist', 'create', 1, NULL),
(1, 'music_playlist', 'delete', 2, NULL),
(1, 'music_playlist', 'edit', 2, NULL),
(1, 'music_playlist', 'view', 2, NULL),
(1, 'poll', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'poll', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'poll', 'comment', 2, NULL),
(1, 'poll', 'create', 1, NULL),
(1, 'poll', 'delete', 2, NULL),
(1, 'poll', 'edit', 2, NULL),
(1, 'poll', 'view', 2, NULL),
(1, 'poll', 'vote', 2, NULL),
(1, 'user', 'activity', 1, NULL),
(1, 'user', 'auth_comment', 5, '["everyone","registered","network","member","owner"]'),
(1, 'user', 'auth_view', 5, '["everyone","registered","network","member","owner"]'),
(1, 'user', 'block', 1, NULL),
(1, 'user', 'comment', 2, NULL),
(1, 'user', 'create', 1, NULL),
(1, 'user', 'delete', 2, NULL),
(1, 'user', 'edit', 2, NULL),
(1, 'user', 'search', 1, NULL),
(1, 'user', 'status', 1, NULL),
(1, 'user', 'style', 2, NULL),
(1, 'user', 'username', 2, NULL),
(1, 'user', 'view', 2, NULL),
(1, 'video', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'video', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(1, 'video', 'comment', 2, NULL),
(1, 'video', 'create', 1, NULL),
(1, 'video', 'delete', 2, NULL),
(1, 'video', 'edit', 2, NULL),
(1, 'video', 'max', 3, '20'),
(1, 'video', 'upload', 1, NULL),
(1, 'video', 'view', 2, NULL),
(2, 'admin', 'view', 1, NULL),
(2, 'album', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'album', 'auth_tag', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'album', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'album', 'comment', 2, NULL),
(2, 'album', 'create', 1, NULL),
(2, 'album', 'delete', 2, NULL),
(2, 'album', 'edit', 2, NULL),
(2, 'album', 'tag', 2, NULL),
(2, 'album', 'view', 2, NULL),
(2, 'announcement', 'create', 1, NULL),
(2, 'announcement', 'delete', 2, NULL),
(2, 'announcement', 'edit', 2, NULL),
(2, 'announcement', 'view', 2, NULL),
(2, 'blog', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'blog', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(2, 'blog', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'blog', 'comment', 2, NULL),
(2, 'blog', 'create', 1, NULL),
(2, 'blog', 'delete', 2, NULL),
(2, 'blog', 'edit', 2, NULL),
(2, 'blog', 'max', 3, '1000'),
(2, 'blog', 'style', 1, NULL),
(2, 'blog', 'view', 2, NULL),
(2, 'chat', 'chat', 1, NULL),
(2, 'chat', 'im', 1, NULL),
(2, 'classified', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'classified', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr'),
(2, 'classified', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'classified', 'comment', 2, NULL),
(2, 'classified', 'create', 1, NULL),
(2, 'classified', 'css', 2, NULL),
(2, 'classified', 'delete', 2, NULL),
(2, 'classified', 'edit', 2, NULL),
(2, 'classified', 'max', 3, '1000'),
(2, 'classified', 'photo', 1, NULL),
(2, 'classified', 'style', 2, NULL),
(2, 'classified', 'view', 2, NULL),
(2, 'core_link', 'create', 1, NULL),
(2, 'core_link', 'delete', 2, NULL),
(2, 'core_link', 'view', 2, NULL),
(2, 'event', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(2, 'event', 'auth_photo', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(2, 'event', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(2, 'event', 'comment', 2, NULL),
(2, 'event', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(2, 'event', 'create', 1, NULL),
(2, 'event', 'delete', 2, NULL),
(2, 'event', 'edit', 2, NULL),
(2, 'event', 'invite', 1, NULL),
(2, 'event', 'photo', 1, NULL),
(2, 'event', 'style', 1, NULL),
(2, 'event', 'view', 2, NULL),
(2, 'forum', 'comment', 2, NULL),
(2, 'forum', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(2, 'forum', 'create', 2, NULL),
(2, 'forum', 'delete', 2, NULL),
(2, 'forum', 'edit', 2, NULL),
(2, 'forum', 'post.create', 2, NULL),
(2, 'forum', 'post.delete', 2, NULL),
(2, 'forum', 'post.edit', 2, NULL),
(2, 'forum', 'topic.create', 2, NULL),
(2, 'forum', 'topic.delete', 2, NULL),
(2, 'forum', 'topic.edit', 2, NULL),
(2, 'forum', 'view', 2, NULL),
(2, 'forum_post', 'create', 2, NULL),
(2, 'forum_post', 'delete', 2, NULL),
(2, 'forum_post', 'edit', 2, NULL),
(2, 'forum_topic', 'create', 2, NULL),
(2, 'forum_topic', 'delete', 2, NULL),
(2, 'forum_topic', 'edit', 2, NULL),
(2, 'forum_topic', 'move', 2, NULL),
(2, 'general', 'activity', 2, NULL),
(2, 'general', 'style', 2, NULL),
(2, 'group', 'auth_comment', 5, '["registered", "member", "officer"]'),
(2, 'group', 'auth_event', 5, '["registered", "member", "officer"]'),
(2, 'group', 'auth_photo', 5, '["registered", "member", "officer"]'),
(2, 'group', 'auth_view', 5, '["everyone", "registered", "member"]'),
(2, 'group', 'comment', 2, NULL),
(2, 'group', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(2, 'group', 'create', 1, NULL),
(2, 'group', 'delete', 2, NULL),
(2, 'group', 'edit', 2, NULL),
(2, 'group', 'event', 1, NULL),
(2, 'group', 'invite', 1, NULL),
(2, 'group', 'photo', 1, NULL),
(2, 'group', 'photo.edit', 2, NULL),
(2, 'group', 'style', 1, NULL),
(2, 'group', 'topic.edit', 2, NULL),
(2, 'group', 'view', 2, NULL),
(2, 'messages', 'auth', 3, 'friends'),
(2, 'messages', 'create', 1, NULL),
(2, 'messages', 'editor', 3, 'plaintext'),
(2, 'music_playlist', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'music_playlist', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'music_playlist', 'comment', 2, NULL),
(2, 'music_playlist', 'create', 1, NULL),
(2, 'music_playlist', 'delete', 2, NULL),
(2, 'music_playlist', 'edit', 2, NULL),
(2, 'music_playlist', 'view', 2, NULL),
(2, 'poll', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'poll', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'poll', 'comment', 2, NULL),
(2, 'poll', 'create', 1, NULL),
(2, 'poll', 'delete', 2, NULL),
(2, 'poll', 'edit', 2, NULL),
(2, 'poll', 'view', 2, NULL),
(2, 'poll', 'vote', 2, NULL),
(2, 'user', 'activity', 1, NULL),
(2, 'user', 'auth_comment', 5, '["everyone","registered","network","member","owner"]'),
(2, 'user', 'auth_view', 5, '["everyone","registered","network","member","owner"]'),
(2, 'user', 'block', 1, NULL),
(2, 'user', 'comment', 2, NULL),
(2, 'user', 'create', 1, NULL),
(2, 'user', 'delete', 2, NULL),
(2, 'user', 'edit', 2, NULL),
(2, 'user', 'search', 1, NULL),
(2, 'user', 'status', 1, NULL),
(2, 'user', 'style', 2, NULL),
(2, 'user', 'username', 2, NULL),
(2, 'user', 'view', 2, NULL),
(2, 'video', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'video', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(2, 'video', 'comment', 2, NULL),
(2, 'video', 'create', 1, NULL),
(2, 'video', 'delete', 2, NULL),
(2, 'video', 'edit', 2, NULL),
(2, 'video', 'max', 3, '20'),
(2, 'video', 'upload', 1, NULL),
(2, 'video', 'view', 2, NULL),
(3, 'album', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'album', 'auth_tag', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'album', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'album', 'comment', 2, NULL),
(3, 'album', 'create', 1, NULL),
(3, 'album', 'delete', 2, NULL),
(3, 'album', 'edit', 2, NULL),
(3, 'album', 'tag', 2, NULL),
(3, 'album', 'view', 2, NULL),
(3, 'announcement', 'view', 1, NULL),
(3, 'blog', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'blog', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(3, 'blog', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'blog', 'comment', 2, NULL),
(3, 'blog', 'create', 1, NULL),
(3, 'blog', 'delete', 2, NULL),
(3, 'blog', 'edit', 2, NULL),
(3, 'blog', 'max', 3, '1000'),
(3, 'blog', 'style', 1, NULL),
(3, 'blog', 'view', 2, NULL),
(3, 'chat', 'chat', 1, NULL),
(3, 'chat', 'im', 1, NULL),
(3, 'classified', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'classified', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr'),
(3, 'classified', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'classified', 'comment', 2, NULL),
(3, 'classified', 'create', 1, NULL),
(3, 'classified', 'css', 2, NULL),
(3, 'classified', 'delete', 2, NULL),
(3, 'classified', 'edit', 2, NULL),
(3, 'classified', 'max', 3, '1000'),
(3, 'classified', 'photo', 1, NULL),
(3, 'classified', 'style', 2, NULL),
(3, 'classified', 'view', 2, NULL),
(3, 'core_link', 'create', 1, NULL),
(3, 'core_link', 'delete', 2, NULL),
(3, 'core_link', 'view', 2, NULL),
(3, 'event', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(3, 'event', 'auth_photo', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(3, 'event', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(3, 'event', 'comment', 2, NULL),
(3, 'event', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(3, 'event', 'create', 1, NULL),
(3, 'event', 'delete', 2, NULL),
(3, 'event', 'edit', 2, NULL),
(3, 'event', 'invite', 1, NULL),
(3, 'event', 'photo', 1, NULL),
(3, 'event', 'style', 1, NULL),
(3, 'event', 'view', 2, NULL),
(3, 'forum', 'comment', 2, NULL),
(3, 'forum', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(3, 'forum', 'create', 2, NULL),
(3, 'forum', 'delete', 2, NULL),
(3, 'forum', 'edit', 2, NULL),
(3, 'forum', 'post.create', 2, NULL),
(3, 'forum', 'post.delete', 2, NULL),
(3, 'forum', 'post.edit', 2, NULL),
(3, 'forum', 'topic.create', 2, NULL),
(3, 'forum', 'topic.delete', 2, NULL),
(3, 'forum', 'topic.edit', 2, NULL),
(3, 'forum', 'view', 2, NULL),
(3, 'forum_post', 'create', 2, NULL),
(3, 'forum_post', 'delete', 2, NULL),
(3, 'forum_post', 'edit', 2, NULL),
(3, 'forum_topic', 'create', 2, NULL),
(3, 'forum_topic', 'delete', 2, NULL),
(3, 'forum_topic', 'edit', 2, NULL),
(3, 'forum_topic', 'move', 2, NULL),
(3, 'general', 'activity', 2, NULL),
(3, 'general', 'style', 2, NULL),
(3, 'group', 'auth_comment', 5, '["registered", "member", "officer"]'),
(3, 'group', 'auth_event', 5, '["registered", "member", "officer"]'),
(3, 'group', 'auth_photo', 5, '["registered", "member", "officer"]'),
(3, 'group', 'auth_view', 5, '["everyone", "registered", "member"]'),
(3, 'group', 'comment', 2, NULL),
(3, 'group', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(3, 'group', 'create', 1, NULL),
(3, 'group', 'delete', 2, NULL),
(3, 'group', 'edit', 2, NULL),
(3, 'group', 'event', 1, NULL),
(3, 'group', 'invite', 1, NULL),
(3, 'group', 'photo', 1, NULL),
(3, 'group', 'photo.edit', 2, NULL),
(3, 'group', 'style', 1, NULL),
(3, 'group', 'topic.edit', 2, NULL),
(3, 'group', 'view', 2, NULL),
(3, 'messages', 'auth', 3, 'friends'),
(3, 'messages', 'create', 1, NULL),
(3, 'messages', 'editor', 3, 'plaintext'),
(3, 'music_playlist', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'music_playlist', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'music_playlist', 'comment', 2, NULL),
(3, 'music_playlist', 'create', 1, NULL),
(3, 'music_playlist', 'delete', 2, NULL),
(3, 'music_playlist', 'edit', 2, NULL),
(3, 'music_playlist', 'view', 2, NULL),
(3, 'poll', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'poll', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'poll', 'comment', 2, NULL),
(3, 'poll', 'create', 1, NULL),
(3, 'poll', 'delete', 2, NULL),
(3, 'poll', 'edit', 2, NULL),
(3, 'poll', 'view', 2, NULL),
(3, 'poll', 'vote', 2, NULL),
(3, 'user', 'activity', 1, NULL),
(3, 'user', 'auth_comment', 5, '["everyone","registered","network","member","owner"]'),
(3, 'user', 'auth_view', 5, '["everyone","registered","network","member","owner"]'),
(3, 'user', 'block', 1, NULL),
(3, 'user', 'comment', 2, NULL),
(3, 'user', 'create', 1, NULL),
(3, 'user', 'delete', 2, NULL),
(3, 'user', 'edit', 2, NULL),
(3, 'user', 'search', 1, NULL),
(3, 'user', 'status', 1, NULL),
(3, 'user', 'style', 2, NULL),
(3, 'user', 'username', 2, NULL),
(3, 'user', 'view', 2, NULL),
(3, 'video', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'video', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(3, 'video', 'comment', 2, NULL),
(3, 'video', 'create', 1, NULL),
(3, 'video', 'delete', 2, NULL),
(3, 'video', 'edit', 2, NULL),
(3, 'video', 'max', 3, '20'),
(3, 'video', 'upload', 1, NULL),
(3, 'video', 'view', 2, NULL),
(4, 'album', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'album', 'auth_tag', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'album', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'album', 'comment', 1, NULL),
(4, 'album', 'create', 1, NULL),
(4, 'album', 'delete', 1, NULL),
(4, 'album', 'edit', 1, NULL),
(4, 'album', 'tag', 1, NULL),
(4, 'album', 'view', 1, NULL),
(4, 'announcement', 'view', 1, NULL),
(4, 'blog', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'blog', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(4, 'blog', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'blog', 'comment', 1, NULL),
(4, 'blog', 'create', 1, NULL),
(4, 'blog', 'delete', 1, NULL),
(4, 'blog', 'edit', 1, NULL),
(4, 'blog', 'max', 3, '50'),
(4, 'blog', 'style', 1, NULL),
(4, 'blog', 'view', 1, NULL),
(4, 'chat', 'chat', 1, NULL),
(4, 'chat', 'im', 1, NULL),
(4, 'classified', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'classified', 'auth_html', 3, 'strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr'),
(4, 'classified', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'classified', 'comment', 1, NULL),
(4, 'classified', 'create', 1, NULL),
(4, 'classified', 'css', 1, NULL),
(4, 'classified', 'delete', 1, NULL),
(4, 'classified', 'edit', 1, NULL),
(4, 'classified', 'max', 3, '50'),
(4, 'classified', 'photo', 1, NULL),
(4, 'classified', 'style', 1, NULL),
(4, 'classified', 'view', 1, NULL),
(4, 'core_link', 'create', 1, NULL),
(4, 'core_link', 'delete', 1, NULL),
(4, 'core_link', 'view', 1, NULL),
(4, 'event', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(4, 'event', 'auth_photo', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(4, 'event', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","parent_member","member","owner"]'),
(4, 'event', 'comment', 1, NULL),
(4, 'event', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(4, 'event', 'create', 1, NULL),
(4, 'event', 'delete', 1, NULL),
(4, 'event', 'edit', 1, NULL),
(4, 'event', 'invite', 1, NULL),
(4, 'event', 'photo', 1, NULL),
(4, 'event', 'style', 1, NULL),
(4, 'event', 'view', 1, NULL),
(4, 'forum', 'comment', 1, NULL),
(4, 'forum', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(4, 'forum', 'post.create', 2, NULL),
(4, 'forum', 'post.delete', 1, NULL),
(4, 'forum', 'post.edit', 1, NULL),
(4, 'forum', 'topic.create', 1, NULL),
(4, 'forum', 'topic.delete', 1, NULL),
(4, 'forum', 'topic.edit', 1, NULL),
(4, 'forum', 'view', 1, NULL),
(4, 'forum_post', 'create', 1, NULL),
(4, 'forum_post', 'delete', 1, NULL),
(4, 'forum_post', 'edit', 1, NULL),
(4, 'forum_topic', 'create', 1, NULL),
(4, 'forum_topic', 'delete', 1, NULL),
(4, 'forum_topic', 'edit', 1, NULL),
(4, 'general', 'style', 1, NULL),
(4, 'group', 'auth_comment', 5, '["registered", "member", "officer"]'),
(4, 'group', 'auth_event', 5, '["registered", "member", "officer"]'),
(4, 'group', 'auth_photo', 5, '["registered", "member", "officer"]'),
(4, 'group', 'auth_view', 5, '["everyone", "registered", "member"]'),
(4, 'group', 'comment', 1, NULL),
(4, 'group', 'commentHtml', 3, 'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),
(4, 'group', 'create', 1, NULL),
(4, 'group', 'delete', 1, NULL),
(4, 'group', 'edit', 1, NULL),
(4, 'group', 'event', 1, NULL),
(4, 'group', 'invite', 1, NULL),
(4, 'group', 'photo', 1, NULL),
(4, 'group', 'photo.edit', 1, NULL),
(4, 'group', 'style', 1, NULL),
(4, 'group', 'topic.edit', 1, NULL),
(4, 'group', 'view', 1, NULL),
(4, 'messages', 'auth', 3, 'friends'),
(4, 'messages', 'create', 1, NULL),
(4, 'messages', 'editor', 3, 'plaintext'),
(4, 'music_playlist', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'music_playlist', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'music_playlist', 'comment', 1, NULL),
(4, 'music_playlist', 'create', 1, NULL),
(4, 'music_playlist', 'delete', 1, NULL),
(4, 'music_playlist', 'edit', 1, NULL),
(4, 'music_playlist', 'view', 1, NULL),
(4, 'poll', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'poll', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'poll', 'comment', 1, NULL),
(4, 'poll', 'create', 1, NULL),
(4, 'poll', 'delete', 1, NULL),
(4, 'poll', 'edit', 1, NULL),
(4, 'poll', 'view', 1, NULL),
(4, 'poll', 'vote', 1, NULL),
(4, 'user', 'auth_comment', 5, '["everyone","registered","network","member","owner"]'),
(4, 'user', 'auth_view', 5, '["everyone","registered","network","member","owner"]'),
(4, 'user', 'block', 1, NULL),
(4, 'user', 'comment', 1, NULL),
(4, 'user', 'create', 1, NULL),
(4, 'user', 'delete', 1, NULL),
(4, 'user', 'edit', 1, NULL),
(4, 'user', 'search', 1, NULL),
(4, 'user', 'status', 1, NULL),
(4, 'user', 'style', 1, NULL),
(4, 'user', 'username', 1, NULL),
(4, 'user', 'view', 1, NULL),
(4, 'video', 'auth_comment', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'video', 'auth_view', 5, '["everyone","owner_network","owner_member_member","owner_member","owner"]'),
(4, 'video', 'comment', 1, NULL),
(4, 'video', 'create', 1, NULL),
(4, 'video', 'delete', 1, NULL),
(4, 'video', 'edit', 1, NULL),
(4, 'video', 'max', 3, '20'),
(4, 'video', 'upload', 1, NULL),
(4, 'video', 'view', 1, NULL),
(5, 'album', 'tag', 0, NULL),
(5, 'album', 'view', 1, NULL),
(5, 'announcement', 'view', 1, NULL),
(5, 'blog', 'view', 1, NULL),
(5, 'classified', 'view', 1, NULL),
(5, 'core_link', 'view', 1, NULL),
(5, 'event', 'view', 1, NULL),
(5, 'forum', 'view', 1, NULL),
(5, 'group', 'view', 1, NULL),
(5, 'music_playlist', 'view', 1, NULL),
(5, 'poll', 'view', 1, NULL),
(5, 'user', 'view', 1, NULL),
(5, 'video', 'view', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_blog_blogs`
--

CREATE TABLE `engine4_blog_blogs` (
  `blog_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `draft` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_blog_categories`
--

CREATE TABLE `engine4_blog_categories` (
  `category_id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_blog_categories`
--

INSERT INTO `engine4_blog_categories` (`category_id`, `user_id`, `category_name`) VALUES
(1, 1, 'Arts & Culture'),
(2, 1, 'Business'),
(3, 1, 'Entertainment'),
(5, 1, 'Family & Home'),
(6, 1, 'Health'),
(7, 1, 'Recreation'),
(8, 1, 'Personal'),
(9, 1, 'Shopping'),
(10, 1, 'Society'),
(11, 1, 'Sports'),
(12, 1, 'Technology'),
(13, 1, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_blog_subscriptions`
--

CREATE TABLE `engine4_blog_subscriptions` (
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subscriber_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_chat_bans`
--

CREATE TABLE `engine4_chat_bans` (
  `ban_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_chat_events`
--

CREATE TABLE `engine4_chat_events` (
  `event_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_chat_messages`
--

CREATE TABLE `engine4_chat_messages` (
  `message_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_chat_rooms`
--

CREATE TABLE `engine4_chat_rooms` (
  `room_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_count` smallint(6) NOT NULL,
  `modified_date` datetime NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_chat_rooms`
--

INSERT INTO `engine4_chat_rooms` (`room_id`, `title`, `user_count`, `modified_date`, `public`) VALUES
(1, 'General Chat', 0, '2010-02-02 00:44:04', 1),
(2, 'Introduce Yourself', 0, '2010-02-02 00:44:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_chat_roomusers`
--

CREATE TABLE `engine4_chat_roomusers` (
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `date` datetime NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_chat_users`
--

CREATE TABLE `engine4_chat_users` (
  `user_id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `date` datetime NOT NULL,
  `event_count` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_chat_whispers`
--

CREATE TABLE `engine4_chat_whispers` (
  `whisper_id` bigint(20) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `recipient_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `sender_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_albums`
--

CREATE TABLE `engine4_classified_albums` (
  `album_id` int(11) UNSIGNED NOT NULL,
  `classified_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `collectible_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_categories`
--

CREATE TABLE `engine4_classified_categories` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_classified_categories`
--

INSERT INTO `engine4_classified_categories` (`category_id`, `user_id`, `category_name`) VALUES
(1, 1, 'Arts & Culture'),
(2, 1, 'Business'),
(3, 1, 'Entertainment'),
(5, 1, 'Family & Home'),
(6, 1, 'Health'),
(7, 1, 'Recreation'),
(8, 1, 'Personal'),
(9, 1, 'Shopping'),
(10, 1, 'Society'),
(11, 1, 'Sports'),
(12, 1, 'Technology'),
(13, 1, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_classifieds`
--

CREATE TABLE `engine4_classified_classifieds` (
  `classified_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `photo_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_fields_maps`
--

CREATE TABLE `engine4_classified_fields_maps` (
  `field_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_classified_fields_maps`
--

INSERT INTO `engine4_classified_fields_maps` (`field_id`, `option_id`, `child_id`, `order`) VALUES
(0, 0, 2, 2),
(0, 0, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_fields_meta`
--

CREATE TABLE `engine4_classified_fields_meta` (
  `field_id` int(11) NOT NULL,
  `type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `display` tinyint(1) UNSIGNED NOT NULL,
  `search` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `order` smallint(3) UNSIGNED NOT NULL DEFAULT '999',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `validators` text COLLATE utf8_unicode_ci,
  `filters` text COLLATE utf8_unicode_ci,
  `style` text COLLATE utf8_unicode_ci,
  `error` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_classified_fields_meta`
--

INSERT INTO `engine4_classified_fields_meta` (`field_id`, `type`, `label`, `description`, `alias`, `required`, `display`, `search`, `show`, `order`, `config`, `validators`, `filters`, `style`, `error`) VALUES
(2, 'currency', 'Price', '', 'price', 0, 1, 1, 1, 999, '{"unit":"USD"}', NULL, NULL, NULL, NULL),
(3, 'location', 'Location', '', 'location', 0, 1, 1, 1, 999, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_fields_options`
--

CREATE TABLE `engine4_classified_fields_options` (
  `option_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_fields_search`
--

CREATE TABLE `engine4_classified_fields_search` (
  `item_id` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_fields_values`
--

CREATE TABLE `engine4_classified_fields_values` (
  `item_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `index` smallint(3) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_classified_photos`
--

CREATE TABLE `engine4_classified_photos` (
  `photo_id` int(11) UNSIGNED NOT NULL,
  `album_id` int(11) UNSIGNED NOT NULL,
  `classified_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_id` int(11) UNSIGNED NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_adcampaigns`
--

CREATE TABLE `engine4_core_adcampaigns` (
  `adcampaign_id` int(11) UNSIGNED NOT NULL,
  `end_settings` tinyint(4) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `limit_view` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `limit_click` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `limit_ctr` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `network` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `clicks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_adphotos`
--

CREATE TABLE `engine4_core_adphotos` (
  `adphoto_id` int(11) UNSIGNED NOT NULL,
  `ad_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_ads`
--

CREATE TABLE `engine4_core_ads` (
  `ad_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ad_campaign` int(11) UNSIGNED NOT NULL,
  `views` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `clicks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `media_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html_code` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_auth`
--

CREATE TABLE `engine4_core_auth` (
  `id` varchar(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `expires` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedemails`
--

CREATE TABLE `engine4_core_bannedemails` (
  `bannedemail_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedips`
--

CREATE TABLE `engine4_core_bannedips` (
  `bannedip_id` int(10) UNSIGNED NOT NULL,
  `start` varbinary(16) NOT NULL,
  `stop` varbinary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedusernames`
--

CREATE TABLE `engine4_core_bannedusernames` (
  `bannedusername_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedwords`
--

CREATE TABLE `engine4_core_bannedwords` (
  `bannedword_id` int(10) UNSIGNED NOT NULL,
  `word` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_comments`
--

CREATE TABLE `engine4_core_comments` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `like_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_content`
--

CREATE TABLE `engine4_core_content` (
  `content_id` int(11) UNSIGNED NOT NULL,
  `page_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'widget',
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_content_id` int(11) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `params` text COLLATE utf8_unicode_ci,
  `attribs` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_content`
--

INSERT INTO `engine4_core_content` (`content_id`, `page_id`, `type`, `name`, `parent_content_id`, `order`, `params`, `attribs`) VALUES
(100, 1, 'container', 'main', NULL, 1, '', NULL),
(110, 1, 'widget', 'core.menu-mini', 100, 1, '', NULL),
(111, 1, 'widget', 'core.menu-logo', 100, 2, '', NULL),
(112, 1, 'widget', 'core.menu-main', 100, 3, '', NULL),
(200, 2, 'container', 'main', NULL, 1, '', NULL),
(210, 2, 'widget', 'core.menu-footer', 200, 2, '', NULL),
(300, 3, 'container', 'main', NULL, 1, '', NULL),
(310, 3, 'container', 'left', 300, 1, '', NULL),
(311, 3, 'container', 'right', 300, 2, '', NULL),
(312, 3, 'container', 'middle', 300, 3, '', NULL),
(320, 3, 'widget', 'user.login-or-signup', 310, 1, '', NULL),
(321, 3, 'widget', 'user.list-online', 310, 2, '{"title":"%s Members Online"}', NULL),
(322, 3, 'widget', 'core.statistics', 310, 3, '{"title":"Network Stats"}', NULL),
(330, 3, 'widget', 'user.list-signups', 311, 1, '{"title":"Newest Members"}', NULL),
(331, 3, 'widget', 'user.list-popular', 311, 2, '{"title":"Popular Members"}', NULL),
(340, 3, 'widget', 'announcement.list-announcements', 312, 1, '', NULL),
(341, 3, 'widget', 'activity.feed', 312, 2, '{"title":"What\'s New"}', NULL),
(400, 4, 'container', 'main', NULL, 1, '', NULL),
(410, 4, 'container', 'left', 400, 1, '', NULL),
(411, 4, 'container', 'right', 400, 2, '', NULL),
(412, 4, 'container', 'middle', 400, 3, '', NULL),
(420, 4, 'widget', 'user.home-photo', 410, 1, '', NULL),
(421, 4, 'widget', 'user.home-links', 410, 2, '', NULL),
(422, 4, 'widget', 'user.list-online', 410, 3, '{"title":"%s Members Online"}', NULL),
(423, 4, 'widget', 'core.statistics', 410, 4, '{"title":"Network Stats"}', NULL),
(430, 4, 'widget', 'activity.list-requests', 411, 1, '{"title":"Requests"}', NULL),
(431, 4, 'widget', 'user.list-signups', 411, 2, '{"title":"Newest Members"}', NULL),
(432, 4, 'widget', 'user.list-popular', 411, 3, '{"title":"Popular Members"}', NULL),
(440, 4, 'widget', 'announcement.list-announcements', 412, 1, '', NULL),
(441, 4, 'widget', 'activity.feed', 412, 2, '{"title":"What\'s New"}', NULL),
(500, 5, 'container', 'main', NULL, 1, '', NULL),
(510, 5, 'container', 'left', 500, 1, '', NULL),
(511, 5, 'container', 'middle', 500, 3, '', NULL),
(520, 5, 'widget', 'user.profile-photo', 510, 1, '', NULL),
(521, 5, 'widget', 'user.profile-options', 510, 2, '', NULL),
(522, 5, 'widget', 'user.profile-friends-common', 510, 3, '{"title":"Mutual Friends"}', NULL),
(523, 5, 'widget', 'user.profile-info', 510, 4, '{"title":"Member Info"}', NULL),
(530, 5, 'widget', 'user.profile-status', 511, 1, '', NULL),
(531, 5, 'widget', 'core.container-tabs', 511, 2, '{"max":"6"}', NULL),
(540, 5, 'widget', 'activity.feed', 531, 1, '{"title":"Updates"}', NULL),
(541, 5, 'widget', 'user.profile-fields', 531, 2, '{"title":"Info"}', NULL),
(542, 5, 'widget', 'user.profile-friends', 531, 3, '{"title":"Friends","titleCount":true}', NULL),
(546, 5, 'widget', 'core.profile-links', 531, 7, '{"title":"Links","titleCount":true}', NULL),
(547, 6, 'container', 'main', NULL, 1, NULL, NULL),
(548, 6, 'container', 'middle', 547, 2, NULL, NULL),
(549, 6, 'widget', 'core.content', 548, 1, NULL, NULL),
(550, 7, 'container', 'main', NULL, 1, NULL, NULL),
(551, 7, 'container', 'middle', 550, 2, NULL, NULL),
(552, 7, 'widget', 'core.content', 551, 1, NULL, NULL),
(553, 8, 'container', 'main', NULL, 1, NULL, NULL),
(554, 8, 'container', 'middle', 553, 2, NULL, NULL),
(555, 8, 'widget', 'core.content', 554, 1, NULL, NULL),
(556, 9, 'container', 'main', NULL, 1, NULL, NULL),
(557, 9, 'container', 'middle', 556, 1, NULL, NULL),
(558, 9, 'widget', 'core.content', 557, 1, NULL, NULL),
(559, 10, 'container', 'main', NULL, 1, NULL, NULL),
(560, 10, 'container', 'middle', 559, 1, NULL, NULL),
(561, 10, 'widget', 'core.content', 560, 1, NULL, NULL),
(562, 11, 'container', 'main', NULL, 1, NULL, NULL),
(563, 11, 'container', 'middle', 562, 1, NULL, NULL),
(564, 11, 'widget', 'core.content', 563, 1, NULL, NULL),
(565, 12, 'container', 'main', NULL, 1, NULL, NULL),
(566, 12, 'container', 'middle', 565, 1, NULL, NULL),
(567, 12, 'widget', 'core.content', 566, 1, NULL, NULL),
(568, 13, 'container', 'main', NULL, 1, NULL, NULL),
(569, 13, 'container', 'middle', 568, 1, NULL, NULL),
(570, 13, 'widget', 'core.content', 569, 1, NULL, NULL),
(571, 14, 'container', 'top', NULL, 1, NULL, NULL),
(572, 14, 'container', 'main', NULL, 2, NULL, NULL),
(573, 14, 'container', 'middle', 571, 1, NULL, NULL),
(574, 14, 'container', 'middle', 572, 2, NULL, NULL),
(575, 14, 'widget', 'user.settings-menu', 573, 1, NULL, NULL),
(576, 14, 'widget', 'core.content', 574, 1, NULL, NULL),
(577, 15, 'container', 'top', NULL, 1, NULL, NULL),
(578, 15, 'container', 'main', NULL, 2, NULL, NULL),
(579, 15, 'container', 'middle', 577, 1, NULL, NULL),
(580, 15, 'container', 'middle', 578, 2, NULL, NULL),
(581, 15, 'widget', 'user.settings-menu', 579, 1, NULL, NULL),
(582, 15, 'widget', 'core.content', 580, 1, NULL, NULL),
(583, 16, 'container', 'top', NULL, 1, NULL, NULL),
(584, 16, 'container', 'main', NULL, 2, NULL, NULL),
(585, 16, 'container', 'middle', 583, 1, NULL, NULL),
(586, 16, 'container', 'middle', 584, 2, NULL, NULL),
(587, 16, 'widget', 'user.settings-menu', 585, 1, NULL, NULL),
(588, 16, 'widget', 'core.content', 586, 1, NULL, NULL),
(589, 17, 'container', 'top', NULL, 1, NULL, NULL),
(590, 17, 'container', 'main', NULL, 2, NULL, NULL),
(591, 17, 'container', 'middle', 589, 1, NULL, NULL),
(592, 17, 'container', 'middle', 590, 2, NULL, NULL),
(593, 17, 'widget', 'user.settings-menu', 591, 1, NULL, NULL),
(594, 17, 'widget', 'core.content', 592, 1, NULL, NULL),
(595, 18, 'container', 'top', NULL, 1, NULL, NULL),
(596, 18, 'container', 'main', NULL, 2, NULL, NULL),
(597, 18, 'container', 'middle', 595, 1, NULL, NULL),
(598, 18, 'container', 'middle', 596, 2, NULL, NULL),
(599, 18, 'widget', 'user.settings-menu', 597, 1, NULL, NULL),
(600, 18, 'widget', 'core.content', 598, 1, NULL, NULL),
(601, 19, 'container', 'top', NULL, 1, NULL, NULL),
(602, 19, 'container', 'main', NULL, 2, NULL, NULL),
(603, 19, 'container', 'middle', 601, 1, NULL, NULL),
(604, 19, 'container', 'middle', 602, 2, NULL, NULL),
(605, 19, 'widget', 'user.settings-menu', 603, 1, NULL, NULL),
(606, 19, 'widget', 'core.content', 604, 1, NULL, NULL),
(607, 20, 'container', 'top', NULL, 1, NULL, NULL),
(608, 20, 'container', 'main', NULL, 2, NULL, NULL),
(609, 20, 'container', 'middle', 607, 1, NULL, NULL),
(610, 20, 'container', 'middle', 608, 2, NULL, NULL),
(611, 20, 'container', 'left', 608, 1, NULL, NULL),
(612, 20, 'widget', 'user.browse-menu', 609, 1, NULL, NULL),
(613, 20, 'widget', 'core.content', 610, 1, NULL, NULL),
(614, 20, 'widget', 'user.browse-search', 611, 1, NULL, NULL),
(615, 21, 'container', 'main', NULL, 1, NULL, NULL),
(616, 21, 'container', 'middle', 615, 2, NULL, NULL),
(617, 21, 'widget', 'core.content', 616, 1, NULL, NULL),
(618, 21, 'widget', 'core.comments', 616, 2, NULL, NULL),
(619, 22, 'container', 'main', NULL, 1, NULL, NULL),
(620, 22, 'container', 'middle', 619, 2, NULL, NULL),
(621, 22, 'widget', 'core.content', 620, 1, NULL, NULL),
(622, 22, 'widget', 'core.comments', 620, 2, NULL, NULL),
(623, 23, 'container', 'top', NULL, 1, NULL, NULL),
(624, 23, 'container', 'main', NULL, 2, NULL, NULL),
(625, 23, 'container', 'middle', 623, 1, NULL, NULL),
(626, 23, 'container', 'middle', 624, 2, NULL, NULL),
(627, 23, 'container', 'right', 624, 1, NULL, NULL),
(628, 23, 'widget', 'album.browse-menu', 625, 1, NULL, NULL),
(629, 23, 'widget', 'core.content', 626, 1, NULL, NULL),
(630, 23, 'widget', 'album.browse-search', 627, 1, NULL, NULL),
(631, 23, 'widget', 'album.browse-menu-quick', 627, 2, NULL, NULL),
(632, 5, 'widget', 'album.profile-albums', 531, 4, '{"title":"Albums","titleCount":true}', NULL),
(633, 24, 'container', 'top', NULL, 1, NULL, NULL),
(634, 24, 'container', 'main', NULL, 2, NULL, NULL),
(635, 24, 'container', 'middle', 633, 1, NULL, NULL),
(636, 24, 'container', 'middle', 634, 2, NULL, NULL),
(637, 24, 'widget', 'album.browse-menu', 635, 1, NULL, NULL),
(638, 24, 'widget', 'core.content', 636, 1, NULL, NULL),
(639, 25, 'container', 'top', NULL, 1, NULL, NULL),
(640, 25, 'container', 'main', NULL, 2, NULL, NULL),
(641, 25, 'container', 'middle', 639, 1, NULL, NULL),
(642, 25, 'container', 'middle', 640, 2, NULL, NULL),
(643, 25, 'container', 'right', 640, 1, NULL, NULL),
(644, 25, 'widget', 'album.browse-menu', 641, 1, NULL, NULL),
(645, 25, 'widget', 'core.content', 642, 1, NULL, NULL),
(646, 25, 'widget', 'album.browse-search', 643, 1, NULL, NULL),
(647, 25, 'widget', 'album.browse-menu-quick', 643, 2, NULL, NULL),
(648, 5, 'widget', 'blog.profile-blogs', 531, 6, '{"title":"Blogs","titleCount":true}', NULL),
(649, 26, 'container', 'main', NULL, 1, NULL, NULL),
(650, 26, 'container', 'left', 649, 1, NULL, NULL),
(651, 26, 'container', 'middle', 649, 2, NULL, NULL),
(652, 26, 'widget', 'blog.gutter-photo', 650, 1, NULL, NULL),
(653, 26, 'widget', 'blog.gutter-menu', 650, 2, NULL, NULL),
(654, 26, 'widget', 'blog.gutter-search', 650, 3, NULL, NULL),
(655, 26, 'widget', 'core.content', 651, 1, NULL, NULL),
(656, 27, 'container', 'main', NULL, 1, NULL, NULL),
(657, 27, 'container', 'left', 656, 1, NULL, NULL),
(658, 27, 'container', 'middle', 656, 2, NULL, NULL),
(659, 27, 'widget', 'blog.gutter-photo', 657, 1, NULL, NULL),
(660, 27, 'widget', 'blog.gutter-menu', 657, 2, NULL, NULL),
(661, 27, 'widget', 'blog.gutter-search', 657, 3, NULL, NULL),
(662, 27, 'widget', 'core.content', 658, 1, NULL, NULL),
(663, 27, 'widget', 'core.comments', 658, 2, NULL, NULL),
(664, 28, 'container', 'top', NULL, 1, NULL, NULL),
(665, 28, 'container', 'main', NULL, 2, NULL, NULL),
(666, 28, 'container', 'middle', 664, 1, NULL, NULL),
(667, 28, 'container', 'middle', 665, 2, NULL, NULL),
(668, 28, 'container', 'right', 665, 1, NULL, NULL),
(669, 28, 'widget', 'blog.browse-menu', 666, 1, NULL, NULL),
(670, 28, 'widget', 'core.content', 667, 1, NULL, NULL),
(671, 28, 'widget', 'blog.browse-search', 668, 1, NULL, NULL),
(672, 28, 'widget', 'blog.browse-menu-quick', 668, 2, NULL, NULL),
(673, 29, 'container', 'top', NULL, 1, NULL, NULL),
(674, 29, 'container', 'main', NULL, 2, NULL, NULL),
(675, 29, 'container', 'middle', 673, 1, NULL, NULL),
(676, 29, 'container', 'middle', 674, 2, NULL, NULL),
(677, 29, 'widget', 'blog.browse-menu', 675, 1, NULL, NULL),
(678, 29, 'widget', 'core.content', 676, 1, NULL, NULL),
(679, 30, 'container', 'top', NULL, 1, NULL, NULL),
(680, 30, 'container', 'main', NULL, 2, NULL, NULL),
(681, 30, 'container', 'middle', 679, 1, NULL, NULL),
(682, 30, 'container', 'middle', 680, 2, NULL, NULL),
(683, 30, 'container', 'right', 680, 1, NULL, NULL),
(684, 30, 'widget', 'blog.browse-menu', 681, 1, NULL, NULL),
(685, 30, 'widget', 'core.content', 682, 1, NULL, NULL),
(686, 30, 'widget', 'blog.browse-search', 683, 1, NULL, NULL),
(687, 30, 'widget', 'blog.browse-menu-quick', 683, 2, NULL, NULL),
(688, 31, 'container', 'main', NULL, 1, '', NULL),
(689, 31, 'container', 'middle', 688, 3, '', NULL),
(690, 31, 'widget', 'core.content', 689, 1, '', NULL),
(691, 5, 'widget', 'classified.profile-classifieds', 531, 6, '{"title":"Classifieds","titleCount":true}', NULL),
(692, 32, 'container', 'top', NULL, 1, NULL, NULL),
(693, 32, 'container', 'main', NULL, 2, NULL, NULL),
(694, 32, 'container', 'middle', 692, 1, NULL, NULL),
(695, 32, 'container', 'middle', 693, 2, NULL, NULL),
(696, 32, 'container', 'right', 693, 1, NULL, NULL),
(697, 32, 'widget', 'classified.browse-menu', 694, 1, NULL, NULL),
(698, 32, 'widget', 'core.content', 695, 1, NULL, NULL),
(699, 32, 'widget', 'classified.browse-search', 696, 1, NULL, NULL),
(700, 32, 'widget', 'classified.browse-menu-quick', 696, 2, NULL, NULL),
(701, 33, 'container', 'main', NULL, 1, '', NULL),
(702, 33, 'container', 'middle', 701, 3, '', NULL),
(703, 33, 'widget', 'core.content', 702, 1, '', NULL),
(704, 33, 'widget', 'core.comments', 702, 2, '', NULL),
(705, 34, 'container', 'top', NULL, 1, NULL, NULL),
(706, 34, 'container', 'main', NULL, 2, NULL, NULL),
(707, 34, 'container', 'middle', 705, 1, NULL, NULL),
(708, 34, 'container', 'middle', 706, 2, NULL, NULL),
(709, 34, 'widget', 'classified.browse-menu', 707, 1, NULL, NULL),
(710, 34, 'widget', 'core.content', 708, 1, NULL, NULL),
(711, 35, 'container', 'top', NULL, 1, NULL, NULL),
(712, 35, 'container', 'main', NULL, 2, NULL, NULL),
(713, 35, 'container', 'middle', 711, 1, NULL, NULL),
(714, 35, 'container', 'middle', 712, 2, NULL, NULL),
(715, 35, 'container', 'right', 712, 1, NULL, NULL),
(716, 35, 'widget', 'classified.browse-menu', 713, 1, NULL, NULL),
(717, 35, 'widget', 'core.content', 714, 1, NULL, NULL),
(718, 35, 'widget', 'classified.browse-search', 715, 1, NULL, NULL),
(719, 35, 'widget', 'classified.browse-menu-quick', 715, 2, NULL, NULL),
(720, 36, 'container', 'main', NULL, 1, '', NULL),
(721, 36, 'container', 'middle', 720, 2, '', NULL),
(722, 36, 'widget', 'event.profile-status', 721, 3, '', NULL),
(723, 36, 'widget', 'event.profile-photo', 721, 4, '', NULL),
(724, 36, 'widget', 'event.profile-info', 721, 5, '', NULL),
(725, 36, 'widget', 'event.profile-rsvp', 721, 6, '', NULL),
(726, 36, 'widget', 'core.container-tabs', 721, 7, '{"max":6}', NULL),
(727, 36, 'widget', 'activity.feed', 726, 8, '{"title":"What\'s New"}', NULL),
(728, 36, 'widget', 'event.profile-members', 726, 9, '{"title":"Guests","titleCount":true}', NULL),
(729, 37, 'container', 'main', NULL, 1, '', NULL),
(730, 37, 'container', 'middle', 729, 3, '', NULL),
(731, 37, 'container', 'left', 729, 1, '', NULL),
(732, 37, 'widget', 'core.container-tabs', 730, 2, '{"max":"6"}', NULL),
(733, 37, 'widget', 'event.profile-status', 730, 1, '', NULL),
(734, 37, 'widget', 'event.profile-photo', 731, 1, '', NULL),
(735, 37, 'widget', 'event.profile-options', 731, 2, '', NULL),
(736, 37, 'widget', 'event.profile-info', 731, 3, '', NULL),
(737, 37, 'widget', 'event.profile-rsvp', 731, 4, '', NULL),
(738, 37, 'widget', 'activity.feed', 732, 1, '{"title":"Updates"}', NULL),
(739, 37, 'widget', 'event.profile-members', 732, 2, '{"title":"Guests","titleCount":true}', NULL),
(740, 37, 'widget', 'event.profile-photos', 732, 3, '{"title":"Photos","titleCount":true}', NULL),
(741, 37, 'widget', 'event.profile-discussions', 732, 4, '{"title":"Discussions","titleCount":true}', NULL),
(742, 37, 'widget', 'core.profile-links', 732, 5, '{"title":"Links","titleCount":true}', NULL),
(743, 4, 'widget', 'event.home-upcoming', 411, 1, '{"title":"Upcoming Events","titleCount":true}', NULL),
(744, 5, 'widget', 'event.profile-events', 531, 8, '{"title":"Events","titleCount":true}', NULL),
(745, 38, 'container', 'top', NULL, 1, NULL, NULL),
(746, 38, 'container', 'main', NULL, 2, NULL, NULL),
(747, 38, 'container', 'middle', 745, 1, NULL, NULL),
(748, 38, 'container', 'middle', 746, 2, NULL, NULL),
(749, 38, 'container', 'right', 746, 1, NULL, NULL),
(750, 38, 'widget', 'event.browse-menu', 747, 1, NULL, NULL),
(751, 38, 'widget', 'core.content', 748, 1, NULL, NULL),
(752, 38, 'widget', 'event.browse-search', 749, 1, NULL, NULL),
(753, 38, 'widget', 'event.browse-menu-quick', 749, 2, NULL, NULL),
(754, 39, 'container', 'top', NULL, 1, NULL, NULL),
(755, 39, 'container', 'main', NULL, 2, NULL, NULL),
(756, 39, 'container', 'middle', 754, 1, NULL, NULL),
(757, 39, 'container', 'middle', 755, 2, NULL, NULL),
(758, 39, 'widget', 'event.browse-menu', 756, 1, NULL, NULL),
(759, 39, 'widget', 'core.content', 757, 1, NULL, NULL),
(760, 40, 'container', 'top', NULL, 1, NULL, NULL),
(761, 40, 'container', 'main', NULL, 2, NULL, NULL),
(762, 40, 'container', 'middle', 760, 1, NULL, NULL),
(763, 40, 'container', 'middle', 761, 2, NULL, NULL),
(764, 40, 'container', 'right', 761, 1, NULL, NULL),
(765, 40, 'widget', 'event.browse-menu', 762, 1, NULL, NULL),
(766, 40, 'widget', 'core.content', 763, 1, NULL, NULL),
(767, 40, 'widget', 'event.browse-search', 764, 1, NULL, NULL),
(768, 40, 'widget', 'event.browse-menu-quick', 764, 2, NULL, NULL),
(769, 5, 'widget', 'forum.profile-forum-posts', 531, 9, '{"title":"Forum Posts","titleCount":true}', NULL),
(770, 41, 'container', 'main', NULL, 1, NULL, NULL),
(771, 41, 'container', 'middle', 770, 1, NULL, NULL),
(772, 41, 'widget', 'core.content', 771, 1, NULL, NULL),
(773, 42, 'container', 'main', NULL, 1, NULL, NULL),
(774, 42, 'container', 'middle', 773, 1, NULL, NULL),
(775, 42, 'widget', 'core.content', 774, 1, NULL, NULL),
(776, 43, 'container', 'main', NULL, 1, NULL, NULL),
(777, 43, 'container', 'middle', 776, 1, NULL, NULL),
(778, 43, 'widget', 'core.content', 777, 1, NULL, NULL),
(779, 5, 'widget', 'group.profile-groups', 531, 9, '{"title":"Groups","titleCount":true}', NULL),
(780, 44, 'container', 'main', NULL, 1, '', NULL),
(781, 44, 'container', 'middle', 780, 3, '', NULL),
(782, 44, 'container', 'left', 780, 1, '', NULL),
(783, 44, 'widget', 'core.container-tabs', 781, 2, '{"max":"6"}', NULL),
(784, 44, 'widget', 'group.profile-status', 781, 1, '', NULL),
(785, 44, 'widget', 'group.profile-photo', 782, 1, '', NULL),
(786, 44, 'widget', 'group.profile-options', 782, 2, '', NULL),
(787, 44, 'widget', 'group.profile-info', 782, 3, '', NULL),
(788, 44, 'widget', 'activity.feed', 783, 1, '{"title":"Updates"}', NULL),
(789, 44, 'widget', 'group.profile-members', 783, 2, '{"title":"Members","titleCount":true}', NULL),
(790, 44, 'widget', 'group.profile-photos', 783, 3, '{"title":"Photos","titleCount":true}', NULL),
(791, 44, 'widget', 'group.profile-discussions', 783, 4, '{"title":"Discussions","titleCount":true}', NULL),
(792, 44, 'widget', 'core.profile-links', 783, 5, '{"title":"Links","titleCount":true}', NULL),
(793, 44, 'widget', 'group.profile-events', 783, 6, '{"title":"Events","titleCount":true}', NULL),
(794, 45, 'container', 'main', NULL, 1, '', NULL),
(795, 45, 'container', 'middle', 794, 2, '', NULL),
(796, 45, 'widget', 'group.profile-status', 795, 3, '', NULL),
(797, 45, 'widget', 'group.profile-photo', 795, 4, '', NULL),
(798, 45, 'widget', 'group.profile-info', 795, 5, '', NULL),
(799, 45, 'widget', 'core.container-tabs', 795, 6, '{"max":6}', NULL),
(800, 45, 'widget', 'activity.feed', 799, 7, '{"title":"What\'s New"}', NULL),
(801, 45, 'widget', 'group.profile-members', 799, 8, '{"title":"Members","titleCount":true}', NULL),
(802, 46, 'container', 'top', NULL, 1, NULL, NULL),
(803, 46, 'container', 'main', NULL, 2, NULL, NULL),
(804, 46, 'container', 'middle', 802, 1, NULL, NULL),
(805, 46, 'container', 'middle', 803, 2, NULL, NULL),
(806, 46, 'container', 'right', 803, 1, NULL, NULL),
(807, 46, 'widget', 'group.browse-menu', 804, 1, NULL, NULL),
(808, 46, 'widget', 'core.content', 805, 1, NULL, NULL),
(809, 46, 'widget', 'group.browse-search', 806, 1, NULL, NULL),
(810, 46, 'widget', 'group.browse-menu-quick', 806, 2, NULL, NULL),
(811, 47, 'container', 'top', NULL, 1, NULL, NULL),
(812, 47, 'container', 'main', NULL, 2, NULL, NULL),
(813, 47, 'container', 'middle', 811, 1, NULL, NULL),
(814, 47, 'container', 'middle', 812, 2, NULL, NULL),
(815, 47, 'widget', 'group.browse-menu', 813, 1, NULL, NULL),
(816, 47, 'widget', 'core.content', 814, 1, NULL, NULL),
(817, 48, 'container', 'top', NULL, 1, NULL, NULL),
(818, 48, 'container', 'main', NULL, 2, NULL, NULL),
(819, 48, 'container', 'middle', 817, 1, NULL, NULL),
(820, 48, 'container', 'middle', 818, 2, NULL, NULL),
(821, 48, 'container', 'right', 818, 1, NULL, NULL),
(822, 48, 'widget', 'group.browse-menu', 819, 1, NULL, NULL),
(823, 48, 'widget', 'core.content', 820, 1, NULL, NULL),
(824, 48, 'widget', 'group.browse-search', 821, 1, NULL, NULL),
(825, 48, 'widget', 'group.browse-menu-quick', 821, 2, NULL, NULL),
(826, 49, 'container', 'main', NULL, 1, NULL, NULL),
(827, 49, 'container', 'middle', 826, 1, NULL, NULL),
(828, 49, 'widget', 'core.content', 827, 1, NULL, NULL),
(829, 50, 'container', 'main', NULL, 1, NULL, NULL),
(830, 50, 'container', 'middle', 829, 1, NULL, NULL),
(831, 50, 'widget', 'core.content', 830, 2, NULL, NULL),
(832, 50, 'widget', 'messages.menu', 830, 1, NULL, NULL),
(833, 51, 'container', 'main', NULL, 1, NULL, NULL),
(834, 51, 'container', 'middle', 833, 1, NULL, NULL),
(835, 51, 'widget', 'core.content', 834, 2, NULL, NULL),
(836, 51, 'widget', 'messages.menu', 834, 1, NULL, NULL),
(837, 52, 'container', 'main', NULL, 1, NULL, NULL),
(838, 52, 'container', 'middle', 837, 1, NULL, NULL),
(839, 52, 'widget', 'core.content', 838, 2, NULL, NULL),
(840, 52, 'widget', 'messages.menu', 838, 1, NULL, NULL),
(841, 53, 'container', 'main', NULL, 1, NULL, NULL),
(842, 53, 'container', 'middle', 841, 1, NULL, NULL),
(843, 53, 'widget', 'core.content', 842, 2, NULL, NULL),
(844, 53, 'widget', 'messages.menu', 842, 1, NULL, NULL),
(845, 54, 'container', 'main', NULL, 1, NULL, NULL),
(846, 54, 'container', 'middle', 845, 1, NULL, NULL),
(847, 54, 'widget', 'core.content', 846, 2, NULL, NULL),
(848, 54, 'widget', 'messages.menu', 846, 1, NULL, NULL),
(849, 55, 'container', 'main', NULL, 1, '', NULL),
(850, 55, 'widget', 'core.menu-logo', 849, 2, '', NULL),
(851, 55, 'widget', 'mobi.mobi-menu-main', 849, 3, '', NULL),
(852, 56, 'container', 'main', NULL, 1, '', NULL),
(853, 56, 'widget', 'mobi.mobi-footer', 852, 2, '', NULL),
(854, 57, 'container', 'main', NULL, 1, '', NULL),
(855, 57, 'container', 'middle', 854, 2, '', NULL),
(856, 57, 'widget', 'user.login-or-signup', 855, 3, '', NULL),
(857, 58, 'container', 'main', NULL, 1, '', NULL),
(858, 58, 'container', 'middle', 857, 2, '', NULL),
(859, 58, 'widget', 'activity.feed', 858, 3, '', NULL),
(860, 59, 'container', 'main', NULL, 1, '', NULL),
(861, 59, 'container', 'middle', 860, 2, '', NULL),
(862, 59, 'widget', 'user.profile-photo', 861, 3, '', NULL),
(863, 59, 'widget', 'user.profile-status', 861, 4, '', NULL),
(864, 59, 'widget', 'mobi.mobi-profile-options', 861, 5, '', NULL),
(865, 59, 'widget', 'core.container-tabs', 861, 6, '{"max":6}', NULL),
(866, 59, 'widget', 'activity.feed', 865, 7, '{"title":"What\'s New"}', NULL),
(867, 59, 'widget', 'user.profile-fields', 865, 8, '{"title":"Info"}', NULL),
(868, 59, 'widget', 'user.profile-friends', 865, 9, '{"title":"Friends","titleCount":true}', NULL),
(869, 5, 'widget', 'music.profile-music', 531, 10, '{"title":"Music","titleCount":true}', NULL),
(870, 5, 'widget', 'music.profile-player', 510, 5, '', NULL),
(871, 60, 'container', 'top', NULL, 1, NULL, NULL),
(872, 60, 'container', 'main', NULL, 2, NULL, NULL),
(873, 60, 'container', 'middle', 871, 1, NULL, NULL),
(874, 60, 'container', 'middle', 872, 2, NULL, NULL),
(875, 60, 'container', 'right', 872, 1, NULL, NULL),
(876, 60, 'widget', 'music.browse-menu', 873, 1, NULL, NULL),
(877, 60, 'widget', 'core.content', 874, 1, NULL, NULL),
(878, 60, 'widget', 'music.browse-search', 875, 1, NULL, NULL),
(879, 60, 'widget', 'music.browse-menu-quick', 875, 2, NULL, NULL),
(880, 61, 'container', 'main', NULL, 1, NULL, NULL),
(881, 61, 'container', 'middle', 880, 1, NULL, NULL),
(882, 61, 'widget', 'core.content', 881, 1, NULL, NULL),
(883, 61, 'widget', 'core.comments', 881, 2, NULL, NULL),
(884, 62, 'container', 'top', NULL, 1, NULL, NULL),
(885, 62, 'container', 'main', NULL, 2, NULL, NULL),
(886, 62, 'container', 'middle', 884, 1, NULL, NULL),
(887, 62, 'container', 'middle', 885, 2, NULL, NULL),
(888, 62, 'widget', 'music.browse-menu', 886, 1, NULL, NULL),
(889, 62, 'widget', 'core.content', 887, 1, NULL, NULL),
(890, 63, 'container', 'top', NULL, 1, NULL, NULL),
(891, 63, 'container', 'main', NULL, 2, NULL, NULL),
(892, 63, 'container', 'middle', 890, 1, NULL, NULL),
(893, 63, 'container', 'middle', 891, 2, NULL, NULL),
(894, 63, 'container', 'right', 891, 1, NULL, NULL),
(895, 63, 'widget', 'music.browse-menu', 892, 1, NULL, NULL),
(896, 63, 'widget', 'core.content', 893, 1, NULL, NULL),
(897, 63, 'widget', 'music.browse-search', 894, 1, NULL, NULL),
(898, 63, 'widget', 'music.browse-menu-quick', 894, 2, NULL, NULL),
(899, 5, 'widget', 'poll.profile-polls', 531, 11, '{"title":"Polls","titleCount":true}', NULL),
(900, 64, 'container', 'top', NULL, 1, NULL, NULL),
(901, 64, 'container', 'main', NULL, 2, NULL, NULL),
(902, 64, 'container', 'middle', 900, 1, NULL, NULL),
(903, 64, 'container', 'middle', 901, 2, NULL, NULL),
(904, 64, 'container', 'right', 901, 1, NULL, NULL),
(905, 64, 'widget', 'poll.browse-menu', 902, 1, NULL, NULL),
(906, 64, 'widget', 'core.content', 903, 1, NULL, NULL),
(907, 64, 'widget', 'poll.browse-search', 904, 1, NULL, NULL),
(908, 64, 'widget', 'poll.browse-menu-quick', 904, 2, NULL, NULL),
(909, 65, 'container', 'main', NULL, 1, '', NULL),
(910, 65, 'container', 'middle', 909, 3, '', NULL),
(911, 65, 'widget', 'core.content', 910, 1, '', NULL),
(912, 65, 'widget', 'core.comments', 910, 2, '', NULL),
(913, 66, 'container', 'top', NULL, 1, NULL, NULL),
(914, 66, 'container', 'main', NULL, 2, NULL, NULL),
(915, 66, 'container', 'middle', 913, 1, NULL, NULL),
(916, 66, 'container', 'middle', 914, 2, NULL, NULL),
(917, 66, 'widget', 'poll.browse-menu', 915, 1, NULL, NULL),
(918, 66, 'widget', 'core.content', 916, 1, NULL, NULL),
(919, 67, 'container', 'top', NULL, 1, NULL, NULL),
(920, 67, 'container', 'main', NULL, 2, NULL, NULL),
(921, 67, 'container', 'middle', 919, 1, NULL, NULL),
(922, 67, 'container', 'middle', 920, 2, NULL, NULL),
(923, 67, 'container', 'right', 920, 1, NULL, NULL),
(924, 67, 'widget', 'poll.browse-menu', 921, 1, NULL, NULL),
(925, 67, 'widget', 'core.content', 922, 1, NULL, NULL),
(926, 67, 'widget', 'poll.browse-search', 923, 1, NULL, NULL),
(927, 67, 'widget', 'poll.browse-menu-quick', 923, 2, NULL, NULL),
(928, 5, 'widget', 'video.profile-videos', 531, 12, '{"title":"Videos","titleCount":true}', NULL),
(929, 68, 'container', 'main', NULL, 1, '', NULL),
(930, 68, 'container', 'right', 929, 1, '', NULL),
(931, 68, 'container', 'middle', 929, 3, '', NULL),
(932, 68, 'widget', 'core.content', 931, 1, '', NULL),
(933, 68, 'widget', 'core.comments', 931, 2, '', NULL),
(934, 68, 'widget', 'video.show-same-tags', 930, 1, '', NULL),
(935, 68, 'widget', 'video.show-also-liked', 930, 2, '', NULL),
(936, 68, 'widget', 'video.show-same-poster', 930, 3, '', NULL),
(937, 69, 'container', 'top', NULL, 1, NULL, NULL),
(938, 69, 'container', 'main', NULL, 2, NULL, NULL),
(939, 69, 'container', 'middle', 937, 1, NULL, NULL),
(940, 69, 'container', 'middle', 938, 2, NULL, NULL),
(941, 69, 'container', 'right', 938, 1, NULL, NULL),
(942, 69, 'widget', 'video.browse-menu', 939, 1, NULL, NULL),
(943, 69, 'widget', 'core.content', 940, 1, NULL, NULL),
(944, 69, 'widget', 'video.browse-search', 941, 1, NULL, NULL),
(945, 69, 'widget', 'video.browse-menu-quick', 941, 2, NULL, NULL),
(946, 70, 'container', 'top', NULL, 1, NULL, NULL),
(947, 70, 'container', 'main', NULL, 2, NULL, NULL),
(948, 70, 'container', 'middle', 946, 1, NULL, NULL),
(949, 70, 'container', 'middle', 947, 2, NULL, NULL),
(950, 70, 'widget', 'video.browse-menu', 948, 1, NULL, NULL),
(951, 70, 'widget', 'core.content', 949, 1, NULL, NULL),
(952, 71, 'container', 'top', NULL, 1, NULL, NULL),
(953, 71, 'container', 'main', NULL, 2, NULL, NULL),
(954, 71, 'container', 'middle', 952, 1, NULL, NULL),
(955, 71, 'container', 'middle', 953, 2, NULL, NULL),
(956, 71, 'container', 'right', 953, 1, NULL, NULL),
(957, 71, 'widget', 'video.browse-menu', 954, 1, NULL, NULL),
(958, 71, 'widget', 'core.content', 955, 1, NULL, NULL),
(959, 71, 'widget', 'video.browse-search', 956, 1, NULL, NULL),
(960, 71, 'widget', 'video.browse-menu-quick', 956, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_geotags`
--

CREATE TABLE `engine4_core_geotags` (
  `geotag_id` int(11) UNSIGNED NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_jobs`
--

CREATE TABLE `engine4_core_jobs` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `jobtype_id` int(10) UNSIGNED NOT NULL,
  `state` enum('pending','active','sleeping','failed','cancelled','completed','timeout') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `is_complete` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `progress` decimal(5,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `started_date` datetime DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `priority` mediumint(9) NOT NULL DEFAULT '100',
  `data` text COLLATE utf8_unicode_ci,
  `messages` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_jobtypes`
--

CREATE TABLE `engine4_core_jobtypes` (
  `jobtype_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `form` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `priority` mediumint(9) NOT NULL DEFAULT '100',
  `multi` tinyint(3) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_jobtypes`
--

INSERT INTO `engine4_core_jobtypes` (`jobtype_id`, `title`, `type`, `module`, `plugin`, `form`, `enabled`, `priority`, `multi`) VALUES
(1, 'Download File', 'file_download', 'core', 'Core_Plugin_Job_FileDownload', 'Core_Form_Admin_Job_FileDownload', 1, 100, 1),
(2, 'Upload File', 'file_upload', 'core', 'Core_Plugin_Job_FileUpload', 'Core_Form_Admin_Job_FileUpload', 1, 100, 1),
(3, 'Rebuild Activity Privacy', 'activity_maintenance_rebuild_privacy', 'activity', 'Activity_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(4, 'Rebuild Member Privacy', 'user_maintenance_rebuild_privacy', 'user', 'User_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(5, 'Rebuild Network Membership', 'network_maintenance_rebuild_membership', 'network', 'Network_Plugin_Job_Maintenance_RebuildMembership', NULL, 1, 50, 1),
(6, 'Storage Transfer', 'storage_transfer', 'core', 'Storage_Plugin_Job_Transfer', 'Core_Form_Admin_Job_Generic', 1, 100, 1),
(7, 'Storage Cleanup', 'storage_cleanup', 'core', 'Storage_Plugin_Job_Cleanup', 'Core_Form_Admin_Job_Generic', 1, 100, 1),
(8, 'Rebuild Album Privacy', 'album_maintenance_rebuild_privacy', 'album', 'Album_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(9, 'Rebuild Blog Privacy', 'blog_maintenance_rebuild_privacy', 'blog', 'Blog_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(10, 'Rebuild Classified Privacy', 'classified_maintenance_rebuild_privacy', 'classified', 'Classified_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(11, 'Rebuild Event Privacy', 'event_maintenance_rebuild_privacy', 'event', 'Event_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(12, 'Rebuild Group Privacy', 'group_maintenance_rebuild_privacy', 'group', 'Group_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(13, 'Rebuild Music Privacy', 'music_maintenance_rebuild_privacy', 'music', 'Music_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(14, 'Rebuild Poll Privacy', 'poll_maintenance_rebuild_privacy', 'poll', 'Poll_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(15, 'Video Encode', 'video_encode', 'video', 'Video_Plugin_Job_Encode', NULL, 1, 75, 2),
(16, 'Rebuild Video Privacy', 'video_maintenance_rebuild_privacy', 'video', 'Video_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_languages`
--

CREATE TABLE `engine4_core_languages` (
  `language_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fallback` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_languages`
--

INSERT INTO `engine4_core_languages` (`language_id`, `code`, `name`, `fallback`, `order`) VALUES
(1, 'en', 'English', 'en', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_likes`
--

CREATE TABLE `engine4_core_likes` (
  `like_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_links`
--

CREATE TABLE `engine4_core_links` (
  `link_id` int(11) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL,
  `owner_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `view_count` mediumint(6) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_listitems`
--

CREATE TABLE `engine4_core_listitems` (
  `listitem_id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_lists`
--

CREATE TABLE `engine4_core_lists` (
  `list_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `child_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `child_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_log`
--

CREATE TABLE `engine4_core_log` (
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `domain` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `plugin` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(2) NOT NULL DEFAULT '6',
  `priorityName` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INFO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_mail`
--

CREATE TABLE `engine4_core_mail` (
  `mail_id` int(11) UNSIGNED NOT NULL,
  `type` enum('system','zend') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(3) DEFAULT '100',
  `recipient_count` int(11) UNSIGNED DEFAULT '0',
  `recipient_total` int(10) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_mailrecipients`
--

CREATE TABLE `engine4_core_mailrecipients` (
  `recipient_id` int(11) UNSIGNED NOT NULL,
  `mail_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `email` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_mailtemplates`
--

CREATE TABLE `engine4_core_mailtemplates` (
  `mailtemplate_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vars` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_mailtemplates`
--

INSERT INTO `engine4_core_mailtemplates` (`mailtemplate_id`, `type`, `module`, `vars`) VALUES
(1, 'header', 'core', ''),
(2, 'footer', 'core', ''),
(3, 'header_member', 'core', ''),
(4, 'footer_member', 'core', ''),
(5, 'core_contact', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_name],[sender_email],[sender_link],[sender_photo],[message]'),
(6, 'core_verification', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),
(7, 'core_verification_password', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link],[password]'),
(8, 'core_welcome', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),
(9, 'core_welcome_password', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link],[password]'),
(10, 'notify_admin_user_signup', 'core', '[host],[email],[date],[recipient_title],[object_title],[object_link]'),
(11, 'core_lostpassword', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),
(12, 'notify_commented', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(13, 'notify_commented_commented', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(14, 'notify_liked', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(15, 'notify_liked_commented', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(16, 'user_account_approved', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo]'),
(17, 'notify_friend_accepted', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(18, 'notify_friend_request', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(19, 'notify_friend_follow_request', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(20, 'notify_friend_follow_accepted', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(21, 'notify_friend_follow', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(22, 'notify_post_user', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(23, 'notify_tagged', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(24, 'notify_message_new', 'messages', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(25, 'invite', 'invite', '[host],[email],[sender_email],[sender_title],[sender_link],[sender_photo],[message],[object_link],[code]'),
(26, 'invite_code', 'invite', '[host],[email],[sender_email],[sender_title],[sender_link],[sender_photo],[message],[object_link],[code]'),
(27, 'payment_subscription_active', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(28, 'payment_subscription_cancelled', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(29, 'payment_subscription_expired', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(30, 'payment_subscription_overdue', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(31, 'payment_subscription_pending', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(32, 'payment_subscription_recurrence', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(33, 'payment_subscription_refunded', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(34, 'notify_blog_subscribed_new', 'blog', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(35, 'notify_event_accepted', 'event', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(36, 'notify_event_approve', 'event', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(37, 'notify_event_discussion_response', 'event', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(38, 'notify_event_discussion_reply', 'event', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(39, 'notify_event_invite', 'event', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(40, 'notify_forum_topic_reply', 'forum', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(41, 'notify_forum_topic_response', 'forum', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(42, 'notify_forum_promote', 'forum', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(43, 'notify_group_accepted', 'group', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(44, 'notify_group_approve', 'group', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(45, 'notify_group_discussion_reply', 'group', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(46, 'notify_group_discussion_response', 'group', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(47, 'notify_group_invite', 'group', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(48, 'notify_group_promote', 'group', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(49, 'notify_video_processed', 'video', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(50, 'notify_video_processed_failed', 'video', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_menuitems`
--

CREATE TABLE `engine4_core_menuitems` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `label` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `submenu` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `custom` tinyint(1) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_menuitems`
--

INSERT INTO `engine4_core_menuitems` (`id`, `name`, `module`, `label`, `plugin`, `params`, `menu`, `submenu`, `enabled`, `custom`, `order`) VALUES
(1, 'core_main_home', 'core', 'Home', 'User_Plugin_Menus', '', 'core_main', '', 1, 0, 1),
(2, 'core_sitemap_home', 'core', 'Home', '', '{"route":"default"}', 'core_sitemap', '', 1, 0, 1),
(3, 'core_footer_privacy', 'core', 'Privacy', '', '{"route":"default","module":"core","controller":"help","action":"privacy"}', 'core_footer', '', 1, 0, 1),
(4, 'core_footer_terms', 'core', 'Terms of Service', '', '{"route":"default","module":"core","controller":"help","action":"terms"}', 'core_footer', '', 1, 0, 2),
(5, 'core_footer_contact', 'core', 'Contact', '', '{"route":"default","module":"core","controller":"help","action":"contact"}', 'core_footer', '', 1, 0, 3),
(6, 'core_mini_admin', 'core', 'Admin', 'User_Plugin_Menus', '', 'core_mini', '', 1, 0, 6),
(7, 'core_mini_profile', 'user', 'My Profile', 'User_Plugin_Menus', '', 'core_mini', '', 1, 0, 5),
(8, 'core_mini_settings', 'user', 'Settings', 'User_Plugin_Menus', '', 'core_mini', '', 1, 0, 3),
(9, 'core_mini_auth', 'user', 'Auth', 'User_Plugin_Menus', '', 'core_mini', '', 0, 0, 2),
(10, 'core_mini_signup', 'user', 'Signup', 'User_Plugin_Menus', '', 'core_mini', '', 1, 0, 1),
(11, 'core_admin_main_home', 'core', 'Home', '', '{"route":"admin_default"}', 'core_admin_main', '', 1, 0, 1),
(12, 'core_admin_main_manage', 'core', 'Manage', '', '{"uri":"javascript:void(0);this.blur();"}', 'core_admin_main', 'core_admin_main_manage', 1, 0, 2),
(13, 'core_admin_main_settings', 'core', 'Settings', '', '{"uri":"javascript:void(0);this.blur();"}', 'core_admin_main', 'core_admin_main_settings', 1, 0, 3),
(14, 'core_admin_main_plugins', 'core', 'Plugins', '', '{"uri":"javascript:void(0);this.blur();"}', 'core_admin_main', 'core_admin_main_plugins', 1, 0, 4),
(15, 'core_admin_main_layout', 'core', 'Layout', '', '{"uri":"javascript:void(0);this.blur();"}', 'core_admin_main', 'core_admin_main_layout', 1, 0, 5),
(16, 'core_admin_main_ads', 'core', 'Ads', '', '{"uri":"javascript:void(0);this.blur();"}', 'core_admin_main', 'core_admin_main_ads', 1, 0, 6),
(17, 'core_admin_main_stats', 'core', 'Stats', '', '{"uri":"javascript:void(0);this.blur();"}', 'core_admin_main', 'core_admin_main_stats', 1, 0, 8),
(18, 'core_admin_main_manage_levels', 'core', 'Member Levels', '', '{"route":"admin_default","module":"authorization","controller":"level"}', 'core_admin_main_manage', '', 1, 0, 2),
(19, 'core_admin_main_manage_networks', 'network', 'Networks', '', '{"route":"admin_default","module":"network","controller":"manage"}', 'core_admin_main_manage', '', 1, 0, 3),
(20, 'core_admin_main_manage_announcements', 'announcement', 'Announcements', '', '{"route":"admin_default","module":"announcement","controller":"manage"}', 'core_admin_main_manage', '', 1, 0, 4),
(21, 'core_admin_message_mail', 'core', 'Email All Members', '', '{"route":"admin_default","module":"core","controller":"message","action":"mail"}', 'core_admin_main_manage', '', 1, 0, 5),
(22, 'core_admin_main_manage_reports', 'core', 'Abuse Reports', '', '{"route":"admin_default","module":"core","controller":"report"}', 'core_admin_main_manage', '', 1, 0, 6),
(23, 'core_admin_main_manage_packages', 'core', 'Packages & Plugins', '', '{"route":"admin_default","module":"core","controller":"packages"}', 'core_admin_main_manage', '', 1, 0, 7),
(24, 'core_admin_main_settings_general', 'core', 'General Settings', '', '{"route":"core_admin_settings","action":"general"}', 'core_admin_main_settings', '', 1, 0, 1),
(25, 'core_admin_main_settings_locale', 'core', 'Locale Settings', '', '{"route":"core_admin_settings","action":"locale"}', 'core_admin_main_settings', '', 1, 0, 1),
(26, 'core_admin_main_settings_fields', 'fields', 'Profile Questions', '', '{"route":"admin_default","module":"user","controller":"fields"}', 'core_admin_main_settings', '', 1, 0, 2),
(27, 'core_admin_main_wibiya', 'core', 'Wibiya Integration', '', '{"route":"admin_default", "action":"wibiya", "controller":"settings", "module":"core"}', 'core_admin_main_settings', '', 1, 0, 4),
(28, 'core_admin_main_settings_spam', 'core', 'Spam & Banning Tools', '', '{"route":"core_admin_settings","action":"spam"}', 'core_admin_main_settings', '', 1, 0, 5),
(29, 'core_admin_main_settings_mailtemplates', 'core', 'Mail Templates', '', '{"route":"admin_default","controller":"mail","action":"templates"}', 'core_admin_main_settings', '', 1, 0, 6),
(30, 'core_admin_main_settings_mailsettings', 'core', 'Mail Settings', '', '{"route":"admin_default","controller":"mail","action":"settings"}', 'core_admin_main_settings', '', 1, 0, 7),
(31, 'core_admin_main_settings_performance', 'core', 'Performance & Caching', '', '{"route":"core_admin_settings","action":"performance"}', 'core_admin_main_settings', '', 1, 0, 8),
(32, 'core_admin_main_settings_password', 'core', 'Admin Password', '', '{"route":"core_admin_settings","action":"password"}', 'core_admin_main_settings', '', 1, 0, 9),
(33, 'core_admin_main_settings_tasks', 'core', 'Task Scheduler', '', '{"route":"admin_default","controller":"tasks"}', 'core_admin_main_settings', '', 1, 0, 10),
(34, 'core_admin_main_layout_content', 'core', 'Layout Editor', '', '{"route":"admin_default","controller":"content"}', 'core_admin_main_layout', '', 1, 0, 1),
(35, 'core_admin_main_layout_themes', 'core', 'Theme Editor', '', '{"route":"admin_default","controller":"themes"}', 'core_admin_main_layout', '', 1, 0, 2),
(36, 'core_admin_main_layout_files', 'core', 'File & Media Manager', '', '{"route":"admin_default","controller":"files"}', 'core_admin_main_layout', '', 1, 0, 3),
(37, 'core_admin_main_layout_language', 'core', 'Language Manager', '', '{"route":"admin_default","controller":"language"}', 'core_admin_main_layout', '', 1, 0, 4),
(38, 'core_admin_main_layout_menus', 'core', 'Menu Editor', '', '{"route":"admin_default","controller":"menus"}', 'core_admin_main_layout', '', 1, 0, 5),
(39, 'core_admin_main_ads_manage', 'core', 'Manage Ad Campaigns', '', '{"route":"admin_default","controller":"ads"}', 'core_admin_main_ads', '', 1, 0, 1),
(40, 'core_admin_main_ads_create', 'core', 'Create New Campaign', '', '{"route":"admin_default","controller":"ads","action":"create"}', 'core_admin_main_ads', '', 1, 0, 2),
(41, 'core_admin_main_ads_affiliate', 'core', 'SE Affiliate Program', '', '{"route":"admin_default","controller":"settings","action":"affiliate"}', 'core_admin_main_ads', '', 1, 0, 3),
(42, 'core_admin_main_ads_viglink', 'core', 'VigLink', '', '{"route":"admin_default","controller":"settings","action":"viglink"}', 'core_admin_main_ads', '', 1, 0, 4),
(43, 'core_admin_main_stats_statistics', 'core', 'Site-wide Statistics', '', '{"route":"admin_default","controller":"stats"}', 'core_admin_main_stats', '', 1, 0, 1),
(44, 'core_admin_main_stats_url', 'core', 'Referring URLs', '', '{"route":"admin_default","controller":"stats","action":"referrers"}', 'core_admin_main_stats', '', 1, 0, 2),
(45, 'core_admin_main_stats_resources', 'core', 'Server Information', '', '{"route":"admin_default","controller":"system"}', 'core_admin_main_stats', '', 1, 0, 3),
(46, 'core_admin_main_stats_logs', 'core', 'Log Browser', '', '{"route":"admin_default","controller":"log","action":"index"}', 'core_admin_main_stats', '', 1, 0, 3),
(47, 'core_admin_banning_general', 'core', 'Spam & Banning Tools', '', '{"route":"core_admin_settings","action":"spam"}', 'core_admin_banning', '', 1, 0, 1),
(48, 'adcampaign_admin_main_edit', 'core', 'Edit Settings', '', '{"route":"admin_default","module":"core","controller":"ads","action":"edit"}', 'adcampaign_admin_main', '', 1, 0, 1),
(49, 'adcampaign_admin_main_manageads', 'core', 'Manage Advertisements', '', '{"route":"admin_default","module":"core","controller":"ads","action":"manageads"}', 'adcampaign_admin_main', '', 1, 0, 2),
(50, 'core_admin_main_settings_activity', 'activity', 'Activity Feed Settings', '', '{"route":"admin_default","module":"activity","controller":"settings","action":"index"}', 'core_admin_main_settings', '', 1, 0, 4),
(51, 'core_admin_main_settings_notifications', 'activity', 'Default Email Notifications', '', '{"route":"admin_default","module":"activity","controller":"settings","action":"notifications"}', 'core_admin_main_settings', '', 1, 0, 11),
(52, 'authorization_admin_main_manage', 'authorization', 'View Member Levels', '', '{"route":"admin_default","module":"authorization","controller":"level"}', 'authorization_admin_main', '', 1, 0, 1),
(53, 'authorization_admin_main_level', 'authorization', 'Member Level Settings', '', '{"route":"admin_default","module":"authorization","controller":"level","action":"edit"}', 'authorization_admin_main', '', 1, 0, 3),
(54, 'authorization_admin_level_main', 'authorization', 'Level Info', '', '{"route":"admin_default","module":"authorization","controller":"level","action":"edit"}', 'authorization_admin_level', '', 1, 0, 1),
(55, 'core_main_user', 'user', 'Members', '', '{"route":"user_general","action":"browse"}', 'core_main', '', 0, 0, 2),
(56, 'core_sitemap_user', 'user', 'Members', '', '{"route":"user_general","action":"browse"}', 'core_sitemap', '', 1, 0, 2),
(57, 'user_home_updates', 'user', 'View Recent Updates', '', '{"route":"recent_activity","icon":"application/modules/User/externals/images/links/updates.png"}', 'user_home', '', 1, 0, 1),
(58, 'user_home_view', 'user', 'View My Profile', 'User_Plugin_Menus', '{"route":"user_profile_self","icon":"application/modules/User/externals/images/links/profile.png"}', 'user_home', '', 1, 0, 2),
(59, 'user_home_edit', 'user', 'Edit My Profile', 'User_Plugin_Menus', '{"route":"user_extended","module":"user","controller":"edit","action":"profile","icon":"application/modules/User/externals/images/links/edit.png"}', 'user_home', '', 1, 0, 3),
(60, 'user_home_friends', 'user', 'Browse Members', '', '{"route":"user_general","controller":"index","action":"browse","icon":"application/modules/User/externals/images/links/search.png"}', 'user_home', '', 1, 0, 4),
(61, 'user_profile_edit', 'user', 'Edit Profile', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 1),
(62, 'user_profile_friend', 'user', 'Friends', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 3),
(63, 'user_profile_block', 'user', 'Block', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 4),
(64, 'user_profile_report', 'user', 'Report User', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 5),
(65, 'user_profile_admin', 'user', 'Admin Settings', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 9),
(66, 'user_edit_profile', 'user', 'Personal Info', '', '{"route":"user_extended","module":"user","controller":"edit","action":"profile"}', 'user_edit', '', 1, 0, 1),
(67, 'user_edit_photo', 'user', 'Edit My Photo', '', '{"route":"user_extended","module":"user","controller":"edit","action":"photo"}', 'user_edit', '', 1, 0, 2),
(68, 'user_edit_style', 'user', 'Profile Style', 'User_Plugin_Menus', '{"route":"user_extended","module":"user","controller":"edit","action":"style"}', 'user_edit', '', 1, 0, 3),
(69, 'user_settings_general', 'user', 'General', '', '{"route":"user_extended","module":"user","controller":"settings","action":"general"}', 'user_settings', '', 1, 0, 1),
(70, 'user_settings_privacy', 'user', 'Privacy', '', '{"route":"user_extended","module":"user","controller":"settings","action":"privacy"}', 'user_settings', '', 1, 0, 2),
(71, 'user_settings_notifications', 'user', 'Notifications', '', '{"route":"user_extended","module":"user","controller":"settings","action":"notifications"}', 'user_settings', '', 1, 0, 3),
(72, 'user_settings_password', 'user', 'Change Password', '', '{"route":"user_extended", "module":"user", "controller":"settings", "action":"password"}', 'user_settings', '', 1, 0, 5),
(73, 'user_settings_delete', 'user', 'Delete Account', 'User_Plugin_Menus::canDelete', '{"route":"user_extended", "module":"user", "controller":"settings", "action":"delete"}', 'user_settings', '', 1, 0, 6),
(74, 'core_admin_main_manage_members', 'user', 'Members', '', '{"route":"admin_default","module":"user","controller":"manage"}', 'core_admin_main_manage', '', 1, 0, 1),
(75, 'core_admin_main_signup', 'user', 'Signup Process', '', '{"route":"admin_default", "controller":"signup", "module":"user"}', 'core_admin_main_settings', '', 1, 0, 3),
(76, 'core_admin_main_facebook', 'user', 'Facebook Integration', '', '{"route":"admin_default", "action":"facebook", "controller":"settings", "module":"user"}', 'core_admin_main_settings', '', 1, 0, 4),
(77, 'core_admin_main_twitter', 'user', 'Twitter Integration', '', '{"route":"admin_default", "action":"twitter", "controller":"settings", "module":"user"}', 'core_admin_main_settings', '', 1, 0, 4),
(78, 'core_admin_main_janrain', 'user', 'Janrain Integration', '', '{"route":"admin_default", "action":"janrain", "controller":"settings", "module":"user"}', 'core_admin_main_settings', '', 1, 0, 4),
(79, 'core_admin_main_settings_friends', 'user', 'Friendship Settings', '', '{"route":"admin_default","module":"user","controller":"settings","action":"friends"}', 'core_admin_main_settings', '', 1, 0, 6),
(80, 'user_admin_banning_logins', 'user', 'Login History', '', '{"route":"admin_default","module":"user","controller":"logins","action":"index"}', 'core_admin_banning', '', 1, 0, 2),
(81, 'authorization_admin_level_user', 'user', 'Members', '', '{"route":"admin_default","module":"user","controller":"settings","action":"level"}', 'authorization_admin_level', '', 1, 0, 2),
(82, 'core_mini_messages', 'messages', 'Messages', 'Messages_Plugin_Menus', '', 'core_mini', '', 1, 0, 4),
(83, 'user_profile_message', 'messages', 'Send Message', 'Messages_Plugin_Menus', '', 'user_profile', '', 1, 0, 2),
(84, 'authorization_admin_level_messages', 'messages', 'Messages', '', '{"route":"admin_default","module":"messages","controller":"settings","action":"level"}', 'authorization_admin_level', '', 1, 0, 3),
(85, 'messages_main_inbox', 'messages', 'Inbox', '', '{"route":"messages_general","action":"inbox"}', 'messages_main', '', 1, 0, 1),
(86, 'messages_main_outbox', 'messages', 'Sent Messages', '', '{"route":"messages_general","action":"outbox"}', 'messages_main', '', 1, 0, 2),
(87, 'messages_main_compose', 'messages', 'Compose Message', '', '{"route":"messages_general","action":"compose"}', 'messages_main', '', 1, 0, 3),
(88, 'user_settings_network', 'network', 'Networks', '', '{"route":"user_extended", "module":"user", "controller":"settings", "action":"network"}', 'user_settings', '', 1, 0, 3),
(89, 'core_main_invite', 'invite', 'Invite', 'Invite_Plugin_Menus::canInvite', '{"route":"default","module":"invite"}', 'core_main', '', 1, 0, 1),
(90, 'user_home_invite', 'invite', 'Invite Your Friends', 'Invite_Plugin_Menus::canInvite', '{"route":"default","module":"invite","icon":"application/modules/Invite/externals/images/invite.png"}', 'user_home', '', 1, 0, 5),
(91, 'core_admin_main_settings_storage', 'core', 'Storage System', '', '{"route":"admin_default","module":"storage","controller":"services","action":"index"}', 'core_admin_main_settings', '', 1, 0, 11),
(92, 'user_settings_payment', 'user', 'Subscription', 'Payment_Plugin_Menus', '{"route":"default", "module":"payment", "controller":"settings", "action":"index"}', 'user_settings', '', 1, 0, 4),
(93, 'core_admin_main_payment', 'payment', 'Billing', '', '{"uri":"javascript:void(0);this.blur();"}', 'core_admin_main', 'core_admin_main_payment', 1, 0, 7),
(94, 'core_admin_main_payment_transactions', 'payment', 'Transactions', '', '{"route":"admin_default","module":"payment","controller":"index","action":"index"}', 'core_admin_main_payment', '', 1, 0, 1),
(95, 'core_admin_main_payment_settings', 'payment', 'Settings', '', '{"route":"admin_default","module":"payment","controller":"settings","action":"index"}', 'core_admin_main_payment', '', 1, 0, 2),
(96, 'core_admin_main_payment_gateways', 'payment', 'Gateways', '', '{"route":"admin_default","module":"payment","controller":"gateway","action":"index"}', 'core_admin_main_payment', '', 1, 0, 3),
(97, 'core_admin_main_payment_packages', 'payment', 'Plans', '', '{"route":"admin_default","module":"payment","controller":"package","action":"index"}', 'core_admin_main_payment', '', 1, 0, 4),
(98, 'core_admin_main_payment_subscriptions', 'payment', 'Subscriptions', '', '{"route":"admin_default","module":"payment","controller":"subscription","action":"index"}', 'core_admin_main_payment', '', 1, 0, 5),
(99, 'core_main_album', 'album', 'Albums', '', '{"route":"album_general","action":"browse"}', 'core_main', '', 0, 0, 3),
(100, 'core_sitemap_album', 'album', 'Albums', '', '{"route":"album_general","action":"browse"}', 'core_sitemap', '', 0, 0, 3),
(101, 'album_main_browse', 'album', 'Browse Albums', 'Album_Plugin_Menus::canViewAlbums', '{"route":"album_general","action":"browse"}', 'album_main', '', 1, 0, 1),
(102, 'album_main_manage', 'album', 'My Albums', 'Album_Plugin_Menus::canCreateAlbums', '{"route":"album_general","action":"manage"}', 'album_main', '', 1, 0, 2),
(103, 'album_main_upload', 'album', 'Add New Photos', 'Album_Plugin_Menus::canCreateAlbums', '{"route":"album_general","action":"upload"}', 'album_main', '', 1, 0, 3),
(104, 'album_quick_upload', 'album', 'Add New Photos', 'Album_Plugin_Menus::canCreateAlbums', '{"route":"album_general","action":"upload","class":"buttonlink icon_photos_new"}', 'album_quick', '', 1, 0, 1),
(105, 'core_admin_main_plugins_album', 'album', 'Photo Albums', '', '{"route":"admin_default","module":"album","controller":"manage","action":"index"}', 'core_admin_main_plugins', '', 1, 0, 999),
(106, 'album_admin_main_manage', 'album', 'View Albums', '', '{"route":"admin_default","module":"album","controller":"manage"}', 'album_admin_main', '', 1, 0, 1),
(107, 'album_admin_main_settings', 'album', 'Global Settings', '', '{"route":"admin_default","module":"album","controller":"settings"}', 'album_admin_main', '', 1, 0, 2),
(108, 'album_admin_main_level', 'album', 'Member Level Settings', '', '{"route":"admin_default","module":"album","controller":"level"}', 'album_admin_main', '', 1, 0, 3),
(109, 'album_admin_main_categories', 'album', 'Categories', '', '{"route":"admin_default","module":"album","controller":"settings", "action":"categories"}', 'album_admin_main', '', 1, 0, 4),
(110, 'authorization_admin_level_album', 'album', 'Photo Albums', '', '{"route":"admin_default","module":"album","controller":"level","action":"index"}', 'authorization_admin_level', '', 1, 0, 999),
(111, 'mobi_browse_album', 'album', 'Albums', '', '{"route":"album_general","action":"browse"}', 'mobi_browse', '', 1, 0, 2),
(112, 'core_main_blog', 'blog', 'Blogs', '', '{"route":"blog_general"}', 'core_main', '', 0, 0, 4),
(113, 'core_sitemap_blog', 'blog', 'Blogs', '', '{"route":"blog_general"}', 'core_sitemap', '', 0, 0, 4),
(114, 'blog_main_browse', 'blog', 'Browse Entries', 'Blog_Plugin_Menus::canViewBlogs', '{"route":"blog_general"}', 'blog_main', '', 1, 0, 1),
(115, 'blog_main_manage', 'blog', 'My Entries', 'Blog_Plugin_Menus::canCreateBlogs', '{"route":"blog_general","action":"manage"}', 'blog_main', '', 1, 0, 2),
(116, 'blog_main_create', 'blog', 'Write New Entry', 'Blog_Plugin_Menus::canCreateBlogs', '{"route":"blog_general","action":"create"}', 'blog_main', '', 1, 0, 3),
(117, 'blog_quick_create', 'blog', 'Write New Entry', 'Blog_Plugin_Menus::canCreateBlogs', '{"route":"blog_general","action":"create","class":"buttonlink icon_blog_new"}', 'blog_quick', '', 1, 0, 1),
(118, 'blog_quick_style', 'blog', 'Edit Blog Style', 'Blog_Plugin_Menus', '{"route":"blog_general","action":"style","class":"smoothbox buttonlink icon_blog_style"}', 'blog_quick', '', 1, 0, 2),
(119, 'blog_gutter_list', 'blog', 'View All Entries', 'Blog_Plugin_Menus', '{"route":"blog_view","class":"buttonlink icon_blog_viewall"}', 'blog_gutter', '', 1, 0, 1),
(120, 'blog_gutter_create', 'blog', 'Write New Entry', 'Blog_Plugin_Menus', '{"route":"blog_general","action":"create","class":"buttonlink icon_blog_new"}', 'blog_gutter', '', 1, 0, 2),
(121, 'blog_gutter_style', 'blog', 'Edit Blog Style', 'Blog_Plugin_Menus', '{"route":"blog_general","action":"style","class":"smoothbox buttonlink icon_blog_style"}', 'blog_gutter', '', 1, 0, 3),
(122, 'blog_gutter_edit', 'blog', 'Edit This Entry', 'Blog_Plugin_Menus', '{"route":"blog_specific","action":"edit","class":"buttonlink icon_blog_edit"}', 'blog_gutter', '', 1, 0, 4),
(123, 'blog_gutter_delete', 'blog', 'Delete This Entry', 'Blog_Plugin_Menus', '{"route":"blog_specific","action":"delete","class":"buttonlink smoothbox icon_blog_delete"}', 'blog_gutter', '', 1, 0, 5),
(124, 'blog_gutter_share', 'blog', 'Share', 'Blog_Plugin_Menus', '{"route":"default","module":"activity","controller":"index","action":"share","class":"buttonlink smoothbox icon_comments"}', 'blog_gutter', '', 1, 0, 6),
(125, 'blog_gutter_report', 'blog', 'Report', 'Blog_Plugin_Menus', '{"route":"default","module":"core","controller":"report","action":"create","class":"buttonlink smoothbox icon_report"}', 'blog_gutter', '', 1, 0, 7),
(126, 'blog_gutter_subscribe', 'blog', 'Subscribe', 'Blog_Plugin_Menus', '{"route":"default","module":"blog","controller":"subscription","action":"add","class":"buttonlink smoothbox icon_blog_subscribe"}', 'blog_gutter', '', 1, 0, 8),
(127, 'core_admin_main_plugins_blog', 'blog', 'Blogs', '', '{"route":"admin_default","module":"blog","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(128, 'blog_admin_main_manage', 'blog', 'View Blogs', '', '{"route":"admin_default","module":"blog","controller":"manage"}', 'blog_admin_main', '', 1, 0, 1),
(129, 'blog_admin_main_settings', 'blog', 'Global Settings', '', '{"route":"admin_default","module":"blog","controller":"settings"}', 'blog_admin_main', '', 1, 0, 2),
(130, 'blog_admin_main_level', 'blog', 'Member Level Settings', '', '{"route":"admin_default","module":"blog","controller":"level"}', 'blog_admin_main', '', 1, 0, 3),
(131, 'blog_admin_main_categories', 'blog', 'Categories', '', '{"route":"admin_default","module":"blog","controller":"settings", "action":"categories"}', 'blog_admin_main', '', 1, 0, 4),
(132, 'authorization_admin_level_blog', 'blog', 'Blogs', '', '{"route":"admin_default","module":"blog","controller":"level","action":"index"}', 'authorization_admin_level', '', 1, 0, 999),
(133, 'mobi_browse_blog', 'blog', 'Blogs', '', '{"route":"blog_general"}', 'mobi_browse', '', 1, 0, 3),
(134, 'core_main_chat', 'chat', 'Chat', '', '{"route":"default","module":"chat"}', 'core_main', '', 1, 0, 5),
(135, 'core_sitemap_chat', 'chat', 'Chat', '', '{"route":"default","module":"chat"}', 'core_sitemap', '', 1, 0, 5),
(136, 'core_admin_main_plugins_chat', 'chat', 'Chat', '', '{"route":"admin_default","module":"chat","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(137, 'chat_admin_main_manage', 'chat', 'Manage Chat Rooms', '', '{"route":"admin_default","module":"chat","controller":"manage"}', 'chat_admin_main', '', 1, 0, 1),
(138, 'chat_admin_main_settings', 'chat', 'Global Settings', '', '{"route":"admin_default","module":"chat","controller":"settings"}', 'chat_admin_main', '', 1, 0, 2),
(139, 'chat_admin_main_level', 'chat', 'Member Level Settings', '', '{"route":"admin_default","module":"chat","controller":"settings","action":"level"}', 'chat_admin_main', '', 1, 0, 3),
(140, 'authorization_admin_level_chat', 'chat', 'Chat', '', '{"route":"admin_default","module":"chat","controller":"settings","action":"level"}', 'authorization_admin_level', '', 1, 0, 999),
(141, 'core_main_classified', 'classified', 'Classifieds', '', '{"route":"classified_general"}', 'core_main', '', 0, 0, 4),
(142, 'core_sitemap_classified', 'classified', 'Classifieds', '', '{"route":"classified_general"}', 'core_sitemap', '', 0, 0, 4),
(143, 'classified_main_browse', 'classified', 'Browse Listings', 'Classified_Plugin_Menus::canViewClassifieds', '{"route":"classified_general"}', 'classified_main', '', 1, 0, 1),
(144, 'classified_main_manage', 'classified', 'My Listings', 'Classified_Plugin_Menus::canCreateClassifieds', '{"route":"classified_general","action":"manage"}', 'classified_main', '', 1, 0, 2),
(145, 'classified_main_create', 'classified', 'Post a New Listing', 'Classified_Plugin_Menus::canCreateClassifieds', '{"route":"classified_general","action":"create"}', 'classified_main', '', 1, 0, 3),
(146, 'classified_quick_create', 'classified', 'Post a New Listing', 'Classified_Plugin_Menus::canCreateClassifieds', '{"route":"classified_general","action":"create","class":"buttonlink icon_classified_new"}', 'classified_quick', '', 1, 0, 1),
(147, 'core_admin_main_plugins_classified', 'classified', 'Classifieds', '', '{"route":"admin_default","module":"classified","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(148, 'classified_admin_main_manage', 'classified', 'View Classifieds', '', '{"route":"admin_default","module":"classified","controller":"manage"}', 'classified_admin_main', '', 1, 0, 1),
(149, 'classified_admin_main_settings', 'classified', 'Global Settings', '', '{"route":"admin_default","module":"classified","controller":"settings"}', 'classified_admin_main', '', 1, 0, 2),
(150, 'classified_admin_main_level', 'classified', 'Member Level Settings', '', '{"route":"admin_default","module":"classified","controller":"level"}', 'classified_admin_main', '', 1, 0, 3),
(151, 'classified_admin_main_fields', 'classified', 'Classified Questions', '', '{"route":"admin_default","module":"classified","controller":"fields"}', 'classified_admin_main', '', 1, 0, 4),
(152, 'classified_admin_main_categories', 'classified', 'Categories', '', '{"route":"admin_default","module":"classified","controller":"settings","action":"categories"}', 'classified_admin_main', '', 1, 0, 5),
(153, 'authorization_admin_level_classified', 'classified', 'Classifieds', '', '{"route":"admin_default","module":"classified","controller":"level","action":"index"}', 'authorization_admin_level', '', 1, 0, 999),
(154, 'mobi_browse_classified', 'classified', 'Classifieds', '', '{"route":"classified_general"}', 'mobi_browse', '', 1, 0, 4),
(155, 'core_main_event', 'event', 'Events', '', '{"route":"event_general"}', 'core_main', '', 0, 0, 6),
(156, 'core_sitemap_event', 'event', 'Events', '', '{"route":"event_general"}', 'core_sitemap', '', 0, 0, 6),
(157, 'event_main_upcoming', 'event', 'Upcoming Events', '', '{"route":"event_upcoming"}', 'event_main', '', 1, 0, 1),
(158, 'event_main_past', 'event', 'Past Events', '', '{"route":"event_past"}', 'event_main', '', 1, 0, 2),
(159, 'event_main_manage', 'event', 'My Events', 'Event_Plugin_Menus', '{"route":"event_general","action":"manage"}', 'event_main', '', 1, 0, 3),
(160, 'event_main_create', 'event', 'Create New Event', 'Event_Plugin_Menus', '{"route":"event_general","action":"create"}', 'event_main', '', 1, 0, 4),
(161, 'event_quick_create', 'event', 'Create New Event', 'Event_Plugin_Menus::canCreateEvents', '{"route":"event_general","action":"create","class":"buttonlink icon_event_new"}', 'event_quick', '', 1, 0, 1),
(162, 'event_profile_edit', 'event', 'Edit Profile', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 1),
(163, 'event_profile_style', 'event', 'Edit Styles', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 2),
(164, 'event_profile_member', 'event', 'Member', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 3),
(165, 'event_profile_report', 'event', 'Report Event', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 4),
(166, 'event_profile_share', 'event', 'Share', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 5),
(167, 'event_profile_invite', 'event', 'Invite', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 6),
(168, 'event_profile_message', 'event', 'Message Members', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 7),
(169, 'event_profile_delete', 'event', 'Delete Event', 'Event_Plugin_Menus', '', 'event_profile', '', 1, 0, 8),
(170, 'core_admin_main_plugins_event', 'event', 'Events', '', '{"route":"admin_default","module":"event","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(171, 'event_admin_main_manage', 'event', 'Manage Events', '', '{"route":"admin_default","module":"event","controller":"manage"}', 'event_admin_main', '', 1, 0, 1),
(172, 'event_admin_main_settings', 'event', 'Global Settings', '', '{"route":"admin_default","module":"event","controller":"settings"}', 'event_admin_main', '', 1, 0, 2),
(173, 'event_admin_main_level', 'event', 'Member Level Settings', '', '{"route":"admin_default","module":"event","controller":"settings","action":"level"}', 'event_admin_main', '', 1, 0, 3),
(174, 'event_admin_main_categories', 'event', 'Categories', '', '{"route":"admin_default","module":"event","controller":"settings","action":"categories"}', 'event_admin_main', '', 1, 0, 4),
(175, 'authorization_admin_level_event', 'event', 'Events', '', '{"route":"admin_default","module":"event","controller":"level","action":"index"}', 'authorization_admin_level', '', 1, 0, 999),
(176, 'mobi_browse_event', 'event', 'Events', '', '{"route":"event_general"}', 'mobi_browse', '', 1, 0, 7),
(177, 'core_main_forum', 'forum', 'Forum', '', '{"route":"forum_general"}', 'core_main', '', 0, 0, 5),
(178, 'core_sitemap_forum', 'forum', 'Forum', '', '{"route":"forum_general"}', 'core_sitemap', '', 0, 0, 5),
(179, 'core_admin_main_plugins_forum', 'forum', 'Forums', '', '{"route":"admin_default","module":"forum","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(180, 'forum_admin_main_manage', 'forum', 'Manage Forums', '', '{"route":"admin_default","module":"forum","controller":"manage"}', 'forum_admin_main', '', 1, 0, 1),
(181, 'forum_admin_main_settings', 'forum', 'Global Settings', '', '{"route":"admin_default","module":"forum","controller":"settings"}', 'forum_admin_main', '', 1, 0, 2),
(182, 'forum_admin_main_level', 'forum', 'Member Level Settings', '', '{"route":"admin_default","module":"forum","controller":"level"}', 'forum_admin_main', '', 1, 0, 3),
(183, 'authorization_admin_level_forum', 'forum', 'Forums', '', '{"route":"admin_default","module":"forum","controller":"level","action":"index"}', 'authorization_admin_level', '', 1, 0, 999),
(184, 'mobi_browse_forum', 'forum', 'Forum', '', '{"route":"forum_general"}', 'mobi_browse', '', 1, 0, 5),
(185, 'core_main_group', 'group', 'Groups', '', '{"route":"group_general"}', 'core_main', '', 1, 0, 6),
(186, 'core_sitemap_group', 'group', 'Groups', '', '{"route":"group_general"}', 'core_sitemap', '', 1, 0, 6),
(187, 'group_main_browse', 'group', 'Browse Groups', '', '{"route":"group_general","action":"browse"}', 'group_main', '', 1, 0, 1),
(188, 'group_main_manage', 'group', 'My Groups', 'Group_Plugin_Menus', '{"route":"group_general","action":"manage"}', 'group_main', '', 1, 0, 2),
(189, 'group_main_create', 'group', 'Create New Group', 'Group_Plugin_Menus', '{"route":"group_general","action":"create"}', 'group_main', '', 1, 0, 3),
(190, 'group_quick_create', 'group', 'Create New Group', 'Group_Plugin_Menus::canCreateGroups', '{"route":"group_general","action":"create","class":"buttonlink icon_group_new"}', 'group_quick', '', 1, 0, 1),
(191, 'group_profile_edit', 'group', 'Edit Profile', 'Group_Plugin_Menus', '', 'group_profile', '', 1, 0, 1),
(192, 'group_profile_style', 'group', 'Edit Styles', 'Group_Plugin_Menus', '', 'group_profile', '', 1, 0, 2),
(193, 'group_profile_member', 'group', 'Member', 'Group_Plugin_Menus', '', 'group_profile', '', 1, 0, 3),
(194, 'group_profile_report', 'group', 'Report Group', 'Group_Plugin_Menus', '', 'group_profile', '', 1, 0, 4),
(195, 'group_profile_share', 'group', 'Share', 'Group_Plugin_Menus', '', 'group_profile', '', 1, 0, 5),
(196, 'group_profile_invite', 'group', 'Invite', 'Group_Plugin_Menus', '', 'group_profile', '', 1, 0, 6),
(197, 'group_profile_message', 'group', 'Message Members', 'Group_Plugin_Menus', '', 'group_profile', '', 1, 0, 7),
(198, 'core_admin_main_plugins_group', 'group', 'Groups', '', '{"route":"admin_default","module":"group","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(199, 'group_admin_main_manage', 'group', 'Manage Groups', '', '{"route":"admin_default","module":"group","controller":"manage"}', 'group_admin_main', '', 1, 0, 1),
(200, 'group_admin_main_settings', 'group', 'Global Settings', '', '{"route":"admin_default","module":"group","controller":"settings"}', 'group_admin_main', '', 1, 0, 2),
(201, 'group_admin_main_level', 'group', 'Member Level Settings', '', '{"route":"admin_default","module":"group","controller":"settings","action":"level"}', 'group_admin_main', '', 1, 0, 3),
(202, 'group_admin_main_categories', 'group', 'Categories', '', '{"route":"admin_default","module":"group","controller":"settings","action":"categories"}', 'group_admin_main', '', 1, 0, 4),
(203, 'authorization_admin_level_group', 'group', 'Groups', '', '{"route":"admin_default","module":"group","controller":"settings","action":"level"}', 'authorization_admin_level', '', 1, 0, 999),
(204, 'mobi_browse_group', 'group', 'Groups', '', '{"route":"group_general"}', 'mobi_browse', '', 1, 0, 8),
(205, 'core_footer_mobile', 'mobi', 'Mobile Site', 'Mobi_Plugin_Menus', '', 'core_footer', '', 1, 0, 4),
(206, 'mobi_footer_mobile', 'mobi', 'Mobile Site', 'Mobi_Plugin_Menus', '', 'mobi_footer', '', 1, 0, 1),
(207, 'mobi_footer_auth', 'mobi', 'Auth', 'Mobi_Plugin_Menus', '', 'mobi_footer', '', 1, 0, 2),
(208, 'mobi_footer_signup', 'mobi', 'Sign Up', 'Mobi_Plugin_Menus', '', 'mobi_footer', '', 1, 0, 3),
(209, 'mobi_main_home', 'mobi', 'Home', 'Mobi_Plugin_Menus', '', 'mobi_main', '', 1, 0, 1),
(210, 'mobi_main_profile', 'mobi', 'Profile', 'Mobi_Plugin_Menus', '', 'mobi_main', '', 1, 0, 2),
(211, 'mobi_main_messages', 'mobi', 'Inbox', 'Mobi_Plugin_Menus', '', 'mobi_main', '', 1, 0, 3),
(212, 'mobi_main_browse', 'mobi', 'Browse', 'Mobi_Plugin_Menus', '', 'mobi_main', '', 1, 0, 4),
(213, 'mobi_profile_message', 'mobi', 'Send Message', 'Mobi_Plugin_Menus', '', 'mobi_profile', '', 1, 0, 1),
(214, 'mobi_profile_friend', 'mobi', 'Friends', 'Mobi_Plugin_Menus', '', 'mobi_profile', '', 1, 0, 2),
(215, 'mobi_profile_edit', 'mobi', 'Edit Profile', 'Mobi_Plugin_Menus', '', 'mobi_profile', '', 1, 0, 3),
(216, 'mobi_profile_report', 'mobi', 'Report User', 'Mobi_Plugin_Menus', '', 'mobi_profile', '', 1, 0, 4),
(217, 'mobi_profile_block', 'mobi', 'Block', 'Mobi_Plugin_Menus', '', 'mobi_profile', '', 1, 0, 5),
(218, 'mobi_profile_admin', 'mobi', 'Admin', 'Mobi_Plugin_Menus', '', 'mobi_profile', '', 1, 0, 6),
(219, 'mobi_browse_members', 'user', 'Members', '', '{"route":"user_general","action":"browse"}', 'mobi_browse', '', 1, 0, 1),
(220, 'core_main_music', 'music', 'Music', '', '{"route":"music_general","action":"browse"}', 'core_main', '', 0, 0, 100),
(221, 'core_sitemap_music', 'music', 'Music', '', '{"route":"music_general","action":"browse"}', 'core_sitemap', '', 0, 0, 100),
(222, 'music_main_browse', 'music', 'Browse Music', 'Music_Plugin_Menus::canViewPlaylists', '{"route":"music_general","action":"browse"}', 'music_main', '', 1, 0, 1),
(223, 'music_main_manage', 'music', 'My Music', 'Music_Plugin_Menus::canCreatePlaylists', '{"route":"music_general","action":"manage"}', 'music_main', '', 1, 0, 2),
(224, 'music_main_create', 'music', 'Upload Music', 'Music_Plugin_Menus::canCreatePlaylists', '{"route":"music_general","action":"create"}', 'music_main', '', 1, 0, 3),
(225, 'music_quick_create', 'music', 'Upload Music', 'Music_Plugin_Menus::canCreatePlaylists', '{"route":"music_general","action":"create","class":"buttonlink icon_music_new"}', 'music_quick', '', 1, 0, 1),
(226, 'core_admin_main_plugins_music', 'music', 'Music', '', '{"route":"admin_default","module":"music","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(227, 'music_admin_main_manage', 'music', 'Manage Music', '', '{"route":"admin_default","module":"music","controller":"manage"}', 'music_admin_main', '', 1, 0, 1),
(228, 'music_admin_main_settings', 'music', 'Global Settings', '', '{"route":"admin_default","module":"music","controller":"settings"}', 'music_admin_main', '', 1, 0, 2),
(229, 'music_admin_main_level', 'music', 'Member Level Settings', '', '{"route":"admin_default","module":"music","controller":"level"}', 'music_admin_main', '', 1, 0, 3),
(230, 'authorization_admin_level_music', 'music', 'Music', '', '{"route":"admin_default","module":"music","controller":"level","action":"index"}', 'authorization_admin_level', '', 1, 0, 999),
(231, 'mobi_browse_music', 'music', 'Music', '', '{"route":"music_general","action":"browse"}', 'mobi_browse', '', 1, 0, 10),
(232, 'core_main_poll', 'poll', 'Polls', '', '{"route":"poll_general","action":"browse"}', 'core_main', '', 0, 0, 5),
(233, 'core_sitemap_poll', 'poll', 'Polls', '', '{"route":"poll_general","action":"browse"}', 'core_sitemap', '', 0, 0, 5),
(234, 'poll_main_browse', 'poll', 'Browse Polls', 'Poll_Plugin_Menus::canViewPolls', '{"route":"poll_general","action":"browse"}', 'poll_main', '', 1, 0, 1),
(235, 'poll_main_manage', 'poll', 'My Polls', 'Poll_Plugin_Menus::canCreatePolls', '{"route":"poll_general","action":"manage"}', 'poll_main', '', 1, 0, 2),
(236, 'poll_main_create', 'poll', 'Create New Poll', 'Poll_Plugin_Menus::canCreatePolls', '{"route":"poll_general","action":"create"}', 'poll_main', '', 1, 0, 3),
(237, 'poll_quick_create', 'poll', 'Create New Poll', 'Poll_Plugin_Menus::canCreatePolls', '{"route":"poll_general","action":"create","class":"buttonlink icon_poll_new"}', 'poll_quick', '', 1, 0, 1),
(238, 'core_admin_main_plugins_poll', 'poll', 'Polls', '', '{"route":"admin_default","module":"poll","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(239, 'poll_admin_main_manage', 'poll', 'Manage Polls', '', '{"route":"admin_default","module":"poll","controller":"manage"}', 'poll_admin_main', '', 1, 0, 1),
(240, 'poll_admin_main_settings', 'poll', 'Global Settings', '', '{"route":"admin_default","module":"poll","controller":"settings"}', 'poll_admin_main', '', 1, 0, 2),
(241, 'poll_admin_main_level', 'poll', 'Member Level Settings', '', '{"route":"admin_default","module":"poll","controller":"settings","action":"level"}', 'poll_admin_main', '', 1, 0, 3),
(242, 'authorization_admin_level_poll', 'poll', 'Polls', '', '{"route":"admin_default","module":"poll","controller":"settings","action":"level"}', 'authorization_admin_level', '', 1, 0, 999),
(243, 'mobi_browse_poll', 'poll', 'Polls', '', '{"route":"poll_general","action":"browse"}', 'mobi_browse', '', 1, 0, 6),
(244, 'core_main_video', 'video', 'Videos', '', '{"route":"video_general"}', 'core_main', '', 0, 0, 7),
(245, 'core_sitemap_video', 'video', 'Videos', '', '{"route":"video_general"}', 'core_sitemap', '', 0, 0, 7),
(246, 'core_admin_main_plugins_video', 'video', 'Videos', '', '{"route":"admin_default","module":"video","controller":"manage"}', 'core_admin_main_plugins', '', 1, 0, 999),
(247, 'video_main_browse', 'video', 'Browse Videos', '', '{"route":"video_general"}', 'video_main', '', 1, 0, 1),
(248, 'video_main_manage', 'video', 'My Videos', 'Video_Plugin_Menus', '{"route":"video_general","action":"manage"}', 'video_main', '', 1, 0, 2),
(249, 'video_main_create', 'video', 'Post New Video', 'Video_Plugin_Menus', '{"route":"video_general","action":"create"}', 'video_main', '', 1, 0, 3),
(250, 'video_quick_create', 'video', 'Post New Video', 'Video_Plugin_Menus::canCreateVideos', '{"route":"video_general","action":"create","class":"buttonlink icon_video_new"}', 'video_quick', '', 1, 0, 1),
(251, 'video_admin_main_manage', 'video', 'Manage Videos', '', '{"route":"admin_default","module":"video","controller":"manage"}', 'video_admin_main', '', 1, 0, 1),
(252, 'video_admin_main_utility', 'video', 'Video Utilities', '', '{"route":"admin_default","module":"video","controller":"settings","action":"utility"}', 'video_admin_main', '', 1, 0, 2),
(253, 'video_admin_main_settings', 'video', 'Global Settings', '', '{"route":"admin_default","module":"video","controller":"settings"}', 'video_admin_main', '', 1, 0, 3),
(254, 'video_admin_main_level', 'video', 'Member Level Settings', '', '{"route":"admin_default","module":"video","controller":"settings","action":"level"}', 'video_admin_main', '', 1, 0, 4),
(255, 'video_admin_main_categories', 'video', 'Categories', '', '{"route":"admin_default","module":"video","controller":"settings","action":"categories"}', 'video_admin_main', '', 1, 0, 5),
(256, 'authorization_admin_level_video', 'video', 'Videos', '', '{"route":"admin_default","module":"video","controller":"settings","action":"level"}', 'authorization_admin_level', '', 1, 0, 999),
(257, 'mobi_browse_video', 'video', 'Videos', '', '{"route":"video_general"}', 'mobi_browse', '', 1, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_menus`
--

CREATE TABLE `engine4_core_menus` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `type` enum('standard','hidden','custom') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'standard',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(3) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_menus`
--

INSERT INTO `engine4_core_menus` (`id`, `name`, `type`, `title`, `order`) VALUES
(1, 'core_main', 'standard', 'Main Navigation Menu', 1),
(2, 'core_mini', 'standard', 'Mini Navigation Menu', 2),
(3, 'core_footer', 'standard', 'Footer Menu', 3),
(4, 'core_sitemap', 'standard', 'Sitemap', 4),
(5, 'user_home', 'standard', 'Member Home Quick Links Menu', 999),
(6, 'user_profile', 'standard', 'Member Profile Options Menu', 999),
(7, 'user_edit', 'standard', 'Member Edit Profile Navigation Menu', 999),
(8, 'user_browse', 'standard', 'Member Browse Navigation Menu', 999),
(9, 'user_settings', 'standard', 'Member Settings Navigation Menu', 999),
(10, 'messages_main', 'standard', 'Messages Main Navigation Menu', 999),
(11, 'album_main', 'standard', 'Album Main Navigation Menu', 999),
(12, 'album_quick', 'standard', 'Album Quick Navigation Menu', 999),
(13, 'blog_main', 'standard', 'Blog Main Navigation Menu', 999),
(14, 'blog_quick', 'standard', 'Blog Quick Navigation Menu', 999),
(15, 'blog_gutter', 'standard', 'Blog Gutter Navigation Menu', 999),
(16, 'classified_main', 'standard', 'Classified Main Navigation Menu', 999),
(17, 'classified_quick', 'standard', 'Classified Quick Navigation Menu', 999),
(18, 'event_main', 'standard', 'Event Main Navigation Menu', 999),
(19, 'event_profile', 'standard', 'Event Profile Options Menu', 999),
(20, 'group_main', 'standard', 'Group Main Navigation Menu', 999),
(21, 'group_profile', 'standard', 'Group Profile Options Menu', 999),
(22, 'mobi_footer', 'standard', 'Mobile Footer Menu', 999),
(23, 'mobi_main', 'standard', 'Mobile Main Menu', 999),
(24, 'mobi_profile', 'standard', 'Mobile Profile Options Menu', 999),
(25, 'mobi_browse', 'standard', 'Mobile Browse Page Menu', 999),
(26, 'music_main', 'standard', 'Music Main Navigation Menu', 999),
(27, 'music_quick', 'standard', 'Music Quick Navigation Menu', 999),
(28, 'poll_main', 'standard', 'Poll Main Navigation Menu', 999),
(29, 'poll_quick', 'standard', 'Poll Quick Navigation Menu', 999),
(30, 'video_main', 'standard', 'Video Main Navigation Menu', 999);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_migrations`
--

CREATE TABLE `engine4_core_migrations` (
  `package` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `current` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_modules`
--

CREATE TABLE `engine4_core_modules` (
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `version` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('core','standard','extra') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'extra'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_modules`
--

INSERT INTO `engine4_core_modules` (`name`, `title`, `description`, `version`, `enabled`, `type`) VALUES
('activity', 'Activity', 'Activity', '4.8.12', 1, 'core'),
('album', 'Albums', 'Albums', '4.8.13', 1, 'extra'),
('announcement', 'Announcements', 'Announcements', '4.8.0', 1, 'standard'),
('authorization', 'Authorization', 'Authorization', '4.7.0', 1, 'core'),
('blog', 'Blogs', 'Blogs', '4.8.12', 1, 'extra'),
('chat', 'Chat', 'Chat', '4.8.8', 1, 'extra'),
('classified', 'Classifieds', 'Classifieds', '4.8.11', 1, 'extra'),
('core', 'Core', 'Core', '4.8.13', 1, 'core'),
('event', 'Events', 'Events', '4.8.12', 1, 'extra'),
('fields', 'Fields', 'Fields', '4.8.13', 1, 'core'),
('forum', 'Forum', 'Forum', '4.8.11', 1, 'extra'),
('group', 'Groups', 'Groups', '4.8.12', 1, 'extra'),
('invite', 'Invite', 'Invite', '4.8.7', 1, 'standard'),
('messages', 'Messages', 'Messages', '4.8.12', 1, 'standard'),
('mobi', 'Mobi', 'Mobile', '4.8.9', 1, 'extra'),
('music', 'Music', 'Music', '4.8.9', 1, 'extra'),
('network', 'Networks', 'Networks', '4.8.6', 1, 'standard'),
('payment', 'Payment', 'Payment', '4.8.11', 1, 'standard'),
('poll', 'Polls', 'Polls', '4.8.11', 1, 'extra'),
('storage', 'Storage', 'Storage', '4.8.9', 1, 'core'),
('user', 'Members', 'Members', '4.8.13', 1, 'core'),
('video', 'Videos', 'Videos', '4.8.13', 1, 'extra');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_nodes`
--

CREATE TABLE `engine4_core_nodes` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `signature` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `first_seen` datetime NOT NULL,
  `last_seen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_pages`
--

CREATE TABLE `engine4_core_pages` (
  `page_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `displayname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `custom` tinyint(1) NOT NULL DEFAULT '1',
  `fragment` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `levels` text COLLATE utf8_unicode_ci,
  `provides` text COLLATE utf8_unicode_ci,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_pages`
--

INSERT INTO `engine4_core_pages` (`page_id`, `name`, `displayname`, `url`, `title`, `description`, `keywords`, `custom`, `fragment`, `layout`, `levels`, `provides`, `view_count`, `search`) VALUES
(1, 'header', 'Site Header', NULL, '', '', '', 0, 1, '', NULL, 'header-footer', 0, 0),
(2, 'footer', 'Site Footer', NULL, '', '', '', 0, 1, '', NULL, 'header-footer', 0, 0),
(3, 'core_index_index', 'Landing Page', NULL, 'Landing Page', 'This is your site\'s landing page.', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(4, 'user_index_home', 'Member Home Page', NULL, 'Member Home Page', 'This is the home page for members.', '', 0, 0, '', NULL, 'viewer;no-subject', 0, 0),
(5, 'user_profile_index', 'Member Profile', NULL, 'Member Profile', 'This is a member\'s profile.', '', 0, 0, '', NULL, 'subject=user', 0, 0),
(6, 'core_help_contact', 'Contact Page', NULL, 'Contact Us', 'This is the contact page', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(7, 'core_help_privacy', 'Privacy Page', NULL, 'Privacy Policy', 'This is the privacy policy page', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(8, 'core_help_terms', 'Terms of Service Page', NULL, 'Terms of Service', 'This is the terms of service page', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(9, 'core_error_requireuser', 'Sign-in Required Page', NULL, 'Sign-in Required', '', '', 0, 0, '', NULL, NULL, 0, 0),
(10, 'core_search_index', 'Search Page', NULL, 'Search Results', '', '', 0, 0, '', NULL, NULL, 0, 0),
(11, 'user_auth_login', 'Sign-in Page', NULL, 'Sign-in', 'This is the site sign-in page.', '', 0, 0, '', NULL, NULL, 0, 0),
(12, 'user_signup_index', 'Sign-up Page', NULL, 'Sign-up', 'This is the site sign-up page.', '', 0, 0, '', NULL, NULL, 0, 0),
(13, 'user_auth_forgot', 'Forgot Password Page', NULL, 'Forgot Password', 'This is the site forgot password page.', '', 0, 0, '', NULL, NULL, 0, 0),
(14, 'user_settings_general', 'User General Settings Page', NULL, 'General', 'This page is the user general settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(15, 'user_settings_privacy', 'User Privacy Settings Page', NULL, 'Privacy', 'This page is the user privacy settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(16, 'user_settings_network', 'User Networks Settings Page', NULL, 'Networks', 'This page is the user networks settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(17, 'user_settings_notifications', 'User Notifications Settings Page', NULL, 'Notifications', 'This page is the user notification settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(18, 'user_settings_password', 'User Change Password Settings Page', NULL, 'Change Password', 'This page is the change password page.', '', 0, 0, '', NULL, NULL, 0, 0),
(19, 'user_settings_delete', 'User Delete Account Settings Page', NULL, 'Delete Account', 'This page is the delete accout page.', '', 0, 0, '', NULL, NULL, 0, 0),
(20, 'user_index_browse', 'Member Browse Page', NULL, 'Member Browse', 'This page show member lists.', '', 0, 0, '', NULL, NULL, 0, 0),
(21, 'album_photo_view', 'Album Photo View Page', NULL, 'Album Photo View', 'This page displays an album\'s photo.', '', 0, 0, '', NULL, 'subject=album_photo', 0, 0),
(22, 'album_album_view', 'Album View Page', NULL, 'Album View', 'This page displays an album\'s photos.', '', 0, 0, '', NULL, 'subject=album', 0, 0),
(23, 'album_index_browse', 'Album Browse Page', NULL, 'Album Browse', 'This page lists album entries.', '', 0, 0, '', NULL, NULL, 0, 0),
(24, 'album_index_upload', 'Album Create Page', NULL, 'Add New Photos', 'This page is the album create page.', '', 0, 0, '', NULL, NULL, 0, 0),
(25, 'album_index_manage', 'Album Manage Page', NULL, 'My Albums', 'This page lists album a user\'s albums.', '', 0, 0, '', NULL, NULL, 0, 0),
(26, 'blog_index_list', 'Blog List Page', NULL, 'Blog List', 'This page lists a member\'s blog entries.', '', 0, 0, '', NULL, 'subject=user', 0, 0),
(27, 'blog_index_view', 'Blog View Page', NULL, 'Blog View', 'This page displays a blog entry.', '', 0, 0, '', NULL, 'subject=blog', 0, 0),
(28, 'blog_index_index', 'Blog Browse Page', NULL, 'Blog Browse', 'This page lists blog entries.', '', 0, 0, '', NULL, NULL, 0, 0),
(29, 'blog_index_create', 'Blog Create Page', NULL, 'Write New Entry', 'This page is the blog create page.', '', 0, 0, '', NULL, NULL, 0, 0),
(30, 'blog_index_manage', 'Blog Manage Page', NULL, 'My Entries', 'This page lists a user\'s blog entries.', '', 0, 0, '', NULL, NULL, 0, 0),
(31, 'chat_index_index', 'Chat Main Page', NULL, 'Chat', 'This is the chat room.', '', 0, 0, '', NULL, NULL, 0, 0),
(32, 'classified_index_index', 'Classified Browse Page', NULL, 'Classified Browse', 'This page lists classifieds.', '', 0, 0, '', NULL, NULL, 0, 0),
(33, 'classified_index_view', 'Classified View Page', NULL, 'View Classified', 'This is the view page for a classified.', '', 0, 0, '', NULL, 'subject=classified', 0, 0),
(34, 'classified_index_create', 'Classified Create Page', NULL, 'Post a New Listing', 'This page is the classified create page.', '', 0, 0, '', NULL, NULL, 0, 0),
(35, 'classified_index_manage', 'Classified Manage Page', NULL, 'My Listings', 'This page lists a user\'s classifieds.', '', 0, 0, '', NULL, NULL, 0, 0),
(36, 'mobi_event_profile', 'Mobile Event Profile', NULL, 'Mobile Event Profile', 'This is the mobile verison of an event profile.', '', 0, 0, '', NULL, NULL, 0, 0),
(37, 'event_profile_index', 'Event Profile', NULL, 'Event Profile', 'This is the profile for an event.', '', 0, 0, '', NULL, 'subject=event', 0, 0),
(38, 'event_index_browse', 'Event Browse Page', NULL, 'Event Browse', 'This page lists events.', '', 0, 0, '', NULL, NULL, 0, 0),
(39, 'event_index_create', 'Event Create Page', NULL, 'Event Create', 'This page allows users to create events.', '', 0, 0, '', NULL, NULL, 0, 0),
(40, 'event_index_manage', 'Event Manage Page', NULL, 'My Events', 'This page lists a user\'s events.', '', 0, 0, '', NULL, NULL, 0, 0),
(41, 'forum_index_index', 'Forum Main Page', NULL, 'Forum Main', 'This is the main forum page.', '', 0, 0, '', NULL, NULL, 0, 0),
(42, 'forum_forum_view', 'Forum View Page', NULL, 'Forum View', 'This is the view forum page.', '', 0, 0, '', NULL, NULL, 0, 0),
(43, 'forum_forum_topic-create', 'Forum Topic Create Page', NULL, 'Post Topic', 'This is the forum topic create page.', '', 0, 0, '', NULL, NULL, 0, 0),
(44, 'group_profile_index', 'Group Profile', NULL, 'Group Profile', 'This is the profile for an group.', '', 0, 0, '', NULL, 'subject=group', 0, 0),
(45, 'mobi_group_profile', 'Mobile Group Profile', NULL, 'Mobile Group Profile', 'This is the mobile verison of a group profile.', '', 0, 0, '', NULL, NULL, 0, 0),
(46, 'group_index_browse', 'Group Browse Page', NULL, 'Group Browse', 'This page lists groups.', '', 0, 0, '', NULL, NULL, 0, 0),
(47, 'group_index_create', 'Group Create Page', NULL, 'Group Create', 'This page allows users to create groups.', '', 0, 0, '', NULL, NULL, 0, 0),
(48, 'group_index_manage', 'Group Manage Page', NULL, 'My Groups', 'This page lists a user\'s groups.', '', 0, 0, '', NULL, NULL, 0, 0),
(49, 'invite_index_index', 'Invite Page', NULL, 'Invite', '', '', 0, 0, '', NULL, NULL, 0, 0),
(50, 'messages_messages_compose', 'Messages Compose Page', NULL, 'Compose', '', '', 0, 0, '', NULL, NULL, 0, 0),
(51, 'messages_messages_inbox', 'Messages Inbox Page', NULL, 'Inbox', '', '', 0, 0, '', NULL, NULL, 0, 0),
(52, 'messages_messages_outbox', 'Messages Outbox Page', NULL, 'Inbox', '', '', 0, 0, '', NULL, NULL, 0, 0),
(53, 'messages_messages_search', 'Messages Search Page', NULL, 'Search', '', '', 0, 0, '', NULL, NULL, 0, 0),
(54, 'messages_messages_view', 'Messages View Page', NULL, 'My Message', '', '', 0, 0, '', NULL, NULL, 0, 0),
(55, 'header_mobi', 'Mobile Site Header', NULL, 'Mobile Site Header', 'This is the mobile site header.', '', 0, 1, '', NULL, NULL, 0, 0),
(56, 'footer_mobi', 'Mobile Site Footer', NULL, 'Mobile Site Footer', 'This is the mobile site footer.', '', 0, 1, '', NULL, NULL, 0, 0),
(57, 'mobi_index_index', 'Mobile Home Page', NULL, 'Mobile Home Page', 'This is the mobile homepage.', '', 0, 0, 'default', NULL, NULL, 0, 0),
(58, 'mobi_index_userhome', 'Mobile Member Home Page', NULL, 'Mobile Member Home Page', 'This is the mobile member homepage.', '', 0, 0, '', NULL, NULL, 0, 0),
(59, 'mobi_index_profile', 'Mobile Member Profile', NULL, 'Mobile Member Profile', 'This is the mobile verison of a member profile.', '', 0, 0, '', NULL, NULL, 0, 0),
(60, 'music_index_browse', 'Music Browse Page', NULL, 'Music Browse', 'This page lists music.', '', 0, 0, '', NULL, NULL, 0, 0),
(61, 'music_playlist_view', 'Music Playlist View Page', NULL, 'Music View', 'This page displays a playlist.', '', 0, 0, '', NULL, NULL, 0, 0),
(62, 'music_index_create', 'Music Create Page', NULL, 'Upload Music', 'This page is the music create page.', '', 0, 0, '', NULL, NULL, 0, 0),
(63, 'music_index_manage', 'Music Manage Page', NULL, 'My Music', 'This page is the music manage page.', '', 0, 0, '', NULL, NULL, 0, 0),
(64, 'poll_index_browse', 'Poll Browse Page', NULL, 'Poll Browse', 'This page lists polls.', '', 0, 0, '', NULL, NULL, 0, 0),
(65, 'poll_poll_view', 'Poll View Page', NULL, 'View Poll', 'This is the view page for a poll.', '', 0, 0, '', NULL, 'subject=poll', 0, 0),
(66, 'poll_index_create', 'Poll Create Page', NULL, 'Create New Pll', 'This page is the poll create page.', '', 0, 0, '', NULL, NULL, 0, 0),
(67, 'poll_index_manage', 'Poll Manage Page', NULL, 'My Poll', 'This page lists a user\'s polls.', '', 0, 0, '', NULL, NULL, 0, 0),
(68, 'video_index_view', 'Video View Page', NULL, 'View Video', 'This is the view page for a video.', '', 0, 0, '', NULL, 'subject=video', 0, 0),
(69, 'video_index_browse', 'Video Browse Page', NULL, 'Video Browse', 'This page lists videos.', '', 0, 0, '', NULL, NULL, 0, 0),
(70, 'video_index_create', 'Video Create Page', NULL, 'Video Create', 'This page allows video to be added.', '', 0, 0, '', NULL, NULL, 0, 0),
(71, 'video_index_manage', 'Video Manage Page', NULL, 'My Videos', 'This page lists a user\'s videos.', '', 0, 0, '', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_processes`
--

CREATE TABLE `engine4_core_processes` (
  `pid` int(10) UNSIGNED NOT NULL,
  `parent_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `system_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `started` int(10) UNSIGNED NOT NULL,
  `timeout` mediumint(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_referrers`
--

CREATE TABLE `engine4_core_referrers` (
  `host` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `query` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_reports`
--

CREATE TABLE `engine4_core_reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `subject_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_routes`
--

CREATE TABLE `engine4_core_routes` (
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_search`
--

CREATE TABLE `engine4_core_search` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hidden` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_serviceproviders`
--

CREATE TABLE `engine4_core_serviceproviders` (
  `serviceprovider_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `class` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_serviceproviders`
--

INSERT INTO `engine4_core_serviceproviders` (`serviceprovider_id`, `title`, `type`, `name`, `class`, `enabled`) VALUES
(1, 'MySQL', 'database', 'mysql', 'Engine_ServiceLocator_Plugin_Database_Mysql', 1),
(2, 'PDO MySQL', 'database', 'mysql_pdo', 'Engine_ServiceLocator_Plugin_Database_MysqlPdo', 1),
(3, 'MySQLi', 'database', 'mysqli', 'Engine_ServiceLocator_Plugin_Database_Mysqli', 1),
(4, 'File', 'cache', 'file', 'Engine_ServiceLocator_Plugin_Cache_File', 1),
(5, 'APC', 'cache', 'apc', 'Engine_ServiceLocator_Plugin_Cache_Apc', 1),
(6, 'Memcache', 'cache', 'memcached', 'Engine_ServiceLocator_Plugin_Cache_Memcached', 1),
(7, 'Simple', 'captcha', 'image', 'Engine_ServiceLocator_Plugin_Captcha_Image', 1),
(8, 'ReCaptcha', 'captcha', 'recaptcha', 'Engine_ServiceLocator_Plugin_Captcha_Recaptcha', 1),
(9, 'SMTP', 'mail', 'smtp', 'Engine_ServiceLocator_Plugin_Mail_Smtp', 1),
(10, 'Sendmail', 'mail', 'sendmail', 'Engine_ServiceLocator_Plugin_Mail_Sendmail', 1),
(11, 'GD', 'image', 'gd', 'Engine_ServiceLocator_Plugin_Image_Gd', 1),
(12, 'Imagick', 'image', 'imagick', 'Engine_ServiceLocator_Plugin_Image_Imagick', 1),
(13, 'Akismet', 'akismet', 'standard', 'Engine_ServiceLocator_Plugin_Akismet', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_services`
--

CREATE TABLE `engine4_core_services` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `profile` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'default',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_servicetypes`
--

CREATE TABLE `engine4_core_servicetypes` (
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `interface` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_servicetypes`
--

INSERT INTO `engine4_core_servicetypes` (`servicetype_id`, `title`, `type`, `interface`, `enabled`) VALUES
(1, 'Database', 'database', 'Zend_Db_Adapter_Abstract', 1),
(2, 'Cache', 'cache', 'Zend_Cache_Backend', 1),
(3, 'Captcha', 'captcha', 'Zend_Captcha_Adapter', 1),
(4, 'Mail Transport', 'mail', 'Zend_Mail_Transport_Abstract', 1),
(5, 'Image', 'image', 'Engine_Image_Adapter_Abstract', 1),
(6, 'Akismet', 'akismet', 'Zend_Service_Akismet', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_session`
--

CREATE TABLE `engine4_core_session` (
  `id` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_session`
--

INSERT INTO `engine4_core_session` (`id`, `modified`, `lifetime`, `data`, `user_id`) VALUES
('0702cqe1rjh2b10qgh77omd757', 1487682829, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('15cuqrkg9j972fukjg6bl0f4e6', 1487683461, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('3u7po8cbhp93a1bnlpnqvi1f05', 1487684421, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('8bvu5dhg6he0aullsu82v7ehm7', 1487682701, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('ajtb48g3kq9i39kgpqfaplgup2', 1487682615, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('cehk9jd9iinubvea3l8u8hebs2', 1487682889, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('dnq87pid95hl2kd5bg5h0bs081', 1487689665, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}ActivityFormToken|a:1:{s:5:"token";s:32:"7e48dee54841d8e35c8a631e7452c393";}twitter_uid|b:0;redirectURL|s:15:"/trimrate/login";Zend_Auth|a:1:{s:7:"storage";i:1;}login_id|s:1:"1";twitter_lock|i:1;', 1),
('e2vatfnq2fnfose5vdnjk5r3e5', 1487684062, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('ech8061ht8k5p4u454jb5idq96', 1487682474, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('em890ruejqmsacj26ggvf15hl4', 1487682949, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('feiaknjq2sutbpl81qmbn3f385', 1487684181, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('fk73oltaohv8u1r880kd5eq345', 1487683010, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('g3pidqfrtqfs2lfme4kol5nbj7', 1487683941, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('gakl8f30mo7k33fnuprfi3oll4', 1487682337, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('geh9r9v7necbohvscqhhtielp7', 1487684301, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('i1s8nkbe9l0l4ntd3gf194i2e5', 1487682540, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('id49jkuskujenegcki5hi4nj76', 1487683219, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('j91helfb76rlbl7pom8651jsq2', 1487683821, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('ke13dlrb49urvgng2gkpr82r32', 1487683581, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('l86dnlns7vqu1ocnq2sbkdeql3', 1487683070, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('upo71bp7ss0ci0g0lj9f31cnf7', 1487683341, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL),
('vhkejilpvojrq4o2iif1c8pdd2', 1487683669, 86400, 'mobile|a:1:{s:6:"mobile";b:0;}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_settings`
--

CREATE TABLE `engine4_core_settings` (
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_settings`
--

INSERT INTO `engine4_core_settings` (`name`, `value`) VALUES
('activity.content', 'everyone'),
('activity.disallowed', 'N'),
('activity.filter', '1'),
('activity.length', '15'),
('activity.liveupdate', '120000'),
('activity.publish', '1'),
('activity.userdelete', '1'),
('activity.userlength', '5'),
('chat.general.delay', '5000'),
('chat.im.privacy', 'friends'),
('classified.currency', '$'),
('core.admin.mode', 'none'),
('core.admin.password', ''),
('core.admin.reauthenticate', '0'),
('core.admin.timeout', '600'),
('core.doctype', 'XHTML1_STRICT'),
('core.facebook.enable', 'none'),
('core.facebook.key', ''),
('core.facebook.secret', ''),
('core.general.browse', '1'),
('core.general.commenthtml', ''),
('core.general.notificationupdate', '120000'),
('core.general.portal', '1'),
('core.general.profile', '1'),
('core.general.quota', '0'),
('core.general.search', '1'),
('core.general.site.title', 'TrimRate'),
('core.license.email', 'email@domain.com'),
('core.license.key', '5752-3038-4954-0000'),
('core.license.statistics', '0'),
('core.locale.locale', 'auto'),
('core.locale.timezone', 'US/Pacific'),
('core.log.adapter', 'file'),
('core.mail.count', '25'),
('core.mail.enabled', '1'),
('core.mail.from', 'email@domain.com'),
('core.mail.name', 'Site Admin'),
('core.mail.queueing', '1'),
('core.secret', 'bf4403f72f06315997e5c1382c6ed56a1f568021'),
('core.site.counter', '4'),
('core.site.creation', '2017-02-21 13:01:37'),
('core.site.title', 'Social Network'),
('core.spam.censor', ''),
('core.spam.comment', '0'),
('core.spam.contact', '0'),
('core.spam.email.antispam.login', '1'),
('core.spam.email.antispam.signup', '1'),
('core.spam.invite', '0'),
('core.spam.ipbans', ''),
('core.spam.login', '0'),
('core.spam.signup', '0'),
('core.tasks.count', '1'),
('core.tasks.interval', '60'),
('core.tasks.jobs', '3'),
('core.tasks.key', '4b8127c4'),
('core.tasks.last', '1487684420'),
('core.tasks.mode', 'curl'),
('core.tasks.pid', ''),
('core.tasks.processes', '2'),
('core.tasks.time', '120'),
('core.tasks.timeout', '900'),
('core.thumbnails.icon.height', '48'),
('core.thumbnails.icon.mode', 'crop'),
('core.thumbnails.icon.width', '48'),
('core.thumbnails.main.height', '720'),
('core.thumbnails.main.mode', 'resize'),
('core.thumbnails.main.width', '720'),
('core.thumbnails.normal.height', '160'),
('core.thumbnails.normal.mode', 'resize'),
('core.thumbnails.normal.width', '140'),
('core.thumbnails.profile.height', '400'),
('core.thumbnails.profile.mode', 'resize'),
('core.thumbnails.profile.width', '200'),
('core.translate.adapter', 'csv'),
('core.twitter.enable', 'none'),
('core.twitter.key', ''),
('core.twitter.secret', ''),
('event.bbcode', '1'),
('event.html', '1'),
('forum.bbcode', '1'),
('forum.forum.pagelength', '25'),
('forum.html', '1'),
('forum.public', '1'),
('forum.topic.pagelength', '25'),
('group.bbcode', '1'),
('group.html', '1'),
('invite.allowCustomMessage', '1'),
('invite.fromEmail', ''),
('invite.fromName', ''),
('invite.max', '10'),
('invite.message', 'You are being invited to join our social network.'),
('invite.subject', 'Join Us'),
('music.playlistsperpage', '10'),
('payment.benefit', 'all'),
('payment.currency', 'USD'),
('payment.secret', '5958ece2875fd79f19dc85c401c2bed2'),
('poll.canchangevote', '1'),
('poll.maxoptions', '15'),
('poll.showpiechart', '0'),
('storage.service.mirrored.counter', '0'),
('storage.service.mirrored.index', '0'),
('storage.service.roundrobin.counter', '0'),
('user.friends.direction', '1'),
('user.friends.eligible', '2'),
('user.friends.lists', '1'),
('user.friends.verification', '1'),
('user.signup.approve', '1'),
('user.signup.checkemail', '1'),
('user.signup.inviteonly', '0'),
('user.signup.random', '0'),
('user.signup.terms', '1'),
('user.signup.username', '1'),
('user.signup.verifyemail', '0'),
('user.support.links', '1'),
('video.embeds', '1'),
('video.ffmpeg.path', ''),
('video.jobs', '2');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_statistics`
--

CREATE TABLE `engine4_core_statistics` (
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_statistics`
--

INSERT INTO `engine4_core_statistics` (`type`, `date`, `value`) VALUES
('core.views', '2017-02-21 13:00:00', 7),
('user.logins', '2017-02-21 13:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_status`
--

CREATE TABLE `engine4_core_status` (
  `status_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_styles`
--

CREATE TABLE `engine4_core_styles` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) UNSIGNED NOT NULL,
  `style` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_tagmaps`
--

CREATE TABLE `engine4_core_tagmaps` (
  `tagmap_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `tagger_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tagger_id` int(11) UNSIGNED NOT NULL,
  `tag_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tag_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `extra` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_tags`
--

CREATE TABLE `engine4_core_tags` (
  `tag_id` int(11) UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_tasks`
--

CREATE TABLE `engine4_core_tasks` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `timeout` int(11) UNSIGNED NOT NULL DEFAULT '60',
  `processes` smallint(3) UNSIGNED NOT NULL DEFAULT '1',
  `semaphore` smallint(3) NOT NULL DEFAULT '0',
  `started_last` int(11) NOT NULL DEFAULT '0',
  `started_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `completed_last` int(11) NOT NULL DEFAULT '0',
  `completed_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `failure_last` int(11) NOT NULL DEFAULT '0',
  `failure_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `success_last` int(11) NOT NULL DEFAULT '0',
  `success_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_tasks`
--

INSERT INTO `engine4_core_tasks` (`task_id`, `title`, `module`, `plugin`, `timeout`, `processes`, `semaphore`, `started_last`, `started_count`, `completed_last`, `completed_count`, `failure_last`, `failure_count`, `success_last`, `success_count`) VALUES
(1, 'Job Queue', 'core', 'Core_Plugin_Task_Jobs', 5, 1, 0, 1487684421, 21, 1487684421, 21, 0, 0, 1487684421, 21),
(2, 'Background Mailer', 'core', 'Core_Plugin_Task_Mail', 15, 1, 0, 1487684421, 21, 1487684421, 21, 0, 0, 1487684421, 21),
(3, 'Cache Prefetch', 'core', 'Core_Plugin_Task_Prefetch', 300, 1, 0, 1487684421, 7, 1487684421, 7, 0, 0, 1487684421, 7),
(4, 'Statistics', 'core', 'Core_Plugin_Task_Statistics', 43200, 1, 0, 1487682474, 1, 1487682474, 1, 0, 0, 1487682474, 1),
(5, 'Log Rotation', 'core', 'Core_Plugin_Task_LogRotation', 7200, 1, 0, 1487682474, 1, 1487682474, 1, 0, 0, 1487682474, 1),
(6, 'Member Data Maintenance', 'user', 'User_Plugin_Task_Cleanup', 60, 1, 0, 1487684301, 13, 1487684301, 13, 0, 0, 1487684301, 13),
(7, 'Payment Maintenance', 'user', 'Payment_Plugin_Task_Cleanup', 43200, 1, 0, 1487682540, 1, 1487682540, 1, 0, 0, 1487682540, 1),
(8, 'Chat Data Maintenance', 'chat', 'Chat_Plugin_Task_Cleanup', 60, 1, 0, 1487684301, 12, 1487684301, 12, 0, 0, 1487684301, 12),
(9, 'Music Cleanup', 'music', 'Music_Plugin_Task_Cleanup', 43200, 1, 0, 1487682615, 1, 1487682615, 1, 0, 0, 1487682615, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_themes`
--

CREATE TABLE `engine4_core_themes` (
  `theme_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_themes`
--

INSERT INTO `engine4_core_themes` (`theme_id`, `name`, `title`, `description`, `active`) VALUES
(1, 'default', 'Default', '', 0),
(2, 'midnight', 'Midnight', '', 0),
(3, 'clean', 'Clean', '', 0),
(4, 'modern', 'Modern', '', 1),
(5, 'bamboo', 'Bamboo', '', 0),
(6, 'digita', 'Digita', '', 0),
(7, 'grid-blue', 'Grid Blue', '', 0),
(8, 'grid-brown', 'Grid Brown', '', 0),
(9, 'grid-dark', 'Grid Dark', '', 0),
(10, 'grid-gray', 'Grid Gray', '', 0),
(11, 'grid-green', 'Grid Green', '', 0),
(12, 'grid-pink', 'Grid Pink', '', 0),
(13, 'grid-purple', 'Grid Purple', '', 0),
(14, 'grid-red', 'Grid Red', '', 0),
(15, 'kandy-cappuccino', 'Kandy Cappuccino', '', 0),
(16, 'kandy-limeorange', 'Kandy Limeorange', '', 0),
(17, 'kandy-mangoberry', 'Kandy Mangoberry', '', 0),
(18, 'kandy-watermelon', 'Kandy Watermelon', '', 0),
(19, 'musicbox-blue', 'Musicbox Blue', '', 0),
(20, 'musicbox-brown', 'Musicbox Brown', '', 0),
(21, 'musicbox-gray', 'Musicbox Gray', '', 0),
(22, 'musicbox-green', 'Musicbox Green', '', 0),
(23, 'musicbox-pink', 'Musicbox Pink', '', 0),
(24, 'musicbox-purple', 'Musicbox Purple', '', 0),
(25, 'musicbox-red', 'Musicbox Red', '', 0),
(26, 'musicbox-yellow', 'Musicbox Yellow', '', 0),
(27, 'quantum-beige', 'Quantum Beige', '', 0),
(28, 'quantum-blue', 'Quantum Blue', '', 0),
(29, 'quantum-gray', 'Quantum Gray', '', 0),
(30, 'quantum-green', 'Quantum Green', '', 0),
(31, 'quantum-orange', 'Quantum Orange', '', 0),
(32, 'quantum-pink', 'Quantum Pink', '', 0),
(33, 'quantum-purple', 'Quantum Purple', '', 0),
(34, 'quantum-red', 'Quantum Red', '', 0),
(35, 'slipstream', 'Slipstream', '', 0),
(36, 'snowbot', 'Snowbot', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_albums`
--

CREATE TABLE `engine4_event_albums` (
  `album_id` int(11) UNSIGNED NOT NULL,
  `event_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `collectible_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_categories`
--

CREATE TABLE `engine4_event_categories` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_event_categories`
--

INSERT INTO `engine4_event_categories` (`category_id`, `title`) VALUES
(1, 'Arts'),
(2, 'Business'),
(3, 'Conferences'),
(4, 'Festivals'),
(5, 'Food'),
(6, 'Fundraisers'),
(7, 'Galleries'),
(8, 'Health'),
(9, 'Just For Fun'),
(10, 'Kids'),
(11, 'Learning'),
(12, 'Literary'),
(13, 'Movies'),
(14, 'Museums'),
(15, 'Neighborhood'),
(16, 'Networking'),
(17, 'Nightlife'),
(18, 'On Campus'),
(19, 'Organizations'),
(20, 'Outdoors'),
(21, 'Pets'),
(22, 'Politics'),
(23, 'Sales'),
(24, 'Science'),
(25, 'Spirituality'),
(26, 'Sports'),
(27, 'Technology'),
(28, 'Theatre'),
(29, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_events`
--

CREATE TABLE `engine4_event_events` (
  `event_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `parent_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `host` varchar(115) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(115) COLLATE utf8_unicode_ci NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `member_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `approval` tinyint(1) NOT NULL DEFAULT '0',
  `invite` tinyint(1) NOT NULL DEFAULT '0',
  `photo_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_membership`
--

CREATE TABLE `engine4_event_membership` (
  `resource_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `rsvp` tinyint(3) NOT NULL DEFAULT '3',
  `title` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_photos`
--

CREATE TABLE `engine4_event_photos` (
  `photo_id` int(11) UNSIGNED NOT NULL,
  `album_id` int(11) UNSIGNED NOT NULL,
  `event_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_id` int(11) UNSIGNED NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_posts`
--

CREATE TABLE `engine4_event_posts` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `event_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_topics`
--

CREATE TABLE `engine4_event_topics` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `event_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `post_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost_id` int(11) UNSIGNED NOT NULL,
  `lastposter_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_event_topicwatches`
--

CREATE TABLE `engine4_event_topicwatches` (
  `resource_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `watch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_categories`
--

CREATE TABLE `engine4_forum_categories` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `forum_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_forum_categories`
--

INSERT INTO `engine4_forum_categories` (`category_id`, `title`, `description`, `creation_date`, `modified_date`, `order`, `forum_count`) VALUES
(1, 'General', '', '2017-02-21 08:01:48', '2017-02-21 08:01:48', 1, 3),
(2, 'Off-Topic', '', '2017-02-21 08:01:48', '2017-02-21 08:01:48', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_forums`
--

CREATE TABLE `engine4_forum_forums` (
  `forum_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '999',
  `file_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `topic_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `post_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastposter_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_forum_forums`
--

INSERT INTO `engine4_forum_forums` (`forum_id`, `category_id`, `title`, `description`, `creation_date`, `modified_date`, `order`, `file_id`, `view_count`, `topic_count`, `post_count`, `lastpost_id`, `lastposter_id`) VALUES
(1, 1, 'News and Announcements', '', '2010-02-01 14:59:01', '2010-02-01 14:59:01', 1, 0, 0, 0, 0, 0, 0),
(2, 1, 'Support', '', '2010-02-01 15:09:01', '2010-02-01 17:59:01', 2, 0, 0, 0, 0, 0, 0),
(3, 1, 'Suggestions', '', '2010-02-01 15:09:01', '2010-02-01 17:59:01', 3, 0, 0, 0, 0, 0, 0),
(4, 2, 'Off-Topic Discussions', '', '2010-02-01 15:09:01', '2010-02-01 17:59:01', 1, 0, 0, 0, 0, 0, 0),
(5, 2, 'Introduce Yourself', '', '2010-02-01 15:09:01', '2010-02-01 17:59:01', 2, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_listitems`
--

CREATE TABLE `engine4_forum_listitems` (
  `listitem_id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_forum_listitems`
--

INSERT INTO `engine4_forum_listitems` (`listitem_id`, `list_id`, `child_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_lists`
--

CREATE TABLE `engine4_forum_lists` (
  `list_id` int(11) UNSIGNED NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `child_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_forum_lists`
--

INSERT INTO `engine4_forum_lists` (`list_id`, `owner_id`, `child_count`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_membership`
--

CREATE TABLE `engine4_forum_membership` (
  `resource_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `moderator` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_posts`
--

CREATE TABLE `engine4_forum_posts` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `forum_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `edit_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_signatures`
--

CREATE TABLE `engine4_forum_signatures` (
  `signature_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `post_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_topics`
--

CREATE TABLE `engine4_forum_topics` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `forum_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `post_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastposter_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_topicviews`
--

CREATE TABLE `engine4_forum_topicviews` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `last_view_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_forum_topicwatches`
--

CREATE TABLE `engine4_forum_topicwatches` (
  `resource_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `watch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_albums`
--

CREATE TABLE `engine4_group_albums` (
  `album_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `collectible_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_categories`
--

CREATE TABLE `engine4_group_categories` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_group_categories`
--

INSERT INTO `engine4_group_categories` (`category_id`, `title`) VALUES
(1, 'Animals'),
(2, 'Business & Finance'),
(3, 'Computers & Internet'),
(4, 'Cultures & Community'),
(5, 'Dating & Relationships'),
(6, 'Entertainment & Arts'),
(7, 'Family & Home'),
(8, 'Games'),
(9, 'Government & Politics'),
(10, 'Health & Wellness'),
(11, 'Hobbies & Crafts'),
(12, 'Music'),
(13, 'Recreation & Sports'),
(14, 'Regional'),
(15, 'Religion & Beliefs'),
(16, 'Schools & Education'),
(17, 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_groups`
--

CREATE TABLE `engine4_group_groups` (
  `group_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `invite` tinyint(1) NOT NULL DEFAULT '1',
  `approval` tinyint(1) NOT NULL DEFAULT '0',
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `member_count` smallint(6) UNSIGNED NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_listitems`
--

CREATE TABLE `engine4_group_listitems` (
  `listitem_id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_lists`
--

CREATE TABLE `engine4_group_lists` (
  `list_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int(11) UNSIGNED NOT NULL,
  `child_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_membership`
--

CREATE TABLE `engine4_group_membership` (
  `resource_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_photos`
--

CREATE TABLE `engine4_group_photos` (
  `photo_id` int(11) UNSIGNED NOT NULL,
  `album_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_id` int(11) UNSIGNED NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_posts`
--

CREATE TABLE `engine4_group_posts` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_topics`
--

CREATE TABLE `engine4_group_topics` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `post_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastposter_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_group_topicwatches`
--

CREATE TABLE `engine4_group_topicwatches` (
  `resource_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `watch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_invites`
--

CREATE TABLE `engine4_invites` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `send_request` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `new_user_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_messages_conversations`
--

CREATE TABLE `engine4_messages_conversations` (
  `conversation_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) UNSIGNED NOT NULL,
  `recipients` int(11) UNSIGNED NOT NULL,
  `modified` datetime NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `resource_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `resource_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_messages_messages`
--

CREATE TABLE `engine4_messages_messages` (
  `message_id` int(11) UNSIGNED NOT NULL,
  `conversation_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `attachment_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `attachment_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_messages_recipients`
--

CREATE TABLE `engine4_messages_recipients` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `conversation_id` int(11) UNSIGNED NOT NULL,
  `inbox_message_id` int(11) UNSIGNED DEFAULT NULL,
  `inbox_updated` datetime DEFAULT NULL,
  `inbox_read` tinyint(1) DEFAULT NULL,
  `inbox_deleted` tinyint(1) DEFAULT NULL,
  `outbox_message_id` int(11) UNSIGNED DEFAULT NULL,
  `outbox_updated` datetime DEFAULT NULL,
  `outbox_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_music_playlists`
--

CREATE TABLE `engine4_music_playlists` (
  `playlist_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(63) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `owner_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `profile` tinyint(1) NOT NULL DEFAULT '0',
  `special` enum('wall','message') COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `play_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_music_playlist_songs`
--

CREATE TABLE `engine4_music_playlist_songs` (
  `song_id` int(11) UNSIGNED NOT NULL,
  `playlist_id` int(11) UNSIGNED NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `play_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_network_membership`
--

CREATE TABLE `engine4_network_membership` (
  `resource_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_network_networks`
--

CREATE TABLE `engine4_network_networks` (
  `network_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `pattern` text COLLATE utf8_unicode_ci,
  `member_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `assignment` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_network_networks`
--

INSERT INTO `engine4_network_networks` (`network_id`, `title`, `description`, `field_id`, `pattern`, `member_count`, `hide`, `assignment`) VALUES
(1, 'North America', '', 0, NULL, 0, 0, 0),
(2, 'South America', '', 0, NULL, 0, 0, 0),
(3, 'Europe', '', 0, NULL, 0, 0, 0),
(4, 'Asia', '', 0, NULL, 0, 0, 0),
(5, 'Africa', '', 0, NULL, 0, 0, 0),
(6, 'Australia', '', 0, NULL, 0, 0, 0),
(7, 'Antarctica', '', 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_gateways`
--

CREATE TABLE `engine4_payment_gateways` (
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `config` mediumblob,
  `test_mode` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_payment_gateways`
--

INSERT INTO `engine4_payment_gateways` (`gateway_id`, `title`, `description`, `enabled`, `plugin`, `config`, `test_mode`) VALUES
(1, '2Checkout', NULL, 0, 'Payment_Plugin_Gateway_2Checkout', NULL, 0),
(2, 'PayPal', NULL, 0, 'Payment_Plugin_Gateway_PayPal', NULL, 0),
(3, 'Testing', NULL, 0, 'Payment_Plugin_Gateway_Testing', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_orders`
--

CREATE TABLE `engine4_payment_orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `gateway_order_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `state` enum('pending','cancelled','failed','incomplete','complete') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'pending',
  `creation_date` datetime NOT NULL,
  `source_type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_packages`
--

CREATE TABLE `engine4_payment_packages` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `downgrade_level_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` decimal(16,2) UNSIGNED NOT NULL,
  `recurrence` int(11) UNSIGNED NOT NULL,
  `recurrence_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) UNSIGNED NOT NULL,
  `duration_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci NOT NULL,
  `trial_duration` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `trial_duration_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `signup` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `after_signup` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_products`
--

CREATE TABLE `engine4_payment_products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `extension_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `extension_id` int(10) UNSIGNED DEFAULT NULL,
  `sku` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(16,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_subscriptions`
--

CREATE TABLE `engine4_payment_subscriptions` (
  `subscription_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `package_id` int(11) UNSIGNED NOT NULL,
  `status` enum('initial','trial','pending','active','cancelled','expired','overdue','refunded') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'initial',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `gateway_id` int(10) UNSIGNED DEFAULT NULL,
  `gateway_profile_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_transactions`
--

CREATE TABLE `engine4_payment_transactions` (
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `state` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `gateway_parent_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_order_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `currency` char(3) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_poll_options`
--

CREATE TABLE `engine4_poll_options` (
  `poll_option_id` int(11) UNSIGNED NOT NULL,
  `poll_id` int(11) UNSIGNED NOT NULL,
  `poll_option` text COLLATE utf8_unicode_ci NOT NULL,
  `votes` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_poll_polls`
--

CREATE TABLE `engine4_poll_polls` (
  `poll_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `vote_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_poll_votes`
--

CREATE TABLE `engine4_poll_votes` (
  `poll_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `poll_option_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_chunks`
--

CREATE TABLE `engine4_storage_chunks` (
  `chunk_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_files`
--

CREATE TABLE `engine4_storage_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `parent_file_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `parent_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `storage_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_major` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mime_minor` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `hash` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_mirrors`
--

CREATE TABLE `engine4_storage_mirrors` (
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_services`
--

CREATE TABLE `engine4_storage_services` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `config` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_storage_services`
--

INSERT INTO `engine4_storage_services` (`service_id`, `servicetype_id`, `config`, `enabled`, `default`) VALUES
(1, 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_servicetypes`
--

CREATE TABLE `engine4_storage_servicetypes` (
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `form` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_storage_servicetypes`
--

INSERT INTO `engine4_storage_servicetypes` (`servicetype_id`, `title`, `plugin`, `form`, `enabled`) VALUES
(1, 'Local Storage', 'Storage_Service_Local', 'Storage_Form_Admin_Service_Local', 1),
(2, 'Database Storage', 'Storage_Service_Db', 'Storage_Form_Admin_Service_Db', 0),
(3, 'Amazon S3', 'Storage_Service_S3', 'Storage_Form_Admin_Service_S3', 1),
(4, 'Virtual File System', 'Storage_Service_Vfs', 'Storage_Form_Admin_Service_Vfs', 1),
(5, 'Round-Robin', 'Storage_Service_RoundRobin', 'Storage_Form_Admin_Service_RoundRobin', 0),
(6, 'Mirrored', 'Storage_Service_Mirrored', 'Storage_Form_Admin_Service_Mirrored', 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_users`
--

CREATE TABLE `engine4_users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` text COLLATE utf8_unicode_ci,
  `status_date` datetime DEFAULT NULL,
  `password` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `salt` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'auto',
  `language` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'en_US',
  `timezone` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'America/Los_Angeles',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `show_profileviewers` tinyint(1) NOT NULL DEFAULT '1',
  `level_id` int(11) UNSIGNED NOT NULL,
  `invites_used` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `extra_invites` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL,
  `creation_ip` varbinary(16) NOT NULL,
  `modified_date` datetime NOT NULL,
  `lastlogin_date` datetime DEFAULT NULL,
  `lastlogin_ip` varbinary(16) DEFAULT NULL,
  `update_date` int(11) DEFAULT NULL,
  `member_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_users`
--

INSERT INTO `engine4_users` (`user_id`, `email`, `username`, `displayname`, `photo_id`, `status`, `status_date`, `password`, `salt`, `locale`, `language`, `timezone`, `search`, `show_profileviewers`, `level_id`, `invites_used`, `extra_invites`, `enabled`, `verified`, `approved`, `creation_date`, `creation_ip`, `modified_date`, `lastlogin_date`, `lastlogin_ip`, `update_date`, `member_count`, `view_count`) VALUES
(1, 'alex.icastro@outlook.com', 'admin', 'admin', 0, NULL, NULL, '80bddf0d34a890c1d8682a58bae46aa4', '8987060', 'auto', 'en_US', 'US/Eastern', 1, 1, 1, 0, 0, 1, 1, 1, '2017-02-21 13:05:23', '', '0000-00-00 00:00:00', '2017-02-21 13:11:04', 0x00000000000000000000000000000001, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_block`
--

CREATE TABLE `engine4_user_block` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `blocked_user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_facebook`
--

CREATE TABLE `engine4_user_facebook` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `facebook_uid` bigint(20) UNSIGNED NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_maps`
--

CREATE TABLE `engine4_user_fields_maps` (
  `field_id` int(11) UNSIGNED NOT NULL,
  `option_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL,
  `order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_maps`
--

INSERT INTO `engine4_user_fields_maps` (`field_id`, `option_id`, `child_id`, `order`) VALUES
(0, 0, 1, 1),
(1, 1, 2, 2),
(1, 1, 3, 3),
(1, 1, 4, 4),
(1, 1, 5, 5),
(1, 1, 6, 6),
(1, 1, 7, 7),
(1, 1, 8, 8),
(1, 1, 9, 9),
(1, 1, 10, 10),
(1, 1, 11, 11),
(1, 1, 12, 12),
(1, 1, 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_meta`
--

CREATE TABLE `engine4_user_fields_meta` (
  `field_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `display` tinyint(1) UNSIGNED NOT NULL,
  `publish` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `search` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `order` smallint(3) UNSIGNED NOT NULL DEFAULT '999',
  `config` text COLLATE utf8_unicode_ci,
  `validators` text COLLATE utf8_unicode_ci,
  `filters` text COLLATE utf8_unicode_ci,
  `style` text COLLATE utf8_unicode_ci,
  `error` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_meta`
--

INSERT INTO `engine4_user_fields_meta` (`field_id`, `type`, `label`, `description`, `alias`, `required`, `display`, `publish`, `search`, `show`, `order`, `config`, `validators`, `filters`, `style`, `error`) VALUES
(1, 'profile_type', 'Profile Type', '', 'profile_type', 1, 0, 0, 2, 1, 999, '', NULL, NULL, NULL, NULL),
(2, 'heading', 'Personal Information', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL),
(3, 'first_name', 'First Name', '', 'first_name', 1, 1, 0, 2, 1, 999, '', '[["StringLength",false,[1,32]]]', NULL, NULL, NULL),
(4, 'last_name', 'Last Name', '', 'last_name', 1, 1, 0, 2, 1, 999, '', '[["StringLength",false,[1,32]]]', NULL, NULL, NULL),
(5, 'gender', 'Gender', '', 'gender', 0, 1, 0, 1, 1, 999, '', NULL, NULL, NULL, NULL),
(6, 'birthdate', 'Birthday', '', 'birthdate', 0, 1, 0, 1, 1, 999, '', NULL, NULL, NULL, NULL),
(7, 'heading', 'Contact Information', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL),
(8, 'website', 'Website', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL),
(9, 'twitter', 'Twitter', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL),
(10, 'facebook', 'Facebook', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL),
(11, 'aim', 'AIM', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL),
(12, 'heading', 'Personal Details', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL),
(13, 'about_me', 'About Me', '', '', 0, 1, 0, 0, 1, 999, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_options`
--

CREATE TABLE `engine4_user_fields_options` (
  `option_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_options`
--

INSERT INTO `engine4_user_fields_options` (`option_id`, `field_id`, `label`, `order`) VALUES
(1, 1, 'Regular Member', 1),
(2, 5, 'Male', 1),
(3, 5, 'Female', 2);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_search`
--

CREATE TABLE `engine4_user_fields_search` (
  `item_id` int(11) UNSIGNED NOT NULL,
  `profile_type` smallint(11) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` smallint(6) UNSIGNED DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_values`
--

CREATE TABLE `engine4_user_fields_values` (
  `item_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `index` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `privacy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_values`
--

INSERT INTO `engine4_user_fields_values` (`item_id`, `field_id`, `index`, `value`, `privacy`) VALUES
(1, 1, 0, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_forgot`
--

CREATE TABLE `engine4_user_forgot` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_janrain`
--

CREATE TABLE `engine4_user_janrain` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_listitems`
--

CREATE TABLE `engine4_user_listitems` (
  `listitem_id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_lists`
--

CREATE TABLE `engine4_user_lists` (
  `list_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int(11) UNSIGNED NOT NULL,
  `child_count` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_logins`
--

CREATE TABLE `engine4_user_logins` (
  `login_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varbinary(16) NOT NULL,
  `timestamp` datetime NOT NULL,
  `state` enum('success','no-member','bad-password','disabled','unpaid','third-party','v3-migration','unknown') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'unknown',
  `source` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_logins`
--

INSERT INTO `engine4_user_logins` (`login_id`, `user_id`, `email`, `ip`, `timestamp`, `state`, `source`, `active`) VALUES
(1, 1, 'alex.icastro@outlook.com', 0x00000000000000000000000000000001, '2017-02-21 13:11:04', 'success', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_membership`
--

CREATE TABLE `engine4_user_membership` (
  `resource_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_online`
--

CREATE TABLE `engine4_user_online` (
  `ip` varbinary(16) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `active` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_online`
--

INSERT INTO `engine4_user_online` (`ip`, `user_id`, `active`) VALUES
(0x00000000000000000000000000000001, 0, '2017-02-21 13:40:21'),
(0x00000000000000000000000000000001, 1, '2017-02-21 15:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_settings`
--

CREATE TABLE `engine4_user_settings` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_signup`
--

CREATE TABLE `engine4_user_signup` (
  `signup_id` int(11) UNSIGNED NOT NULL,
  `class` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '999',
  `enable` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_signup`
--

INSERT INTO `engine4_user_signup` (`signup_id`, `class`, `order`, `enable`) VALUES
(1, 'User_Plugin_Signup_Account', 1, 1),
(2, 'User_Plugin_Signup_Fields', 2, 1),
(3, 'User_Plugin_Signup_Photo', 3, 1),
(4, 'User_Plugin_Signup_Invite', 4, 0),
(5, 'Payment_Plugin_Signup_Subscription', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_twitter`
--

CREATE TABLE `engine4_user_twitter` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `twitter_uid` bigint(20) UNSIGNED NOT NULL,
  `twitter_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_verify`
--

CREATE TABLE `engine4_user_verify` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_video_categories`
--

CREATE TABLE `engine4_video_categories` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_video_categories`
--

INSERT INTO `engine4_video_categories` (`category_id`, `user_id`, `category_name`) VALUES
(1, 0, 'Autos & Vehicles'),
(2, 0, 'Comedy'),
(3, 0, 'Education'),
(4, 0, 'Entertainment'),
(5, 0, 'Film & Animation'),
(6, 0, 'Gaming'),
(7, 0, 'Howto & Style'),
(8, 0, 'Music'),
(9, 0, 'News & Politics'),
(10, 0, 'Nonprofits & Activism'),
(11, 0, 'People & Blogs'),
(12, 0, 'Pets & Animals'),
(13, 0, 'Science & Technology'),
(14, 0, 'Sports'),
(15, 0, 'Travel & Events');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_video_ratings`
--

CREATE TABLE `engine4_video_ratings` (
  `video_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(9) UNSIGNED NOT NULL,
  `rating` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_video_videos`
--

CREATE TABLE `engine4_video_videos` (
  `video_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `owner_type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `parent_type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL,
  `code` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) UNSIGNED DEFAULT NULL,
  `rating` float NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `duration` int(9) UNSIGNED NOT NULL,
  `rotation` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `engine4_activity_actions`
--
ALTER TABLE `engine4_activity_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `SUBJECT` (`subject_type`,`subject_id`),
  ADD KEY `OBJECT` (`object_type`,`object_id`);

--
-- Indexes for table `engine4_activity_actionsettings`
--
ALTER TABLE `engine4_activity_actionsettings`
  ADD PRIMARY KEY (`user_id`,`type`);

--
-- Indexes for table `engine4_activity_actiontypes`
--
ALTER TABLE `engine4_activity_actiontypes`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `engine4_activity_attachments`
--
ALTER TABLE `engine4_activity_attachments`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `type_id` (`type`,`id`);

--
-- Indexes for table `engine4_activity_comments`
--
ALTER TABLE `engine4_activity_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `resource_type` (`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_activity_likes`
--
ALTER TABLE `engine4_activity_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_activity_notifications`
--
ALTER TABLE `engine4_activity_notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `LOOKUP` (`user_id`,`date`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `object` (`object_type`,`object_id`);

--
-- Indexes for table `engine4_activity_notificationsettings`
--
ALTER TABLE `engine4_activity_notificationsettings`
  ADD PRIMARY KEY (`user_id`,`type`);

--
-- Indexes for table `engine4_activity_notificationtypes`
--
ALTER TABLE `engine4_activity_notificationtypes`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `engine4_activity_stream`
--
ALTER TABLE `engine4_activity_stream`
  ADD PRIMARY KEY (`target_type`,`target_id`,`action_id`),
  ADD KEY `SUBJECT` (`subject_type`,`subject_id`,`action_id`),
  ADD KEY `OBJECT` (`object_type`,`object_id`,`action_id`);

--
-- Indexes for table `engine4_album_albums`
--
ALTER TABLE `engine4_album_albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `owner_type` (`owner_type`,`owner_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `search` (`search`);

--
-- Indexes for table `engine4_album_categories`
--
ALTER TABLE `engine4_album_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_album_photos`
--
ALTER TABLE `engine4_album_photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `owner_type` (`owner_type`,`owner_id`);

--
-- Indexes for table `engine4_announcement_announcements`
--
ALTER TABLE `engine4_announcement_announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_authorization_allow`
--
ALTER TABLE `engine4_authorization_allow`
  ADD PRIMARY KEY (`resource_type`,`resource_id`,`action`,`role`,`role_id`);

--
-- Indexes for table `engine4_authorization_levels`
--
ALTER TABLE `engine4_authorization_levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `engine4_authorization_permissions`
--
ALTER TABLE `engine4_authorization_permissions`
  ADD PRIMARY KEY (`level_id`,`type`,`name`);

--
-- Indexes for table `engine4_blog_blogs`
--
ALTER TABLE `engine4_blog_blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `owner_type` (`owner_type`,`owner_id`),
  ADD KEY `search` (`search`,`creation_date`),
  ADD KEY `owner_id` (`owner_id`,`draft`),
  ADD KEY `draft` (`draft`,`search`);

--
-- Indexes for table `engine4_blog_categories`
--
ALTER TABLE `engine4_blog_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`,`category_name`),
  ADD KEY `category_name` (`category_name`);

--
-- Indexes for table `engine4_blog_subscriptions`
--
ALTER TABLE `engine4_blog_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`subscriber_user_id`),
  ADD KEY `subscriber_user_id` (`subscriber_user_id`);

--
-- Indexes for table `engine4_chat_bans`
--
ALTER TABLE `engine4_chat_bans`
  ADD PRIMARY KEY (`ban_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_chat_events`
--
ALTER TABLE `engine4_chat_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `user_id` (`user_id`,`date`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `engine4_chat_messages`
--
ALTER TABLE `engine4_chat_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `room_id` (`room_id`,`date`);

--
-- Indexes for table `engine4_chat_rooms`
--
ALTER TABLE `engine4_chat_rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `public` (`public`);

--
-- Indexes for table `engine4_chat_roomusers`
--
ALTER TABLE `engine4_chat_roomusers`
  ADD PRIMARY KEY (`room_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `engine4_chat_users`
--
ALTER TABLE `engine4_chat_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `engine4_chat_whispers`
--
ALTER TABLE `engine4_chat_whispers`
  ADD PRIMARY KEY (`whisper_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_deleted` (`recipient_deleted`,`sender_deleted`);

--
-- Indexes for table `engine4_classified_albums`
--
ALTER TABLE `engine4_classified_albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `classified_id` (`classified_id`);

--
-- Indexes for table `engine4_classified_categories`
--
ALTER TABLE `engine4_classified_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_classified_classifieds`
--
ALTER TABLE `engine4_classified_classifieds`
  ADD PRIMARY KEY (`classified_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `search` (`search`);

--
-- Indexes for table `engine4_classified_fields_maps`
--
ALTER TABLE `engine4_classified_fields_maps`
  ADD PRIMARY KEY (`field_id`,`option_id`,`child_id`);

--
-- Indexes for table `engine4_classified_fields_meta`
--
ALTER TABLE `engine4_classified_fields_meta`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `engine4_classified_fields_options`
--
ALTER TABLE `engine4_classified_fields_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `engine4_classified_fields_search`
--
ALTER TABLE `engine4_classified_fields_search`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `price` (`price`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `engine4_classified_fields_values`
--
ALTER TABLE `engine4_classified_fields_values`
  ADD PRIMARY KEY (`item_id`,`field_id`,`index`);

--
-- Indexes for table `engine4_classified_photos`
--
ALTER TABLE `engine4_classified_photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `classified_id` (`classified_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_core_adcampaigns`
--
ALTER TABLE `engine4_core_adcampaigns`
  ADD PRIMARY KEY (`adcampaign_id`);

--
-- Indexes for table `engine4_core_adphotos`
--
ALTER TABLE `engine4_core_adphotos`
  ADD PRIMARY KEY (`adphoto_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `engine4_core_ads`
--
ALTER TABLE `engine4_core_ads`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `ad_campaign` (`ad_campaign`);

--
-- Indexes for table `engine4_core_auth`
--
ALTER TABLE `engine4_core_auth`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `expires` (`expires`);

--
-- Indexes for table `engine4_core_bannedemails`
--
ALTER TABLE `engine4_core_bannedemails`
  ADD PRIMARY KEY (`bannedemail_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `engine4_core_bannedips`
--
ALTER TABLE `engine4_core_bannedips`
  ADD PRIMARY KEY (`bannedip_id`),
  ADD UNIQUE KEY `start` (`start`,`stop`);

--
-- Indexes for table `engine4_core_bannedusernames`
--
ALTER TABLE `engine4_core_bannedusernames`
  ADD PRIMARY KEY (`bannedusername_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `engine4_core_bannedwords`
--
ALTER TABLE `engine4_core_bannedwords`
  ADD PRIMARY KEY (`bannedword_id`);

--
-- Indexes for table `engine4_core_comments`
--
ALTER TABLE `engine4_core_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `resource_type` (`resource_type`,`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_core_content`
--
ALTER TABLE `engine4_core_content`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `page_id` (`page_id`,`order`);

--
-- Indexes for table `engine4_core_geotags`
--
ALTER TABLE `engine4_core_geotags`
  ADD PRIMARY KEY (`geotag_id`),
  ADD KEY `latitude` (`latitude`,`longitude`);

--
-- Indexes for table `engine4_core_jobs`
--
ALTER TABLE `engine4_core_jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `jobtype_id` (`jobtype_id`),
  ADD KEY `state` (`state`),
  ADD KEY `is_complete` (`is_complete`,`priority`,`job_id`);

--
-- Indexes for table `engine4_core_jobtypes`
--
ALTER TABLE `engine4_core_jobtypes`
  ADD PRIMARY KEY (`jobtype_id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `engine4_core_languages`
--
ALTER TABLE `engine4_core_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `engine4_core_likes`
--
ALTER TABLE `engine4_core_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `resource_type` (`resource_type`,`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_core_links`
--
ALTER TABLE `engine4_core_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `owner` (`owner_type`,`owner_id`),
  ADD KEY `parent` (`parent_type`,`parent_id`);

--
-- Indexes for table `engine4_core_listitems`
--
ALTER TABLE `engine4_core_listitems`
  ADD PRIMARY KEY (`listitem_id`),
  ADD KEY `list_id` (`list_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `engine4_core_lists`
--
ALTER TABLE `engine4_core_lists`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `owner_type` (`owner_type`,`owner_id`);

--
-- Indexes for table `engine4_core_log`
--
ALTER TABLE `engine4_core_log`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `domain` (`domain`,`timestamp`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_core_mail`
--
ALTER TABLE `engine4_core_mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `engine4_core_mailrecipients`
--
ALTER TABLE `engine4_core_mailrecipients`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `engine4_core_mailtemplates`
--
ALTER TABLE `engine4_core_mailtemplates`
  ADD PRIMARY KEY (`mailtemplate_id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `engine4_core_menuitems`
--
ALTER TABLE `engine4_core_menuitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `LOOKUP` (`name`,`order`);

--
-- Indexes for table `engine4_core_menus`
--
ALTER TABLE `engine4_core_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `order` (`order`);

--
-- Indexes for table `engine4_core_migrations`
--
ALTER TABLE `engine4_core_migrations`
  ADD PRIMARY KEY (`package`);

--
-- Indexes for table `engine4_core_modules`
--
ALTER TABLE `engine4_core_modules`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `engine4_core_nodes`
--
ALTER TABLE `engine4_core_nodes`
  ADD PRIMARY KEY (`node_id`),
  ADD UNIQUE KEY `signature` (`signature`);

--
-- Indexes for table `engine4_core_pages`
--
ALTER TABLE `engine4_core_pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `engine4_core_processes`
--
ALTER TABLE `engine4_core_processes`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `engine4_core_referrers`
--
ALTER TABLE `engine4_core_referrers`
  ADD PRIMARY KEY (`host`,`path`,`query`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `engine4_core_reports`
--
ALTER TABLE `engine4_core_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `category` (`category`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `read` (`read`);

--
-- Indexes for table `engine4_core_routes`
--
ALTER TABLE `engine4_core_routes`
  ADD PRIMARY KEY (`name`),
  ADD KEY `order` (`order`);

--
-- Indexes for table `engine4_core_search`
--
ALTER TABLE `engine4_core_search`
  ADD PRIMARY KEY (`type`,`id`);
ALTER TABLE `engine4_core_search` ADD FULLTEXT KEY `LOOKUP` (`title`,`description`,`keywords`,`hidden`);

--
-- Indexes for table `engine4_core_serviceproviders`
--
ALTER TABLE `engine4_core_serviceproviders`
  ADD PRIMARY KEY (`serviceprovider_id`),
  ADD UNIQUE KEY `type` (`type`,`name`);

--
-- Indexes for table `engine4_core_services`
--
ALTER TABLE `engine4_core_services`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `type` (`type`,`profile`);

--
-- Indexes for table `engine4_core_servicetypes`
--
ALTER TABLE `engine4_core_servicetypes`
  ADD PRIMARY KEY (`servicetype_id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `engine4_core_session`
--
ALTER TABLE `engine4_core_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_core_settings`
--
ALTER TABLE `engine4_core_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `engine4_core_statistics`
--
ALTER TABLE `engine4_core_statistics`
  ADD PRIMARY KEY (`type`,`date`);

--
-- Indexes for table `engine4_core_status`
--
ALTER TABLE `engine4_core_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `engine4_core_styles`
--
ALTER TABLE `engine4_core_styles`
  ADD PRIMARY KEY (`type`,`id`);

--
-- Indexes for table `engine4_core_tagmaps`
--
ALTER TABLE `engine4_core_tagmaps`
  ADD PRIMARY KEY (`tagmap_id`),
  ADD KEY `resource_type` (`resource_type`,`resource_id`),
  ADD KEY `tagger_type` (`tagger_type`,`tagger_id`),
  ADD KEY `tag_type` (`tag_type`,`tag_id`);

--
-- Indexes for table `engine4_core_tags`
--
ALTER TABLE `engine4_core_tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `text` (`text`);

--
-- Indexes for table `engine4_core_tasks`
--
ALTER TABLE `engine4_core_tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD UNIQUE KEY `plugin` (`plugin`),
  ADD KEY `module` (`module`),
  ADD KEY `started_last` (`started_last`);

--
-- Indexes for table `engine4_core_themes`
--
ALTER TABLE `engine4_core_themes`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `engine4_event_albums`
--
ALTER TABLE `engine4_event_albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `search` (`search`);

--
-- Indexes for table `engine4_event_categories`
--
ALTER TABLE `engine4_event_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `engine4_event_events`
--
ALTER TABLE `engine4_event_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_type` (`parent_type`,`parent_id`),
  ADD KEY `starttime` (`starttime`),
  ADD KEY `search` (`search`);

--
-- Indexes for table `engine4_event_membership`
--
ALTER TABLE `engine4_event_membership`
  ADD PRIMARY KEY (`resource_id`,`user_id`),
  ADD KEY `REVERSE` (`user_id`);

--
-- Indexes for table `engine4_event_photos`
--
ALTER TABLE `engine4_event_photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `collection_id` (`collection_id`);

--
-- Indexes for table `engine4_event_posts`
--
ALTER TABLE `engine4_event_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_event_topics`
--
ALTER TABLE `engine4_event_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_event_topicwatches`
--
ALTER TABLE `engine4_event_topicwatches`
  ADD PRIMARY KEY (`resource_id`,`topic_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_forum_categories`
--
ALTER TABLE `engine4_forum_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `order` (`order`);

--
-- Indexes for table `engine4_forum_forums`
--
ALTER TABLE `engine4_forum_forums`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `engine4_forum_listitems`
--
ALTER TABLE `engine4_forum_listitems`
  ADD PRIMARY KEY (`listitem_id`),
  ADD KEY `list_id` (`list_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `engine4_forum_lists`
--
ALTER TABLE `engine4_forum_lists`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `engine4_forum_membership`
--
ALTER TABLE `engine4_forum_membership`
  ADD PRIMARY KEY (`resource_id`,`user_id`);

--
-- Indexes for table `engine4_forum_posts`
--
ALTER TABLE `engine4_forum_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_forum_signatures`
--
ALTER TABLE `engine4_forum_signatures`
  ADD PRIMARY KEY (`signature_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_forum_topics`
--
ALTER TABLE `engine4_forum_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_forum_topicviews`
--
ALTER TABLE `engine4_forum_topicviews`
  ADD PRIMARY KEY (`user_id`,`topic_id`);

--
-- Indexes for table `engine4_forum_topicwatches`
--
ALTER TABLE `engine4_forum_topicwatches`
  ADD PRIMARY KEY (`resource_id`,`topic_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_group_albums`
--
ALTER TABLE `engine4_group_albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `engine4_group_categories`
--
ALTER TABLE `engine4_group_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `engine4_group_groups`
--
ALTER TABLE `engine4_group_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `search` (`search`);

--
-- Indexes for table `engine4_group_listitems`
--
ALTER TABLE `engine4_group_listitems`
  ADD PRIMARY KEY (`listitem_id`),
  ADD KEY `list_id` (`list_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `engine4_group_lists`
--
ALTER TABLE `engine4_group_lists`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `engine4_group_membership`
--
ALTER TABLE `engine4_group_membership`
  ADD PRIMARY KEY (`resource_id`,`user_id`),
  ADD KEY `REVERSE` (`user_id`);

--
-- Indexes for table `engine4_group_photos`
--
ALTER TABLE `engine4_group_photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_group_posts`
--
ALTER TABLE `engine4_group_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_group_topics`
--
ALTER TABLE `engine4_group_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_group_topicwatches`
--
ALTER TABLE `engine4_group_topicwatches`
  ADD PRIMARY KEY (`resource_id`,`topic_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_invites`
--
ALTER TABLE `engine4_invites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipient` (`recipient`);

--
-- Indexes for table `engine4_messages_conversations`
--
ALTER TABLE `engine4_messages_conversations`
  ADD PRIMARY KEY (`conversation_id`);

--
-- Indexes for table `engine4_messages_messages`
--
ALTER TABLE `engine4_messages_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `CONVERSATIONS` (`conversation_id`,`message_id`);

--
-- Indexes for table `engine4_messages_recipients`
--
ALTER TABLE `engine4_messages_recipients`
  ADD PRIMARY KEY (`user_id`,`conversation_id`),
  ADD KEY `INBOX_UPDATED` (`user_id`,`conversation_id`,`inbox_updated`),
  ADD KEY `OUTBOX_UPDATED` (`user_id`,`conversation_id`,`outbox_updated`);

--
-- Indexes for table `engine4_music_playlists`
--
ALTER TABLE `engine4_music_playlists`
  ADD PRIMARY KEY (`playlist_id`),
  ADD KEY `creation_date` (`creation_date`),
  ADD KEY `play_count` (`play_count`),
  ADD KEY `owner_id` (`owner_type`,`owner_id`);

--
-- Indexes for table `engine4_music_playlist_songs`
--
ALTER TABLE `engine4_music_playlist_songs`
  ADD PRIMARY KEY (`song_id`),
  ADD KEY `playlist_id` (`playlist_id`,`file_id`),
  ADD KEY `play_count` (`play_count`);

--
-- Indexes for table `engine4_network_membership`
--
ALTER TABLE `engine4_network_membership`
  ADD PRIMARY KEY (`resource_id`,`user_id`);

--
-- Indexes for table `engine4_network_networks`
--
ALTER TABLE `engine4_network_networks`
  ADD PRIMARY KEY (`network_id`),
  ADD KEY `assignment` (`assignment`);

--
-- Indexes for table `engine4_payment_gateways`
--
ALTER TABLE `engine4_payment_gateways`
  ADD PRIMARY KEY (`gateway_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `engine4_payment_orders`
--
ALTER TABLE `engine4_payment_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `gateway_id` (`gateway_id`,`gateway_order_id`),
  ADD KEY `state` (`state`),
  ADD KEY `source_type` (`source_type`,`source_id`);

--
-- Indexes for table `engine4_payment_packages`
--
ALTER TABLE `engine4_payment_packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `engine4_payment_products`
--
ALTER TABLE `engine4_payment_products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `extension_type` (`extension_type`,`extension_id`);

--
-- Indexes for table `engine4_payment_subscriptions`
--
ALTER TABLE `engine4_payment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD UNIQUE KEY `gateway_id` (`gateway_id`,`gateway_profile_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `status` (`status`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `engine4_payment_transactions`
--
ALTER TABLE `engine4_payment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `gateway_id` (`gateway_id`),
  ADD KEY `type` (`type`),
  ADD KEY `state` (`state`),
  ADD KEY `gateway_transaction_id` (`gateway_transaction_id`),
  ADD KEY `gateway_parent_transaction_id` (`gateway_parent_transaction_id`);

--
-- Indexes for table `engine4_poll_options`
--
ALTER TABLE `engine4_poll_options`
  ADD PRIMARY KEY (`poll_option_id`),
  ADD KEY `poll_id` (`poll_id`);

--
-- Indexes for table `engine4_poll_polls`
--
ALTER TABLE `engine4_poll_polls`
  ADD PRIMARY KEY (`poll_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_closed` (`is_closed`),
  ADD KEY `creation_date` (`creation_date`);

--
-- Indexes for table `engine4_poll_votes`
--
ALTER TABLE `engine4_poll_votes`
  ADD PRIMARY KEY (`poll_id`,`user_id`),
  ADD KEY `poll_option_id` (`poll_option_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_storage_chunks`
--
ALTER TABLE `engine4_storage_chunks`
  ADD PRIMARY KEY (`chunk_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `engine4_storage_files`
--
ALTER TABLE `engine4_storage_files`
  ADD PRIMARY KEY (`file_id`),
  ADD UNIQUE KEY `parent_file_id` (`parent_file_id`,`type`),
  ADD KEY `PARENT` (`parent_type`,`parent_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `engine4_storage_mirrors`
--
ALTER TABLE `engine4_storage_mirrors`
  ADD PRIMARY KEY (`file_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `engine4_storage_services`
--
ALTER TABLE `engine4_storage_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `engine4_storage_servicetypes`
--
ALTER TABLE `engine4_storage_servicetypes`
  ADD PRIMARY KEY (`servicetype_id`),
  ADD UNIQUE KEY `plugin` (`plugin`);

--
-- Indexes for table `engine4_users`
--
ALTER TABLE `engine4_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `EMAIL` (`email`),
  ADD UNIQUE KEY `USERNAME` (`username`),
  ADD KEY `MEMBER_COUNT` (`member_count`),
  ADD KEY `CREATION_DATE` (`creation_date`),
  ADD KEY `search` (`search`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `engine4_user_block`
--
ALTER TABLE `engine4_user_block`
  ADD PRIMARY KEY (`user_id`,`blocked_user_id`),
  ADD KEY `REVERSE` (`blocked_user_id`);

--
-- Indexes for table `engine4_user_facebook`
--
ALTER TABLE `engine4_user_facebook`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `facebook_uid` (`facebook_uid`);

--
-- Indexes for table `engine4_user_fields_maps`
--
ALTER TABLE `engine4_user_fields_maps`
  ADD PRIMARY KEY (`field_id`,`option_id`,`child_id`);

--
-- Indexes for table `engine4_user_fields_meta`
--
ALTER TABLE `engine4_user_fields_meta`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `engine4_user_fields_options`
--
ALTER TABLE `engine4_user_fields_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `engine4_user_fields_search`
--
ALTER TABLE `engine4_user_fields_search`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `profile_type` (`profile_type`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `gender` (`gender`),
  ADD KEY `birthdate` (`birthdate`);

--
-- Indexes for table `engine4_user_fields_values`
--
ALTER TABLE `engine4_user_fields_values`
  ADD PRIMARY KEY (`item_id`,`field_id`,`index`);

--
-- Indexes for table `engine4_user_forgot`
--
ALTER TABLE `engine4_user_forgot`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `engine4_user_janrain`
--
ALTER TABLE `engine4_user_janrain`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `engine4_user_listitems`
--
ALTER TABLE `engine4_user_listitems`
  ADD PRIMARY KEY (`listitem_id`),
  ADD KEY `list_id` (`list_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `engine4_user_lists`
--
ALTER TABLE `engine4_user_lists`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `engine4_user_logins`
--
ALTER TABLE `engine4_user_logins`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `engine4_user_membership`
--
ALTER TABLE `engine4_user_membership`
  ADD PRIMARY KEY (`resource_id`,`user_id`),
  ADD KEY `REVERSE` (`user_id`);

--
-- Indexes for table `engine4_user_online`
--
ALTER TABLE `engine4_user_online`
  ADD PRIMARY KEY (`ip`,`user_id`),
  ADD KEY `LOOKUP` (`active`);

--
-- Indexes for table `engine4_user_settings`
--
ALTER TABLE `engine4_user_settings`
  ADD PRIMARY KEY (`user_id`,`name`);

--
-- Indexes for table `engine4_user_signup`
--
ALTER TABLE `engine4_user_signup`
  ADD PRIMARY KEY (`signup_id`);

--
-- Indexes for table `engine4_user_twitter`
--
ALTER TABLE `engine4_user_twitter`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `twitter_uid` (`twitter_uid`);

--
-- Indexes for table `engine4_user_verify`
--
ALTER TABLE `engine4_user_verify`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `engine4_video_categories`
--
ALTER TABLE `engine4_video_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `engine4_video_ratings`
--
ALTER TABLE `engine4_video_ratings`
  ADD PRIMARY KEY (`video_id`,`user_id`),
  ADD KEY `INDEX` (`video_id`);

--
-- Indexes for table `engine4_video_videos`
--
ALTER TABLE `engine4_video_videos`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `owner_id` (`owner_id`,`owner_type`),
  ADD KEY `search` (`search`),
  ADD KEY `creation_date` (`creation_date`),
  ADD KEY `view_count` (`view_count`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `engine4_activity_actions`
--
ALTER TABLE `engine4_activity_actions`
  MODIFY `action_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_activity_attachments`
--
ALTER TABLE `engine4_activity_attachments`
  MODIFY `attachment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_activity_comments`
--
ALTER TABLE `engine4_activity_comments`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_activity_likes`
--
ALTER TABLE `engine4_activity_likes`
  MODIFY `like_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_activity_notifications`
--
ALTER TABLE `engine4_activity_notifications`
  MODIFY `notification_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_album_albums`
--
ALTER TABLE `engine4_album_albums`
  MODIFY `album_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_album_categories`
--
ALTER TABLE `engine4_album_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `engine4_album_photos`
--
ALTER TABLE `engine4_album_photos`
  MODIFY `photo_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_announcement_announcements`
--
ALTER TABLE `engine4_announcement_announcements`
  MODIFY `announcement_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_authorization_levels`
--
ALTER TABLE `engine4_authorization_levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `engine4_blog_blogs`
--
ALTER TABLE `engine4_blog_blogs`
  MODIFY `blog_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_blog_categories`
--
ALTER TABLE `engine4_blog_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `engine4_blog_subscriptions`
--
ALTER TABLE `engine4_blog_subscriptions`
  MODIFY `subscription_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_chat_bans`
--
ALTER TABLE `engine4_chat_bans`
  MODIFY `ban_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_chat_events`
--
ALTER TABLE `engine4_chat_events`
  MODIFY `event_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_chat_messages`
--
ALTER TABLE `engine4_chat_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_chat_rooms`
--
ALTER TABLE `engine4_chat_rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `engine4_chat_whispers`
--
ALTER TABLE `engine4_chat_whispers`
  MODIFY `whisper_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_classified_albums`
--
ALTER TABLE `engine4_classified_albums`
  MODIFY `album_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_classified_categories`
--
ALTER TABLE `engine4_classified_categories`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `engine4_classified_classifieds`
--
ALTER TABLE `engine4_classified_classifieds`
  MODIFY `classified_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_classified_fields_meta`
--
ALTER TABLE `engine4_classified_fields_meta`
  MODIFY `field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `engine4_classified_fields_options`
--
ALTER TABLE `engine4_classified_fields_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_classified_photos`
--
ALTER TABLE `engine4_classified_photos`
  MODIFY `photo_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_adcampaigns`
--
ALTER TABLE `engine4_core_adcampaigns`
  MODIFY `adcampaign_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_adphotos`
--
ALTER TABLE `engine4_core_adphotos`
  MODIFY `adphoto_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_ads`
--
ALTER TABLE `engine4_core_ads`
  MODIFY `ad_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_bannedemails`
--
ALTER TABLE `engine4_core_bannedemails`
  MODIFY `bannedemail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_bannedips`
--
ALTER TABLE `engine4_core_bannedips`
  MODIFY `bannedip_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_bannedusernames`
--
ALTER TABLE `engine4_core_bannedusernames`
  MODIFY `bannedusername_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_bannedwords`
--
ALTER TABLE `engine4_core_bannedwords`
  MODIFY `bannedword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_comments`
--
ALTER TABLE `engine4_core_comments`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_content`
--
ALTER TABLE `engine4_core_content`
  MODIFY `content_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=961;
--
-- AUTO_INCREMENT for table `engine4_core_jobs`
--
ALTER TABLE `engine4_core_jobs`
  MODIFY `job_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_jobtypes`
--
ALTER TABLE `engine4_core_jobtypes`
  MODIFY `jobtype_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `engine4_core_languages`
--
ALTER TABLE `engine4_core_languages`
  MODIFY `language_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `engine4_core_likes`
--
ALTER TABLE `engine4_core_likes`
  MODIFY `like_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_links`
--
ALTER TABLE `engine4_core_links`
  MODIFY `link_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_listitems`
--
ALTER TABLE `engine4_core_listitems`
  MODIFY `listitem_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_lists`
--
ALTER TABLE `engine4_core_lists`
  MODIFY `list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_log`
--
ALTER TABLE `engine4_core_log`
  MODIFY `message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_mail`
--
ALTER TABLE `engine4_core_mail`
  MODIFY `mail_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_mailrecipients`
--
ALTER TABLE `engine4_core_mailrecipients`
  MODIFY `recipient_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_mailtemplates`
--
ALTER TABLE `engine4_core_mailtemplates`
  MODIFY `mailtemplate_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `engine4_core_menuitems`
--
ALTER TABLE `engine4_core_menuitems`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `engine4_core_menus`
--
ALTER TABLE `engine4_core_menus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `engine4_core_nodes`
--
ALTER TABLE `engine4_core_nodes`
  MODIFY `node_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_pages`
--
ALTER TABLE `engine4_core_pages`
  MODIFY `page_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `engine4_core_reports`
--
ALTER TABLE `engine4_core_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_serviceproviders`
--
ALTER TABLE `engine4_core_serviceproviders`
  MODIFY `serviceprovider_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `engine4_core_services`
--
ALTER TABLE `engine4_core_services`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_servicetypes`
--
ALTER TABLE `engine4_core_servicetypes`
  MODIFY `servicetype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `engine4_core_status`
--
ALTER TABLE `engine4_core_status`
  MODIFY `status_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_tagmaps`
--
ALTER TABLE `engine4_core_tagmaps`
  MODIFY `tagmap_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_tags`
--
ALTER TABLE `engine4_core_tags`
  MODIFY `tag_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_core_tasks`
--
ALTER TABLE `engine4_core_tasks`
  MODIFY `task_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `engine4_core_themes`
--
ALTER TABLE `engine4_core_themes`
  MODIFY `theme_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `engine4_event_albums`
--
ALTER TABLE `engine4_event_albums`
  MODIFY `album_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_event_categories`
--
ALTER TABLE `engine4_event_categories`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `engine4_event_events`
--
ALTER TABLE `engine4_event_events`
  MODIFY `event_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_event_photos`
--
ALTER TABLE `engine4_event_photos`
  MODIFY `photo_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_event_posts`
--
ALTER TABLE `engine4_event_posts`
  MODIFY `post_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_event_topics`
--
ALTER TABLE `engine4_event_topics`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_forum_categories`
--
ALTER TABLE `engine4_forum_categories`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `engine4_forum_forums`
--
ALTER TABLE `engine4_forum_forums`
  MODIFY `forum_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `engine4_forum_listitems`
--
ALTER TABLE `engine4_forum_listitems`
  MODIFY `listitem_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `engine4_forum_lists`
--
ALTER TABLE `engine4_forum_lists`
  MODIFY `list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `engine4_forum_posts`
--
ALTER TABLE `engine4_forum_posts`
  MODIFY `post_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_forum_signatures`
--
ALTER TABLE `engine4_forum_signatures`
  MODIFY `signature_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_forum_topics`
--
ALTER TABLE `engine4_forum_topics`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_group_albums`
--
ALTER TABLE `engine4_group_albums`
  MODIFY `album_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_group_categories`
--
ALTER TABLE `engine4_group_categories`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `engine4_group_groups`
--
ALTER TABLE `engine4_group_groups`
  MODIFY `group_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_group_listitems`
--
ALTER TABLE `engine4_group_listitems`
  MODIFY `listitem_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_group_lists`
--
ALTER TABLE `engine4_group_lists`
  MODIFY `list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_group_photos`
--
ALTER TABLE `engine4_group_photos`
  MODIFY `photo_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_group_posts`
--
ALTER TABLE `engine4_group_posts`
  MODIFY `post_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_group_topics`
--
ALTER TABLE `engine4_group_topics`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_invites`
--
ALTER TABLE `engine4_invites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_messages_conversations`
--
ALTER TABLE `engine4_messages_conversations`
  MODIFY `conversation_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_messages_messages`
--
ALTER TABLE `engine4_messages_messages`
  MODIFY `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_music_playlists`
--
ALTER TABLE `engine4_music_playlists`
  MODIFY `playlist_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_music_playlist_songs`
--
ALTER TABLE `engine4_music_playlist_songs`
  MODIFY `song_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_network_networks`
--
ALTER TABLE `engine4_network_networks`
  MODIFY `network_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `engine4_payment_gateways`
--
ALTER TABLE `engine4_payment_gateways`
  MODIFY `gateway_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `engine4_payment_orders`
--
ALTER TABLE `engine4_payment_orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_payment_packages`
--
ALTER TABLE `engine4_payment_packages`
  MODIFY `package_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_payment_products`
--
ALTER TABLE `engine4_payment_products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_payment_subscriptions`
--
ALTER TABLE `engine4_payment_subscriptions`
  MODIFY `subscription_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_payment_transactions`
--
ALTER TABLE `engine4_payment_transactions`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_poll_options`
--
ALTER TABLE `engine4_poll_options`
  MODIFY `poll_option_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_poll_polls`
--
ALTER TABLE `engine4_poll_polls`
  MODIFY `poll_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_storage_chunks`
--
ALTER TABLE `engine4_storage_chunks`
  MODIFY `chunk_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_storage_files`
--
ALTER TABLE `engine4_storage_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_storage_services`
--
ALTER TABLE `engine4_storage_services`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `engine4_storage_servicetypes`
--
ALTER TABLE `engine4_storage_servicetypes`
  MODIFY `servicetype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `engine4_users`
--
ALTER TABLE `engine4_users`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `engine4_user_fields_meta`
--
ALTER TABLE `engine4_user_fields_meta`
  MODIFY `field_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `engine4_user_fields_options`
--
ALTER TABLE `engine4_user_fields_options`
  MODIFY `option_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `engine4_user_listitems`
--
ALTER TABLE `engine4_user_listitems`
  MODIFY `listitem_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_user_lists`
--
ALTER TABLE `engine4_user_lists`
  MODIFY `list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `engine4_user_logins`
--
ALTER TABLE `engine4_user_logins`
  MODIFY `login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `engine4_user_signup`
--
ALTER TABLE `engine4_user_signup`
  MODIFY `signup_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `engine4_video_categories`
--
ALTER TABLE `engine4_video_categories`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `engine4_video_videos`
--
ALTER TABLE `engine4_video_videos`
  MODIFY `video_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

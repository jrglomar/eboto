USE [eboto]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [FK_vote_o_userID]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [FK_vote_o_electionID]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [FK_vote_o_candidateID]
GO
ALTER TABLE [dbo].[t_vote_contestant] DROP CONSTRAINT [FK_vote_con_userID]
GO
ALTER TABLE [dbo].[t_vote_contestant] DROP CONSTRAINT [FK_vote_con_contestID]
GO
ALTER TABLE [dbo].[t_vote_contestant] DROP CONSTRAINT [FK_vote_con_constestantID]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [FK_vote_c_userID]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [FK_vote_c_electionID]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [FK_vote_c_candidateID]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [FK_user_orgsID]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [FK_user_courseID]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [FK_poll_orgID]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [FK_option_electionID]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [FK_election_orgID]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [FK_contestant_contestID]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [FK_contest_orgID]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [FK_candidate_electionID]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [DF_VoteOption]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [DF_VoteCandidate]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF__t_user__userStat__151B244E]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF_User]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF__t_poll__pollStat__1332DBDC]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF_Poll]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF__t_option__option__114A936A]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF_Option]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF__t_electio__elect__0F624AF8]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF_Election]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [DF__t_contest__conte__0D7A0286]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [DF__t_contest__conte__0C85DE4D]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF__t_contest__conte__0B91BA14]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF_Contest]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF__t_candida__candi__09A971A2]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF_Candidate]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF__r_org__orgStatus__07C12930]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF_Org]
GO
ALTER TABLE [dbo].[r_course] DROP CONSTRAINT [DF__r_course__course__05D8E0BE]
GO
ALTER TABLE [dbo].[r_course] DROP CONSTRAINT [DF_Course]
GO
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_vote_option]
GO
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_vote_contestant]
GO
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_vote_candidate]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_user]
GO
/****** Object:  Table [dbo].[t_poll]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_poll]
GO
/****** Object:  Table [dbo].[t_option]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_option]
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_election]
GO
/****** Object:  Table [dbo].[t_contestant]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_contestant]
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_contest]
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[t_candidate]
GO
/****** Object:  Table [dbo].[r_org]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[r_org]
GO
/****** Object:  Table [dbo].[r_course]    Script Date: 12/17/2020 10:01:36 AM ******/
DROP TABLE [dbo].[r_course]
GO
/****** Object:  Table [dbo].[r_course]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[r_course](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[courseName] [varchar](100) NULL,
	[courseDateCreated] [datetime] NULL,
	[courseStatus] [bit] NULL,
 CONSTRAINT [PK_courseID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[r_org]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[r_org](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[orgName] [varchar](100) NULL,
	[orgDateCreated] [datetime] NULL,
	[orgStatus] [bit] NULL,
	[orgLogo] [varchar](200) NULL,
 CONSTRAINT [PK_orgsID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[candidateElectionID] [numeric](18, 0) NULL,
	[candidateDateCreated] [datetime] NULL,
	[candidateStatus] [bit] NULL,
	[candidatePosition] [varchar](100) NULL,
	[candidateName] [varchar](200) NULL,
	[candidateDescription] [varchar](1000) NULL,
	[candidateImage] [varchar](500) NULL,
 CONSTRAINT [PK_candidatesID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_contest](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[contestName] [varchar](100) NULL,
	[contestDateStart] [datetime] NULL,
	[contestDateEnd] [datetime] NULL,
	[contestOrg] [numeric](18, 0) NULL,
	[contestDateCreated] [datetime] NULL,
	[contestStatus] [bit] NULL,
	[contestDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_contestID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_contestant]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_contestant](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[contestantName] [varchar](100) NULL,
	[contestantDescription] [varchar](1000) NULL,
	[contestantStatus] [bit] NULL,
	[contestantContestID] [numeric](18, 0) NULL,
	[contestantImage] [varchar](500) NULL,
	[contestantDateCreated] [datetime] NULL,
 CONSTRAINT [PK_contestantID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_election](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[electionName] [varchar](100) NULL,
	[electionDateStart] [datetime] NULL,
	[electionDateEnd] [datetime] NULL,
	[electionOrg] [numeric](18, 0) NULL,
	[electionDateCreated] [datetime] NULL,
	[electionStatus] [bit] NULL,
	[electionDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_electionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_option]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_option](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[optionPollID] [numeric](18, 0) NULL,
	[optionName] [varchar](100) NULL,
	[optionDateCreated] [datetime] NULL,
	[optionStatus] [bit] NULL,
 CONSTRAINT [PK_optionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_poll]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_poll](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[pollName] [varchar](100) NULL,
	[pollDateStart] [datetime] NULL,
	[pollDateEnd] [datetime] NULL,
	[pollOrg] [numeric](18, 0) NULL,
	[pollDateCreated] [datetime] NULL,
	[pollStatus] [bit] NULL,
	[pollDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_pollsID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[userFirstName] [varchar](100) NULL,
	[userMiddleName] [varchar](100) NULL,
	[userLastName] [varchar](100) NULL,
	[userStudentNo] [varchar](100) NULL,
	[userPassword] [varchar](100) NULL,
	[userEmail] [varchar](100) NULL,
	[userType] [varchar](100) NULL,
	[userOrg] [numeric](18, 0) NULL,
	[userCourse] [numeric](18, 0) NULL,
	[userDateCreated] [datetime] NULL,
	[userStatus] [bit] NULL,
 CONSTRAINT [PK_userID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_candidateID] [numeric](18, 0) NULL,
	[vote_electionID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_candidateID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_contestant](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_contestantID] [numeric](18, 0) NULL,
	[vote_contestID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_contestID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 12/17/2020 10:01:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_option](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_optionID] [numeric](18, 0) NULL,
	[vote_pollID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_optionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[r_org] ON 

INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(1 AS Numeric(18, 0)), NULL, CAST(0x0000AC8D00D6912C AS DateTime), 0, N'dp10.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(2 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8D00D7171F AS DateTime), 0, N'dp11.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(3 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8D00D87BB1 AS DateTime), 0, N'avatar_01.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(4 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8D00D8F747 AS DateTime), 0, N'dp12.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(5 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8D00D90EF8 AS DateTime), 0, N'dp.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(6 AS Numeric(18, 0)), N'Public', CAST(0x0000AC8D00DF9BF2 AS DateTime), 0, N'PUPLogo1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(7 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8D00E09D79 AS DateTime), 0, N'dp7.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(8 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000AC8D00E25AF5 AS DateTime), 0, N'COMMITS.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(9 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000AC8D00E29DA5 AS DateTime), 0, N'COMMITS1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(10 AS Numeric(18, 0)), N'test', CAST(0x0000AC8D00E70690 AS DateTime), 0, N'dp8.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(11 AS Numeric(18, 0)), N'test', CAST(0x0000AC8D00E71CE4 AS DateTime), 0, N'PUPLogo2.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(12 AS Numeric(18, 0)), N'test2', CAST(0x0000AC8D00E72505 AS DateTime), 0, N'dp9.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(13 AS Numeric(18, 0)), N'JMSs', CAST(0x0000AC8D00EF26D4 AS DateTime), 0, N'COMMITS3.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(14 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000AC8E009629D9 AS DateTime), 0, N'11942076_1674469006101558_3534662844221263438_o_(1).jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(15 AS Numeric(18, 0)), N'JMS', CAST(0x0000AC8E009660D7 AS DateTime), 0, N'jms.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(16 AS Numeric(18, 0)), N'FBTO', CAST(0x0000AC8E00968E14 AS DateTime), 0, N'fbto.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(17 AS Numeric(18, 0)), N'DOMT', CAST(0x0000AC8E0096C71C AS DateTime), 0, N'DOMT.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(18 AS Numeric(18, 0)), N'CHRS', CAST(0x0000AC8E0096EE30 AS DateTime), 0, N'CHRS.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(19 AS Numeric(18, 0)), N'YES', CAST(0x0000AC8E00971D6D AS DateTime), 0, N'yes.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(20 AS Numeric(18, 0)), N'PRIVATE', CAST(0x0000AC8E00986FC3 AS DateTime), 0, N'PUPLogo2.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(21 AS Numeric(18, 0)), N'PUBLIC', CAST(0x0000AC8E00987E02 AS DateTime), 0, N'PUPLogo1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(22 AS Numeric(18, 0)), N'TEST', CAST(0x0000AC8E009EB7F6 AS DateTime), 0, N'dp.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(23 AS Numeric(18, 0)), N'TEST', CAST(0x0000AC8F00BF26E8 AS DateTime), 0, N'PUPLogo3.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(24 AS Numeric(18, 0)), N'PUBLIC', CAST(0x0000AC9000FFEB04 AS DateTime), 1, N'PUPLogo4.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(25 AS Numeric(18, 0)), N'PRIVATE', CAST(0x0000AC9000FFF571 AS DateTime), 1, N'PUPLogo5.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(26 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000AC9000FFFD86 AS DateTime), 1, N'11942076_1674469006101558_3534662844221263438_o4.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(27 AS Numeric(18, 0)), N'JMS', CAST(0x0000AC9001000A78 AS DateTime), 1, N'jms1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(28 AS Numeric(18, 0)), N'CHRS', CAST(0x0000AC9001001454 AS DateTime), 1, N'CHRS1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(29 AS Numeric(18, 0)), N'FBTO', CAST(0x0000AC90010025E5 AS DateTime), 1, N'fbto1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(30 AS Numeric(18, 0)), N'DOMT', CAST(0x0000AC9001002F0A AS DateTime), 1, N'DOMT1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(31 AS Numeric(18, 0)), N'YES', CAST(0x0000AC9001003A06 AS DateTime), 1, N'yes1.jpg')
SET IDENTITY_INSERT [dbo].[r_org] OFF
SET IDENTITY_INSERT [dbo].[t_candidate] ON 

INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(0x0000AC90010D149B AS DateTime), 1, N'President', N'John Raven Glomar', N'Age: 21
Skills: Prog', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(0x0000AC90010D15BA AS DateTime), 1, N'President', N'John Raven Glomar', N'Age: 21
Skills: Prog', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(0x0000AC90010D601E AS DateTime), 1, N'President', N'John Raven Glomar', N'Skills: Prog
Age: 21', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(0x0000AC90010D9A15 AS DateTime), 1, N'President', N'John Raven Glomar', N'Skills: Prog', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC90011F5F47 AS DateTime), 1, N'President', N'John Raven Glomar', N's', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(110 AS Numeric(18, 0)), CAST(0x0000AC9101059040 AS DateTime), 1, N'President', N'TEST', N'asd', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300AEF17F AS DateTime), 0, N'asd', N'Test', N'asd', N'psuccesslogo.png')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300B366DF AS DateTime), 0, N'Cleaners', N'John Raven Glomar', N'sad', N'avatar_012.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300B424FE AS DateTime), 1, N'Dev', N'John Raven Glomar', N'Test', N'avatar_013.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300B48000 AS DateTime), 1, N'Taga hugas ng platos', N'John Raven Glomar', N'Test', N'avatar_0110.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300B4C7D4 AS DateTime), 0, N'Taga hugas ng plato', N'John Raven Glomar', N'asd', N'avatar_015.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300B4F345 AS DateTime), 0, N'Taga hugas ng plato', N'John Raven Glomar', N'asd', N'avatar_016.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300CAE10B AS DateTime), 0, N'Taga luto hahaha', N'Erica Cantos', N'test', N'avatar_02.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9300CB7F9C AS DateTime), 0, N'Taga luto hahaha', N'Erica Cantos', N'asd', N'avatar_021.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(97 AS Numeric(18, 0)), CAST(0x0000AC94009238DE AS DateTime), 1, N'Taga hugas ng plato', N'John Raven Glomar', N'asd', N'avatar_0112.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(103 AS Numeric(18, 0)), CAST(0x0000AC9400994A3E AS DateTime), 1, N'avsd', N'asd', N'avsdvasdasv
avsdasvdasv', N'avatar_022.jpg')
SET IDENTITY_INSERT [dbo].[t_candidate] OFF
SET IDENTITY_INSERT [dbo].[t_contest] ON 

INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'Pagalingan sumayaw', CAST(0x0000AC9400000000 AS DateTime), CAST(0x0000ACA1018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC8100F59FCD AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'asd', CAST(0x0000ACA200000000 AS DateTime), CAST(0x0000AC8C00000000 AS DateTime), NULL, CAST(0x0000AC8100F927A4 AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(3 AS Numeric(18, 0)), N'asd', CAST(0x0000ACA200000000 AS DateTime), CAST(0x0000AC8C00000000 AS DateTime), NULL, CAST(0x0000AC8100F948B4 AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'Test Contest 1', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8600000000 AS DateTime), NULL, CAST(0x0000AC81016249A4 AS DateTime), 1, N'This is test contest 1')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(5 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8200A35143 AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(6 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8200A354BA AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(7 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8200A418D2 AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(8 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8200A427E1 AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(9 AS Numeric(18, 0)), N'Test Contest2', CAST(0x0000AC8200000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8200C9ECCB AS DateTime), 1, N'Test contest2')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(10 AS Numeric(18, 0)), N'Test Contest3', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CA330B AS DateTime), 1, N'Test contest3')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(11 AS Numeric(18, 0)), N'Test Contest4', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CAFA76 AS DateTime), 1, N'Test Contest4')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(12 AS Numeric(18, 0)), N'Test Contest4', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CB980F AS DateTime), 1, N'Test Contest 4')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(13 AS Numeric(18, 0)), N'Test Contest4', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CBE773 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(14 AS Numeric(18, 0)), N'Test Contest4', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CC067B AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(15 AS Numeric(18, 0)), N'Test Contest4', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CC11AC AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(16 AS Numeric(18, 0)), N'Test Contest4', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CC11AC AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(17 AS Numeric(18, 0)), N'Test Contest5', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CC1E3E AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(18 AS Numeric(18, 0)), N'Test Contest6', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CC31E6 AS DateTime), 1, N'asdascd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(19 AS Numeric(18, 0)), N'Test Contest7', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CC4DF2 AS DateTime), 1, N'asd7')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(20 AS Numeric(18, 0)), N'Test Contest9', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CC78FB AS DateTime), 1, N'asdc')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(21 AS Numeric(18, 0)), N'Test Contest10', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CCDBA4 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(22 AS Numeric(18, 0)), N'Test Contest10', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CCDBA4 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(23 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CD9ED1 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(24 AS Numeric(18, 0)), N'asd11', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CDEC80 AS DateTime), 1, N'asd11')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(25 AS Numeric(18, 0)), N'asd12', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CE0933 AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(26 AS Numeric(18, 0)), N'asd12', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CE0B1F AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(27 AS Numeric(18, 0)), N'asd12', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CE0BFF AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(28 AS Numeric(18, 0)), N'asd12', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CE170B AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(29 AS Numeric(18, 0)), N'Test Contest4', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CEC7B7 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(30 AS Numeric(18, 0)), N'asdasdas', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200CEF93E AS DateTime), 1, N'asdasdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(31 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D02371 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(32 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D047B8 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(33 AS Numeric(18, 0)), N'v123', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D09EE7 AS DateTime), 1, N'v123')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(34 AS Numeric(18, 0)), N'v123', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D0F1F4 AS DateTime), 1, N'v123')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(35 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D212F7 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(36 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D25B8F AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(37 AS Numeric(18, 0)), N'ba', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D26833 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(38 AS Numeric(18, 0)), N'test 123', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D2DC08 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(39 AS Numeric(18, 0)), N'test 123', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D2DC08 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(40 AS Numeric(18, 0)), N'asd123v', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D333B3 AS DateTime), 1, N'asd123v')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(41 AS Numeric(18, 0)), N'test loading', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D34690 AS DateTime), 1, N'test loading')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(42 AS Numeric(18, 0)), N'new contest', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D85FBF AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(43 AS Numeric(18, 0)), N'v2 new contest', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8200D9187B AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(44 AS Numeric(18, 0)), N'Test Contest123', CAST(0x0000AC8300000000 AS DateTime), CAST(0x0000AC8500000000 AS DateTime), NULL, CAST(0x0000AC8300FDA700 AS DateTime), 1, N'asdv123')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(45 AS Numeric(18, 0)), N'Test', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC840108FFDD AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(46 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8F00000000 AS DateTime), CAST(0x0000AC90018B80D4 AS DateTime), NULL, CAST(0x0000AC8F00BF0815 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(47 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8F00000000 AS DateTime), CAST(0x0000AC90018B80D4 AS DateTime), NULL, CAST(0x0000AC8F00CBE19C AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(48 AS Numeric(18, 0)), N' zxc', CAST(0x0000AC8F00000000 AS DateTime), CAST(0x0000AC92018B80D4 AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(0x0000AC8F00CBEBFC AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(49 AS Numeric(18, 0)), N'Test public', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC900101B4F3 AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(50 AS Numeric(18, 0)), N'test', CAST(0x0000AC9100000000 AS DateTime), CAST(0x0000AC92018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC91010C004F AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(51 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9100000000 AS DateTime), CAST(0x0000AC92018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC91010D054D AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(52 AS Numeric(18, 0)), N'test', CAST(0x0000AC9400000000 AS DateTime), CAST(0x0000AC95018B80D4 AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(0x0000AC94009C04C1 AS DateTime), 1, N'asd')
SET IDENTITY_INSERT [dbo].[t_contest] OFF
SET IDENTITY_INSERT [dbo].[t_contestant] ON 

INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), N'test', N'test', 1, NULL, NULL, NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), N'test', N'asd', 1, NULL, NULL, NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), N'asd', N'asd', 1, NULL, N'11942076_1674469006101558_3534662844221263438_o27.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), N'Test', N'asd', 1, NULL, N'11942076_1674469006101558_3534662844221263438_o28.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), N'asd', N'asd', 1, NULL, N'11942076_1674469006101558_3534662844221263438_o29.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), N'asd', N'asd', 1, CAST(51 AS Numeric(18, 0)), N'11942076_1674469006101558_3534662844221263438_o210.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), N'asd', N'asd', 1, CAST(51 AS Numeric(18, 0)), N'11942076_1674469006101558_3534662844221263438_o211.jpg', CAST(0x0000AC91010EAB60 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), N'asd', N'asd', 1, CAST(1 AS Numeric(18, 0)), N'avatar_0115.jpg', CAST(0x0000AC94009793B7 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), N'asds', N'ascdasdvas
avsdasvdas
asvdasvdas
avsdasvdasvdasdva
asvdasvdasvdasvdasv a sdas das
avsdav', 1, CAST(1 AS Numeric(18, 0)), N'avatar_0117.jpg', CAST(0x0000AC9400981581 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_contestant] OFF
SET IDENTITY_INSERT [dbo].[t_election] ON 

INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(2 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(3 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(4 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(5 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(6 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(7 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(8 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(9 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(10 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(11 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(12 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(14 AS Numeric(18, 0)), N'qwe', CAST(0x0000AC7E00000000 AS DateTime), CAST(0x0000AC7F00000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(15 AS Numeric(18, 0)), N'qweqwe', CAST(0x0000AC7E00000000 AS DateTime), CAST(0x0000AC7F00000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(16 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(17 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(18 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(19 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(20 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(21 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(22 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(23 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(24 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(25 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(26 AS Numeric(18, 0)), N'qwe123231', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(27 AS Numeric(18, 0)), N'123123123asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(28 AS Numeric(18, 0)), N'12313sd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(29 AS Numeric(18, 0)), N'asdasdsad', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(30 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(31 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(32 AS Numeric(18, 0)), N'test26-01', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(33 AS Numeric(18, 0)), N'test26-02', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00AC1781 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(34 AS Numeric(18, 0)), N'DOMT Election', CAST(0x0000AC9D00000000 AS DateTime), CAST(0x0000ACA1018B80D4 AS DateTime), CAST(26 AS Numeric(18, 0)), CAST(0x0000AC7F00BAE076 AS DateTime), 1, N's')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(35 AS Numeric(18, 0)), N'test-26-042', CAST(0x0000AC9D00000000 AS DateTime), CAST(0x0000ACA100000000 AS DateTime), NULL, CAST(0x0000AC7F00BAEABE AS DateTime), 0, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(36 AS Numeric(18, 0)), N'qwe', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC302E AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(37 AS Numeric(18, 0)), N'qwesd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC60FE AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(38 AS Numeric(18, 0)), N'qwesd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC64B3 AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(39 AS Numeric(18, 0)), N'qwe', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC97B4 AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(40 AS Numeric(18, 0)), N'qwec', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BCF4A2 AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(41 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8100E99639 AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(42 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F09566 AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(43 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8100F09A13 AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(44 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F0A6FB AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(45 AS Numeric(18, 0)), N'PSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F0B889 AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(46 AS Numeric(18, 0)), N'COMMITS Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8E00000000 AS DateTime), NULL, CAST(0x0000AC8100F12532 AS DateTime), 1, N'This is COMMITS Election')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(47 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8B00000000 AS DateTime), NULL, CAST(0x0000AC81010AC4A9 AS DateTime), 1, N'This is for SSC Election
Please vote wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(48 AS Numeric(18, 0)), N'PSC Election', CAST(0x0000AC8300000000 AS DateTime), CAST(0x0000AC8500000000 AS DateTime), NULL, CAST(0x0000AC8301870584 AS DateTime), 1, N'qews')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(49 AS Numeric(18, 0)), N'JMS Electionqwe', CAST(0x0000AC8400000000 AS DateTime), CAST(0x0000AC8900000000 AS DateTime), NULL, CAST(0x0000AC84000661BF AS DateTime), 0, N'This is jms election')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(50 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC86009ECC37 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(51 AS Numeric(18, 0)), N'test123', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC86009F2831 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(52 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC86009F9E3D AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(53 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC86009FD009 AS DateTime), 0, N'asdv')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(54 AS Numeric(18, 0)), N'dasd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC86009FF969 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(55 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A01866 AS DateTime), 0, N'savd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(56 AS Numeric(18, 0)), N'avsd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A025E5 AS DateTime), 0, N'avsd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(57 AS Numeric(18, 0)), N'asvd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A0322F AS DateTime), 0, N'avsd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(58 AS Numeric(18, 0)), N'avsd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A098B6 AS DateTime), 0, N'asvd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(59 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A0ACFB AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(60 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A0C156 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(61 AS Numeric(18, 0)), N'asdasd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A0C4FC AS DateTime), 0, N'asdasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(62 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A11C47 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(63 AS Numeric(18, 0)), N'asdv', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A1D101 AS DateTime), 0, N'asvd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(64 AS Numeric(18, 0)), N'123', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600A1E3DD AS DateTime), 0, N'123')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(65 AS Numeric(18, 0)), N'Test', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600D9237B AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(66 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600DC1197 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(67 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600E13BE0 AS DateTime), 0, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(68 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600E14725 AS DateTime), 0, N'vs')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(69 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC8600E16C65 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(70 AS Numeric(18, 0)), N'', CAST(0x0000AC8B00000000 AS DateTime), CAST(0x0000AC9400000000 AS DateTime), NULL, CAST(0x0000AC8600E17CD6 AS DateTime), 0, N'asdascd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(71 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC8F00000000 AS DateTime), NULL, CAST(0x0000AC8700A77278 AS DateTime), 1, N'This election is for ssc election. Please vote wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(72 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC8F00000000 AS DateTime), NULL, CAST(0x0000AC8700A78905 AS DateTime), 1, N'ASD')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(73 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC8E00000000 AS DateTime), NULL, CAST(0x0000AC8700AE8873 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(74 AS Numeric(18, 0)), N'', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC9B00000000 AS DateTime), NULL, CAST(0x0000AC8700B00EF5 AS DateTime), 0, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(75 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8700B01743 AS DateTime), 1, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(76 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC8700000000 AS DateTime), NULL, CAST(0x0000AC8700BFF1B1 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(77 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC88018B80D4 AS DateTime), NULL, CAST(0x0000AC8700C0C821 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(80 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8700C21362 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(81 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8700C21A2B AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(84 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC8800000000 AS DateTime), NULL, CAST(0x0000AC8700D5783A AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(85 AS Numeric(18, 0)), N'asda', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC8800000000 AS DateTime), NULL, CAST(0x0000AC8700D5B22E AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(86 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8700D5B5F8 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(87 AS Numeric(18, 0)), N'BBTE Election', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC8F018B80D4 AS DateTime), NULL, CAST(0x0000AC8700D5CED2 AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(88 AS Numeric(18, 0)), N'Test', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC87018B80D4 AS DateTime), NULL, CAST(0x0000AC8700D7F452 AS DateTime), 1, N'qwe')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(89 AS Numeric(18, 0)), N'', CAST(0x0000000000000000 AS DateTime), CAST(0x000063E000107994 AS DateTime), NULL, CAST(0x0000AC8701136D93 AS DateTime), 1, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(90 AS Numeric(18, 0)), N'asd', CAST(0x0000000000000000 AS DateTime), CAST(0x000063E000107994 AS DateTime), NULL, CAST(0x0000AC8701137CB4 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(91 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC88018B80D4 AS DateTime), NULL, CAST(0x0000AC870113853F AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(92 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC87018B80D4 AS DateTime), NULL, CAST(0x0000AC870114E951 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(93 AS Numeric(18, 0)), N'asdas213', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC88018B80D4 AS DateTime), NULL, CAST(0x0000AC870114FC4E AS DateTime), 1, N'asdasdsad')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(94 AS Numeric(18, 0)), N'asdtest', CAST(0x0000AC8500000000 AS DateTime), CAST(0x0000AC86018B80D4 AS DateTime), NULL, CAST(0x0000AC8701152ED9 AS DateTime), 1, N'asdtest')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(95 AS Numeric(18, 0)), N'qcwe', CAST(0x0000AC8700000000 AS DateTime), CAST(0x0000AC88018B80D4 AS DateTime), NULL, CAST(0x0000AC87011AD89E AS DateTime), 1, N'cqwe')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(96 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8F00000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(30 AS Numeric(18, 0)), CAST(0x0000AC8F00BEFBE5 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(97 AS Numeric(18, 0)), N'sad', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC95018B80D4 AS DateTime), CAST(30 AS Numeric(18, 0)), CAST(0x0000AC8F00C1134A AS DateTime), 1, N'dasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(98 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(27 AS Numeric(18, 0)), CAST(0x0000AC8F00C151D8 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(99 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8F00000000 AS DateTime), CAST(0x0000AC90018B80D4 AS DateTime), NULL, CAST(0x0000AC8F00C8289A AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(100 AS Numeric(18, 0)), N'asd', CAST(0x0000AC8F00000000 AS DateTime), CAST(0x0000AC90018B80D4 AS DateTime), NULL, CAST(0x0000AC8F00CA6C7C AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(101 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(28 AS Numeric(18, 0)), CAST(0x0000AC8F00CFA570 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(102 AS Numeric(18, 0)), N'Test', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(14 AS Numeric(18, 0)), CAST(0x0000AC9000FFB8D6 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(103 AS Numeric(18, 0)), N'Test Election', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC94018B80D4 AS DateTime), CAST(26 AS Numeric(18, 0)), CAST(0x0000AC9001104FEF AS DateTime), 1, N'Please vote wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(104 AS Numeric(18, 0)), N'Test Election', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC90011068E6 AS DateTime), 1, N'')
GO
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(105 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC900110A9CC AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(106 AS Numeric(18, 0)), N'zxc', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC90011145FD AS DateTime), 1, N'zxc')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(107 AS Numeric(18, 0)), N'asd2', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC900111E467 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(108 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(26 AS Numeric(18, 0)), CAST(0x0000AC9001120D4E AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(109 AS Numeric(18, 0)), N'asdxzc', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(28 AS Numeric(18, 0)), CAST(0x0000AC9001121729 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(110 AS Numeric(18, 0)), N'This is election name', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(0x0000AC900113A3A9 AS DateTime), 1, N'This is decsription')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(111 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(0x0000AC900114B1D4 AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(112 AS Numeric(18, 0)), N'new', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), NULL, CAST(0x0000AC900114BDA5 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(113 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), NULL, CAST(0x0000AC900114DF7B AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(114 AS Numeric(18, 0)), N'new', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), NULL, CAST(0x0000AC900114EC73 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(115 AS Numeric(18, 0)), N'new', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), NULL, CAST(0x0000AC900114FE88 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(116 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC90011675C7 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(117 AS Numeric(18, 0)), N'new test election name', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC90011706F1 AS DateTime), 0, N'description')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(118 AS Numeric(18, 0)), N'New Election123', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC900119587A AS DateTime), 0, N'asd')
SET IDENTITY_INSERT [dbo].[t_election] OFF
SET IDENTITY_INSERT [dbo].[t_option] ON 

INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'asd', CAST(0x0000AC910111F50B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'You should asdfasdfsdas', CAST(0x0000AC94009ECECE AS DateTime), 0)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'asds', CAST(0x0000AC94009F1486 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'asdss', CAST(0x0000AC94009FDD08 AS DateTime), 0)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9400A3A1C9 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9400A3A93C AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'sd', CAST(0x0000AC9400A3AD08 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[t_option] OFF
SET IDENTITY_INSERT [dbo].[t_poll] ON 

INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'This is poll voting', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8500000000 AS DateTime), NULL, CAST(0x0000AC8100F2A49B AS DateTime), 1, N'asd')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'This is poll voting v2', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8D00000000 AS DateTime), NULL, CAST(0x0000AC8100F2E4F1 AS DateTime), 1, N'Rqwqwe')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(3 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8100F2FBD5 AS DateTime), 1, NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'This is poll voting v3', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F32B65 AS DateTime), 1, N'qweqwe')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(5 AS Numeric(18, 0)), N' sad', CAST(0x0000AC8F00000000 AS DateTime), CAST(0x0000AC92018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC8F00BF180C AS DateTime), 1, N'sad')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(6 AS Numeric(18, 0)), N'Test private', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(0x0000AC900101C154 AS DateTime), 1, N'asd')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(7 AS Numeric(18, 0)), N'asd', CAST(0x0000AC9000000000 AS DateTime), CAST(0x0000AC91018B80D4 AS DateTime), CAST(31 AS Numeric(18, 0)), CAST(0x0000AC900101C7B7 AS DateTime), 1, N'asd')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(8 AS Numeric(18, 0)), N'This is poll voting', CAST(0x0000AC9400000000 AS DateTime), CAST(0x0000AC95018B80D4 AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(0x0000AC94009E3747 AS DateTime), 1, N'asd')
SET IDENTITY_INSERT [dbo].[t_poll] OFF
SET IDENTITY_INSERT [dbo].[t_user] ON 

INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(1 AS Numeric(18, 0)), N'jet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[t_user] OFF
ALTER TABLE [dbo].[r_course] ADD  CONSTRAINT [DF_Course]  DEFAULT (getdate()) FOR [courseDateCreated]
GO
ALTER TABLE [dbo].[r_course] ADD  DEFAULT ((1)) FOR [courseStatus]
GO
ALTER TABLE [dbo].[r_org] ADD  CONSTRAINT [DF_Org]  DEFAULT (getdate()) FOR [orgDateCreated]
GO
ALTER TABLE [dbo].[r_org] ADD  DEFAULT ((1)) FOR [orgStatus]
GO
ALTER TABLE [dbo].[t_candidate] ADD  CONSTRAINT [DF_Candidate]  DEFAULT (getdate()) FOR [candidateDateCreated]
GO
ALTER TABLE [dbo].[t_candidate] ADD  DEFAULT ((1)) FOR [candidateStatus]
GO
ALTER TABLE [dbo].[t_contest] ADD  CONSTRAINT [DF_Contest]  DEFAULT (getdate()) FOR [contestDateCreated]
GO
ALTER TABLE [dbo].[t_contest] ADD  DEFAULT ((1)) FOR [contestStatus]
GO
ALTER TABLE [dbo].[t_contestant] ADD  DEFAULT ((1)) FOR [contestantStatus]
GO
ALTER TABLE [dbo].[t_contestant] ADD  DEFAULT (getdate()) FOR [contestantDateCreated]
GO
ALTER TABLE [dbo].[t_election] ADD  CONSTRAINT [DF_Election]  DEFAULT (getdate()) FOR [electionDateCreated]
GO
ALTER TABLE [dbo].[t_election] ADD  DEFAULT ((1)) FOR [electionStatus]
GO
ALTER TABLE [dbo].[t_option] ADD  CONSTRAINT [DF_Option]  DEFAULT (getdate()) FOR [optionDateCreated]
GO
ALTER TABLE [dbo].[t_option] ADD  DEFAULT ((1)) FOR [optionStatus]
GO
ALTER TABLE [dbo].[t_poll] ADD  CONSTRAINT [DF_Poll]  DEFAULT (getdate()) FOR [pollDateCreated]
GO
ALTER TABLE [dbo].[t_poll] ADD  DEFAULT ((1)) FOR [pollStatus]
GO
ALTER TABLE [dbo].[t_user] ADD  CONSTRAINT [DF_User]  DEFAULT (getdate()) FOR [userDateCreated]
GO
ALTER TABLE [dbo].[t_user] ADD  DEFAULT ((1)) FOR [userStatus]
GO
ALTER TABLE [dbo].[t_vote_candidate] ADD  CONSTRAINT [DF_VoteCandidate]  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_vote_option] ADD  CONSTRAINT [DF_VoteOption]  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_candidate]  WITH CHECK ADD  CONSTRAINT [FK_candidate_electionID] FOREIGN KEY([candidateElectionID])
REFERENCES [dbo].[t_election] ([id])
GO
ALTER TABLE [dbo].[t_candidate] CHECK CONSTRAINT [FK_candidate_electionID]
GO
ALTER TABLE [dbo].[t_contest]  WITH CHECK ADD  CONSTRAINT [FK_contest_orgID] FOREIGN KEY([contestOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_contest] CHECK CONSTRAINT [FK_contest_orgID]
GO
ALTER TABLE [dbo].[t_contestant]  WITH CHECK ADD  CONSTRAINT [FK_contestant_contestID] FOREIGN KEY([contestantContestID])
REFERENCES [dbo].[t_contest] ([id])
GO
ALTER TABLE [dbo].[t_contestant] CHECK CONSTRAINT [FK_contestant_contestID]
GO
ALTER TABLE [dbo].[t_election]  WITH CHECK ADD  CONSTRAINT [FK_election_orgID] FOREIGN KEY([electionOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_election] CHECK CONSTRAINT [FK_election_orgID]
GO
ALTER TABLE [dbo].[t_option]  WITH CHECK ADD  CONSTRAINT [FK_option_electionID] FOREIGN KEY([optionPollID])
REFERENCES [dbo].[t_poll] ([id])
GO
ALTER TABLE [dbo].[t_option] CHECK CONSTRAINT [FK_option_electionID]
GO
ALTER TABLE [dbo].[t_poll]  WITH CHECK ADD  CONSTRAINT [FK_poll_orgID] FOREIGN KEY([pollOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_poll] CHECK CONSTRAINT [FK_poll_orgID]
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_user_courseID] FOREIGN KEY([userCourse])
REFERENCES [dbo].[r_course] ([id])
GO
ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_user_courseID]
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_user_orgsID] FOREIGN KEY([userOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_user_orgsID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_candidateID] FOREIGN KEY([vote_candidateID])
REFERENCES [dbo].[t_candidate] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_candidateID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_electionID] FOREIGN KEY([vote_electionID])
REFERENCES [dbo].[t_election] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_electionID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_userID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_constestantID] FOREIGN KEY([vote_contestantID])
REFERENCES [dbo].[t_contestant] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_constestantID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_contestID] FOREIGN KEY([vote_contestID])
REFERENCES [dbo].[t_contest] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_contestID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_userID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_candidateID] FOREIGN KEY([vote_optionID])
REFERENCES [dbo].[t_option] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_candidateID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_electionID] FOREIGN KEY([vote_pollID])
REFERENCES [dbo].[t_poll] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_electionID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_userID]
GO

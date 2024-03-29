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
ALTER TABLE [dbo].[t_vote_contestant] DROP CONSTRAINT [DF__t_vote_co__conte__37A5467C]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [DF_VoteCandidate]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF__t_user__userStat__35BCFE0A]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF_User]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF_userType]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF__t_poll__pollStat__33D4B598]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF_Poll]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF__t_option__option__31EC6D26]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF_Option]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF__t_electio__elect__300424B4]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF_Election]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [DF__t_contest__conte__2E1BDC42]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [DF__t_contest__conte__2D27B809]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF__t_contest__conte__2C3393D0]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF_Contest]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF__t_candida__candi__2A4B4B5E]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF_Candidate]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF__r_org__orgStatus__286302EC]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF_Org]
GO
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_vote_option]
GO
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_vote_contestant]
GO
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_vote_candidate]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_user]
GO
/****** Object:  Table [dbo].[t_poll]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_poll]
GO
/****** Object:  Table [dbo].[t_option]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_option]
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_election]
GO
/****** Object:  Table [dbo].[t_contestant]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_contestant]
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_contest]
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[t_candidate]
GO
/****** Object:  Table [dbo].[r_org]    Script Date: 1/21/2021 12:12:03 PM ******/
DROP TABLE [dbo].[r_org]
GO
/****** Object:  Table [dbo].[r_org]    Script Date: 1/21/2021 12:12:03 PM ******/
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
/****** Object:  Table [dbo].[t_candidate]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_contest]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_contestant]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_election]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_option]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_poll]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_user]    Script Date: 1/21/2021 12:12:04 PM ******/
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
	[userCourse] [varchar](255) NULL,
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
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 1/21/2021 12:12:04 PM ******/
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
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 1/21/2021 12:12:04 PM ******/
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

INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(1 AS Numeric(18, 0)), N'PUBLIC', CAST(0x0000ACA700E9E4C1 AS DateTime), 1, N'PUPLogo22.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(2 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000ACA700EA046B AS DateTime), 1, N'11942076_1674469006101558_3534662844221263438_o6.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(3 AS Numeric(18, 0)), N'YES', CAST(0x0000ACA700EA19D4 AS DateTime), 1, N'yes2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(4 AS Numeric(18, 0)), N'YES', CAST(0x0000ACA700EA19F0 AS DateTime), 0, N'yes3.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(5 AS Numeric(18, 0)), N'CHRS', CAST(0x0000ACA700EA50B3 AS DateTime), 1, N'CHRS2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(6 AS Numeric(18, 0)), N'CHRS', CAST(0x0000ACA700EA50D2 AS DateTime), 0, N'CHRS3.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(7 AS Numeric(18, 0)), N'JMS', CAST(0x0000ACA700EA6522 AS DateTime), 1, N'jms2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(8 AS Numeric(18, 0)), N'DOMT', CAST(0x0000ACA700EA7EE4 AS DateTime), 1, N'DOMT2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(9 AS Numeric(18, 0)), N'FBTO', CAST(0x0000ACA700EA8FD0 AS DateTime), 1, N'fbto1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(10 AS Numeric(18, 0)), N'PRIVATE', CAST(0x0000ACA700EAAF85 AS DateTime), 1, N'PUPLogo21.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(11 AS Numeric(18, 0)), N'TEST Org', CAST(0x0000ACB1016526A4 AS DateTime), 0, N'4448.jpg')
SET IDENTITY_INSERT [dbo].[r_org] OFF
SET IDENTITY_INSERT [dbo].[t_candidate] ON 

INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EDE4ED AS DateTime), 1, N'President', N'Arvin John Carino', N'AGE:21
BIRTHDATE: MARCH 03, 1999
MOTTO: TIME IS GOLD', N'12196195_1199439253404253_8781946651624041247_n2.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EE1E09 AS DateTime), 1, N'Developer', N'John Raven Glomar', N'AGE: 21
MOTTO: JUST DO IT', N'avatar_0120.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700EE75C7 AS DateTime), 1, N'QA', N'Joshua Pugoy', N'AGE:21
MOTTO: DASAL LANG', N'129157035_1075137792910609_3363601868927077009_o21.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EE9E1C AS DateTime), 1, N'QA', N'Joshua Pugoy', N'AGE:21
MOTTO: DASAL LANG', N'129157035_1075137792910609_3363601868927077009_o22.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EF0597 AS DateTime), 1, N'Vice President', N'JETT MAIN', N'AGE: 24
MOTTO: WATCH THIS', N'Valorant-Wallpaper-Boys-Dark-Display3.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700F01061 AS DateTime), 1, N'QA', N'PHEONIX', N'AGE : 24
MOTTO: Jokes over your dead', N'valorant-offwhitelaunch-keyart1.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F0BB1F AS DateTime), 1, N'PRESIDENT', N'RAZE', N'AGE:30
MOTTO: HERE COMES THE PARTY', N'120603301_233871211667769_2890483866310201068_o1.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F0F579 AS DateTime), 1, N'Vice President', N'Breach', N'AGE:31
MOTTO: LETS GO!', N'120605198_233871331667757_4667358385407191493_o1.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F119B5 AS DateTime), 1, N'Secretary', N'Joshua Pugoy', N'Age:21
Motto: DASAL LANG', N'129157035_1075137792910609_3363601868927077009_o3.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F13A10 AS DateTime), 1, N'Auditor', N'John Raven Glomar', N'AGE:21
MOTTO: JUST DO IT', N'avatar_0121.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F1675E AS DateTime), 1, N'QA', N'Arvin John Carino', N'AGE:21
MOTTO: TIME IS GOLD', N'12196195_1199439253404253_8781946651624041247_n3.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F1D67C AS DateTime), 1, N'PRESIDENT', N'Joshua Pugoy', N'AGE:21
MOTTO: DASAL LANG PARA PUMASA
BIRTHDATE: UNKNOWN', N'129157035_1075137792910609_3363601868927077009_o221.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F202E0 AS DateTime), 1, N'Vice President', N'John Raven Glomar', N'AGE:21
MOTTO: JUST DO IT
BIRTHDAY: UNKNOWN', N'avatar_0171.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F25880 AS DateTime), 1, N'Secretary', N'Arvin John Carino', N'AGE:21
MOTTO: TIME IS GOLD WHEN PLAYING VALORANT
BIRTHDATE: UKNOWN
', N'12196195_1199439253404253_8781946651624041247_n4.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F280CB AS DateTime), 1, N'QA', N'JETT', N'AGE :24
MOTTO: WATCH THIS
BIRTHDATE: UKNOWN', N'valorant-offwhitelaunch-keyart2.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F280E6 AS DateTime), 0, N'QA', N'JETT', N'AGE :24
MOTTO: WATCH THIS
BIRTHDATE: UKNOWN', N'valorant-offwhitelaunch-keyart3.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F2E4AA AS DateTime), 1, N'QA', N'RAZE', N'AGE: 24
MOTTO: HERE COMES THE PARTY
BIRTHDATE: UKNOWN', N'120603301_233871211667769_2890483866310201068_o2.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F3770A AS DateTime), 1, N'President', N'John Raven Glomar', N'AGE:21
MOTTO: JUST DO IT
vote wisely', N'avatar_0141.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F3C879 AS DateTime), 1, N'Vice President', N'Joshua Pugoy', N'Vote Wisely
AGE: 21
MOTTO: DASAL LANG PARA PUMASA', N'129157035_1075137792910609_3363601868927077009_o2211.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F41063 AS DateTime), 1, N'QA', N'Arvin John Carino', N'PLEASE VOTE WISELY
Motto: time is gold
age: 21', N'12196195_1199439253404253_8781946651624041247_n5.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F43B61 AS DateTime), 1, N'Secretary', N'RAZE', N'VOTE WISELY
AGE: 23
MOTTO: HERE COMES THE PARTY', N'120603301_233871211667769_2890483866310201068_o3.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F47238 AS DateTime), 1, N'QA', N'Breach', N'Please Vote Wisely
age: 30
motto: LETS GO!
', N'120605198_233871331667757_4667358385407191493_o2.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F4BD46 AS DateTime), 1, N'President', N'John Raven Glomar', N'Must Vote Wisely', N'avatar_0161.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F4D5E6 AS DateTime), 1, N'Vice President', N'Arvin John Carino', N'Please Vote for me', N'12196195_1199439253404253_8781946651624041247_n51.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F50D9F AS DateTime), 1, N'Secretary', N'RAZE', N'Vote Vote Vote for me', N'120603301_233871211667769_2890483866310201068_o4.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F5301A AS DateTime), 1, N'QA', N'Breach', N'VOTE FOR ME PLEASE', N'120605198_233871331667757_4667358385407191493_o3.jpg')
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA70105D3A9 AS DateTime), 0, N'Secretary', N'Joshua Pugoy', N'IT 3-1', N'129157035_1075137792910609_3363601868927077009_e.jpg')
SET IDENTITY_INSERT [dbo].[t_candidate] OFF
SET IDENTITY_INSERT [dbo].[t_contest] ON 

INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'Art Contest', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700FB0DD1 AS DateTime), 1, N'The Art Contest is open to all students of PUP Quezon City Branch.

Please Submit your entries as soon as possible! 

Thank you for participating!')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'Mr. Pogi Contest', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACA700FC6564 AS DateTime), 1, N'This contest is open for IT 3-1 only.

The contest is open for all boys of IT 3-1')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(3 AS Numeric(18, 0)), N'Mr. & Ms. HR 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(5 AS Numeric(18, 0)), CAST(0x0000ACA700FF4834 AS DateTime), 1, N'The search for Mr. & Ms. Human Resource is now open!

First year to Fourth year must have their own candidates! 

')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'Hip - Hop Competition 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA70100DB12 AS DateTime), 1, N'The Hip - Hop Competition is open for students of PUP Quezon City only!

The group must have 5 - 10 members!

*  Cash Prize is waiting! *')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(5 AS Numeric(18, 0)), N'Spoken Word Poetry', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA701027416 AS DateTime), 1, N'The contest is open for every student that are ready to share their poems to everyone.

cc')
SET IDENTITY_INSERT [dbo].[t_contest] OFF
SET IDENTITY_INSERT [dbo].[t_contestant] ON 

INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'IT 3-1
"Ang pag-ibig ay parang tahong"', 1, CAST(5 AS Numeric(18, 0)), N'X1.jpg', CAST(0x0000ACA70108430D AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), N'Arvin Carino', N'IT 3-1', 1, CAST(5 AS Numeric(18, 0)), N'C2.jpg', CAST(0x0000ACA7010B4A85 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), N'Raven Glomar', N'IT 3-1
"Ang bituin ay gabay lamang"', 0, CAST(1 AS Numeric(18, 0)), N'c3.jpg', CAST(0x0000ACA7010CB6E4 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), N'Raven Glomar', N'IT 3-1', 1, CAST(5 AS Numeric(18, 0)), N'c31.jpg', CAST(0x0000ACA7010CD445 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), N'Erica Cantos', N'MM 3-1
"Ang puso at isip ay kasama sa pagmamahal"', 1, CAST(4 AS Numeric(18, 0)), N'c4.jpg', CAST(0x0000ACA7010D21A3 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), N'Erica Cantos', N'MM 2-1', 1, CAST(5 AS Numeric(18, 0)), N'c41.jpg', CAST(0x0000ACA7010D3F44 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), N'Bernard Teja', N'IT 3-1', 1, CAST(5 AS Numeric(18, 0)), N'C5.jpg', CAST(0x0000ACA7010D7292 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'Poging Hiphop dancerist ng IT 3-1!', 1, CAST(4 AS Numeric(18, 0)), N'X2.jpg', CAST(0x0000ACA7010DB6F6 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), N'Raven Glomar', N'Poging Developer at Athlete ng PUP QC', 1, CAST(4 AS Numeric(18, 0)), N'c32.jpg', CAST(0x0000ACA7010DE816 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(10 AS Numeric(18, 0)), N'Arvin and The Squad', N'Poging Developer at Volleyball Player ng PUP QC', 1, CAST(4 AS Numeric(18, 0)), N'M31.jpg', CAST(0x0000ACA7010E0F1C AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(11 AS Numeric(18, 0)), N'JETT', N'Cute na exchange student from Korea!', 1, CAST(4 AS Numeric(18, 0)), N'JETT.jpg', CAST(0x0000ACA7010E84A2 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(12 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'Mr. but he has no Ms. ', 1, CAST(3 AS Numeric(18, 0)), N'M1.jpg', CAST(0x0000ACA7010EDDB9 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(13 AS Numeric(18, 0)), N'Raven Glomar', N'Mr. IT 2018 AND 2019', 1, CAST(3 AS Numeric(18, 0)), N'M2.jpg', CAST(0x0000ACA70110A771 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(14 AS Numeric(18, 0)), N'Arvin Carino', N'Mr. IT 2016', 1, CAST(3 AS Numeric(18, 0)), N'M3.jpg', CAST(0x0000ACA70110E1BA AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(15 AS Numeric(18, 0)), N'Erica Cantos', N'Ms. Marketing 2017, 2018, and 2019', 1, CAST(3 AS Numeric(18, 0)), N'm4.jpg', CAST(0x0000ACA701111DCD AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(16 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'pogi true pa sa legit
single ready to mingle', 1, CAST(2 AS Numeric(18, 0)), N'p1.jpg', CAST(0x0000ACA70111B8E7 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(17 AS Numeric(18, 0)), N'Raven Glomar', N'Developer ng room, Pogi, karapat dapat sa trono.', 1, CAST(2 AS Numeric(18, 0)), N'p2.jpg', CAST(0x0000ACA7011212D4 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(18 AS Numeric(18, 0)), N'Arvin Carino', N'Legit pogi, mayaman kaso taken. ', 1, CAST(2 AS Numeric(18, 0)), N'p3.jpg', CAST(0x0000ACA70112A504 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(19 AS Numeric(18, 0)), N'Bernard Teja', N'Pogi, Bikerist, tsaka Malaki maskels.', 1, CAST(2 AS Numeric(18, 0)), N'p4.jpg', CAST(0x0000ACA70112F8C7 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(20 AS Numeric(18, 0)), N'Breach', N'Legit din pogi kaso madalas manghilo at mambulag', 1, CAST(2 AS Numeric(18, 0)), N'PP4.png', CAST(0x0000ACA701136349 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(21 AS Numeric(18, 0)), N'KILLJOY', N'Made by Mr. Raven Glomar of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'valorant-killjoy-valorant-digital-art-artwork-digital-hd-wallpaper-thumb.jpg', CAST(0x0000ACA70114BDCD AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(22 AS Numeric(18, 0)), N'Damage', N'Made by Mr. Joshua Pugoy of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'Valorant-gets-closed-beta-patch-to-address-community-feedback-3.jpg', CAST(0x0000ACA70114E704 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(23 AS Numeric(18, 0)), N'THE VALORANT', N'Made by Mr. Arvin Carino of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'The_Valorant.jpg', CAST(0x0000ACA701150EFF AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(24 AS Numeric(18, 0)), N'Sage', N'Made by Ms. Erica Cantos of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'Sage.jpg', CAST(0x0000ACA701152F5D AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(25 AS Numeric(18, 0)), N'Sova', N'Made by Mr. Bernard Teja of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'Sova.jpg', CAST(0x0000ACA701154F3D AS DateTime))
SET IDENTITY_INSERT [dbo].[t_contestant] OFF
SET IDENTITY_INSERT [dbo].[t_election] ON 

INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'JMS ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACA700EB437A AS DateTime), 1, N'This Election is for JMS Election
Please Vote Wisely!')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'SSC ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700EB914B AS DateTime), 1, N'This Election is for the student who can be a great example')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(3 AS Numeric(18, 0)), N'FBTO ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACA700EC5929 AS DateTime), 1, N'This Election is for FBTO
To find a FBTO Student
who can lead')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'CHRS ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(5 AS Numeric(18, 0)), CAST(0x0000ACA700ED356A AS DateTime), 1, N'To find student who can lead CHRS Organization')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(5 AS Numeric(18, 0)), N'SSC', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACAA018B80D4 AS DateTime), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700ED40F4 AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(6 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700ED8146 AS DateTime), 1, N'FINDING STUDENT TO BE THE REPRESENTATIVE OF COMMITS')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(7 AS Numeric(18, 0)), N'TEST ELECTION', CAST(0x0000ACAB00000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAB01095572 AS DateTime), 0, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(8 AS Numeric(18, 0)), N'TEST', CAST(0x0000ACAB00000000 AS DateTime), CAST(0x0000ACAC018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAB01096FF8 AS DateTime), 0, N'ASD')
SET IDENTITY_INSERT [dbo].[t_election] OFF
SET IDENTITY_INSERT [dbo].[t_option] ON 

INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Joshua Pugoy', CAST(0x0000ACA7011C24EC AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Erica Cantos', CAST(0x0000ACA7011C311E AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Joylyn Castor', CAST(0x0000ACA7011C3AD9 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Bernard Teja', CAST(0x0000ACA7011C43A2 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Christine', CAST(0x0000ACA7011C628B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'KOPIKO 3in1', CAST(0x0000ACA7011D5B32 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'KOPIKO BLACK', CAST(0x0000ACA7011D64BF AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Nescafe 3in1', CAST(0x0000ACA7011D720B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Great Taste White', CAST(0x0000ACA7011D89E0 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'PUP PYLON', CAST(0x0000ACA7011DF4BB AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'PUP CANTEEN', CAST(0x0000ACA7011E019D AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'STUDENTS LOUNGE', CAST(0x0000ACA7011E0F7B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'MISE', CAST(0x0000ACA7011E15F4 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'CHAPEL', CAST(0x0000ACA7011E1D48 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 19, 2021', CAST(0x0000ACA7011ED17B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 18, 2021', CAST(0x0000ACA7011EEA85 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 17, 2021', CAST(0x0000ACA7011EFA94 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 16, 2021', CAST(0x0000ACA7011F0570 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 15, 2021', CAST(0x0000ACA7011F13CC AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[t_option] OFF
SET IDENTITY_INSERT [dbo].[t_poll] ON 

INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'Cutest PUP QC student 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA70115CC29 AS DateTime), 1, N'PUP QUEZON CITY STUDENTS ARE WELCOME TO JOIN. AS LONG AS YOU ARE CONFIDENT AND YOU THINK THAT YOU ARE CUTE ENOUGH TO JOIN!')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'Coffee Of The Year', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA701166316 AS DateTime), 1, N'Sino nga ba ang kapeng pang masa? Sino nga ba ang kapeng kasama ng mga studyante habang sila ay nagpupuyat kakagawa ng thesis?')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(3 AS Numeric(18, 0)), N'Best Research 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACA7011B6993 AS DateTime), 0, N'This is a private poll for IT 3-1 students only')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'Best Research PUP Quezon City 2021 ', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011BC8DB AS DateTime), 0, N'This is open for all students of PUP QC. ')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(5 AS Numeric(18, 0)), N'Best Tiktoker of 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011C09E5 AS DateTime), 1, N'Please vote the one you think who is the most viewed Tiktok influencer')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(6 AS Numeric(18, 0)), N'Best Place in PUP QC to Hang Out', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011D44EE AS DateTime), 1, N'This poll will show where in PUP QC we can enjoy or have fun while we are on breaktime!')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(7 AS Numeric(18, 0)), N'Best Date for Year End Party', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011EB4C8 AS DateTime), 1, N'In this poll, students are encouraged to vote for the official date of Year End Party.')
SET IDENTITY_INSERT [dbo].[t_poll] OFF
SET IDENTITY_INSERT [dbo].[t_user] ON 

INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(1 AS Numeric(18, 0)), N'PUP', N'E', N'Boto', N'admin', N'admin', N'pup_eboto@gmail.com', N'2', NULL, NULL, CAST(0x0000ACA700E0EDB9 AS DateTime), 1)
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(2 AS Numeric(18, 0)), N'John Raven', N'Tamang', N'Glomar', N'2018-00232-CM-0', N'admin', N'jrglomar016@gmail.com', N'1', NULL, NULL, CAST(0x0000ACA900BB7667 AS DateTime), 1)
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(4 AS Numeric(18, 0)), N'Test', N'Dummy', N'Account', N'test01', N'test01', N'test01@gmail.com', NULL, NULL, N'BSIT 3-1', CAST(0x0000ACB700C450DB AS DateTime), 1)
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(5 AS Numeric(18, 0)), N'Test', N'Dummy', N'Account', N'test02', N'test02', N'test01@gmail.com', NULL, NULL, N'BSIT 3-2', CAST(0x0000ACB700C46A34 AS DateTime), 1)
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(6 AS Numeric(18, 0)), N'Test', N'Dummy', N'Account', N'test03', N'test03', N'test03@gmail.com', NULL, NULL, N'BSIT 3-1', CAST(0x0000ACB700C48716 AS DateTime), 1)
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(7 AS Numeric(18, 0)), N'Test', N'Dummy', N'Account', N'test04', N'test04', N'test04@gmail.com', N'1', NULL, N'BSIT 3-1', CAST(0x0000ACB700C50B6D AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[t_user] OFF
SET IDENTITY_INSERT [dbo].[t_vote_candidate] ON 

INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA800C01ABD AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA800F7D409 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA800F7D409 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF7 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF7 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACAD00B50067 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACAD00B50069 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACAD00B5006A AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAF011D3777 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(24 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAF011D3778 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(25 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAF011D3779 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207814 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207815 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207815 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(11 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207815 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_vote_candidate] OFF
SET IDENTITY_INSERT [dbo].[t_vote_contestant] ON 

INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA800C0CA0A AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACB101300528 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_vote_contestant] OFF
SET IDENTITY_INSERT [dbo].[t_vote_option] ON 

INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(24 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACA9015F5FA6 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACB100BC8D42 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_vote_option] OFF
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
ALTER TABLE [dbo].[t_user] ADD  CONSTRAINT [DF_userType]  DEFAULT ((1)) FOR [userType]
GO
ALTER TABLE [dbo].[t_user] ADD  CONSTRAINT [DF_User]  DEFAULT (getdate()) FOR [userDateCreated]
GO
ALTER TABLE [dbo].[t_user] ADD  DEFAULT ((1)) FOR [userStatus]
GO
ALTER TABLE [dbo].[t_vote_candidate] ADD  CONSTRAINT [DF_VoteCandidate]  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_vote_contestant] ADD  DEFAULT (getdate()) FOR [voteDateCreated]
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

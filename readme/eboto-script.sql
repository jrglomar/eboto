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
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [FK_option_orgID]
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
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF__t_user__userStat__182C9B23]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF_User]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF__t_poll__pollStat__1FCDBCEB]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF_Poll]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF__t_option__option__24927208]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF_Option]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF__t_electio__elect__1BFD2C07]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF_Election]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [DF__t_contest__conte__59FA5E80]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF__t_contest__conte__5441852A]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF_Contest]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF__t_candida__candi__286302EC]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF_Candidate]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF__r_org__orgStatus__108B795B]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF_Org]
GO
ALTER TABLE [dbo].[r_course] DROP CONSTRAINT [DF__r_course__course__1367E606]
GO
ALTER TABLE [dbo].[r_course] DROP CONSTRAINT [DF_Course]
GO
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_vote_option]
GO
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_vote_contestant]
GO
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_vote_candidate]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_user]
GO
/****** Object:  Table [dbo].[t_poll]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_poll]
GO
/****** Object:  Table [dbo].[t_option]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_option]
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_election]
GO
/****** Object:  Table [dbo].[t_contestant]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_contestant]
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_contest]
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[t_candidate]
GO
/****** Object:  Table [dbo].[r_org]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[r_org]
GO
/****** Object:  Table [dbo].[r_course]    Script Date: 12/1/2020 7:33:37 PM ******/
DROP TABLE [dbo].[r_course]
GO
/****** Object:  Table [dbo].[r_course]    Script Date: 12/1/2020 7:33:37 PM ******/
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
/****** Object:  Table [dbo].[r_org]    Script Date: 12/1/2020 7:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[r_org](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[orgName] [varchar](100) NULL,
	[orgType] [varchar](100) NULL,
	[orgDateCreated] [datetime] NULL,
	[orgStatus] [bit] NULL,
 CONSTRAINT [PK_orgsID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 12/1/2020 7:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[candidateElectionID] [numeric](18, 0) NULL,
	[candidateFirstName] [varchar](100) NULL,
	[candidateMiddleName] [varchar](100) NULL,
	[candidateLastName] [varchar](100) NULL,
	[candidateCourse] [varchar](100) NULL,
	[candidateBirthday] [varchar](100) NULL,
	[candidateImage] [image] NULL,
	[candidateDateCreated] [datetime] NULL,
	[candidateStatus] [bit] NULL,
	[candidatePosition] [varchar](100) NULL,
 CONSTRAINT [PK_candidatesID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 12/1/2020 7:33:37 PM ******/
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
/****** Object:  Table [dbo].[t_contestant]    Script Date: 12/1/2020 7:33:37 PM ******/
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
	[contestantImage] [image] NULL,
	[contestDateCreated] [datetime] NULL,
	[contestStatus] [bit] NULL,
	[contestantContestID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_contestantID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 12/1/2020 7:33:37 PM ******/
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
/****** Object:  Table [dbo].[t_option]    Script Date: 12/1/2020 7:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_option](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[optionPollID] [numeric](18, 0) NULL,
	[optionOrgID] [numeric](18, 0) NULL,
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
/****** Object:  Table [dbo].[t_poll]    Script Date: 12/1/2020 7:33:37 PM ******/
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
/****** Object:  Table [dbo].[t_user]    Script Date: 12/1/2020 7:33:37 PM ******/
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
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 12/1/2020 7:33:37 PM ******/
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
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 12/1/2020 7:33:37 PM ******/
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
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 12/1/2020 7:33:37 PM ******/
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
SET IDENTITY_INSERT [dbo].[t_contest] ON 

INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'Pagalingan sumayaw', CAST(0x0000AC9400000000 AS DateTime), CAST(0x0000ACA100000000 AS DateTime), NULL, CAST(0x0000AC8100F59FCD AS DateTime), 1, N'asdasd')
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
SET IDENTITY_INSERT [dbo].[t_contest] OFF
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
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(34 AS Numeric(18, 0)), N'test-26-03', CAST(0x0000AC9D00000000 AS DateTime), CAST(0x0000ACA100000000 AS DateTime), NULL, CAST(0x0000AC7F00BAE076 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(35 AS Numeric(18, 0)), N'test-26-04', CAST(0x0000AC9D00000000 AS DateTime), CAST(0x0000ACA100000000 AS DateTime), NULL, CAST(0x0000AC7F00BAEABE AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(36 AS Numeric(18, 0)), N'qwe', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC302E AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(37 AS Numeric(18, 0)), N'qwesd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC60FE AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(38 AS Numeric(18, 0)), N'qwesd', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC64B3 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(39 AS Numeric(18, 0)), N'qwe', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BC97B4 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(40 AS Numeric(18, 0)), N'qwec', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), NULL, CAST(0x0000AC7F00BCF4A2 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(41 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8100E99639 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(42 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F09566 AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(43 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8100F09A13 AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(44 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F0A6FB AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(45 AS Numeric(18, 0)), N'PSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F0B889 AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(46 AS Numeric(18, 0)), N'COMMITS Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8E00000000 AS DateTime), NULL, CAST(0x0000AC8100F12532 AS DateTime), 1, N'This is COMMITS Election')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(47 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8B00000000 AS DateTime), NULL, CAST(0x0000AC81010AC4A9 AS DateTime), 1, N'This is for SSC Election
Please vote wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(48 AS Numeric(18, 0)), N'PSC Election', CAST(0x0000AC8300000000 AS DateTime), CAST(0x0000AC8500000000 AS DateTime), NULL, CAST(0x0000AC8301870584 AS DateTime), 1, N'qew')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(49 AS Numeric(18, 0)), N'JMS Election', CAST(0x0000AC8400000000 AS DateTime), CAST(0x0000AC8900000000 AS DateTime), NULL, CAST(0x0000AC84000661BF AS DateTime), 1, N'This is jms election')
SET IDENTITY_INSERT [dbo].[t_election] OFF
SET IDENTITY_INSERT [dbo].[t_poll] ON 

INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'This is poll voting', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8500000000 AS DateTime), NULL, CAST(0x0000AC8100F2A49B AS DateTime), 1, N'asd')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'This is poll voting v2', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8D00000000 AS DateTime), NULL, CAST(0x0000AC8100F2E4F1 AS DateTime), 1, N'Rqwqwe')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(3 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(0x0000AC8100F2FBD5 AS DateTime), 1, NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'This is poll voting v3', CAST(0x0000AC8100000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), NULL, CAST(0x0000AC8100F32B65 AS DateTime), 1, N'qweqwe')
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
ALTER TABLE [dbo].[t_contestant] ADD  DEFAULT ((1)) FOR [contestStatus]
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
ALTER TABLE [dbo].[t_option]  WITH CHECK ADD  CONSTRAINT [FK_option_orgID] FOREIGN KEY([optionOrgID])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_option] CHECK CONSTRAINT [FK_option_orgID]
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
